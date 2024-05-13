{% if product_detail %}
	
	{# Wording to notice that adding one more product free shipping is achieved #}

	{% if calculator_label %}
	<span class="js-shipping-add-product-label mb-2" {% if hide_free_shipping_minimum %}style="display: none;"{% endif %}>
	{% else %}
	<span class="js-free-shipping-add-product-title position-absolute transition-up w-100 {% if not hide_free_shipping_minimum %}transition-up-active{% endif %} mb-2">
	{% endif %}
		<span class='js-fs-add-this-product'>{{ "¡Agregá este producto y " | translate }}</span>
		<span class='js-fs-add-one-more' style='display: none;'>{{ "¡Agregá uno más y " | translate }}</span>
		<strong class='text-accent'>{{ "tenés envío gratis!" | translate }}</strong>
	</span>

{% else %}
	<div class="js-visible-on-cart-filled" {% if cart.items_count == 0 %}style="display: none;"{% endif %}>
		<div class="js-fulfillment-info js-allows-non-shippable" {% if not cart.has_shippable_products %}style="display: none"{% endif %}>

			{# Free shipping progress bar #}
			<div class="js-ship-free-rest {% if progress_bar %}cart-row{% endif %} mt-2 mb-3">
				<div class="js-bar-progress bar-progress">
					<div class="js-bar-progress-active bar-progress-active transition-soft"></div>
				</div>
				<div class="js-ship-free-rest-message ship-free-rest-message">
					<div class="ship-free-rest-text bar-progress-success text-accent transition-soft">
						{{ "¡Genial! Tenés envío gratis" | translate }}
					</div>
					<div class="ship-free-rest-text bar-progress-amount transition-soft">
						{{ "¡Estás a <span class='js-ship-free-dif'></span> de tener <span class='text-accent'>envío gratis</span>!" | translate }}
					</div>
					<div class="ship-free-rest-text bar-progress-condition transition-soft">
						{{ "<span class='text-accent'>Envío gratis</span> superando los" | translate }} <span>{{ cart.free_shipping.min_price_free_shipping.min_price }}</span>
					</div>
				</div>
			</div>
		</div>
	</div>
{% endif %}