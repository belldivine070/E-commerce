import csv
import io
import os
from zoneinfo import ZoneInfo

from django.conf import settings
from django.contrib import messages
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.db.models import Count, Q
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse, Http404
from django.template.loader import render_to_string
from django.shortcuts import render, get_object_or_404, redirect
from django.urls import reverse, reverse_lazy
from django.utils.timezone import make_aware, is_naive, now as timezone_now
from django.views import View
from django.views.generic import (
    TemplateView, ListView, CreateView, UpdateView, 
    DeleteView, FormView, DetailView
)

# Model Imports
from .models import (
    Category, CategoryPost, Widget, WidgetPost, AppVariable, 
    POST_FIELD_CHOICES, NewsPost, ExternalSubscriber, Page, 
    MediaAsset, ActivityLog, MediaAlbum
)
# Form Imports
from .forms import (
    ContactForm, CategoryForm, DynamicCategoryPostForm, WidgetForm, 
    DynamicWidgetPostForm, SiteSettingsKeyForm, BroadcastForm, 
    SubcribersForm, CSVUploadForm, UniversalMediaForm, MediaAlbumForm
)
from .tasks import send_broadcast_task 
from .mixins import get_client_ip
from .utils import get_geo_info 
from accounts.models import CustomUser, Position





# Helper to get IP (Replace with your actual utility if different)
def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip




# =========================================================
# 1. PUBLIC & DASHBOARD VIEWS
# =========================================================

class IndexView(LoginRequiredMixin, TemplateView):
    template_name = 'home.html'


class AdminDashboardView(LoginRequiredMixin, TemplateView):
    template_name = 'core/admin_dashboard.html'


class DynamicPageView(DetailView):
    model = Page
    template_name = 'core/page.html'
    slug_url_kwarg = 'slug'


class ContactUs(FormView):
    form_class = ContactForm
    template_name = "lmsn/contact-us.html"
    success_url = reverse_lazy("lmsn:contact-us")

    def form_valid(self, form):
        form.save()
        messages.success(self.request, "Your message has been sent successfully!")
        return super().form_valid(form)
    
    def form_invalid(self, form):
        print(form.errors) # This will print the errors to your terminal/console
        return super().form_invalid(form)
    

# =========================================================
# 2. ALBUM / MEDIA LIBRARY & ASSETS
# =========================================================
# --- DYNAMIC MEDIA AJAX ---

class MediaCategoryListView(LoginRequiredMixin, ListView):
    model = MediaAlbum
    template_name ='media/media_cat.html'
    context_object_name = 'albums'
    ordering = ['-id']

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['album_form'] = MediaAlbumForm()
        return context


class MediaCategoryCreateView(LoginRequiredMixin, CreateView):
    model = MediaAlbum
    form_class = MediaAlbumForm
    success_url = reverse_lazy('core:media_categories')

    def form_valid(self, form):
        messages.success(self.request, "Album created successfully!")
        return super().form_valid(form)

    def form_invalid(self, form):
        messages.error(self.request, "Failed to create album. Check if the name is unique.")
        return redirect('core:media_categories')
    

class MediaCategoryUpdateView(LoginRequiredMixin, UpdateView):
    model = MediaAlbum
    form_class = MediaAlbumForm
    template_name = 'media/media_cat.html'
    success_url = reverse_lazy('core:media_categories')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['albums'] = MediaAlbum.objects.all().order_by('-id')
        context['album_form'] = context['form']
        context['is_edit'] = True
        return context


class MediaCategoryDeleteView(LoginRequiredMixin, DeleteView):
    model = MediaAlbum
    
    def get(self, request, *args, **kwargs):
        # We fetch the object and delete it directly
        self.object = self.get_object()
        success_url = reverse_lazy('core:media_categories')
        
        self.object.delete()
        messages.warning(request, "Album deleted successfully.")
        return HttpResponseRedirect(success_url)

    # We override post just in case a POST request hits this URL
    def post(self, request, *args, **kwargs):
        return self.get(request, *args, **kwargs)


class MediaLibraryListView(LoginRequiredMixin, ListView):
    model = MediaAsset
    template_name = 'media/media_library.html'
    context_object_name = 'assets'
    paginate_by = 10 

    def get_paginate_by(self, queryset):
        return self.request.GET.get('entries', self.paginate_by)
    
    def get_queryset(self):
        qs = MediaAsset.objects.all().order_by('-uploaded_at')
        query = self.request.GET.get('q')
        cat_id = self.request.GET.get('cat')
        
        if query:
            qs = qs.filter(Q(title__icontains=query) | Q(file__icontains=query))
        if cat_id:
            qs = qs.filter(mediacat_id=cat_id)
        return qs

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['albums'] = MediaAlbum.objects.all() 
        context['base_template'] = 'layout.html'
        context['is_picker'] = False
        return context

    def post(self, request, *args, **kwargs):
        action = request.POST.get('bulk_action')
        asset_ids = request.POST.getlist('asset_ids')

        if not asset_ids:
            messages.warning(request, "No items selected.")
        elif action == 'delete':
            deleted_count, _ = MediaAsset.objects.filter(id__in=asset_ids).delete()
            messages.success(request, f"Successfully deleted {deleted_count} items.")
        return redirect('core:media_library')
    
