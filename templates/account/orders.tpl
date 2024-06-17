{# {% embed "snipplets/page-header.tpl" %}
    {% block page_header_text %}{{ "Mi cuenta" | translate }}{% endblock page_header_text %}
{% endembed %} #}

<section class="account-page mt-5">
    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="mb-4 customer-panel-shadow"> 
                        <div class="mb-0">
                            <span class="subtitle">{{ 'Datos Personales' | translate }}</span>
                            {{ 'Editar' | translate | a_tag(store.customer_info_url, '', 'btn-link btn-link-primary  float-right') }}
                        </div>
                        <div class="divider my-3"></div>
                        <p class=" mb-0">
                            <span class="customer-info">
                                <iconify-icon icon="lucide:user"></iconify-icon>
                                {{customer.name}}
                            </span>
                            <span class="customer-info">
                                <iconify-icon icon="fluent:mail-20-regular"></iconify-icon>
                                {{customer.email}}
                            </span>
                            {% if customer.cpf_cnpj %}
                                <span class="customer-info">
                                    <iconify-icon icon="mage:file-2"></iconify-icon>
                                    {{ customer.cpf_cnpj | format_cpf_cnpj }}
                                </span>
                            {% endif %}
                            {% if customer.phone %}
                                <span class="customer-info">
                                    <iconify-icon icon="ph:phone"></iconify-icon>
                                    {{ customer.phone }}
                                </span>
                            {% endif %}
                        </p>
                    </div>
                    {% if customer.default_address %}
                        <div class="mb-4 customer-panel-shadow">
                            <div class="mb-0">
                                <span class="subtitle">{{ 'Mis direcciones' | translate }}</span>
                                {{ '+ Adicionar' | a_tag(store.customer_new_address_url, '', 'btn-link btn-link-primary  float-right') }}
                            </div>
                            <div class="divider my-3"></div>

                            {% for address in customer.addresses %}
                                {# <p class="mb-0">
                                    <span class="d-block  my-2">
                                        {{ customer.default_address | format_address_short }}
                                    </span>
                                    {{ 'Otras direcciones' | translate | a_tag(store.customer_addresses_url, '', 'btn-link btn-link-primary ') }}
                                </p> #}
                                <div class="address-item">
                                    <p>
                                        {{ address.address}}, {{ address.number }} - {{ address.neighborhood }}<br>
                                        {{ address.city }}/{{ address.state }} - {{ address.zipcode }}
                                    </p>

                                    <a class="edit-button" href="{{store.customer_address_url(customer.default_address)}}" title="Editar">
                                        <iconify-icon icon="lucide:pen-line"></iconify-icon>
                                    </a>
                                </div>
                            {% endfor %}
                        </div>
                    {% endif %}
                    <div class="mb-4">
                        {{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, '', 'btn btn-default w-auto d-inline-block') }}
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="row customer-panel-shadow" data-store="account-orders">
                        {% if customer.orders %}
                            {% if customer.ordersCount > 50 %}
                                <div class="w-100 subtitle">
                                    {{ 'Últimas 50 órdenes' | translate }}
                                </div>
                            {% else %}
                                <div class="w-100 subtitle">
                                    Minhas compras
                                </div>
                            {% endif %}
                            <div class="divider my-3 w-100"></div>
                            <div class="orders-grid">
                                {% for order in customer.orders %}
                                    {% set add_checkout_link = order.pending %}
                                    <div class="customer-panel-shadow order-item-custom" data-store="account-order-item-{{ order.id }}">
                                        <a class="btn-link-primary order-code" href="{{ store.customer_order_url(order) }}">
                                            {{'Orden' | translate}}: #{{order.number}} - {{ order.date | i18n_date('%d/%m/%Y') }}
                                        </a>
                                        <div class="p-0">
                                            <div class="row">
                                                <div class="col-7">
                                                    <p class=" mb-2">
                                                        <svg class="icon-inline mr-1 icon-w svg-icon-text"><use xlink:href="#credit-card"/></svg>
                                                        {{'Pago' | translate}}: <span class="{{ order.payment_status }}"> <strong>{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</strong></span>
                                                    </p>
                                                    <p class="">
                                                        <svg class="icon-inline mr-1 icon-w svg-icon-text"><use xlink:href="#truck"/></svg>
                                                        {{'Envío' | translate}}: <strong> {{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }} </strong>
                                                    </p>
                                                    <h4 class="m-0 mt-4">
                                                        <strong>{{'Total' | translate}}</strong> {{ order.total | money }}
                                                    </h4>
                                                    <div class="desktop-button">
                                                        <a class="btn btn-primary d-block btn-block btn-medium accent mt-4 mb-2" href="{{ store.customer_order_url(order) }}">{{'Ver detalle >' | translate}}</a>
                                                        {% if add_checkout_link %}
                                                            <a class="btn btn-primary d-block btn-block btn-medium" href="{{ order.checkout_url | add_param('ref', 'orders_list') }}" target="_blank">{{'Realizar el pago' | translate}}</a>
                                                        {% elseif order.order_status_url != null %}
                                                            <a class="btn btn-primary d-block btn-block btn-medium" href="{{ order.order_status_url | add_param('ref', 'orders_list') }}" target="_blank">{% if 'Correios' in order.shipping_name %}{{'Seguí la entrega' | translate}}{% else %}{{'Seguí tu orden' | translate}}{% endif %}</a>
                                                        {% endif %}
                                                    </div>
                                                </div>

                                                <div class="col-5">
                                                    <div class="card-img-square-container">
                                                        {% for item in order.items %}
                                                            {% if loop.first %} 
                                                                {% if loop.length > 1 %} 
                                                                    <span class="card-img-pill">{{ loop.length }} {{'Productos' | translate }}</span>
                                                                {% endif %}
                                                                {{ item.featured_image | product_image_url("") | img_tag(item.featured_image.alt, {class: 'card-img-square'}) }}
                                                            {% endif %}
                                                        {% endfor %}
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mobile-button">
                                                <a class="btn btn-primary d-block btn-block btn-medium accent mt-4 mb-2" href="{{ store.customer_order_url(order) }}">{{'Ver detalle >' | translate}}</a>
                                                {% if add_checkout_link %}
                                                    <a class="btn btn-primary d-block btn-block btn-medium" href="{{ order.checkout_url | add_param('ref', 'orders_list') }}" target="_blank">{{'Realizar el pago' | translate}}</a>
                                                {% elseif order.order_status_url != null %}
                                                    <a class="btn btn-primary d-block btn-block btn-medium" href="{{ order.order_status_url | add_param('ref', 'orders_list') }}" target="_blank">{% if 'Correios' in order.shipping_name %}{{'Seguí la entrega' | translate}}{% else %}{{'Seguí tu orden' | translate}}{% endif %}</a>
                                                {% endif %}
                                            </div>
                                        </div>
                                        
                                    </div>
                                {% endfor %}
                            </div>
                        {% else %}
                        <div class="col text-center">
                            <svg class="icon-inline mr-1 icon-lg svg-icon-primary"><use xlink:href="#bag"/></svg>
                            <p class="mt-2">{{ '¡Hacé tu primera compra!' | translate }}</p>
                            {{ 'Ir a la tienda' | translate | a_tag(store.url, '', 'btn btn-primary btn-medium w-100 mt-2') }}
                        </div>
                        {% endif %}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
