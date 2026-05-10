from django import forms
from .models import Order




class OrderCreateForm(forms.ModelForm):

    class Meta:
        model = Order
        fields = ['recipient_name', 'recipient_email', 'shipping_phone', 'shipping_address']
        labels = {
            'recipient_name': 'Recipient Full Name',
            'recipient_email': 'Recipient Email (Optional)',
            'shipping_phone': 'Delivery Phone Number',
            'shipping_address': 'Delivery Address'
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields.values():
            field.widget.attrs.update({'class': 'form-control'})