# class MediaLibraryListView(LoginRequiredMixin, ListView):
#     model = MediaAsset
#     template_name = 'media/media_library.html'
#     context_object_name = 'assets'
#     paginate_by = 10 

#     def get_paginate_by(self, queryset):
#         # Dynamically set entries based on the 'entries' GET parameter
#         if self.request.GET.get('type') == 'picker':
#             return 24 # Show a larger grid for easier selection
#         return self.request.GET.get('entries', self.paginate_by)
    
#     def get_queryset(self):
#         qs = MediaAsset.objects.all().order_by('-uploaded_at')
#         query = self.request.GET.get('q')
#         cat_id = self.request.GET.get('cat')
        
#         if query:
#             qs = qs.filter(Q(title__icontains=query) | Q(file__icontains=query))
#         if cat_id:
#             qs = qs.filter(mediacat_id=cat_id)
#         return qs

#     def get(self, request, *args, **kwargs):
#         # Identify if we are in 'picker' or 'edit' mode
#         # Usage: /media-library/?type=picker
#         self.is_picker = request.GET.get('type') == 'picker'

#         if request.headers.get('x-requested-with') == 'XMLHttpRequest':
#             # This allows the AJAX to update the table and pagination together
#             self.object_list = self.get_queryset()
#             context = self.get_context_data()
#             # We return the ENTIRE wrapper content so pagination updates too
#             html = render_to_string('media/media_library.html', context, request=request)
#             return HttpResponse(html)
#         return super().get(request, *args, **kwargs)

#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         context['albums'] = MediaAlbum.objects.all() 
#         # Pass the mode to the template
#         # is_picker will be True if ?type=picker is in the URL
#         context['is_picker'] = self.request.GET.get('type') == 'picker'
        
#         # Useful for layout.html to hide navbars/sidebars
#         if context['is_picker']:
#             context['base_template'] = 'media_library.html' # Or whatever minimal layout you use
#         else:# Pass the mode to the template
#             # is_picker will be True if ?type=picker is in the URL
#             context['is_picker'] = self.request.GET.get('type') == 'picker'
        
#         # Useful for layout.html to hide navbars/sidebars
#         if context['is_picker']:
#             context['base_template'] = 'media_modal.html' # Or whatever minimal layout you use
#         else:
#             context['base_template'] = 'layout.html'
#         return context

#     def post(self, request, *args, **kwargs):
#         action = request.POST.get('bulk_action')
#         asset_ids = request.POST.getlist('asset_ids')

#         if not asset_ids:
#             messages.warning(request, "No items selected.")
#         elif action == 'delete':
#             deleted_count, _ = MediaAsset.objects.filter(id__in=asset_ids).delete()
#             messages.success(request, f"Successfully deleted {deleted_count} items.")
        
#         # Redirect back to the library
#         return redirect('core:media_library')


class MediaPickerView(LoginRequiredMixin, ListView):
    model = MediaAsset
    template_name = 'media/media_modal.html'
    context_object_name = 'assets'
    paginate_by = 30  # Larger grid for the popup

    def get_queryset(self):
        qs = MediaAsset.objects.all().order_by('-uploaded_at')
        query = self.request.GET.get('q')
        cat_id = self.request.GET.get('cat')
        
        if query:
            qs = qs.filter(Q(title__icontains=query) | Q(file__icontains=query))
        if cat_id:
            qs = qs.filter(mediacat_id=cat_id)
        return qs

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['albums'] = MediaAlbum.objects.all() 
        # Capture picker-specific data from URL
        context['target'] = self.request.GET.get('target', '') # 'primary', 'secondary', 'gallery'
        context['mode'] = self.request.GET.get('mode', 'single') # 'bulk' for gallery
        context['is_picker'] = True
        return context
    

class MediaUploadView(LoginRequiredMixin, FormView):
    """Handles multiple file uploads and logging"""
    template_name = 'media/media_popup.html'
    form_class = UniversalMediaForm
    success_url = reverse_lazy('core:media_library')

    def form_valid(self, form):
        results = form.save_multiple()
        messages.success(self.request, f"Processed: {results['created']} new, {results['replaced']} updated.")
        return super().form_valid(form)


