from django.shortcuts import render
from django.urls import reverse_lazy, reverse
from django.views.generic import DetailView, TemplateView, ListView, UpdateView, View
from django.views.generic.edit import FormView
from product.models import ProductCategory, Product, Brand, Supplier, ProductInventory
from cart.models import Wishlist, Cart, CartItem
from order.models import Order, OrderItem
from accounts.models import CustomUser, Address
from core.models import Category, CategoryPost, Widget, WidgetPost
from core.utils import get_geo_info
from django.db.models import Prefetch
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.db import transaction
from django.shortcuts import redirect
from .forms import PublicUserCreationForm, ProfileEdit, AddressFormSet, ExternalSubcriberForm
from django.template.loader import render_to_string

from django.shortcuts import get_object_or_404




class Index(TemplateView):
    template_name = 'lmsn/index.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        
        # 1. Queryset for available stock
        in_stock_inventory = ProductInventory.objects.filter(quantity__gt=0)

        # 2. Build the Product Queryset
        # Note: Use the direct name of the relation (inventory_records) here
        active_products_qs = Product.objects.filter(
            is_active=True, inventory_records__quantity__gt=0
        ).select_related('is_primary', 'is_secondary').prefetch_related(
            Prefetch('inventory_records', queryset=in_stock_inventory,to_attr='available_inventory') # Removed 'products__' prefix
        ).distinct()

        # 3. Attach Products to Featured Categories
        context['featured_categories'] = ProductCategory.objects.filter(is_featured=True, is_active=True).prefetch_related(
            Prefetch('products',queryset=active_products_qs,to_attr='active_products')
        ).order_by('?')

        context['categories'] = ProductCategory.objects.filter(is_active=True)
        
        return context
    
    
class CategoryProductListView(ListView):
    model = Product
    template_name = 'lmsn/category_products.html'  # Your customer-side template
    context_object_name = 'products'
    
    def get_queryset(self):
        # Capture the category via the slug in the URL
        self.category = get_object_or_404(ProductCategory, slug=self.kwargs['slug'], is_active=True)
        # Return products for this category only
        return Product.objects.filter(category=self.category, is_active=True).select_related('is_primary')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['category'] = self.category
        return context
    
    
# class ProductDetailView(DetailView):
#     model = Product
#     template_name = 'lmsn\product-detail.html'
#     context_object_name = 'product'

#     def get_queryset(self):
#         # Optimization: Pull images and brand info in one go
#         return Product.objects.filter(is_active=True).select_related('brand', 'category', 'is_primary', 'is_secondary').prefetch_related('gallery', 'variants', 'inventory_records', 'reviews')
    

class ProductDetailView(DetailView):
    model = Product
    template_name = 'lmsn/product-detail.html' # Fixed backslash to forward slash
    context_object_name = 'product'

    def get_queryset(self):
        return Product.objects.filter(is_active=True).select_related('brand', 'category', 'is_primary', 'is_secondary').prefetch_related('gallery', 'variants__color', 'variants__size', 'variants__inventory', 'reviews')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        product = self.get_object()


        if product.tags:
            # Splits "Tag1, Tag2" into ['Tag1', 'Tag2'] and removes extra whitespace
            context['tag_list'] = [tag.strip() for tag in product.tags.split(',') if tag.strip()]
        
        # Extract unique colors available for this product
        # We fetch the color name and hex code for the UI
        variants = product.variants.all()
        unique_colors = []
        seen_colors = set()

        for v in variants:
            if v.color and v.color.name not in seen_colors:
                unique_colors.append({
                    'name': v.color.name,
                    'hex': v.color.hex_code  # Assuming your Color model has hex_code
                })
                seen_colors.add(v.color.name)

        context['unique_colors'] = unique_colors
        return context
    

class QuickViewAjax(View):
    def get(self, request, pk): 
        # 1. Fetch product using 'pk' (must match the argument in def get)
        product = get_object_or_404(
            Product.objects.filter(is_active=True).select_related(
                'brand', 'category', 'is_primary', 'is_secondary'
            ).prefetch_related(
                'gallery', 
                'variants__color', 
                'variants__size', 
                'variants__inventory'
            ), 
            id=pk # Fixed: was product_id
        )

        # 2. Extract unique colors for the switcher
        variants = product.variants.all()
        unique_colors = []
        seen_colors = set()

        for v in variants:
            if v.color and v.color.name not in seen_colors:
                unique_colors.append({
                    'name': v.color.name,
                    'hex': v.color.hex_code
                })
                seen_colors.add(v.color.name)

        # 3. Prepare Tags
        tag_list = []
        if product.tags:
            tag_list = [tag.strip() for tag in product.tags.split(',') if tag.strip()]

        product_url = reverse('lmsn:product_detail', kwargs={'pk': product.pk})

        context = {
            'product': product,
            'unique_colors': unique_colors,
            'tag_list': tag_list,
            'product_url': product_url, # Pass this to the template
        }

        # 4. Render the specific quick-view template
        html = render_to_string('lmsn/quick-view.html', context, request=request)

        return HttpResponse(html)
    
  
