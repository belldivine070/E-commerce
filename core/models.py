import os
import uuid
from django.db import models
from django.conf import settings
from django.utils import timezone
from django.utils.text import slugify
from django.contrib.auth import get_user_model

from django.db.models.signals import post_delete, pre_save
from django.dispatch import receiver
from django.core.files.images import get_image_dimensions
from mutagen import File as MutagenFile



POST_FIELD_CHOICES = {
    'title': 'Title', 
    'slug': 'Slug', 
    'excerpt': 'Excerpt', 
    'content': 'Content',    
    'author': 'Author', 
    'btn_url': 'btn_URL',
    'btn_text': 'btn_Text', 
    'is_published': 'Publish Now (Toggle)',
    'featured_image': 'Feature Image (from Library)', 
    'featured_video': 'Feature Video (from Library)', 
    'featured_audio': 'Feature Audio (from Library)', 
    'icon': 'Icon',
    'image_align': 'Image Align', 
    'tags': 'Tags',
    'event_date': 'Event Date', 
    'address': 'Address', 
    'addfield1': 'Add Field 1',
    'addfield2': 'Add Field 2', 
    'addfield3': 'Add Field 3', 
    'addfield4': 'Add Field 4',
    'subtitle': 'Subtitle', 
    'shortcodes': 'Shortcodes', 
    'progress': 'Progress',
}


# ----------------------------------------------------
# 1. HELPERS & PATHS
# ----------------------------------------------------

def media_library_path(instance, filename):
    # 1. Determine the category folder
    if instance.mediacat:
        folder_name = slugify(instance.mediacat.name)
    else:
        folder_name = 'general'
    
    # # 2. Get the date structure
    # date_path = timezone.now().strftime('%Y/%m')
    
    # 3. Join them all
    # This results in: media_library/electronics/2026/04/yourfile.jpg
    return os.path.join('media_library', folder_name, filename)


