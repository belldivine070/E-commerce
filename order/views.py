from django.views.generic import CreateView, ListView, DetailView, View
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import redirect, render, get_object_or_404
from .models import Order, OrderItem
from .forms import OrderCreateForm
from django.db import transaction
from cart.models import Cart, CartItem
from django.contrib import messages
from accounts.models import Address





class CheckoutView(LoginRequiredMixin, View):
    template_name = 'lmsn/checkout.html'
    login_url = 'accounts:register' or 'accounts:login'

    def get_cart(self, request):
        # Ensure we get the DB-backed cart for the logged-in user
        return Cart.objects.filter(user=request.user).first()

    def get(self, request, order_id=None, *args, **kwargs):
        # --- 1. Restore Order Logic ---
        if order_id:
            # Check for existing unpaid order
            order = get_object_or_404(Order, id=order_id, user=request.user, is_paid=False)
            cart, _ = Cart.objects.get_or_create(user=request.user)

            try:
                with transaction.atomic():
                    for item in order.order_items.all():
                        # FIX: Logic to handle product access safely
                        product_obj = item.variant.product if item.variant else None
                        
                        if product_obj:
                            cart_item, created = CartItem.objects.get_or_create(
                                cart=cart,
                                product=product_obj,
                                variant=item.variant,
                                defaults={
                                    'quantity': item.quantity,
                                    'price_at_addition': item.price_at_purchase
                                }
                            )
                            if not created:
                                cart_item.quantity += item.quantity
                                cart_item.save()

                    # Important: Delete the old order so we don't have duplicates
                    order.delete()

                     # FORCE CACHE CLEAR
                    request.session['cart_modified'] = True
                    request.session.modified = True

                    messages.info(request, "Items restored to checkout. Please confirm your details.")
                    
                # Redirect to the standard checkout URL (WITHOUT the order_id)
                return redirect('orders:checkout')
            except Exception as e:
                messages.error(request, f"Restore failed: {str(e)}")
                return redirect('orders:order_list')

        # --- 2. Standard GET Logic ---
        cart = self.get_cart(request)
        
        # FIX: Check if the cart has items. 
        # If we just redirected from the 'restore' logic, cart.items.exists() must be True.
        if not cart or not cart.items.exists():
            messages.info(request, "Your cart is empty.")
            return redirect('lmsn:index')
        
        # Pre-filling logic
        user_address = Address.objects.filter(user=request.user, is_default=True).first()
        if not user_address:
            user_address = Address.objects.filter(user=request.user).first()
        
        context = {
            'cart': cart,
            'items': cart.items.select_related('product', 'variant', 'variant__size', 'variant__color'),
            'default_name': request.user.full_name,
            'default_email': request.user.email,
            'default_phone': request.user.mobile or '',
            # Prefilling from the separate Address model instance
            'saved_address': user_address.address_line_1 if user_address else '',
            'saved_city': user_address.city if user_address else '',
            'saved_state': user_address.state if user_address else '',
        }
        return render(request, self.template_name, context)
    
    def post(self, request, *args, **kwargs):
        cart = self.get_cart(request)
        
        selected_item_ids = request.POST.getlist('selected_items')
        if not selected_item_ids:
            messages.error(request, "Please select at least one item to order.")
            return redirect('orders:checkout')

        items_to_order = cart.items.filter(id__in=selected_item_ids)
        
        order_subtotal = sum(item.quantity * item.price_at_addition for item in items_to_order)
        shipping_fee = 0 
        total_amount = order_subtotal + shipping_fee

        try:
            with transaction.atomic():
                # Construct shipping address
                address = request.POST.get('address', '')
                city = request.POST.get('city', '')
                state = request.POST.get('state', '')
                full_address = f"{address}, {city}, {state}"
                
                order = Order.objects.create(
                    user=request.user,
                    recipient_name=request.POST.get('full_name') or request.user.full_name,
                    recipient_email=request.POST.get('email') or request.user.email,
                    shipping_phone=request.POST.get('phone') or (request.user.mobile or ''),
                    shipping_address=full_address,
                    subtotal=order_subtotal,
                    shipping_fee=shipping_fee,
                    total_amount=total_amount,
                    status='pending',
                    order_notes=request.POST.get('order_notes', '')
                )

                for item in items_to_order:
                    OrderItem.objects.create(
                        order=order,
                        variant=item.variant,
                        product_name_snapshot=item.variant.product.name if item.variant else "Unknown Product",
                        price_at_purchase=item.price_at_addition, 
                        quantity=item.quantity
                    )

                # Step 5: CLEAR CART (This makes the cart empty)
                items_to_order.delete()

                # Step 6: ACTIVATE PAYMENT
                # This is the "Pay Now" trigger. It redirects the browser to the payment app.
                # print(f"--- REDIRECTING TO ORDER {order.id} ---") # Add this line to confirm we're hitting this point
                return redirect('payments:initiate', order_id=order.id)

        except Exception as e:
            messages.error(request, f"Checkout failed: {str(e)}")
            return redirect('orders:checkout')
        


class OrderListView(LoginRequiredMixin, ListView):
    model = Order
    template_name = "orders/order_list.html"
    context_object_name = "orders"
    paginate_by = 10

    def get_queryset(self):
        return Order.objects.filter(user=self.request.user).order_by("-created_at")
    

class OrderDetailView(LoginRequiredMixin, DetailView):
    model = Order
    template_name = "lmsn/order_detail.html"
    context_object_name = "order"

    def get_queryset(self):
        # We prefetch 'tracking_history' and the linked 'status_message' 
        # to make the timeline load instantly.
        return Order.objects.filter(user=self.request.user).prefetch_related(
            'order_items', 
            'tracking_history__status_message'
        )
    

# class OrderHistoryView(LoginRequiredMixin, ListView):
#     model = Order
#     template_name = 'orders/history.html'

#     def get_queryset(self):
#         return Order.objects.filter(user=self.request.user)
