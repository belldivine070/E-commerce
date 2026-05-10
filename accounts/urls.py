from django.urls import path
from . import views
from django.contrib.auth import views as auth_views

app_name = 'accounts'

urlpatterns = [
    # =========================================================
    # 1. AUTHENTICATION & PUBLIC SIGNUP
    # =========================================================
    path('', views.UserLoginView.as_view(), name='login'),
    path('logout/', views.UserLogoutView.as_view(), name='logout'),
    path('signup/', views.SignupView.as_view(), name='register'),

    # ... other urls ...
    path('password-reset/', auth_views.PasswordResetView.as_view(template_name='accounts/password_reset.html'), name='password_reset'),
    path('password-reset/done/', auth_views.PasswordResetDoneView.as_view(template_name='accounts/password_reset_done.html'), name='password_reset_done'),
    path('password-reset-confirm/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(template_name='accounts/password_reset_confirm.html'), name='password_reset_confirm'),
    path('password-reset-complete/', auth_views.PasswordResetCompleteView.as_view(template_name='accounts/password_reset_complete.html'), name='password_reset_complete'),

    # =========================================================
    # 2. USER MANAGEMENT (Staff/Admin)
    # =========================================================
    # This acts as the main Account List with Search/Filters
    path('users/', views.ManageUsersListView.as_view(), name='manage_users'),
    path('edit/<uuid:pk>/', views.EditSubordinateView.as_view(), name='edit_user'),
    path('detail/<uuid:pk>/', views.UserDetailView.as_view(), name='user_detail'),
    path('assignments/', views.StaffAssignmentView.as_view(), name='staff_assignment'),

    # =========================================================
    # 2. CUSTOMER MANAGEMENT
    # =========================================================
    # This acts as the main Account List with Search/Filters
    path('manage-customers/', views.ManageCustomersListView.as_view(), name='manage_customers'),
    path('customer/<uuid:pk>/edit/', views.CustomerEditView.as_view(), name='customer_edit'),
    path('customer/<uuid:pk>/delete/', views.CustomerDeleteView.as_view(), name='customer_delete'),

    # =========================================================
    # 3. ROLE MANAGEMENT (Superuser Only)
    # =========================================================
    path('roles/', views.ManageRolesView.as_view(), name='manage_roles'),
    path('roles/add/', views.RoleCreateView.as_view(), name='add_role'),
    path('roles/edit/<int:pk>/', views.RoleUpdateView.as_view(), name='edit_role'),
    path('roles/delete/<int:pk>/', views.RoleDeleteView.as_view(), name='delete_role'),
]