class Shop(TemplateView):
    template_name = 'lmsn/shop.html'
    context_object_name = 'product'

    def get_queryset(self):
        # if ProductCategory:
        #     return 
        return Product.objects.filter(is_active=True).order_by('-is_featured', '?')
    

class FAQView(TemplateView):
    template_name = 'lmsn/faq.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        category = Category.objects.filter(slug="frequently-asked-question").first()
        if category:
            context['category'] = category
            context["faqs"] = CategoryPost.objects.filter(category=category, is_published=True)
        else:
            context["faq"] = []
        return context



class TermsOfUse(TemplateView):
    template_name = 'lmsn/terms-of-use.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        category = Category.objects.filter(slug="terms-of-use").first()
        if category:
            context['category'] = category
            context["termsofuse"] = CategoryPost.objects.filter(category=category, is_published=True)
        else:
            context["termsofuse"] = []
        return context


class PrivacyPolicy(TemplateView):
    template_name = 'lmsn/privacypolicy.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        category = Category.objects.filter(slug="Privacy-Policy").first()
        if category:
            context['category'] = category
            context["policies"] = CategoryPost.objects.filter(category=category, is_published=True)
        else:
            context["policies"] = []
        return context


class AboutUs(TemplateView):
    template_name = 'lmsn/about-us.html'


class Contact(TemplateView):
    template_name  = 'lmsn/contact-us.html'


class PublicSignupView(FormView):
    template_name = 'lmsn/register.html'
    form_class = PublicUserCreationForm
    success_url = reverse_lazy('accounts:login')

    def form_valid(self, form):
        # Save the user and apply the client flag
        user = form.save(commit=False)
        user.is_client = True
        user.is_subscribed = True
        user.save()
        return super().form_valid(form)
    

class ProfileView(LoginRequiredMixin, UpdateView):
    model = CustomUser
    form_class = ProfileEdit
    template_name = 'lmsn/my-account.html'
    
    def get_object(self):
        return self.request.user
    
    def get_success_url(self):
        # Redirects back to the account detail tab after saving
        return reverse('lmsn:profile') + "#account-detail"

    def get_context_data(self, **kwargs):
        data = super().get_context_data(**kwargs)
        # Fetching orders and addresses for the display tabs
        data['orders'] = Order.objects.filter(user=self.request.user).order_by('-created_at')
        data['location'] = Address.objects.filter(user=self.request.user)
        
        if self.request.POST:
            data['address_form'] = AddressFormSet(self.request.POST, instance=self.request.user)
        else:
            data['address_form'] = AddressFormSet(instance=self.request.user)
        return data

    def form_valid(self, form):
        context = self.get_context_data()
        address_form = context['address_form']
        
        if form.is_valid() and address_form.is_valid():
            # Save the User first
            self.object = form.save()
            
            # Explicitly bind the formset to the saved user and save
            address_form.instance = self.object
            address_form.save()
            
            return redirect(self.get_success_url())
        else:
            # If the address form isn't valid, show errors
            return self.render_to_response(self.get_context_data(form=form))
        

class ExternalSubscribers(FormView):
    form_class = ExternalSubcriberForm
    template_name = "lmsn/index.html" # Fallback required by Django logic

    def get_success_url(self):
        return self.request.META.get('HTTP_REFERER', '/')

    def get(self, request, *args, **kwargs):
        return self.post(request, *args, **kwargs)

    def form_valid(self, form):
        geo = get_geo_info(self.request)
        subscriber = form.save(commit=False)

        # Attach tracking data
        subscriber.ip_address = geo.get('ip')
        subscriber.city = geo.get('city')
        subscriber.region = geo.get('region')
        subscriber.country = geo.get('country')
        subscriber.save()

        messages.success(self.request, "Thank you for subscribing!")
        return HttpResponseRedirect(self.get_success_url())

    def form_invalid(self, form):
        # Extract the specific error message from the form
        for error in form.errors.values():
            messages.error(self.request, error[0])
        return HttpResponseRedirect(self.get_success_url())
    

