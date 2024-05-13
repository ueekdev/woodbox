{# Product quantity #}
        
<div class="col-4{% if settings.product_stock %} mb-4{% endif %}">
    {% set form_quantity_class = settings.product_stock ? ' mb-0' : '' %}

    {% embed "snipplets/forms/form-input.tpl" with{
    type_number: true, input_value: '1',
    input_name: 'quantity' ~ item.id, 
    input_custom_class: 'js-quantity-input', 
    input_label: false, 
    input_append_content: true, 
    input_group_custom_class: 'js-quantity form-quantity form-quantity-product' ~ form_quantity_class, 
    form_control_container_custom_class: 'col',
    form_data_component: 'product.adding-amount',
    form_control_quantity: true,
    input_min: '1',
    data_component: 'adding-amount.value',
    input_aria_label: 'Cambiar cantidad' | translate } %}
        {% block input_prepend_content %}
        <div class="form-row m-0 align-items-center" data-component="product.quantity">
            <span class="js-quantity-down form-quantity-icon btn" data-component="product.quantity.minus">
                <svg class="icon-inline icon-w-12 icon-lg"><use xlink:href="#minus"/></svg>
            </span>
        {% endblock input_prepend_content %}
        {% block input_append_content %}
            <span class="js-quantity-up form-quantity-icon btn" data-component="product.quantity.plus">
                <svg class="icon-inline icon-w-12 icon-lg"><use xlink:href="#plus"/></svg>
            </span>
        </div>
        {% endblock input_append_content %}
    {% endembed %}
    {% if settings.product_stock %}
        {% include "snipplets/product/product-stock.tpl" with {custom_class: "py-2 text-center"} %}
    {% endif %}
</div>