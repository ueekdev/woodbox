{% embed "snipplets/page-header.tpl" with {'breadcrumbs': true} %}
    {% block page_header_text %}{{ "Carrito de Compras" | translate }}{% endblock page_header_text %}
{% endembed %}

<div id="shoppingCartPage" class="container-fluid mt-4" data-minimum="{{ settings.cart_minimum_value }}" data-store="cart-page">
    <form action="{{ store.cart_url }}" method="post" class="cart-body" data-store="cart-form" data-component="cart">
        <div class="cart-body">

            {# Cart alerts #}

            {% if error.add %}
                {{ component('alert', {'type': 'warning', 'message': 'our_components.cart.error_messages.' ~ error.add }) }}
            {% endif %}
            {% for error in error.update %}
                <div class="alert alert-warning">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
            {% endfor %}
            {% if cart.items %}

                {# Cart header #}
                
                <div class="cart-row mb-4 subtitle d-none d-md-block">
                    <div class="row">
                        <div class="col-12 col-md-1">
                            <span class="js-cart-products-heading-plural" {% if cart.items_count == 1 %}style="display: none;"{% endif %}>{{ 'Productos' | translate }}</span>
                            <span class="js-cart-products-heading-singular" {% if cart.items_count > 1 %}style="display: none;"{% endif %}>{{ 'Producto' | translate }}</span>
                        </div>
                        <div class="col-md-10">
                            <div class="row">
                                <div class="col-md-3 offset-5 text-center">{{ 'Cantidad' | translate }}</div>
                                <div class="col-md-2 text-center">{{ 'Precio' | translate }}</div>
                                <div class="col-md-2 text-center">{{ 'Subtotal' | translate }}</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="js-ajax-cart-list cart-row">

                    {# Cart items #}

                    {% if cart.items %}
                      {% for item in cart.items %}
                        {% include "snipplets/cart-item-ajax.tpl" with {'cart_page': true} %}
                      {% endfor %}
                    {% endif %}
                </div>
            {% else %}

                {#  Empty cart  #}

                {% if not error %}
                    {{ component('alert', {'type': 'info', 'message': ('El carrito de compras está vacío.' | translate) }) }}
                {% endif %}
            {% endif %}
            <div id="error-ajax-stock" style="display: none;">
                <div class="alert alert-warning">
                    {{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}<a href="{{ store.products_url }}" class="btn-link ml-1">{{ "ver otros acá" | translate }}</a>
                </div>
            </div>
            {% include "snipplets/cart-totals.tpl" with {'cart_page': true} %}
        </div>
    </form>
    <div id="store-curr" class="hidden">{{ cart.currency }}</div>
</div>