class MediaDeleteView(LoginRequiredMixin, DeleteView):
    model = MediaAsset
    success_url = reverse_lazy('core:media_library')

    def post(self, request, *args, **kwargs):
        obj = self.get_object()
        log_description = f"Permanently deleted media asset: {obj.title}"
        
        # LOG THE ACTION
        ActivityLog.objects.create(
            user=request.user, 
            activity_type='delete', 
            description=log_description, 
            ip_address=get_client_ip(request)
        )
        
        messages.warning(request, f"Media '{obj.title}' deleted.")
        return super().post(request, *args, **kwargs)

def admin_media_explorer(request):
    """View for the popup/modal media picker"""
    assets = MediaAsset.objects.all().order_by('-uploaded_at')
    return render(request, 'core/media/upload_media.html', {'assets': assets})


# =========================================================
# 6. SYSTEM LOGS & MONITORING
# =========================================================

class ActivityLogListView(LoginRequiredMixin, ListView):
    model = ActivityLog
    template_name = 'admin/logs/activity_list.html'
    context_object_name = 'logs'
    paginate_by = 50
    ordering = ['-timestamp'] # Assuming your model has a timestamp/created_at field

class ClearLogsView(LoginRequiredMixin, View):
    """Allows admins to wipe the logs"""
    def post(self, request):
        count = ActivityLog.objects.count()
        ActivityLog.objects.all().delete()
        
        # Log the clearing of logs (so there is at least one record of who did it)
        ActivityLog.objects.create(
            user=request.user,
            activity_type='delete',
            description=f"Cleared all activity logs ({count} entries removed).",
            ip_address=get_client_ip(request)
        )
        
        messages.success(request, "Activity logs cleared successfully.")
        return redirect('core:activity_logs')
    

# =========================================================
#             1. CATEGORY & CATEGORY POST VIEWS
# =========================================================

class CategoryListView(LoginRequiredMixin, ListView):
    model = Category
    template_name = 'categories/category_list.html'
    context_object_name = 'categories'

    def get_queryset(self):
        return Category.objects.annotate(post_count=Count('posts')).order_by('title')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Convert the tuple of tuples into a dictionary so get_item can work
        context['POST_FIELD_CHOICES'] = dict(POST_FIELD_CHOICES)
        return context
    
class CategoryBaseView(LoginRequiredMixin):
    model = Category
    form_class = CategoryForm
    template_name = 'categories/category_form.html'
    success_url = reverse_lazy('core:category_list')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Fix: Using 'mediacat' to avoid FieldError
        context['available_media_cats'] = MediaAsset.objects.values_list(
            'mediacat', flat=True
        ).distinct().order_by('mediacat')
        return context
    
    def form_valid(self, form):
        # 1. Capture the ID from the hidden input field (sent by the popup)
        # Ensure the 'name' in HTML matches 'library_asset_id'
        selected_asset_id = self.request.POST.get('library_asset_id')
        
        if selected_asset_id:
            # Assign the ID directly to the Foreign Key field
            # Replace 'media_asset_id' with your actual field name + _id
            form.instance.media_asset_id = selected_asset_id

        # 2. Save the instance
        response = super().form_valid(form)
        
        # 3. Enhanced Logging
        is_update = 'update' if self.object.pk else 'create'
        media_info = f"Asset ID: {selected_asset_id}" if selected_asset_id else "No Asset"
        
        ActivityLog.objects.create(
            user=self.request.user,
            activity_type=is_update,
            description=f"{'Updated' if is_update == 'update' else 'Created'} category: {self.object.title} ({media_info})",
            ip_address=get_client_ip(self.request)
        )
        
        messages.success(self.request, f"Category '{self.object.title}' saved successfully.")
        return response


class CategoryCreateView(CategoryBaseView, CreateView):
    pass

class CategoryEditView(CategoryBaseView, UpdateView):
    slug_url_kwarg = 'slug'

class CategoryDeleteView(LoginRequiredMixin, DeleteView):
    model = Category
    slug_url_kwarg = 'slug'
    success_url = reverse_lazy('core:category_list') 

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()
        self.object.delete()
        messages.success(request, "Category and posts deleted.")
        return redirect(self.success_url)


class PostListByCategoryView(LoginRequiredMixin, ListView):
    model = CategoryPost
    template_name = 'categories/post_list.html'
    context_object_name = 'posts'

    def get_queryset(self):
        self.category = get_object_or_404(Category, slug=self.kwargs['category_slug'])
        return CategoryPost.objects.filter(category=self.category).order_by('-created_at')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['category'] = self.category
        return context

