import logging
from celery import shared_task
from django.apps import apps
from django.utils import timezone
from django.core.mail import EmailMessage
from django.conf import settings

logger = logging.getLogger(__name__)

@shared_task(bind=True, max_retries=3)
def send_single_email_task(self, recipient, subject, body, from_email):
    """
    Sends one individual email. 
    If it fails, it retries 3 times with a 30-second delay.
    """
    try:
        msg = EmailMessage(
            subject=subject,
            body=body,
            from_email=from_email,
            to=[recipient.strip()],
        )
        msg.content_subtype = "html"
        msg.send(fail_silently=False)
        return f"Sent to {recipient}"
    except Exception as exc:
        logger.error(f"Error sending to {recipient}: {str(exc)}")
        # Retry after 30 seconds
        raise self.retry(exc=exc, countdown=30)

@shared_task
def send_broadcast_task(post_id, recipient_list, from_email, subject=None):
    """
    Master Task: Spawns individual tasks for every recipient.
    This ensures one bad email address doesn't stop the whole broadcast.
    """
    # Using 'core' because we moved NewsPost to core/models.py
    NewsPost = apps.get_model('core', 'NewsPost')
    
    try:
        post = NewsPost.objects.get(id=post_id)
    except NewsPost.DoesNotExist:
        logger.error(f"NewsPost with ID {post_id} not found.")
        return "Post not found"
    
    email_subject = subject or post.subject or post.title
    
    # Update status to 'sending' while loop runs
    post.status = 'sending'
    post.save(update_fields=['status'])

    # Spawn individual tasks
    for recipient in recipient_list:
        send_single_email_task.delay(
            recipient=recipient,
            subject=email_subject,
            body=post.content,
            from_email=from_email
        )

    # Final update to status
    post.status = 'sent'
    post.last_sent_at = timezone.now()
    post.save(update_fields=['status', 'last_sent_at'])
    
    return f"Queued {len(recipient_list)} individual email tasks."

@shared_task
def check_scheduled_broadcasts():
    """
    Celery Beat task to check for scheduled posts that are due to be sent.
    """
    NewsPost = apps.get_model('core', 'NewsPost')
    now = timezone.now()
    
    # Find posts marked as 'draft' or 'scheduled' where the time has arrived
    pending_posts = NewsPost.objects.filter(
        status__in=['draft', 'scheduled'],
        scheduled_time__lte=now
    )
    
    for post in pending_posts:
        recipients = post.gather_emails()
        if recipients:
            send_broadcast_task.delay(
                post_id=post.id,
                recipient_list=recipients,
                from_email=post.sender_email
            )
        else:
            logger.warning(f"Post {post.id} has no recipients in target audience.")
            post.status = 'failed'
            post.save(update_fields=['status'])