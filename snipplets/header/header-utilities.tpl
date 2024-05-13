
{% set tabnav_icon_class = '' %}
{% if tabnav %}
	{% set tabnav_icon_class = 'tabnav-icon tabnav-icon-open' %}
{% endif %}

{% if use_menu %}
	<span class="utilities-container">
		<a href="#" class="js-modal-open {% if tabnav %}js-toggle-tabnav tabnav-link{% endif %} utilities-link utilities-item" data-toggle="#nav-hamburger" aria-label="{{ 'Menú' | translate }}" data-component="menu-button">
			<svg class="icon-inline utilities-icon {{ tabnav_icon_class }}"><use xlink:href="#bars"/></svg>
			{% if tabnav %}
				<svg class="tabnav-icon tabnav-icon-close icon-inline utilities-icon"><use xlink:href="#times"/></svg>
			{% endif %}
			{% if settings.utilities_type_desktop == 'icons_text' %}
				<span class="utilities-text d-none d-md-inline-block">{{ 'Menú' | translate }}</span>
			{% endif %}
		</a>
	</span>
{% elseif use_account %}
	<span class="utilities-container">
		<a href="{% if not customer %}{{ store.customer_login_url }}{% else %}{{ store.customer_home_url }}{% endif %}" {% if tabnav %}class="tabnav-link"{% endif %}>
			<svg class="icon-inline utilities-icon {{ tabnav_icon_class }}"><use xlink:href="#user"/></svg>
		</a>
		{% if settings.utilities_type_desktop == 'icons_text' %}
			<span class="utilities-text d-none d-md-inline-block">
				{% if not customer %}
					{{ "Ingresá" | translate | a_tag(store.customer_login_url, '', '') }} / 
					{{ "Registráte" | translate | a_tag(store.customer_register_url, '', '') }}
				{% else %}
					{{ "Mi cuenta" | translate | a_tag(store.customer_home_url, '', '') }}
				{% endif %}
			</span>
		{% endif %}
	</span>
{% else %}
	<span class="utilities-container">
		<div id="ajax-cart{% if tabnav %}-tabnav{% endif %}" class="cart-summary" data-component='cart-button'>
			<a {% if settings.ajax_cart and template != 'cart' %}href="#" class="js-modal-open {% if not tabnav %}js-fullscreen-modal-open{% endif %} {% if tabnav and settings.ajax_cart %}js-toggle-tabnav js-cart-tab tabnav-link{% endif %}" data-toggle="#modal-cart" {% if not tabnav %}data-modal-url="modal-fullscreen-cart"{% endif %}{% else %}href="{{ store.cart_url }}" {% if tabnav %}class="tabnav-link"{% endif %} {% endif %}>
				<svg class="icon-inline utilities-icon {{ tabnav_icon_class }}"><use xlink:href="#bag"/></svg>
				{% if tabnav %}
					<svg class="tabnav-icon tabnav-icon-close icon-inline utilities-icon"><use xlink:href="#times"/></svg>
				{% endif %}
				{% if settings.utilities_type_desktop == 'icons_text' %}
					<span class="utilities-text d-none d-md-inline-block">{{ 'Carrito' | translate }}<span class="ml-1">(<span class="js-cart-widget-amount">{{ "{1}" | translate(cart.items_count ) }}</span>)</span></span>
				{% endif %}
				<span class="js-cart-widget-amount badge badge-amount{% if settings.utilities_type_desktop == 'icons_text' %} d-md-none{% endif %}">{{ "{1}" | translate(cart.items_count ) }}</span>
			</a>	
		</div>
	</span>
{% endif %}