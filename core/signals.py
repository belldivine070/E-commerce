from django.contrib.auth.signals import user_logged_in, user_logged_out
from django.dispatch import receiver
from cart.models import Cart, CartItem
from django.contrib.auth import get_user_model
from django.utils import timezone

User = get_user_model()



@receiver(user_logged_in)
def merge_carts(sender, user, request, **kwargs):
    """
    Moves items from an anonymous cart to a user's cart.
    Uses 'anon_cart_id' for a more reliable link than session_key.
    """
    # 1. Try to find the cart via the "hard link" ID first
    cart_id = request.session.get('anon_cart_id')
    anonymous_cart = None

    if cart_id:
        anonymous_cart = Cart.objects.filter(id=cart_id, user__isnull=True).first()
    
    # 2. Fallback: Try the session key if ID isn't found
    if not anonymous_cart:
        session_key = request.session.session_key
        anonymous_cart = Cart.objects.filter(session_key=session_key, user__isnull=True).first()

    if anonymous_cart:
        user_cart, _ = Cart.objects.get_or_create(user=user)

        for item in anonymous_cart.items.all():
            existing_item = CartItem.objects.filter(
                cart=user_cart, 
                product=item.product, 
                variant=item.variant
            ).first()

            if existing_item:
                existing_item.quantity += item.quantity
                existing_item.save()
                item.delete()
            else:
                item.cart = user_cart
                item.save()

        # 3. Cleanup
        anonymous_cart.delete()
        # Remove the ID from the session now that we're done
        if 'anon_cart_id' in request.session:
            del request.session['anon_cart_id']


@receiver(user_logged_in)
def safe_update_last_login(sender, request, user, **kwargs):
    User.objects.filter(pk=user.pk).update(last_login=timezone.now(), is_online=True)


@receiver(user_logged_out)
def handle_user_logout(sender, request, user, **kwargs):
    if user:
        User.objects.filter(pk=user.pk).update(is_online=False)