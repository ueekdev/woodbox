<div class="js-ajax-cart-list cart-row cart-shadow">
    {# Cart panel items #}
    {% if cart.items %}
      {% for item in cart.items %}
        {% include "snipplets/cart-item-ajax.tpl" %}
      {% endfor %}
    {% endif %}

    <div class="divider"></div>
    <div class="js-visible-on-cart-filled cart-subtotal-area" {% if cart.items_count == 0 %}style="display:none;"{% endif %} data-store="cart-subtotal">
      <span>
        {{ "Subtotal" | translate }}
        
        <small class="js-subtotal-shipping-wording" {% if not (cart.has_shippable_products or show_calculator_on_cart) %}style="display: none"{% endif %}>{{ " (sin envío)" | translate }}</small>
        :
      </span>
      <span class="js-ajax-cart-total js-cart-subtotal  text-right" data-priceraw="{{ cart.subtotal }}" data-component="cart.subtotal" data-component-value={{ cart.subtotal }}>{{ cart.subtotal | money }}</span>
    </div>
</div>
<div class="js-empty-ajax-cart cart-row" {% if cart.items_count > 0 %}style="display:none;"{% endif %}>
 	{# Cart panel empty #}
    <div class="alert alert-info" data-component="cart.empty-message">{{ "El carrito de compras está vacío." | translate }} </div>
</div>
<div id="error-ajax-stock" style="display: none;">
	<div class="alert alert-warning">
     	{{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}<a href="{{ store.products_url }}" class="btn-link ml-1">{{ "ver otros acá" | translate }}</a>
    </div>
</div>

<div class="cart-row">
    {% include "snipplets/cart-totals.tpl" %}
</div>