class MediaAlbum(models.Model):
    name = models.CharField(max_length=100)
    slug = models.SlugField(max_length=150, unique=True, blank=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.name
    

class MediaAsset(models.Model):
    FILE_TYPES = (
        ('image', 'Image'),
        ('video', 'Video'),
        ('audio', 'Audio'),
        ('document', 'Document'),
    )
    
    mediacat = models.ForeignKey('MediaAlbum', on_delete=models.SET_NULL, null=True, blank=True, related_name='assets')
    file = models.FileField(upload_to=media_library_path, max_length=500)
    title = models.CharField(max_length=255, blank=True)
    file_type = models.CharField(max_length=10, choices=FILE_TYPES, default='image')
    file_size = models.PositiveIntegerField(help_text="Size in bytes", editable=False, null=True)
    
    width = models.PositiveIntegerField(null=True, blank=True, editable=False)
    height = models.PositiveIntegerField(null=True, blank=True, editable=False)
    duration = models.FloatField(null=True, blank=True, editable=False, help_text="Duration in seconds")
    extension = models.CharField(max_length=10, blank=True, editable=False)

    replace_existing = models.BooleanField(default=False)
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def save(self, *args, **kwargs):
        if self.file:
            # 1. Set Title and Extension
            if not self.title:
                self.title = os.path.basename(self.file.name)
            
            self.extension = os.path.splitext(self.file.name)[1].lower()
            self.file_size = self.file.size

            # 2. Type Detection
            ext = self.extension
            if ext in ['.mp4', '.webm', '.mov', '.mkv', '.avi']: 
                self.file_type = 'video'
            elif ext in ['.jpg', '.jpeg', '.png', '.gif', '.webp', '.svg']: 
                self.file_type = 'image'
            elif ext in ['.mp3', '.wav', '.ogg']: 
                self.file_type = 'audio'
            else: 
                self.file_type = 'document'

            # 3. Physical File Replacement Logic
            if self.replace_existing:
                full_path = os.path.join(settings.MEDIA_ROOT, 'media_library', self.file.name)
                if os.path.exists(full_path):
                    os.remove(full_path)

            # 4. Extract Metadata (Dimensions/Duration)
            try:
                if self.file_type == 'image':
                    self.width, self.height = get_image_dimensions(self.file)
                elif self.file_type in ['video', 'audio']:
                    audio_info = MutagenFile(self.file)
                    if audio_info and audio_info.info:
                        self.duration = audio_info.info.length
            except Exception as e:
                print(f"Metadata error: {e}")

        super().save(*args, **kwargs)

    @property
    def formatted_duration(self):
        if self.duration:
            mins, secs = divmod(int(self.duration), 60)
            return f"{mins:02d}:{secs:02d}"
        return "00:00"

    def __str__(self):
        return f"[{self.file_type.upper()}] {self.title}"

    class Meta:
        verbose_name = "Media Asset"
        verbose_name_plural = "Media Library"
        ordering = ['-uploaded_at']

# --- PHYSICAL FILE CLEANUP ---

@receiver(post_delete, sender=MediaAsset)
def auto_delete_file_on_delete(sender, instance, **kwargs):
    """Deletes physical file when record is deleted from DB"""
    if instance.file:
        if os.path.isfile(instance.file.path):
            os.remove(instance.file.path)

@receiver(pre_save, sender=MediaAsset)
def auto_delete_file_on_change(sender, instance, **kwargs):
    """Deletes old physical file when a new file is uploaded to the same record"""
    if not instance.pk:
        return False

    try:
        old_file = MediaAsset.objects.get(pk=instance.pk).file
    except MediaAsset.DoesNotExist:
        return False

    new_file = instance.file
    if not old_file == new_file:
        if os.path.isfile(old_file.path):
            os.remove(old_file.path)


# ----------------------------------------------------
# 3. SYSTEM SETTINGS & AUDIT
# ----------------------------------------------------

class AppVariable(models.Model):
    var_name = models.CharField(max_length=100, unique=True)
    var_value = models.TextField(blank=True, null=True)
    description = models.CharField(max_length=250, blank=True, default="")
    isreadonly = models.BooleanField(default=False)
    lastupdated = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "System Setting"
        verbose_name_plural = "System Settings"

    def __str__(self):
        return f"{self.var_name}: {self.var_value}"

    @staticmethod
    def get_setting(name, default=''):
        try:
            return AppVariable.objects.get(var_name=name).var_value
        except AppVariable.DoesNotExist:
            return default


class ActivityLog(models.Model):
    ACTIVITY_TYPES = (
        ('login', 'Login'),
        ('logout', 'Logout'),
        ('purchase', 'Purchase'),
        ('purchase', 'Purchase'),
        ('refund', 'Refund'),
        ('cancel_Payment', 'Cancel Payment'),
        ('failed_login', 'Failed Login Attempt'),
        ('password_change', 'Password Change'),
        ('registered', 'Register'),
    )
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='activities')
    activity_type = models.CharField(max_length=20, choices=ACTIVITY_TYPES)
    description = models.TextField()
    ip_address = models.GenericIPAddressField(null=True, blank=True)
    user_agent = models.TextField(null=True, blank=True)
    timestamp = models.DateTimeField(auto_now_add=True)

    class Meta:
        indexes = [
            models.Index(fields=['timestamp', 'activity_type']),
        ]
        ordering = ['-timestamp']


class SecurityAuditLog(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, null=True)
    event = models.CharField(max_length=100) 
    description = models.TextField()
    user_agent = models.TextField(null=True, blank=True)
    ip_address = models.GenericIPAddressField(null=True, blank=True)
    timestamp = models.DateTimeField(auto_now_add=True)



# ----------------------------------------------------
# 4. CONTENT & DYNAMIC PAGES
# ----------------------------------------------------

class Page(models.Model):
    title = models.CharField(max_length=100)
    slug = models.SlugField(unique=True, blank=True)
    content_category = models.ForeignKey('Category', on_delete=models.SET_NULL, null=True, blank=True)
    meta_title = models.CharField(max_length=255, blank=True)
    meta_description = models.TextField(blank=True)
    is_active = models.BooleanField(default=True)

    def save(self, *args, **kwargs):
        if not self.slug: self.slug = slugify(self.title)
        super().save(*args, **kwargs)

    def __str__(self): return self.title


class PageSection(models.Model):
    LAYOUT_CHOICES = (
        ('hero', 'Hero Slider (Widget Preferred)'),
        ('standard', 'Standard (Text & Image)'),
        ('icons', 'Icon Grid (Features)'),
        ('testimonial', 'Testimonials Carousel'),
        ('info', 'Info Bar (Strip)'),
        ('widget_box', 'Custom Widget Box'),
    )
    page = models.ForeignKey(Page, on_delete=models.CASCADE, related_name='sections')
    category = models.ForeignKey('Category', on_delete=models.SET_NULL, null=True, blank=True)
    widget = models.ForeignKey('Widget', on_delete=models.SET_NULL, null=True, blank=True)
    layout_type = models.CharField(max_length=20, choices=LAYOUT_CHOICES, default='standard')
    order = models.PositiveIntegerField(default=0)

    class Meta:
        ordering = ['order']


