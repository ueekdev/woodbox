{# {% embed "snipplets/page-header.tpl" %}
    {% block page_header_text %}{{ 'Orden #{1}' | translate(order.number) }}{% endblock page_header_text %}
{% endembed %} #}

<section class="account-page">
    <div class="container-fluid" data-store="account-order-detail-{{ order.id }}">
    	<div class="container">
            <div class="row">
                <div class="col-12 mt-5 w-100">
                    {% include 'snipplets/breadcrumbs.tpl' %}
                    <h3 class="title-internal">{{ 'Orden #{1}' | translate(order.number) }}</h3>
                </div>
                <div class="col-md-4 product-detail font-bigger">
                    <div class="mb-4">
                        {% if log_entry %}
                            <h4>{{ 'Estado actual del envío' | translate }}:</h4>{{ log_entry }}
                        {% endif %}
                        <div class="subtitle">{{ 'Detalles' | translate }}</div>
                        <div class="divider my-3"></div>
                        <p class="">
                            <svg class="icon-inline mr-1 icon-w svg-icon-text"><use xlink:href="#calendar"/></svg>
                            {{'Fecha' | translate}}: <strong>{{ order.date | i18n_date('%d/%m/%Y') }}</strong> 
                        </p>
                        <p class="">
                            <svg class="icon-inline mr-1 icon-w svg-icon-text"><use xlink:href="#info-circle"/></svg>
                            {{'Estado' | translate}}: <strong>{{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}</strong>
                        </p>
                        <p class="">
                            <svg class="icon-inline mr-1 icon-w svg-icon-text"><use xlink:href="#credit-card"/></svg>
                            {{'Pago' | translate}}: <strong>{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }} </strong>
                        </p>
                        <p class="">
                            <svg class="icon-inline mr-1 icon-w svg-icon-text"><use xlink:href="#usd-circle"/></svg>
                            {{'Medio de pago' | translate}}: <strong>{{ order.payment_name }}</strong>
                        </p>

                        {% if order.address %}
                            <p class="">
                                <svg class="icon-inline mr-1 icon-w svg-icon-text"><use xlink:href="#truck"/></svg>
                                {{'Envío' | translate}}: <strong>{{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}</strong>
                            </p>
                            <p class=""> 
                                <svg class="icon-inline mr-1 icon-w svg-icon-text"><use xlink:href="#map-marker-alt"/></svg>
                                <strong>{{ 'Dirección de envío' | translate }}:</strong>
                                <span class="d-block">
                                    {{ order.address | format_address }}
                                </span>
                            </p>
                        {% endif %}
                    </div>
                </div>
                <div class="col-md-8 product-detail">
                    <div class="d-lg-none d-md-block mb-3">{{ 'Productos' | translate }}</div>
                    <div class="d-none d-md-block">
                        <div class="row">
                            <div class="col-6">
                                <p>{{ 'Producto' | translate }}</p>
                            </div>
                            <div class="col-2 text-center">
                                <p>{{ 'Precio' | translate }}</p>
                            </div>
                            <div class="col-2 text-center">
                                <p>{{ 'Cantidad' | translate }}</p>
                            </div>
                            <div class="col-2 text-center">
                                <p>{{ 'Total' | translate }}</p>
                            </div>
                        </div>
                    </div>
                    <div class="order-detail">
                        {% for item in order.items %}
                            <div class="order-item">
                                <div class="row align-items-center">
                                    <div class="col-7 col-md-6">
                                        <div class="row align-items-center">
                                            <div class="col-4 col-md-3 pr-0">
                                                <div class="card-img-square-container">
                                                    {{ item.featured_image | product_image_url("small") | img_tag(item.featured_image.alt, {class: 'd-block card-img-square'}) }} 
                                                </div>
                                            </div>
                                            <div class="col-8 col-md-9">
                                                <p>
                                                    <strong>{{ item.name }}</strong> <span class="d-inline-block d-md-none text-center">x{{ item.quantity }}</span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-2 d-none d-md-block text-center">
                                        <p>
                                            {{ item.unit_price | money }}
                                        </p>
                                    </div>
                                    <div class="col-2 d-none d-md-block text-center">
                                        <p>
                                            {{ item.quantity }}
                                        </p>
                                    </div>
                                    <div class="col-5 col-md-2 text-center">
                                        <p>
                                            {{ item.subtotal | money }}
                                        </p>
                                    </div>
                                </div>
                            </div>
                        {% endfor %}
                        {% if order.show_shipping_price %}
                            <p class="mt-3">
                                <strong class="">{{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:</strong>
                                {% if order.shipping == 0  %}
                                    {{ 'Gratis' | translate }}
                                {% else %}
                                    {{ order.shipping | money_long }}
                                {% endif %}
                            </p>
                        {% else %}
                            <p class="mt-3">
                                <strong class="">{{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:</strong>
                                {{ 'A convenir' | translate }}
                            </p>
                        {% endif %}
                        {% if order.discount %}
                            <p class="mt-3">
                            <strong class="">{{ 'Descuento ({1})' | translate(order.coupon) }}:</strong>
                                - {{ order.discount | money }}
                            </p>
                        {% endif %}
                        {% if order.shipping or order.discount %}
                            <p class="mt-3">
                                <strong class="">{{ 'Subtotal' | translate }}:</strong>
                                {{ order.subtotal | money }}
                            </p>
                        {% endif %}  
                        <h3>{{ 'Total' | translate }}: {{ order.total | money }}</h3>
                        {% if order.pending %}
                            <a class="btn btn-primary d-inline-block" href="{{ order.checkout_url | add_param('ref', 'orders_details') }}" target="_blank">{{ 'Realizar el pago' | translate }}</a>
                        {% endif %}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>