class CatPostBaseView(LoginRequiredMixin):
    model = CategoryPost
    form_class = DynamicCategoryPostForm
    template_name = 'categories/post_form.html'

    def get_form_kwargs(self):
        kwargs = super().get_form_kwargs()
        # Fetch and store category once
        self.category = get_object_or_404(Category, slug=self.kwargs['category_slug'])
        kwargs['category_id'] = self.category.id
        return kwargs
        
    def form_valid(self, form):
        # 1. Attach the stored category and author
        form.instance.category = self.category
        form.instance.author = self.request.user

        # 2. MEDIA LIBRARY PICKER FIX:
        # Capture the ID from the hidden 'library_asset_id' input in your HTML
        selected_asset_id = self.request.POST.get('library_asset_id')
        
        if selected_asset_id:
            # Manually link the Foreign Key using the ID from the picker
            form.instance.featured_image_id = selected_asset_id
        elif selected_asset_id == "":
            # Handle clearing the image
            form.instance.featured_image = None

        # 3. Save the main Post instance
        response = super().form_valid(form)
        
        # 4. Handle Multiple Gallery Image Uploads (Legacy File Upload)
        # Note: Replace 'PostImage' with your actual Gallery Model name
        images = self.request.FILES.getlist('gallery_images')
        for f in images:
            # Assuming you have a PostImage model that links to CategoryPost
            # PostImage.objects.create(post=self.object, image=f)
            pass
            
        return response
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['category'] = self.category
        return context
    
    def get_success_url(self):
        # FIX: Changed namespace from 'users' to 'core' based on your previous logs
        # If your namespace is actually 'accounts', use that instead.
        return reverse('core:post_list_by_category', kwargs={'category_slug': self.kwargs['category_slug']})
    

class PostCreateView(CatPostBaseView, CreateView):
    pass

class PostEditView(CatPostBaseView, UpdateView):
    slug_url_kwarg = 'post_slug'
    

class PostDeleteView(LoginRequiredMixin, DeleteView):
    model = CategoryPost
    slug_url_kwarg = 'post_slug'
    success_url = reverse_lazy('core:post_list_by_category')

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()
        slug = self.kwargs['category_slug']
        self.object.delete()
        return redirect(reverse('core:post_list_by_category', kwargs={'category_slug': slug}))
    
    def get_success_url(self):
        return reverse('core:post_list_by_category', kwargs={'category_slug': self.kwargs['category_slug']})
    

# =========================================================
#             2. WIDGET & WIDGET POST VIEWS
# =========================================================

class WidgetListView(LoginRequiredMixin, ListView):
    model = Widget
    template_name = 'widgets/widget_list.html'
    context_object_name = 'widgets'

    def get_queryset(self):
        return Widget.objects.annotate(post_count=Count('widget_posts')).order_by('title')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['POST_FIELD_CHOICES'] = dict(POST_FIELD_CHOICES)
        return super().get_context_data(**kwargs)

class WidgetBaseView(LoginRequiredMixin):
    model = Widget
    form_class = WidgetForm
    template_name = 'widgets/widget_form.html'
    success_url = reverse_lazy('core:widget_list')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['available_media_cats'] = MediaAsset.objects.values_list(
            'mediacat', flat=True
        ).distinct().order_by('mediacat')
        return context
    
    def form_valid(self, form):
        selected_asset_id = self.request.POST.get('library_asset_id')
        
        if selected_asset_id:
            form.instance.media_asset_id = selected_asset_id

        response = super().form_valid(form)
        
        # 3. Enhanced Logging
        is_update = 'update' if self.object.pk else 'create'
        media_info = f"Asset ID: {selected_asset_id}" if selected_asset_id else "No Asset"
        
        ActivityLog.objects.create(
            user=self.request.user,
            activity_type=is_update,
            description=f"{'Updated' if is_update == 'update' else 'Created'} widget: {self.object.title} ({media_info})",
            ip_address=get_client_ip(self.request)
        )
        
        messages.success(self.request, f"Widget '{self.object.title}' saved successfully.")
        return response


class WidgetCreateView(WidgetBaseView, CreateView):
    pass

class WidgetEditView(WidgetBaseView, UpdateView):
    slug_url_kwarg = 'slug'

class WidgetDeleteView(LoginRequiredMixin, DeleteView):
    model = Widget
    slug_url_kwarg = 'slug'
    success_url = reverse_lazy('core:widget_list')

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()
        self.object.delete()
        return redirect(self.success_url)

class PostListByWidgetView(LoginRequiredMixin, ListView):
    model = WidgetPost
    template_name = 'widgets/wid_post_list.html'
    context_object_name = 'posts'

    def get_queryset(self):
        self.widget = get_object_or_404(Widget, slug=self.kwargs['widget_slug'])
        return WidgetPost.objects.filter(widget=self.widget).order_by('-created_at')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['widget'] = self.widget
        return context


