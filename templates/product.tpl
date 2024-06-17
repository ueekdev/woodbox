
{# Payments details #}

<div id="single-product" class="js-has-new-shipping js-product-detail js-product-container js-shipping-calculator-container" data-variants="{{product.variants_object | json_encode }}" data-store="product-detail">
    <div class="container-fluid">
        <div class=" container">
            <div class=" section-single-product">
                <div class="product-gallery">
                    {% include 'snipplets/product/product-image.tpl' %}
                </div>
                <div class="product-form-area" data-store="product-info-{{ product.id }}">
                    {% if settings.scroll_product_images %}
                        <div class="js-sticky-product sticky-product">
                    {% endif %}
                    {% include 'snipplets/product/product-form.tpl' %}
                    {# {% if not settings.full_width_description %}
                    {% endif %} #}
                    {% if settings.scroll_product_images %}
                        </div>
                    {% endif %}
                </div>

                {# Product description full width #}
{# 
                {% if settings.full_width_description %}
                    {% include 'snipplets/product/product-description.tpl' %}
                {% endif %} #}
            </div>
            <div class=" product-description">
                {% include 'snipplets/product/product-description.tpl' %}
            </div>
            <div class="divider-woodbox">
                <div class="divider"></div>
                {{ "images/logo-small.svg" | static_url | img_tag("Logo Woodbox") }}
                <div class="divider"></div>
            </div>
        </div>
    </div>
</div>

{# Related products #}
{% include 'snipplets/product/product-related.tpl' %}
