<div class="js-accordion-container js-toggle-shipping {% if product_detail %} mb-3{% endif %}">
    {# <a href="#" class="js-accordion-toggle py-1 row">
        <div class="col">
        	<svg class="icon-inline icon-w svg-icon-text mr-1"><use xlink:href="#truck"/></svg>
            <span class="subtitle">{{ 'Medios de envío' | translate }}</span>
        </div>
        <div class="col-auto">
            <span class="js-accordion-toggle-inactive">
            	<svg class="icon-inline svg-icon-text icon-rotate-90"><use xlink:href="#chevron"/></svg>
            </span>
            <span class="js-accordion-toggle-active" style="display: none;">
            	<svg class="icon-inline svg-icon-text icon-rotate-90-neg"><use xlink:href="#chevron"/></svg>
            </span>
        </div>
    </a>
    <div class="js-accordion-content" style="display: none;"> #}

		{# Check if store has free shipping without regions or categories #}

		{% set has_free_shipping = cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}

		{# Free shipping visibility variables #}

		{% if product_detail and cart.free_shipping.min_price_free_shipping.min_price %}

			{# Calculate if adding one more product free shipping is achieved #}

			{% set free_shipping_product_threashold = cart.free_shipping.min_price_free_shipping.min_price_raw - (cart.total + product.price) %}

			{% set hide_free_shipping_minimum = (cart.free_shipping.cart_has_free_shipping or not cart.free_shipping.min_price_free_shipping.min_price) or free_shipping_product_threashold <= 0 %}

		{% else %}

			{% set hide_free_shipping_minimum = cart.free_shipping.cart_has_free_shipping or not cart.free_shipping.min_price_free_shipping.min_price %}

		{% endif %}

		{% set free_shipping_minimum_label_changes_visibility = product_detail and has_free_shipping and cart.free_shipping.min_price_free_shipping.min_price_raw > 0 %}

		{% set free_shipping_messages_visible = (product_detail and has_free_shipping) or (not product_detail and has_free_shipping and cart.free_shipping.min_price_free_shipping.min_price_raw == 0) %}

		{% set hide_cart_free_shipping_message = not product_detail and has_free_shipping and cart.free_shipping.min_price_free_shipping.min_price_raw > 0 %}

		{% set include_product_free_shipping_min_wording = cart.free_shipping.min_price_free_shipping.min_price_raw > 0 and product_detail %}

		{% if product_detail %}
			{% set cart_zipcode = false %}
		{% else %}
			{% set cart_zipcode = cart.shipping_zipcode %}
		{% endif %}

		{% set has_free_shipping_bar = has_free_shipping and cart.free_shipping.min_price_free_shipping.min_price_raw > 0 and not product_detail %}

		<div class="shipping-options" data-store="shipping-calculator">
			<div class="js-shipping-calculator-head shipping-calculator-head position-relative transition-soft {% if cart_zipcode %}with-zip{% else %}with-form{% endif %} {% if free_shipping_messages_visible %}with-free-shipping{% endif %}">
				<div class="js-shipping-calculator-with-zipcode {% if cart_zipcode %}js-cart-saved-zipcode transition-up-active{% endif %} mb-4 w-100 transition-up position-absolute mt-2">
					{% if free_shipping_messages_visible %}

						{# Free shipping labels when calcualtor is hidden #}

						<div class="free-shipping-title transition-soft">

							{# Free shipping achieved label #}

							<div class="js-free-shipping-title position-absolute transition-up w-100 text-accent {% if cart.free_shipping.cart_has_free_shipping %}transition-up-active{% endif %}">
								{{ "¡Genial! Tenés envío gratis" | translate }}
							</div>

							{# Free shipping with min price label #}

							{% if include_product_free_shipping_min_wording %}

								{% include "snipplets/shipping/shipping-free-rest.tpl" with {'calculator_label': false, 'product_detail': true} %}

							{% endif %}


							<div class="js-free-shipping-title-min-cost position-absolute transition-up w-100 {% if not hide_free_shipping_minimum %}transition-up-active{% endif %}">
								{{ "<span class='text-accent'>Envío gratis</span> superando los" | translate }} <span>{{ cart.free_shipping.min_price_free_shipping.min_price }}</span>
							</div>
						</div>

					{% endif %}
					<div class=" p-0">
						<div class="d-flex align-items-center justify-content-between flex-wrap">
							<span class="cep-delivery align-bottom">
								<span>{{ "Entregas para el CP:" | translate }}</span>
								<strong class="js-shipping-calculator-current-zip">{{ cart_zipcode }}</strong>
							</span>
							<a class="js-shipping-calculator-change-zipcode btn {% if product_detail %} btn-primary accent {% else %} inline {% endif %}" href="#">{{ "Cambiar CP" | translate }}</a>
						</div>
					</div>
				</div>

				<div class="js-shipping-calculator-form mt-2 shipping-calculator-form transition-up position-absolute w-100">

					{# Shipping calcualtor input #}

					{% embed "snipplets/forms/form-input.tpl" with{type_tel: true, input_value: cart_zipcode, input_name: 'zipcode', input_custom_class: 'js-shipping-input d-block', input_placeholder: "Tu código postal" | translate, input_aria_label: 'Tu código postal' | translate, input_label: false, input_append_content: true, input_group_custom_class: 'form-row form-group-inline mb-3'} %}
						{% block input_prepend_content %}
							<div class="col-12">

								{# Free shipping with min price label #}

								<div class="{% if free_shipping_minimum_label_changes_visibility %}js-shipping-calculator-label{% endif %} mb-2" {% if hide_free_shipping_minimum or hide_cart_free_shipping_message %}style="display: none;"{% endif %}>
									{{ "<span class='text-accent'>Envío gratis</span> superando los" | translate }} <span>{{ cart.free_shipping.min_price_free_shipping.min_price }}</span>
								</div>

								{% if include_product_free_shipping_min_wording %}

									{% include "snipplets/shipping/shipping-free-rest.tpl" with {'calculator_label': true, 'product_detail': true} %}

								{% endif %}

								{# Free shipping achieved calculator label #}

								<div class="{% if free_shipping_minimum_label_changes_visibility %}js-free-shipping-message{% endif %} text-accent mb-2" {% if not cart.free_shipping.cart_has_free_shipping or hide_cart_free_shipping_message %}style="display: none;"{% endif %}>
									{{ "¡Genial! Tenés envío gratis" | translate }}
								</div>

							</div>
							<div class="position-relative col-12">
						{% endblock input_prepend_content %}
						{% block input_append_content %}
								<button class="js-calculate-shipping btn btn-primary calculate-button " aria-label="{{ 'Calcular envío' | translate }}">	
									<span class="js-calculate-shipping-wording">
										{# <svg class="icon-inline btn-icon svg-icon-text"><use xlink:href="#plus"/></svg> #}
										<iconify-icon icon="ep:right"></iconify-icon>
									</span>
									<span class="float-right loading" style="display: none;">
										<svg class="icon-inline btn-icon icon-spin svg-icon-text"><use xlink:href="#spinner-third"/></svg>
									</span>
								</button>
							</div>
						{% endblock input_append_content %}
						{% block input_form_alert %}
						{% set zipcode_help_countries = ['BR', 'AR', 'MX'] %}
						{% if store.country in zipcode_help_countries %}
							{% set zipcode_help_ar = 'https://www.correoargentino.com.ar/formularios/cpa' %}
							{% set zipcode_help_br = 'http://www.buscacep.correios.com.br/sistemas/buscacep/' %}
							{% set zipcode_help_mx = 'https://www.correosdemexico.gob.mx/SSLServicios/ConsultaCP/Descarga.aspx' %}
							<div class="col-12">
								<a class=" text-uppercase mt-2 mb-2 d-block {% if product_detail %} js-shipping-zipcode-help {% endif %}" href="{% if store.country == 'AR' %}{{ zipcode_help_ar }}{% elseif store.country == 'BR' %}{{ zipcode_help_br }}{% elseif store.country == 'MX' %}{{ zipcode_help_mx }}{% endif %}" target="_blank">{{ "No sé mi código postal" | translate }}</a>
							</div>
						{% endif %}
						<div class="col-12">
							<div class="js-ship-calculator-error invalid-zipcode alert alert-danger" style="display: none;">
								
								{# Specific error message considering if store has multiple languages #}

								{% for language in languages %}
									{% if language.active %}
										{% if languages | length > 1 %}
											{% set wrong_zipcode_wording = ' para ' | translate ~ language.country_name ~ '. Podés intentar con otro o' | translate %}
										{% else %}
											{% set wrong_zipcode_wording = '. ¿Está bien escrito?' | translate %}
										{% endif %}
										{{ "No encontramos este código postal{1}" | translate(wrong_zipcode_wording) }}

										{% if languages | length > 1 %}
											<a href="#" data-toggle="#{% if product_detail %}product{% else %}cart{% endif %}-shipping-country" class="js-modal-open js-open-over-modal btn-link btn-link-primary text-lowercase">
												{{ 'cambiar tu país de entrega' | translate }}
											</a>
										{% endif %}
									{% endif %}
								{% endfor %}
							</div>
							<div class="js-ship-calculator-error js-ship-calculator-common-error alert alert-danger" style="display: none;">{{ "Ocurrió un error al calcular el envío. Por favor intentá de nuevo en unos segundos." | translate }}</div>
							<div class="js-ship-calculator-error js-ship-calculator-external-error alert alert-danger" style="display: none;">{{ "El calculo falló por un problema con el medio de envío. Por favor intentá de nuevo en unos segundos." | translate }}</div>
						</div>
						{% endblock input_form_alert %}
						{% block input_add_on %}
							{% if shipping_calculator_variant %}
								<input type="hidden" name="variant_id" id="shipping-variant-id" value="{{ shipping_calculator_variant.id }}">
							{% endif %}
						{% endblock input_add_on %}
					{% endembed %}
				</div>
			</div>
			<div class="js-shipping-calculator-spinner shipping-spinner-container my-4 transition-soft text-center" style="display: none;">
				<i class="spinner col-6 offset-3"></i>
			</div>
			<div class="js-shipping-calculator-response transition-soft {% if product_detail %}list {% else %} radio-buttons-group{% endif %}" style="display: none;"></div>
		</div>
	{# </div> #}
</div>

{# Shipping country modal #}

{% if languages | length > 1 %}

	{% if product_detail %}
		{% set country_modal_id = 'product-shipping-country' %}
	{% else %}
		{% set country_modal_id = 'cart-shipping-country' %}
	{% endif %}

	{% embed "snipplets/modal.tpl" with{modal_id: country_modal_id, modal_class: 'bottom modal-centered-small js-modal-shipping-country', modal_position: 'center', modal_position_desktop: 'center', modal_transition: 'slide', modal_header_title: true, modal_footer: true, modal_width: 'centered', modal_zindex_top: true, modal_mobile_full_screen: false} %}
		{% block modal_head %}
		    {{ 'País de entrega' | translate }}
		{% endblock %}
		{% block modal_body %}
		    {% embed "snipplets/forms/form-select.tpl" with{select_label: true, select_label_name: 'País donde entregaremos tu compra' | translate, select_aria_label: 'País donde entregaremos tu compra' | translate, select_custom_class: 'js-country-select', select_group_custom_class: 'mt-4' } %}
				{% block select_options %}
					{% for language in languages %}
						<option value="{{ language.country }}" data-country-url="{{ language.url }}" {% if language.active %}selected{% endif %}>{{ language.country_name }}</option>
					{% endfor %}
				{% endblock select_options%}
			{% endembed %}
		{% endblock %}
		{% block modal_foot %}
			<a href="#" class="js-save-shipping-country btn btn-primary d-inline-block">{{ 'Aplicar' | translate }}</a>
		{% endblock %}
	{% endembed %}
{% endif %}