class WidPostBaseView(LoginRequiredMixin):
    model = WidgetPost
    form_class = DynamicWidgetPostForm
    template_name = 'widgets/wid_postcreate.html'

    def get_form_kwargs(self):
        kwargs = super().get_form_kwargs()
        # Fetch and store category once
        self.widget = get_object_or_404(Widget, slug=self.kwargs['widget_slug'])
        kwargs['widget_id'] = self.widget.id
        return kwargs
        
    def form_valid(self, form):
        # 1. Attach the stored category and author
        form.instance.widget = self.widget
        form.instance.author = self.request.user

        # 2. MEDIA LIBRARY PICKER FIX:
        selected_asset_id = self.request.POST.get('library_asset_id')
        
        if selected_asset_id:
            # Manually link the Foreign Key using the ID from the picker
            form.instance.featured_image_id = selected_asset_id
        elif selected_asset_id == "":
            # Handle clearing the image
            form.instance.featured_image = None

        # 3. Save the main Post instance
        response = super().form_valid(form)
        
        # 4. Handle Multiple Gallery Image Uploads (Legacy File Upload)
        # Note: Replace 'PostImage' with your actual Gallery Model name
        images = self.request.FILES.getlist('gallery_images')
        for f in images:
            # Assuming you have a PostImage model that links to CategoryPost
            # PostImage.objects.create(post=self.object, image=f)
            pass
            
        return response
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['widget'] = self.widget
        return context
    
    def get_success_url(self):
        return reverse('core:post_list_by_widget', kwargs={'widget_slug': self.kwargs['widget_slug']})
    

class WidgetPostCreateView(WidPostBaseView, CreateView):
    pass

class WidgetPostEditView(WidPostBaseView, UpdateView):
    slug_url_kwarg = 'post_slug'

# class WidgetPostCreateView(LoginRequiredMixin, CreateView):
#     model = WidgetPost
#     form_class = DynamicWidgetPostForm
#     template_name = 'widgets/wid_postcreate.html'

#     def get_widget(self):
#         return get_object_or_404(Widget, slug=self.kwargs['widget_slug'])

#     def get_form_kwargs(self):
#         kwargs = super().get_form_kwargs()
#         kwargs['widget_id'] = self.get_widget().id
#         return kwargs
    
#     def form_valid(self, form):
#         form.instance.widget = self.get_widget()
#         form.instance.author = self.request.user
#         return super().form_valid(form)
    
#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         # Pass the actual widget object so {{ widget.slug }} works in templates
#         context['widget'] = self.get_widget()
#         return context

#     def get_success_url(self):
#         return reverse('core:post_list_by_widget', kwargs={'widget_slug': self.kwargs['widget_slug']})


# class WidgetPostEditView(LoginRequiredMixin, UpdateView):
#     model = WidgetPost
#     form_class = DynamicWidgetPostForm
#     template_name = 'widgets/wid_post_edit.html'
#     slug_url_kwarg = 'post_slug'

#     def get_object(self, queryset=None):
#         """
#         Ensures the post exists AND belongs to the widget in the URL.
#         This prevents 404s when the slugs don't match exactly.
#         """
#         return get_object_or_404(
#             WidgetPost, 
#             slug=self.kwargs.get('post_slug'),
#             widget__slug=self.kwargs.get('widget_slug')
#         )

#     def get_form_kwargs(self):
#         kwargs = super().get_form_kwargs()
#         # Fetch the object once to avoid multiple DB hits
#         obj = self.get_object()
#         kwargs['widget_id'] = obj.widget.id
#         return kwargs
    
#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         # Pass the widget to the template for the breadcrumbs/header
#         context['widget'] = self.get_object().widget
#         return context
    
#     def get_success_url(self):
#         # Redirect back to the slide list for this specific widget
#         return reverse('core:post_list_by_widget', kwargs={'widget_slug': self.object.widget.slug})


class WidgetPostDeleteView(LoginRequiredMixin, DeleteView):
    model = WidgetPost
    slug_url_kwarg = 'post_slug'

    def post(self, request, *args, **kwargs):
        self.object = self.get_object()
        widget_slug = self.object.widget.slug
        self.object.delete()
        return redirect('core:post_list_by_widget', widget_slug=widget_slug)

# # --- Category Posts ---

# class PostListByCategoryView(LoginRequiredMixin, ListView):
#     model = CategoryPost
#     template_name = 'categories/post_list.html'
#     context_object_name = 'posts'

#     def get_queryset(self):
#         self.category = get_object_or_404(Category, slug=self.kwargs['category_slug'])
#         return CategoryPost.objects.filter(category=self.category).order_by('-created_at')
    
#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         context['category'] = self.category
#         return context

# class PostCreateView(LoginRequiredMixin, CreateView):
#     model = CategoryPost
#     form_class = DynamicCategoryPostForm
#     template_name = 'categories/post_create.html'

#     def get_form_kwargs(self):
#         kwargs = super().get_form_kwargs()
#         # Fetch and store category once
#         self.category = get_object_or_404(Category, slug=self.kwargs['category_slug'])
#         kwargs['category_id'] = self.category.id
#         return kwargs
        
#     def form_valid(self, form):
#         # 1. Save the main Post instance first
#         form.instance.author = self.request.user
#         # If CreateView, ensure category is set (as we did before)
#         if not hasattr(form.instance, 'category'):
#             form.instance.category = get_object_or_404(Category, slug=self.kwargs['category_slug'])
        
