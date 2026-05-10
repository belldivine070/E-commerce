import logging
import uuid
from django.contrib.gis.geoip2 import GeoIP2
from django.conf import settings
from .models import AppVariable 


logger = logging.getLogger(__name__)

def get_geo_info(request):
    """
    Returns a dictionary with IP and Location data.
    Automatically handles Localhost by providing a mock IP if in DEBUG mode.
    """
    # 1. Extract the real IP address
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0].strip()
    else:
        ip = request.META.get('REMOTE_ADDR')

    # 2. Initialize default data
    geo_data = {
        'ip': ip,
        'city': 'Unknown',
        'country': 'Unknown',
        'region': 'Unknown',
    }

    # 3. Handle Localhost Testing
    # If developing locally, GeoIP2 will fail on 127.0.0.1.
    # We use a known public IP (e.g., a Nigerian IP) for testing logic.
    if ip in ['127.0.0.1', '::1'] and settings.DEBUG:
        lookup_ip = '102.89.1.1' # Example Nigerian IP
    else:
        lookup_ip = ip

    # 4. Perform Lookup
    try:
        g = GeoIP2()
        location = g.city(lookup_ip)
        geo_data.update({
            'city': location.get('city'),
            'country': location.get('country_name'),
            'region': location.get('region'),
        })
    except Exception as e:
        logger.error(f"GeoIP Lookup Error for IP {lookup_ip}: {e}")
        # We keep the default 'Unknown' values so the app doesn't crash

    return geo_data


def get_official_email():
    """
    Fetches the company's official default email from AppVariables.
    Uses the logic requested: [2025-12-30] I want to use the official_email 
    in my AppVariable as the default email for sending.
    """
    try:
        # We look for the key exactly as you specified
        variable = AppVariable.objects.get(key='OFFICIAL_EMAIL')
        return variable.value
    except AppVariable.DoesNotExist:
        logger.warning("AppVariable 'OFFICIAL_EMAIL' not found. Using fallback.")
        return getattr(settings, 'DEFAULT_FROM_EMAIL', 'support@company.com')


def generate_order_number():
    """Generates a unique order number for the checkout process."""
    return f"ORD-{uuid.uuid4().hex[:8].upper()}"