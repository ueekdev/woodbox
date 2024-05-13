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
<footer class="js-footer js-hide-footer-while-scrolling display-when-content-ready{% if settings.show_tab_nav %} pb-5 pb-md-0{% endif %}" data-store="footer">
	<div class="container-fluid">
		<div class="row mb-4 {% if template == 'password' %}justify-content-md-center{% endif %}">

			{% if settings.news_show or has_social_network %}
				<div class="col-12 col-md{% if template == 'password' %}-3{% else %}{% if not has_footer_menu_secondary or not has_footer_contact_info %}-4{% endif %} pr-md-5{% endif %} mb-5">
					{% include 'snipplets/newsletter.tpl' %}
					{% include "snipplets/social/social-links.tpl" %}
				</div>
			{% endif %}
			
			{% if template != 'password' %}

				{# Foot Nav #}
				{% if has_footer_menu %}
					<div class="{% if settings.footer_menus_toggle %}js-accordion-container{% endif %} col-12 col-md pr-md-5 mb-4">
						{% if settings.footer_menus_toggle %}
							<a href="#" class="js-accordion-toggle-mobile row no-gutters">
						{% endif %}
							{% if settings.footer_menu_title %}
								<div class="subtitle mb-3 {% if settings.footer_menus_toggle %}col{% endif %}">{{ settings.footer_menu_title }}</div>
							{% endif %}
						{% if settings.footer_menus_toggle %}
								<span class="d-md-none">
									<span class="js-accordion-toggle-inactive">
										<svg class="icon-inline icon-w-14 icon-lg icon-rotate-90"><use xlink:href="#chevron"/></svg>
									</span>
									<span class="js-accordion-toggle-inactive" style="display: none;">
										<svg class="icon-inline icon-w-14 icon-lg icon-rotate-90-neg"><use xlink:href="#chevron"/></svg>
									</span>
								</span>
							</a>
							<div class="js-accordion-content js-accordion-content-mobile">
						{% endif %}
								{% include "snipplets/navigation/navigation-foot.tpl" %}
						{% if settings.footer_menus_toggle %}
							</div>
						{% endif %}
					</div>
				{% endif %}

				{# Foot Nav Secondary #}
				{% if has_footer_menu_secondary %}
					<div class="{% if settings.footer_menus_toggle %}js-accordion-container{% endif %} col-12 col-md pr-md-5 mb-4">
						{% if settings.footer_menus_toggle %}
							<a href="#" class="js-accordion-toggle-mobile row no-gutters">
						{% endif %}
							{% if settings.footer_menu_secondary_title %}
								<div class="subtitle mb-3 {% if settings.footer_menus_toggle %}col{% endif %}">{{ settings.footer_menu_secondary_title }}</div>
							{% endif %}
						{% if settings.footer_menus_toggle %}
								<span class="d-md-none">
									<span class="js-accordion-toggle-inactive">
										<svg class="icon-inline icon-w-14 icon-lg icon-rotate-90"><use xlink:href="#chevron"/></svg>
									</span>
									<span class="js-accordion-toggle-inactive" style="display: none;">
										<svg class="icon-inline icon-w-14 icon-lg icon-rotate-90-neg"><use xlink:href="#chevron"/></svg>
									</span>
								</span>
							</a>
							<div class="js-accordion-content js-accordion-content-mobile">
						{% endif %}
								{% include "snipplets/navigation/navigation-foot-secondary.tpl" %}
						{% if settings.footer_menus_toggle  %}
							</div>
						{% endif %}
					</div>
				{% endif %}

				{# Contact info #}
				{% if has_footer_contact_info %}
					<div class="{% if settings.footer_menus_toggle %}js-accordion-container{% endif %} col-12 col-md mb-4">
						{% if settings.footer_menus_toggle %}
							<a href="#" class="js-accordion-toggle-mobile row no-gutters">
						{% endif %}
							{% if settings.footer_contact_title %}
								<div class="subtitle mb-3 {% if settings.footer_menus_toggle %}col{% endif %}">{{ settings.footer_contact_title }}</div>
							{% endif %}
						{% if settings.footer_menus_toggle %}
								<span class="d-md-none">
									<span class="js-accordion-toggle-inactive">
										<svg class="icon-inline icon-w-14 icon-lg icon-rotate-90"><use xlink:href="#chevron"/></svg>
									</span>
									<span class="js-accordion-toggle-inactive" style="display: none;">
										<svg class="icon-inline icon-w-14 icon-lg icon-rotate-90-neg"><use xlink:href="#chevron"/></svg>
									</span>
								</span>
							</a>
							<div class="js-accordion-content js-accordion-content-mobile">
						{% endif %}
								{% include "snipplets/contact-links.tpl" %}
						{% if settings.footer_menus_toggle   %}
							</div>
						{% endif %}
					</div>
				{% endif %}

			{% endif %}

		</div>

		{# Logos Payments and Shipping #}

 		{% if has_shipping_payment_logos and template != 'password' %}
 			<div class="footer-payments-shipping-logos text-center {% if languages | length > 1 %}mb-4{% else %}mb-5{% endif %}">
 				{% if has_payment_logos %}
 					<span class="mr-2-md">{% include "snipplets/logos-icons.tpl" with {'payments': true} %}</span>
				{% endif %}
 				{% if has_shipping_logos %}
 					<span>{% include "snipplets/logos-icons.tpl" with {'shipping': true} %}</span>
 				{% endif %}
			</div>
		{% endif %}

		{# Language selector #}
		
		{% if languages | length > 1 and template != 'password' %}
			<div class="row mb-5">
					<div class="col-6 offset-3 col-md-2 offset-md-5">
					{% include "snipplets/navigation/navigation-lang.tpl" %}
				</div>
			</div>
		{% endif %}	

		{# AFIP - EBIT - Custom Seal #}
		{% if has_seal_logos and template != 'password' %}
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
		{% endif %}
	</div>
	<div class="js-footer-legal footer-legal">
		<div class="container-fluid">
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
	                {#
	                La leyenda que aparece debajo de esta linea de código debe mantenerse
	                con las mismas palabras y con su apropiado link a Tienda Nube;
	                como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
	                Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
	                tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
	                Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
	                palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
	                http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
	                e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
	                manter visivél e com um link funcionando.
	                #}
	                {{ new_powered_by_link }}
	            </div>
	            
	        </div>
    	</div>
    </div>
</footer>