#         response = super().form_valid(form)
        
#         # 2. Handle Multiple Image Uploads
#         images = self.request.FILES.getlist('gallery_images')
#         for f in images:
#             # Assuming your gallery model is 'PostImage' and has a foreign key 'post'
#             Category.image.objects.create(post=self.object, image=f)
            
#         return response
    
#     def form_valid(self, form):
#         # Attach the stored category and author
#         form.instance.category = self.category
#         form.instance.author = self.request.user
#         return super().form_valid(form)
    
#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         context['category'] = self.category # Use the cached version
#         return context
    
#     def get_success_url(self):
#         return reverse('core:post_list_by_category', kwargs={'category_slug': self.kwargs['category_slug']})
     

# class PostEditView(LoginRequiredMixin, UpdateView):
#     model = CategoryPost
#     form_class = DynamicCategoryPostForm
#     template_name = 'categories/post_edit.html'
#     slug_url_kwarg = 'post_slug'

#     def get_form_kwargs(self):
#         kwargs = super().get_form_kwargs()
#         kwargs['category_instance'] = self.get_object().category.id
#         return kwargs
    
#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         context['category'] = self.object.category
#         context['category_slug'] = self.object.category.slug 
#         return context
    
#     def get_success_url(self):
#         return reverse('core:post_list_by_category', kwargs={'category_slug': self.kwargs['category_slug']})


# class PostDetailView(LoginRequiredMixin, DetailView):
#     model = CategoryPost
#     template_name = 'categories/post_detail.html'
#     slug_url_kwarg = 'post_slug'
#     context_object_name = 'post'

# class PostDeleteView(LoginRequiredMixin, DeleteView):
#     model = CategoryPost
#     slug_url_kwarg = 'post_slug'
#     success_url = reverse_lazy('core:post_list_by_category')

#     def get(self, request, *args, **kwargs):
#         self.object = self.get_object()
#         slug = self.kwargs['category_slug']
#         self.object.delete()
#         return redirect(reverse('core:post_list_by_category', kwargs={'category_slug': slug}))
    
#     def get_success_url(self):
#         return reverse('core:post_list_by_category', kwargs={'category_slug': self.kwargs['category_slug']})
    

# =========================================================
#             2. WIDGET & WIDGET POST VIEWS
# =========================================================

# class WidgetListView(LoginRequiredMixin, ListView):
#     model = Widget
#     template_name = 'widgets/widget_list.html'
#     context_object_name = 'widgets'

#     def get_queryset(self):
#         return Widget.objects.annotate(post_count=Count('widget_posts')).order_by('title')
    
#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         context['POST_FIELD_CHOICES'] = dict(POST_FIELD_CHOICES)
#         return super().get_context_data(**kwargs)

# class WidgetCreateView(LoginRequiredMixin, CreateView):
#     model = Widget
#     form_class = WidgetForm
#     template_name = 'widgets/widget_form.html'
#     success_url = reverse_lazy('core:widget_list')

# class WidgetEditView(LoginRequiredMixin, UpdateView):
#     model = Widget
#     form_class = WidgetForm
#     template_name = 'widgets/widget_form.html'
#     slug_url_kwarg = 'slug'
#     success_url = reverse_lazy('core:widget_list')

# class WidgetDeleteView(LoginRequiredMixin, DeleteView):
#     model = Widget
#     slug_url_kwarg = 'slug'
#     success_url = reverse_lazy('core:widget_list')

#     def get(self, request, *args, **kwargs):
#         self.object = self.get_object()
#         self.object.delete()
#         return redirect(self.success_url)

# class PostListByWidgetView(LoginRequiredMixin, ListView):
#     model = WidgetPost
#     template_name = 'widgets/wid_post_list.html'
#     context_object_name = 'posts'

#     def get_queryset(self):
#         self.widget = get_object_or_404(Widget, slug=self.kwargs['widget_slug'])
#         return WidgetPost.objects.filter(widget=self.widget).order_by('-created_at')

#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         context['widget'] = self.widget
#         return context

# class WidgetPostCreateView(LoginRequiredMixin, CreateView):
#     model = WidgetPost
#     form_class = DynamicWidgetPostForm
#     template_name = 'widgets/wid_postcreate.html'

#     def get_widget(self):
#         return get_object_or_404(Widget, slug=self.kwargs['widget_slug'])

#     def get_form_kwargs(self):
#         kwargs = super().get_form_kwargs()
#         kwargs['widget_id'] = self.get_widget().id
#         return kwargs
    
#     def form_valid(self, form):
#         form.instance.widget = self.get_widget()
#         form.instance.author = self.request.user
#         return super().form_valid(form)
    
#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         # Pass the actual widget object so {{ widget.slug }} works in templates
#         context['widget'] = self.get_widget()
#         return context

