{% if settings.quick_shop %}
    {% embed "snipplets/modal.tpl" with{modal_id: 'quickshop-modal', modal_class: 'quickshop bottom modal-centered modal-bottom-sheet', modal_position: 'bottom', modal_transition: 'slide', modal_header_title: false, modal_footer: false, modal_width: 'centered modal-docked-md modal-docked-md-centered', modal_mobile_full_screen: 'true', modal_header_class: 'modal-floating-close'} %}
        {% block modal_body %}
            <div class="js-item-product" data-product-id="">
                <div class="js-product-container js-quickshop-container js-quickshop-modal js-quickshop-modal-shell" data-variants="" data-quickshop-id="">
                    <div class="js-item-variants">
                        <div class="js-item-name h4 mb-2 pr-4" data-store="product-item-name-{{ product.id }}"></div>
                        <div class="item-price-container mb-3" data-store="product-item-price-{{ product.id }}">
                            {% set price_big_class = settings.payment_discount_price ? 'font-big' %}
                            <span class="js-compare-price-display price-compare {{ price_big_class }}"></span>
                            <span class="js-price-display {{ price_big_class }}"></span>
                            {{ component('payment-discount-price', {
                                    visibility_condition: settings.payment_discount_price,
                                    location: 'product',
                                    container_classes: "mt-2",
                                }) 
                            }}
                        </div>
                        {# Image is hidden but present so it can be used on cart notifiaction #}
                        <img srcset="" class="js-quickshop-img js-item-image hidden"/>
                        <div id="quickshop-form"></div>
                    </div>
                </div>
            </div>
        {% endblock %}
    {% endembed %}
{% endif %}