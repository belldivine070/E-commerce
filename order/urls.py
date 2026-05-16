from django.urls import path
from .import views


app_name = 'orders'



urlpatterns = [
    path('checkout/', views.CheckoutView.as_view(), name='checkout'),
    path('checkout/<int:pk>/', views.CheckoutView.as_view(), name='checkout_retry'),

    # --- User Order Views ---
    # List of all orders
    path('my-orders/', views.OrderListView.as_view(), name='order_list'),    
    path('detail/<int:pk>/', views.OrderDetailView.as_view(), name='order_detail'),
]