#     def get_success_url(self):
#         return reverse('core:post_list_by_widget', kwargs={'widget_slug': self.kwargs['widget_slug']})


# class WidgetPostEditView(LoginRequiredMixin, UpdateView):
#     model = WidgetPost
#     form_class = DynamicWidgetPostForm
#     template_name = 'widgets/wid_post_edit.html'
#     slug_url_kwarg = 'post_slug'

#     def get_object(self, queryset=None):
#         """
#         Ensures the post exists AND belongs to the widget in the URL.
#         This prevents 404s when the slugs don't match exactly.
#         """
#         return get_object_or_404(
#             WidgetPost, 
#             slug=self.kwargs.get('post_slug'),
#             widget__slug=self.kwargs.get('widget_slug')
#         )

#     def get_form_kwargs(self):
#         kwargs = super().get_form_kwargs()
#         # Fetch the object once to avoid multiple DB hits
#         obj = self.get_object()
#         kwargs['widget_id'] = obj.widget.id
#         return kwargs
    
#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         # Pass the widget to the template for the breadcrumbs/header
#         context['widget'] = self.get_object().widget
#         return context
    
#     def get_success_url(self):
#         # Redirect back to the slide list for this specific widget
#         return reverse('core:post_list_by_widget', kwargs={'widget_slug': self.object.widget.slug})


# class WidgetPostDeleteView(LoginRequiredMixin, DeleteView):
#     model = WidgetPost
#     slug_url_kwarg = 'post_slug'

#     def post(self, request, *args, **kwargs):
#         self.object = self.get_object()
#         widget_slug = self.object.widget.slug
#         self.object.delete()
#         return redirect('core:post_list_by_widget', widget_slug=widget_slug)
    

# =========================================================
# 4. BROADCAST & SUBSCRIBER HUB
# =========================================================

class SubcribersHubView(LoginRequiredMixin, FormView):
    template_name = 'subscribers_list.html'
    form_class = SubcribersForm
    success_url = reverse_lazy('core:subscriber_list')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['subscribers'] = ExternalSubscriber.objects.all().order_by('-id')
        context['bulk_form'] = CSVUploadForm()
        return context

    def post(self, request, *args, **kwargs):
        if 'csv_file' in request.FILES:
            return self.handle_bulk_upload(request)
        return super().post(request, *args, **kwargs)

    def form_valid(self, form):
        subscriber = form.save(commit=False)
        subscriber.ip_address = get_client_ip(self.request)
        subscriber.save()
        messages.success(self.request, "Subscriber added successfully!")
        return redirect(self.success_url)

    def handle_bulk_upload(self, request):
        bulk_form = CSVUploadForm(request.POST, request.FILES)
        if bulk_form.is_valid():
            csv_file = request.FILES['csv_file']
            try:
                data_set = csv_file.read().decode('UTF-8')
                io_string = io.StringIO(data_set)
                reader = csv.reader(io_string, delimiter=',', quotechar="|")
                next(reader) 
                created_count = 0
                for row in reader:
                    if not row: continue
                    email = row[0].strip()
                    if email and not ExternalSubscriber.objects.filter(email=email).exists():
                        ExternalSubscriber.objects.create(email=email, ip_address=get_client_ip(request))
                        created_count += 1
                messages.success(request, f"Imported {created_count} new subscribers.")
            except Exception as e:
                messages.error(request, f"Error processing file: {e}")
        return redirect(self.success_url)
    

class SubscriberDeleteView(LoginRequiredMixin, DeleteView):
    model = ExternalSubscriber
    success_url = reverse_lazy('core:subscriber_list')
    
    def get(self, request, *args, **kwargs):
        return self.post(request, *args, **kwargs)

    def delete(self, request, *args, **kwargs):
        messages.warning(request, "Subscriber removed.")
        return super().delete(request, *args, **kwargs)
    

class ExternalSubscribers(FormView):
    """
    A single, robust view for all subscription forms.
    Handles duplicates, geo-tracking, and dynamic redirects.
    """
    form_class = SubcribersForm

    def get_success_url(self):
        # Redirect back to the page the user was on, or home if referer is missing
        return self.request.META.get('HTTP_REFERER', '/')

    def form_valid(self, form):
        email = form.cleaned_data.get("email")

        # 1. DUPLICATE PREVENTION
        if ExternalSubscriber.objects.filter(email=email).exists():
            messages.warning(self.request, "This email is already subscribed.")
            return HttpResponseRedirect(self.get_success_url())

        # 2. ENHANCED DATA (GEO-TRACKING)
        geo = get_geo_info(self.request)
        subscriber = form.save(commit=False)

        # Attach tracking data
        subscriber.ip_address = geo.get('ip')
        subscriber.city = geo.get('city')
        subscriber.region = geo.get('region')
        subscriber.country = geo.get('country')

        subscriber.save()

        # 3. SUCCESS FEEDBACK
        messages.success(self.request, "Thank you for subscribing!")

        # 4. DYNAMIC REDIRECT
        return HttpResponseRedirect(self.get_success_url())

    def form_invalid(self, form):
        messages.error(self.request, "Please provide a valid email address.")
        return HttpResponseRedirect(self.get_success_url())
    

