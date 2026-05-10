from django.db.models import Q, Count
from django.urls import reverse, reverse_lazy
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin, PermissionRequiredMixin
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, DetailView, FormView
from django.contrib.auth.views import LoginView, LogoutView
from django.contrib import messages
from django.core.exceptions import PermissionDenied
from django.shortcuts import redirect

from django.contrib.auth import update_session_auth_hash
from django.utils.http import url_has_allowed_host_and_scheme
from core.mixins import RolePermissionRequiredMixin
from .models import CustomUser, Position
from .forms import LoginForm, UserEditForm, UserSignupForm, RoleForm

from django.views import View
from django.http import HttpResponse
from django.shortcuts import get_object_or_404



# =========================================================
# 1. AUTHENTICATION VIEWS
# =========================================================

class UserLoginView(LoginView):
    form_class = LoginForm
    template_name = "lmsn/login.html"

    def get_success_url(self):
        user = self.request.user
        next_url = self.request.GET.get('next')

        # ✅ Secure redirect check (prevents open redirect attacks)
        if next_url and url_has_allowed_host_and_scheme(
            url=next_url,
            allowed_hosts={self.request.get_host()}
        ):
            return next_url

        # ✅ Role-based redirect
        if user.is_staff or user.is_superuser:
            return reverse("core:index")

        return reverse("lmsn:index")

    def form_valid(self, form):
        user = form.get_user()
        messages.success(self.request, f"Welcome back, {user.full_name}!")
        return super().form_valid(form)


class UserLogoutView(LogoutView):
    next_page = reverse_lazy("lmsn:index")

    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            messages.info(request, "You have been logged out successfully.")
        return super().dispatch(request, *args, **kwargs)


# =========================================================
# 2. USER REGISTRATION & MANAGEMENT
# =========================================================

class SignupView(RolePermissionRequiredMixin, CreateView):
    """
    Handles both Public Signup and Admin-created users.
    """
    required_permission = 'can_create_user'
    form_class = UserSignupForm
    template_name = "lmsn/register.html"
    success_url = reverse_lazy('accounts:manage_users')

    def form_valid(self, form):
        user = form.save(commit=False)

        is_authenticated = self.request.user.is_authenticated
        is_staff = self.request.user.is_staff if is_authenticated else False

        # ✅ Check if admin/staff is creating user
        is_admin_creating = is_authenticated and is_staff

        # ✅ Assign creator if staff (but not superuser)
        if is_admin_creating and not self.request.user.is_superuser:
            user.assigned_to = self.request.user

        # ✅ Mark public users as clients
        if not is_admin_creating:
            user.is_client = True

        user.save()

        messages.success(self.request, f"User {user.username} created successfully.")

        # ✅ Redirect admin to manage users
        if is_admin_creating:
            return redirect("accounts:manage_users")

        # ✅ Handle safe redirect for public signup
        next_url = self.request.GET.get('next')
        if next_url and url_has_allowed_host_and_scheme(
            url=next_url,
            allowed_hosts={self.request.get_host()}
        ):
            return redirect(next_url)

        return redirect("lsmn:index")
    

class ManageUsersListView(LoginRequiredMixin, PermissionRequiredMixin, ListView):
    model = CustomUser
    permission_required = ['accounts.can_create_user', 'accounts.can_edit_user']
    template_name = 'accounts/manage_users.html'
    context_object_name = 'users'
    paginate_by = 10
    
    def get_queryset(self):
        # 1. Get the actual user object
        request_user = self.request.user
        
        # 2. Corrected Base Queryset logic
        if request_user.is_superuser:
            # Show everyone EXCEPT the current superuser and clients
            queryset = CustomUser.objects.all().exclude(pk=request_user.pk)
        else:
            # Show only users assigned to this staff member
            queryset = CustomUser.objects.filter(assigned_to=request_user)
        
        queryset = queryset.select_related('position', 'assigned_to').order_by("-date_joined")

        # 3. Search and Filters (Cleaned variable names)
        search = self.request.GET.get("search")
        position_slug = self.request.GET.get("Position")
        region = self.request.GET.get("region")

        if search:
            queryset = queryset.filter(
                Q(first_name__icontains=search) |
                Q(last_name__icontains=search) |
                Q(username__icontains=search) |
                Q(email__icontains=search)
            )
        
        if position_slug:
            # Assuming 'position' is the field name on CustomUser
            queryset = queryset.filter(position__slug=position_slug)
            
        if region:
            queryset = queryset.filter(region__icontains=region)

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update({
            "search": self.request.GET.get("search", ""),
            "Position_filter": self.request.GET.get("Position", ""),
            "region_filter": self.request.GET.get("region", "")
        })
        return context

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update({
            "search": self.request.GET.get("search", ""),
            "Position_filter": self.request.GET.get("Position", ""),
            "region_filter": self.request.GET.get("region", "")
        })
        return context


class EditSubordinateView(RolePermissionRequiredMixin, UpdateView):
    model = CustomUser
    form_class = UserEditForm
    template_name = 'accounts/user_edit.html'
    required_permission = ['can_assign_staff', 'can_create_user' ] 
    success_url = reverse_lazy('accounts:manage_users')

    def get_queryset(self):
        if self.request.user.is_superuser:
            return CustomUser.objects.all()
        return CustomUser.objects.filter(assigned_to=self.request.user)