# ----------------------------------------------------
# 5. CATEGORIES & POSTS (Content Types)
# ----------------------------------------------------

class Category(models.Model):
    title = models.CharField(max_length=100, unique=True)
    slug = models.SlugField(max_length=100, unique=True, blank=True)
    excerpt = models.TextField(blank=True, null=True)
    # Linked to Media Library
    media_asset = models.ForeignKey(MediaAsset, on_delete=models.SET_NULL, null=True, blank=True, related_name='category_covers')
    child_fields = models.JSONField(default=list, blank=True)

    def save(self, *args, **kwargs):
        if not self.slug: self.slug = slugify(self.title)
        super().save(*args, **kwargs)

    class Meta:
        verbose_name = "Content Type (Category)"
        verbose_name_plural = "Content Types (Categories)"

    def __str__(self): return self.title


class CategoryPost(models.Model):
    title = models.CharField(max_length=255)
    slug = models.SlugField(max_length=255, unique=True, blank=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='posts')
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, null=True, blank=True)
    excerpt = models.TextField(blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    tags = models.CharField(max_length=255, blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    subtitle = models.CharField(max_length=255, blank=True, null=True)
    shortcodes = models.TextField(blank=True, null=True)
    
    # Linked to Media Library (Single files as requested)
    featured_image = models.ForeignKey(MediaAsset, on_delete=models.SET_NULL, null=True, blank=True, related_name='cat_post_images')
    featured_video = models.ForeignKey(MediaAsset, on_delete=models.SET_NULL, null=True, blank=True, related_name='cat_post_videos')
    featured_audio = models.ForeignKey(MediaAsset, on_delete=models.SET_NULL, null=True, blank=True, related_name='cat_post_audios')
    
    icon = models.CharField(max_length=70, blank=True, null=True)
    image_align = models.CharField(max_length=50, blank=True, null=True)
    btn_text = models.CharField(max_length=100, blank=True, null=True, default="Read More")
    btn_url = models.URLField(blank=True, null=True)
    event_date = models.DateTimeField(blank=True, null=True)
    progress = models.IntegerField(blank=True, null=True)
    addfield1 = models.CharField(max_length=255, blank=True, null=True)
    addfield2 = models.CharField(max_length=255, blank=True, null=True)
    addfield3 = models.CharField(max_length=255, blank=True, null=True)
    addfield4 = models.CharField(max_length=255, blank=True, null=True)
    is_published = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)       

    def save(self, *args, **kwargs):
        if not self.slug: self.slug = slugify(self.title)
        super().save(*args, **kwargs)

    @property
    def primary_image_url(self):
        if self.featured_image and self.featured_image.file:
            return self.featured_image.file.url
        return None

    class Meta:
        ordering = ['category', '-created_at']

# ----------------------------------------------------
# 6. WIDGETS & WIDGET POSTS
# ----------------------------------------------------

class Widget(models.Model):
    title = models.CharField(max_length=100, unique=True)
    slug = models.SlugField(max_length=100, unique=True, blank=True)
    excerpt = models.TextField(blank=True, null=True)
    # Linked to Media Library
    media_asset = models.ForeignKey(MediaAsset, on_delete=models.SET_NULL, null=True, blank=True, related_name='widget_covers')
    child_fields = models.JSONField(default=list, blank=True)

    def save(self, *args, **kwargs):
        if not self.slug: self.slug = slugify(self.title)
        super().save(*args, **kwargs)

    def __str__(self): return self.title


class WidgetPost(models.Model):
    title = models.CharField(max_length=255)
    slug = models.SlugField(max_length=255, unique=True, blank=True)
    widget = models.ForeignKey(Widget, on_delete=models.CASCADE, related_name='widget_posts')          
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, null=True, blank=True)
    excerpt = models.TextField(blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    tags = models.CharField(max_length=255, blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    subtitle = models.CharField(max_length=255, blank=True, null=True)
    shortcodes = models.TextField(blank=True, null=True)
    
    # Linked to Media Library
    featured_image = models.ForeignKey(MediaAsset, on_delete=models.SET_NULL, null=True, blank=True, related_name='wid_post_images')
    featured_video = models.ForeignKey(MediaAsset, on_delete=models.SET_NULL, null=True, blank=True, related_name='wid_post_videos')
    featured_audio = models.ForeignKey(MediaAsset, on_delete=models.SET_NULL, null=True, blank=True, related_name='wid_post_audios')
    
    icon = models.CharField(max_length=70, blank=True, null=True)
    image_align = models.CharField(max_length=50, blank=True, null=True)
    btn_text = models.CharField(max_length=100, blank=True, null=True, default="Read More")
    btn_url = models.URLField(blank=True, null=True)
    event_date = models.DateTimeField(blank=True, null=True)
    progress = models.IntegerField(blank=True, null=True)
    addfield1 = models.CharField(max_length=255, blank=True, null=True)
    addfield2 = models.CharField(max_length=255, blank=True, null=True)
    addfield3 = models.CharField(max_length=255, blank=True, null=True)
    addfield4 = models.CharField(max_length=255, blank=True, null=True)
    is_published = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    @property
    def primary_image_url(self):
        if self.featured_image and self.featured_image.file:
            return self.featured_image.file.url
        return None

    def save(self, *args, **kwargs):
        if not self.slug: self.slug = slugify(self.title)
        super().save(*args, **kwargs)

    class Meta:
        ordering = ['widget', '-created_at']   

# ----------------------------------------------------
# 7. MARKETING, COMMUNICATIONS & OTHER
# ----------------------------------------------------

class Banner(models.Model):
    title = models.CharField(max_length=100)
    image_asset = models.ForeignKey(MediaAsset, on_delete=models.CASCADE, related_name='banners', null=True, blank=True)
    link_url = models.URLField(blank=True)
    is_active = models.BooleanField(default=True)
    order = models.PositiveIntegerField(default=0)


class ExternalSubscriber(models.Model):
    email = models.EmailField(unique=True)
    ip_address = models.GenericIPAddressField(null=True, blank=True)
    region = models.CharField(max_length=100, null=True, blank=True)
    date_subscribed = models.DateTimeField(auto_now_add=True)

    def save(self, *args, **kwargs):
        is_new = self.pk is None
        super().save(*args, **kwargs)
        if is_new and self.ip_address:
            try:
                from .tasks import get_subscriber_location_task
                get_subscriber_location_task.delay(self.id)
            except Exception: pass


class ContactUs(models.Model):
    fullname = models.CharField(max_length=100)
    email = models.EmailField()
    subject = models.CharField(max_length=200)
    message = models.TextField()
    submitted_at = models.DateTimeField(auto_now_add=True)


class NewsPost(models.Model):
    AUDIENCE_CHOICES = [
        ('all', 'All Audience'), ('staff_only', 'Staff Only'),
        ('external_only', 'External Subscribers Only'), ('clients', 'Clients'),
    ]
    title = models.CharField(max_length=255)
    subject = models.CharField(max_length=255, blank=True)
    slug = models.SlugField(max_length=255, unique=True, blank=True)
    content = models.TextField()
    sender_email = models.EmailField(blank=True, null=True)
    target_audience = models.CharField(max_length=50, choices=AUDIENCE_CHOICES, default='all')
    scheduled_time = models.DateTimeField(null=True, blank=True)
    status = models.CharField(max_length=15, default='draft')
    created_at = models.DateTimeField(auto_now_add=True)

    def save(self, *args, **kwargs):
        if not self.subject: self.subject = self.title
        if not self.slug: self.slug = slugify(self.title)
        if not self.sender_email:
            self.sender_email = AppVariable.get_setting('official_email', 'noreply@bgtech.com')
        super().save(*args, **kwargs)

    def gather_emails(self):
        CustomUser = get_user_model()
        emails = set()
        if self.target_audience in ['all', 'external_only']:
            emails.update(ExternalSubscriber.objects.values_list('email', flat=True))
        if self.target_audience in ['all', 'staff_only']:
            emails.update(CustomUser.objects.filter(is_staff=True).values_list('email', flat=True))
        return list(filter(None, emails))


class BroadcastLog(models.Model):
    news_post = models.ForeignKey(NewsPost, on_delete=models.CASCADE)
    recipient_email = models.EmailField()
    status = models.CharField(max_length=20, default='Sent')
    sent_at = models.DateTimeField(auto_now_add=True)