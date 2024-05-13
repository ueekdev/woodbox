
{# Payments details #}

<div id="single-product" class="js-has-new-shipping js-product-detail js-product-container js-shipping-calculator-container" data-variants="{{product.variants_object | json_encode }}" data-store="product-detail">
    <div class="container-fluid">
        <div class="row section-single-product">
            <div class="col-12 col-md-8{% if not settings.scroll_product_images and product.images_count > 1 %} pl-md-0{% endif %}">
            	{% include 'snipplets/product/product-image.tpl' %}
            </div>
            <div class="col" data-store="product-info-{{ product.id }}">
                {% if settings.scroll_product_images %}
                    <div class="js-sticky-product sticky-product">
                {% endif %}
            	{% include 'snipplets/product/product-form.tpl' %}
                {% if not settings.full_width_description %}
                    {% include 'snipplets/product/product-description.tpl' %}
                {% endif %}
                {% if settings.scroll_product_images %}
                    </div>
                {% endif %}
            </div>

            {# Product description full width #}

            {% if settings.full_width_description %}
                {% include 'snipplets/product/product-description.tpl' %}
            {% endif %}
        </div>
    </div>
</div>

{# Related products #}
{% include 'snipplets/product/product-related.tpl' %}
