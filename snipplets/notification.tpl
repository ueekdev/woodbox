{# Cookie validation #}

{% if show_cookie_banner and not params.preview %}
    <div class="js-notification js-notification-cookie-banner notification notification-fixed-bottom {% if settings.show_tab_nav %}notification-fixed-bottom-with-tabnav{% endif %} notification-above notification-primary text-left" style="display: none;">
        <div class="container-fluid p-0">
            <div class="row justify-content-center align-items-center">
                <div class="col col-md-auto pr-0">
                    <div class="">{{ 'Al navegar por este sitio <strong>aceptás el uso de cookies</strong> para agilizar tu experiencia de compra.' | translate }}</div>
                </div>
                <div class="col-auto">
                    <a href="#" class="js-notification-close js-acknowledge-cookies btn btn-secondary " data-amplitude-event-name="cookie_banner_acknowledge_click">{{ "Entendido" | translate }}</a>
                </div>
            </div>
        </div>
    </div>
{% endif %}

{% if order_notification and status_page_url %}
    <div class="js-notification js-notification-status-page notification notification-primary" style="display:none;" data-url="{{ status_page_url }}">
        <div class="container">
            <div class="row">
                <div class="col">
                    <a href="{{ status_page_url }}"><strong>{{ "Seguí acá" | translate }}</strong> {{ "tu última compra" | translate }}</a>
                    <a class="js-notification-close js-notification-status-page-close ml-3" href="#">
                        <svg class="icon-inline icon-lg"><use xlink:href="#times"/></svg>
                    </a>
                </div>
            </div>
        </div>
    </div>
{% endif %}

{% if add_to_cart %}
    <div class="js-alert-added-to-cart notification-floating notification-cart-container notification-hidden {% if add_to_cart_fixed %}notification-fixed{% endif %} {% if settings.show_tab_nav %}notification-with-tabnav{% endif %} {% if settings.search_big_mobile %}notification-with-big-search{% endif %}" style="display: none;">
        <div class="notification notification-primary notification-cart position-relative">
            <div class="js-cart-notification-close notification-close">
                <svg class="icon-inline icon-lg notification-icon"><use xlink:href="#times"/></svg>
            </div>
            <div class="js-cart-notification-item row" data-store="cart-notification-item">
                <div class="col-2 pr-0 notification-img">
                    <img src="" class="js-cart-notification-item-img img-fluid" />
                </div>
                <div class="col-10 text-left">
                    <div class="mb-1 mr-4">
                        <span class="js-cart-notification-item-name"></span>
                        <span class="js-cart-notification-item-variant-container" style="display: none;">
                            (<span class="js-cart-notification-item-variant"></span>)
                        </span>
                    </div>
                    <div class="mb-1">
                        <span class="js-cart-notification-item-quantity"></span>
                        <span> x </span>
                        <span class="js-cart-notification-item-price"></span>
                    </div>
                    <strong>{{ '¡Agregado al carrito con éxito!' | translate }}</strong>
                </div>
            </div>
            <div class="divider my-2"></div>
            <div class="row h6 mb-3">
                <span class="col-auto text-left ml-2">
                    <span>{{ "Total" | translate }}</span> 
                    (<span class="js-cart-widget-amount">
                        {{ "{1}" | translate(cart.items_count ) }} 
                    </span>
                    <span class="js-cart-counts-plural" style="display: none;">
                        {{ 'productos' | translate }}):
                    </span>
                    <span class="js-cart-counts-singular" style="display: none;">
                        {{ 'producto' | translate }}):
                    </span>

                </span>
                <strong class="js-cart-total col text-right">{{ cart.total | money }}</strong>
            </div>
            <a href="#" class="js-modal-open js-open-cart js-cart-notification-close js-fullscreen-modal-open btn btn-primary btn-medium w-100 d-inline-block" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart">
                {{'Ver carrito' | translate }}
            </a>
        </div>
    </div>
{% endif %}
