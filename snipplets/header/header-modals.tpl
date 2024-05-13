{# Modal Hamburger #}

{% set modal_position_desktop_val = 'left' %}
{% if settings.logo_position_desktop != 'center' %}
	{% set modal_position_desktop_val = 'right' %}
{% endif %}

{% set modal_position_mobile_val = 'left' %}
{% if settings.show_tab_nav %}
	{% set modal_position_mobile_val = 'bottom' %}
{% elseif settings.logo_position_mobile != 'center' %}
	{% set modal_position_mobile_val = 'right' %}
{% endif %}

{% set modal_with_desktop_only_overlay_val = false %}
{% set modal_mobile_full_screen_val = true %}
{% set tabnav_modal_classes = '' %}
{% if settings.show_tab_nav %}
	{% set modal_with_desktop_only_overlay_val = true %}
	{% set modal_mobile_full_screen_val = false %}
	{% set tabnav_modal_classes = 'js-tabnav-modal tabnav-modal' %}
{% endif %}

{% embed "snipplets/modal.tpl" with{modal_id: 'nav-hamburger',modal_class: 'nav-hamburger modal-docked-md pb-0 ' ~ tabnav_modal_classes, modal_position: modal_position_mobile_val, modal_position_desktop: modal_position_desktop_val, modal_transition: 'slide', modal_width: 'full', modal_mobile_full_screen: false, modal_hide_close: 'true',modal_body_class: 'nav-body', modal_footer_class: 'footer-contact-links', modal_fixed_footer: true, modal_footer: true, desktop_overlay_only: modal_with_desktop_only_overlay_val, modal_header_title: true} %}

{% block modal_head %}
			{% block page_header_text %}{{ "Menu" | translate }}{% endblock page_header_text %}
		{% endblock %}
	{% block modal_body %}
		{% include "snipplets/navigation/navigation-panel.tpl" with {hamburger: true, primary_links: true} %}
	{% endblock %}
	{% block modal_foot %}
		<p class="footer-link-contacts nav-list-link">Fale conosco</p>
		<div class="contact-link-list">
			{% include "snipplets/contact-links.tpl" %}
		</div>
		{% include "snipplets/navigation/navigation-panel.tpl" with {mobile: true} %}
	{% endblock %}
{% endembed %}

{# Notifications #}

{# Modal Search #}

{% set modal_position_desktop_val = 'left' %}
{% if settings.logo_position_desktop != 'center' %}
	{% set modal_position_desktop_val = 'right' %}
{% endif %}

{% embed "snipplets/modal.tpl" with{modal_id: 'nav-search',modal_class: 'nav-search ' ~ tabnav_modal_classes, modal_position: modal_position_mobile_val, modal_position_desktop: modal_position_desktop_val, modal_transition: 'slide', modal_width: 'docked-md', modal_header_title: true, desktop_overlay_only: modal_with_desktop_only_overlay_val } %}
		{% block modal_head %}
			{% block page_header_text %}{{ "Menu" | translate }}{% endblock page_header_text %}
		{% endblock %}
	{% block modal_body %}
		{% include "snipplets/header/header-search.tpl" with {use_big_search: true} %}
	{% endblock %}
{% endembed %}


{# Modal Cart #}

{% if settings.show_tab_nav %}
	{% set modal_cart_position_mobile_val = 'bottom' %}
{% else %}
	{% set modal_cart_position_mobile_val = 'right' %}
{% endif %}

{% if not store.is_catalog and settings.ajax_cart and template != 'cart' %}           

	{# Cart Ajax #}

	{% embed "snipplets/modal.tpl" with{modal_id: 'modal-cart',modal_class: 'cart ' ~ tabnav_modal_classes, modal_position: modal_cart_position_mobile_val, modal_position_desktop: 'right', modal_transition: 'slide', modal_width: 'docked-md', modal_form_action: store.cart_url, modal_form_class: 'js-ajax-cart-panel', modal_header_title: true, modal_mobile_full_screen: modal_mobile_full_screen_val, modal_form_hook: 'cart-form', data_component:'cart', desktop_overlay_only: modal_with_desktop_only_overlay_val } %}
		{% block modal_head %}
			{% block page_header_text %}{{ "Carrito de Compras" | translate }}{% endblock page_header_text %}
		{% endblock %}
		{% block modal_body %}
			{% snipplet "cart-panel.tpl" %}
		{% endblock %}
	{% endembed %}

{% endif %}