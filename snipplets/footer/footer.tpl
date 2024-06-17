{% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
{% set has_footer_contact_info = (store.whatsapp or store.phone or store.email or store.address or store.blog) and settings.footer_contact_show %}          

{% set has_footer_menu = settings.footer_menu and settings.footer_menu_show %}
{% set has_footer_menu_secondary = settings.footer_menu_secondary and settings.footer_menu_secondary_show %}
{% set has_footer_about = settings.footer_about_show and (settings.footer_about_title or settings.footer_about_description) %}
{% set has_payment_logos = settings.payments %}
{% set has_shipping_logos = settings.shipping %}
{% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}

{% set has_seal_logos = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
{% set show_help = not has_products and not has_social_network %}
<footer class="js-footer js-hide-footer-while-scrolling display-when-content-ready" data-store="footer">
	<div class="container-fluid">
		<div class="container">
			<div class="footer-links">

				<div class="logo">
                    {{ "images/logo-small-brown.svg" | static_url | img_tag("Logo Woodbox") }}
				</div>
				
				{% if template != 'password' %}

					{# Foot Nav #}
					{% if has_footer_menu %}
						<div class="footer-links-group">
							<div class="group-title">{{ settings.footer_menu_title }}</div>
							{% include "snipplets/navigation/navigation-foot.tpl" %}
						</div>
					{% endif %}

					{# Foot Nav Secondary #}
					{% if has_footer_menu_secondary %}
						<div class="footer-links-group">
							<div class="group-title">{{ settings.footer_menu_secondary_title }}</div>
							{% include "snipplets/navigation/navigation-foot-secondary.tpl" %}
						</div>
					{% endif %}

					{# Contact info #}
					{% if has_footer_contact_info %}
						<div class="footer-links-group">
							<div class="group-title">{{ settings.footer_contact_title }}</div>
							{% include "snipplets/contact-links.tpl" %}
						</div>
					{% endif %}

				{% endif %}

			</div>

			{# Language selector #}
			
			{# {% if languages | length > 1 and template != 'password' %}
				<div class="row mb-5">
						<div class="col-6 offset-3 col-md-2 offset-md-5">
						{% include "snipplets/navigation/navigation-lang.tpl" %}
					</div>
				</div>
			{% endif %}	 #}

			{# AFIP - EBIT - Custom Seal #}
			{# {% if has_seal_logos and template != 'password' %}
				{% if store.afip or ebit %}
					<div class="row justify-content-center mb-4">
						<div class="col text-center">
							{% if store.afip %}
								<div class="footer-logo afip seal-afip">
									{{ store.afip | raw }}
								</div>
							{% endif %}
							{% if ebit %}
								<div class="footer-logo ebit seal-ebit">
									{{ ebit }}
								</div>
							{% endif %}
						</div>
					</div>
				{% endif %}
				{% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
					<div class="row justify-content-center mb-4">
						<div class="col text-center">
							{% if "seal_img.jpg" | has_custom_image %}
								<div class="footer-logo custom-seal">
									{% if settings.seal_url != '' %}
										<a href="{{ settings.seal_url | setting_url }}" target="_blank">
									{% endif %}
										<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ "seal_img.jpg" | static_url }}" class="custom-seal-img lazyload" alt="{{ 'Sello de' | translate }} {{ store.name }}"/>
									{% if settings.seal_url != '' %}
										</a>
									{% endif %}
								</div>
							{% endif %}
							{% if settings.custom_seal_code %}
								<div class="custom-seal custom-seal-code">
									{{ settings.custom_seal_code | raw }}
								</div>
							{% endif %}
						</div>
					</div>
				{% endif %}
			{% endif %} #}
		</div>
	</div>
	
	<div class="container-fluid footer-copyright">
		<div class="container">
			{% include "snipplets/social/social-links.tpl" %}

			{# Logos Payments and Shipping #}

			{% if has_shipping_payment_logos and template != 'password' %}
				<div class="footer-payments-shipping-logos ">
					{% if has_payment_logos %}
						<span class="mr-2-md">{% include "snipplets/logos-icons.tpl" with {'payments': true} %}</span>
					{% endif %}
					{% if has_shipping_logos %}
						<span>{% include "snipplets/logos-icons.tpl" with {'shipping': true} %}</span>
					{% endif %}

				</div>
			{% endif %}
			<div class="powered">
				{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
				
				{{ new_powered_by_link }}
			</div>
		</div>	
	</div>
	{# <div class="js-footer-legal footer-legal">
		<div class="container-fluid">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-12 text-center  mb-3">
						<div class="d-inline-block mr-md-2">
						{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
						</div>
						{{ component('claim-info', {
								container_classes: "d-md-inline-block mt-md-0 mt-3",
								divider_classes: "mx-1 d-none d-md-inline-block",
								text_classes: {text_consumer_defense: 'd-inline-block mb-2'},
								link_classes: {
									link_consumer_defense: "font-weight-bold",
									link_order_cancellation: "font-weight-bold d-md-inline-block d-block mb-2 w-100 w-md-auto",
								},
							}) 
						}}
					</div>

					<div class="col-12 text-center">
						{{ new_powered_by_link }}
					</div>
				</div>
			</div>
    	</div>
    </div> #}
</footer>