class UserDetailView(LoginRequiredMixin, DetailView):
    model = CustomUser
    template_name = "users/user_detail.html"
    context_object_name = "target_user"

    def get_object(self, queryset=None):
        obj = super().get_object()
        # Security: Only staff or the user themselves can view the profile
        if not self.request.user.is_staff and obj != self.request.user:
            raise PermissionDenied("You are not allowed to view this profile.")
        return obj
    

###########################################################
# Customer
###########################################################
class ManageCustomersListView(LoginRequiredMixin, ListView):
    """Unified View for listing accounts with Search and Filtering."""
    model = CustomUser
    template_name = 'accounts/manage_customers.html'
    required_permission = ['can_assign_staff', 'can_create_user', 'can_edit_user' ] 
    context_object_name = 'users'
    paginate_by = 10
    
    def get_queryset(self):
        # Correctly exclude staff/superusers to only show 'customers'
        queryset = CustomUser.objects.filter(is_staff=False, is_superuser=False).order_by("-date_joined")

        # Capture filter values
        search = self.request.GET.get("search")
        region = self.request.GET.get("region")

        # Apply Search logic
        if search:
            queryset = queryset.filter(
                Q(first_name__icontains=search) |
                Q(last_name__icontains=search) |
                Q(username__icontains=search) |
                Q(email__icontains=search)
            )

        # Apply Position Filter (Checking by slug)
        if region:
            queryset = queryset.filter(region__icontains=region)

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Pass filters back to template to persist in search fields
        context.update({
            "search": self.request.GET.get("search", ""),
            "position_filter": self.request.GET.get("position", ""),
            "region_filter": self.request.GET.get("region", "")
        })
        return context
    

class CustomerEditView(LoginRequiredMixin, PermissionRequiredMixin, UpdateView):
    model = CustomUser
    form_class = UserEditForm
    template_name = 'accounts/user_edit.html'
    permission_required = ('accounts.can_assign_staff', 'accounts.can_create_user')
    success_url = reverse_lazy('accounts:manage_users')

    def get_queryset(self):
        if self.request.user.is_superuser:
            return CustomUser.objects.all()
        return CustomUser.objects.filter(is_client=self.request.user)


class CustomerDeleteView(LoginRequiredMixin, View):
    def delete(self, request, *args, **kwargs):
        pk = kwargs.get('pk')
        customer = get_object_or_404(CustomUser, pk=pk, is_staff=False)
        customer.delete()
        
        return HttpResponse("")
    

# =========================================================
# 3. ROLE MANAGEMENT (Superuser Only)
# =========================================================

class ManageRolesView(UserPassesTestMixin, ListView):
    model = Position
    template_name = 'roles/manage_roles.html'
    context_object_name = 'roles'
    def test_func(self): return self.request.user.is_superuser
    def get_queryset(self): return Position.objects.annotate(user_count=Count('users'))


class RoleCreateView(UserPassesTestMixin, CreateView):
    model = Position
    form_class = RoleForm
    template_name = 'roles/add_role.html'
    success_url = reverse_lazy('accounts:manage_roles')
    def test_func(self): return self.request.user.is_superuser


class RoleUpdateView(UserPassesTestMixin, UpdateView):
    model = Position
    form_class = RoleForm
    template_name = 'roles/edit_role.html'
    success_url = reverse_lazy('accounts:manage_roles')
    def test_func(self): return self.request.user.is_superuser


class RoleDeleteView(UserPassesTestMixin, DeleteView):
    model = Position
    success_url = reverse_lazy('accounts:manage_roles')
    def test_func(self): return self.request.user.is_superuser

    def post(self, request, *args, **kwargs):
        role = self.get_object()
        # Check if any users are currently using this Position
        if Position.users.exists():
            messages.error(request, f"Cannot delete '{Position.name}' because it is assigned to {Position.users.count()} users. Reassign them first.")
            return redirect(self.success_url)
        
        messages.success(request, f"Position '{Position.name}' deleted successfully.")
        return super().post(request, *args, **kwargs)
    


# =================================================
# 4. Assign Staffs
# =================================================

class StaffAssignmentView(RolePermissionRequiredMixin, ListView):
    """
    Dedicated view for managers to see only the staff assigned to them.
    Uses a different template if you want a dashboard-style layout.
    """
    required_permission = 'can_assign_staff' 
    model = CustomUser
    template_name = 'dashboard/staff_assignment.html'
    context_object_name = 'subordinates'

    def get_queryset(self):
        # Only show users assigned to the logged-in user
        return CustomUser.objects.filter(assigned_to=self.request.user).select_related('Position')
    



class CustomPasswordChangeView(LoginRequiredMixin, FormView):
    template_name = 'registration/password_change_form.html'
    success_url = reverse_lazy('users:login')
    def get_form_class(self):
        from django.contrib.auth.forms import PasswordChangeForm
        return PasswordChangeForm
        
    def get_form_kwargs(self):
        kwargs = super().get_form_kwargs()
        kwargs['user'] = self.request.user
        return kwargs
    
    def form_valid(self, form):
        user = form.save()
        update_session_auth_hash(self.request, user)
        messages.success(self.request, "Password updated.")
        return super().form_valid(form)