class BroadcastCreateView(LoginRequiredMixin, CreateView):
    model = NewsPost
    form_class = BroadcastForm
    template_name = 'send_email.html'
    success_url = reverse_lazy('core:broadcast_dashboard')

    def get(self, request, *args, **kwargs):
        if request.headers.get('x-requested-with') == 'XMLHttpRequest':
            audience = request.GET.get('audience')
            emails = set()
            filters = {
                'is_manager': {'is_manager': True},
                'super_admin': {'is_superuser': True},
                'staffs': {'is_staff': True},
                'clients': {'is_client': True},
                'department': {'department__name__iexact': request.GET.get('department')}
            }
            if audience == 'all':
                emails.update(CustomUser.objects.filter(is_active=True).values_list('email', flat=True))
                emails.update(ExternalSubscriber.objects.values_list('email', flat=True))
            elif audience == 'department':
                emails.update(CustomUser.objects.filter(department__name=request.GET.get('department'), is_active=True).values_list('email', flat=True))
            elif audience == 'external_only':
                emails.update(ExternalSubscriber.objects.values_list('email', flat=True))
            elif audience in filters:
                emails.update(CustomUser.objects.filter(**filters[audience], is_active=True).values_list('email', flat=True))
            return JsonResponse({'emails': sorted(list(emails))})
        return super().get(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['recent_posts'] = NewsPost.objects.all().order_by('-created_at')[:10]
        return context

    def form_valid(self, form):
        self.object = form.save()
        recipient_list = self.request.POST.getlist('final_recipients') or self.object.gather_emails()

        if not recipient_list:
            messages.error(self.request, "No recipients found.")
            return redirect(self.success_url)

        user_tz = ZoneInfo(self.request.POST.get('user_timezone', 'UTC'))
        scheduled_time = self.object.scheduled_time

        if scheduled_time:
            if is_naive(scheduled_time): scheduled_time = make_aware(scheduled_time, user_tz)
            scheduled_time_utc = scheduled_time.astimezone(ZoneInfo('UTC'))
        else:
            scheduled_time_utc = None

        if scheduled_time_utc and scheduled_time_utc > timezone_now():
            send_broadcast_task.apply_async(kwargs={'post_id': self.object.id, 'recipient_list': recipient_list, 'from_email': self.object.sender_email}, eta=scheduled_time_utc)
            self.object.status = 'scheduled'
            messages.success(self.request, f"📅 Scheduled for {scheduled_time.strftime('%Y-%m-%d %H:%M')}")
        else:
            send_broadcast_task.delay(post_id=self.object.id, recipient_list=recipient_list, from_email=self.object.sender_email)
            self.object.status = 'sending'
            messages.success(self.request, "🚀 Broadcast sending now.")

        self.object.save(update_fields=['status'])
        return redirect(self.success_url)


class BroadcastDeleteView(LoginRequiredMixin, DeleteView):
    model = NewsPost
    success_url = reverse_lazy('core:broadcast_dashboard')
    
    def get(self, request, *args, **kwargs): 
        return self.post(request, *args, **kwargs)


class SiteSettingsUpdateView(UserPassesTestMixin, FormView):
    form_class = SiteSettingsKeyForm
    template_name = 'settings/site_settings.html' 
    success_url = reverse_lazy('core:site_settings') 
    
    def test_func(self): return self.request.user.is_superuser
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        combined = []
        for setting in context['form'].settings:
            combined.append({
                'value_field': context['form'][setting.var_name],
                'description_field': context['form'][f'desc_{setting.var_name}'],
                'var_name': setting.var_name,
                'label': context['form'][setting.var_name].label
            })
        context['combined_settings_list'] = combined
        return context
        
    def form_valid(self, form):
        form.save()
        messages.success(self.request, "Settings updated.")
        return super().form_valid(form)
    

class DownloadCSVTemplateView(LoginRequiredMixin, View):
    def get(self, request):
        response = HttpResponse(content_type='text/csv')
        response['Content-Disposition'] = 'attachment; filename="all_subscribers.csv"'
        writer = csv.writer(response)
        writer.writerow(['Email', 'Date Subscribed', 'IP Address', 'Region'])
        subscribers = ExternalSubscriber.objects.all().values_list('email', 'date_subscribed', 'ip_address', 'region')
        for sub in subscribers: writer.writerow(sub)
        return response


class SubscriberDeleteView(LoginRequiredMixin, DeleteView):
    model = ExternalSubscriber
    success_url = reverse_lazy('core:subscriber_list')
    def get(self, request, *args, **kwargs): return self.post(request, *args, **kwargs)

