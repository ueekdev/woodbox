{# Product name and breadcrumbs #}

{% embed "snipplets/page-header.tpl" %}
	{% block page_header_text %}{{ product.name }}{% endblock page_header_text %}
{% endembed %}

{# Product price #}

<div class="price-container mb-3 " data-store="product-price-{{ product.id }}">
    <div class="price-group">
        {% set price_big_class = settings.payment_discount_price ? 'font-big' %}
        <span class="d-inline-block {{ price_big_class }}">
            <div id="compare_price_display" class="js-compare-price-display price-compare" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% else %} style="display:block;"{% endif %}>{% if product.compare_at_price and product.display_price %}{{ product.compare_at_price | money }}{% endif %}</div>
        </span>
        <span class="d-inline-block {{ price_big_class }}">
            <div class="js-price-display" id="price_display" {% if not product.display_price %}style="display:none;"{% endif %} data-product-price="{{ product.price }}">{% if product.display_price %}{{ product.price | money }}{% endif %}</div>
        </span>
        {{ component('payment-discount-price', {
                visibility_condition: settings.payment_discount_price,
                location: 'product',
                container_classes: "mt-2",
            }) 
        }}
    </div>
    {# {% if settings.product_detail_installments %}
        <div class="col-auto">
            {{ component('installments', {'location' : 'product_detail', container_classes: { installment: "item-installments"}}) }}
        </div>
    {% endif %} #}

    {# Product installments #}

    {% set installments_info = product.installments_info_from_any_variant %}
    {% set hasDiscount = product.maxPaymentDiscount.value > 0 %}
    {% set show_payments_info = settings.product_detail_installments and product.show_installments and product.display_price and installments_info %}

    {% if show_payments_info or hasDiscount %}

        {# If product detail installments, include container with "see installments" link #}

        <div class="js-accordion-container mb-3">
            {# <a href="#" class="js-accordion-toggle py-1 row">
                <div class="col">
                    <svg class="icon-inline icon-w svg-icon-text mr-1"><use xlink:href="#credit-card"/></svg>
                    <span class="subtitle">{{ 'Medios de pago' | translate }}</span>
                </div>
                <div class="col-auto">
                    <span class="js-accordion-toggle-inactive">
                        <svg class="icon-inline svg-icon-text icon-rotate-90"><use xlink:href="#chevron"/></svg>
                    </span>
                    <span class="js-accordion-toggle-active" style="display: none;">
                        <svg class="icon-inline svg-icon-text icon-rotate-90-neg"><use xlink:href="#chevron"/></svg>
                    </span>
                </div>
            </a> #}
            {# <div class="js-accordion-content pt-3" style="display: none;"> #}
                <div {% if installments_info %}data-toggle="#installments-modal" data-modal-url="modal-fullscreen-payments"{% endif %} class="{% if installments_info %}js-modal-open js-fullscreen-modal-open{% endif %} js-product-payments-container " {% if not (product.get_max_installments and product.get_max_installments(false)) %}style="display: none;"{% endif %}>

                    {# Installments #}

                    {% if show_payments_info %}
                        {% set max_installments_without_interests = product.get_max_installments(false) %}
                        {% set installments_without_interests = max_installments_without_interests and max_installments_without_interests.installment > 1 %}
                        {% set installment_text_color = installments_without_interests ? 'text-accent' : '' %}
                        {{ component('installments', {'location' : 'product_detail', container_classes: { installment: " " ~ installment_text_color}}) }}
                    {% endif %}

                    {# Max Payment Discount #}

                    {% if hasDiscount %}
                       
                            <span class="text-accent">{{ product.maxPaymentDiscount.value }}% {{'de descuento' | translate }}</span> {{'pagando con' | translate }} {{ product.maxPaymentDiscount.paymentProviderName }}
                       
                    {% endif %}

                    <a id="btn-installments" class="btn-link " {% if not (product.get_max_installments and product.get_max_installments(false)) %}style="display: none;"{% endif %}>
                        Ver meios de pagamento
                    </a>
                </div>
            {# </div> #}
        </div>
    {% endif %}
</div>

{# Promotional text #}

{% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off and product.display_price %}
    <div class="js-product-promo-container mb-3" data-store="product-promotion-info">
        {% if product.promotional_offer.script.is_discount_for_quantity %}
            {% for threshold in product.promotional_offer.parameters %}
                <h4 class="mb-2 h6 text-accent">{{ "¡{1}% OFF comprando {2} o más!" | translate(threshold.discount_decimal_percentage * 100, threshold.quantity) }}</h4>
            {% endfor %}
        {% else %}
            <h4 class="mb-2 h6 text-accent">{{ "¡Llevá {1} y pagá {2}!" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}</h4>
        {% endif %}
        {% if product.promotional_offer.scope_type == 'categories' %}
            <p class="">{{ "Válido para" | translate }} {{ "este producto y todos los de la categoría" | translate }}:
            {% for scope_value in product.promotional_offer.scope_value_info %}
               {{ scope_value.name }}{% if not loop.last %}, {% else %}.{% endif %}
            {% endfor %}</br>{{ "Podés combinar esta promoción con otros productos de la misma categoría." | translate }}</p>
        {% elseif product.promotional_offer.scope_type == 'all'  %}
            <p class="">{{ "Vas a poder aprovechar esta promoción en cualquier producto de la tienda." | translate }}</p>
        {% endif %}
    </div>
{% endif %}

{# Product form, includes: Variants, CTA and Shipping calculator #}

 <form id="product_form" class="js-product-form" method="post" action="{{ store.cart_url }}" data-store="product-form-{{ product.id }}">
	<input type="hidden" name="add_to_cart" value="{{product.id}}" />
 	{% if product.variations %}
        {% include "snipplets/product/product-variants.tpl" with {show_size_guide: true} %}
    {% endif %}

    {% set show_product_quantity = product.available and product.display_price and settings.quantity_input %}

    {% if settings.last_product and show_product_quantity %}
        <div class="{% if product.variations %}js-last-product {% endif %}text-accent font-weight-bold mb-4"{% if product.selected_or_first_available_variant.stock != 1 %} style="display: none;"{% endif %}>
            {{ settings.last_product_text }}
        </div>
    {% endif %}

   

{# {% if show_product_quantity %} #}
    {% include "snipplets/product/product-quantity.tpl" %}
{# {% endif %} #}

    {# Define contitions to show shipping calculator and store branches on product page #}

    {% set show_product_fulfillment = settings.shipping_calculator_product_page and (store.has_shipping or store.branches) and not product.free_shipping and not product.is_non_shippable %}

    {% if show_product_fulfillment %}

        {# Shipping calculator and branch link #}

        <div id="product-shipping-container" class="product-shipping-calculator list" {% if not product.display_price or not product.has_stock %}style="display:none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">
            {% if store.has_shipping %}
                {% include "snipplets/shipping/shipping-calculator.tpl" with {'shipping_calculator_variant' : product.selected_or_first_available_variant, 'product_detail': true} %}
            {% endif %}
        </div>

        {% if store.branches %} 
            {# Link for branches #}
            {% include "snipplets/shipping/branches.tpl" with {'product_detail': true} %}
        {% endif %}

    {% endif %}

    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
    {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
    <div class="{% if show_product_quantity %}col-8{% else %}col-12{% endif %}">

        {% if settings.product_stock and not settings.quantity_input and product.available and product.display_price %}
            {% include "snipplets/product/product-stock.tpl" with {custom_class: "pb-3"} %}
        {% endif %}

        {# Add to cart CTA #}

        <input type="submit" class="js-addtocart js-prod-submit-form btn btn-primary btn-block {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-store="product-buy-button" data-component="product.add-to-cart"/>

        {# Fake add to cart CTA visible during add to cart event #}

        {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "mb-4"} %}

    </div>

    {% if settings.ajax_cart %}
        <div class="col-12">
            <div class="js-added-to-cart-product-message " style="display: none;">
                <svg class="icon-inline icon-lg svg-icon-text mr-2 d-table float-left"><use xlink:href="#check"/></svg>
                <span>
                    {{'Ya agregaste este producto.' | translate }}<a href="#" class="js-modal-open js-open-cart js-fullscreen-modal-open btn-link float-right subtitle ml-1" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart">{{ 'Ver carrito' | translate }}</a>
                </span>
                <div class="divider"></div>
            </div>
        </div>
    {% endif %}
 </form>

{# Product payments details #}

{% include 'snipplets/product/product-payment-details.tpl' %}
