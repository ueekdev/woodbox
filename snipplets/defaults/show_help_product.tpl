{% include "snipplets/svg/empty-placeholders.tpl" %}

{% set product_view_box = '0 0 1000 1000' %}

<div id="single-product" class="js-has-new-shipping js-product-detail js-product-container js-shipping-calculator-container" data-variants="{{product.variants_object | json_encode }}" data-store="product-detail">
    <div class="container-fluid">
        <div class="row section-single-product">
            <div class="col-12 col-md-8 pl-0 pr-0 pl-md-3 pr-md-3">
                <div class="row">
                    <div class="col-2 d-none d-md-block">
                        <a href="#" class="js-product-thumb product-thumb d-block position-relative mb-3">
                            <svg viewBox='{{ product_view_box }}'><use xlink:href="#item-product-placeholder-3"/></svg>
                        </a>
                        <a href="#" class="js-product-thumb product-thumb d-block position-relative mb-3">
                            <svg viewBox='{{ product_view_box }}'><use xlink:href="#product-image-green-placeholder"/></svg>
                        </a>
                        <a href="#" class="js-product-thumb product-thumb d-block position-relative mb-3">
                            <svg viewBox='{{ product_view_box }}'><use xlink:href="#product-image-red-placeholder"/></svg>
                        </a>
                    </div>
                    <div class="product-image-container col-12 col-md-10">
                        <div class="js-swiper-product swiper-container">
                            <div class="labels labels-product-slider">
                                <div class="label label-accent">{{ "35% OFF" | translate }}</div>
                            </div>
                            <div class="swiper-wrapper">
                                 <div class="swiper-slide js-product-slide slider-slide" data-image="0" data-image-position="0">
                                    <a href="{{ image | product_image_url('huge') }}" data-fancybox="product-gallery" class="d-block p-relative">
                                        <svg viewBox='{{ product_view_box }}'><use xlink:href="#item-product-placeholder-3"/></svg>
                                    </a>
                                 </div>
                                 <div class="swiper-slide js-product-slide slider-slide" data-image="1" data-image-position="1">
                                    <a href="{{ image | product_image_url('huge') }}" data-fancybox="product-gallery" class="d-block p-relative">
                                        <svg viewBox='{{ product_view_box }}'><use xlink:href="#product-image-green-placeholder"/></svg>
                                    </a>
                                 </div>
                                 <div class="swiper-slide js-product-slide slider-slide" data-image="2" data-image-position="2">
                                    <a href="{{ image | product_image_url('huge') }}" data-fancybox="product-gallery" class="d-block p-relative">
                                        <svg viewBox='{{ product_view_box }}'><use xlink:href="#product-image-red-placeholder"/></svg>
                                    </a>
                                 </div>
                            </div>
                            <div class="js-swiper-product-pagination swiper-pagination swiper-pagination-white h5 font-weight-normal d-block d-md-none"></div>
                        </div>
                    </div>
                </div>
                {% snipplet 'placeholders/product-detail-image-placeholder.tpl' %}
            </div>
            <div class="col">
                {# Product name and breadcrumbs #}

                <section class="page-header pt-4">
                    <div class="breadcrumbs">
                        <a class="crumb" href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
                        <span class="divider mr-1">.</span>
                        <a class="crumb" href="{{ store.products_url }}" title="{{ "Productos" | translate }}">{{ "Productos" | translate }}</a>
                        <span class="divider mr-1">.</span>
                        <span class="crumb active">{{ "Producto de ejemplo" | translate }}</span>
                    </div>
                    <h1 class="h4">{{ "Producto de ejemplo" | translate }}</h1>
                </section>

                {# Product price #}

                {% set product_can_show_installments = product.show_installments and product.display_price %}

                {% if store.country == 'BR' %}
                    <div class="price-container">
                        <span class="d-inline-block">
                           <div id="compare_price_display" class="js-compare-price-display price-compare font-weight-normal" style="display:block;">{{"28000" | money }}</div>
                        </span>
                        <span class="d-inline-block mr-3">
                            <div class="js-price-display" id="price_display">{{"18200" | money }}</div>
                        </span>
                    </div>
                {% else %}
                    <div class="price-container">
                        <span class="d-inline-block">
                           <div id="compare_price_display" class="js-compare-price-display price-compare font-weight-normal" style="display:block;">{{"280000" | money }}</div>
                        </span>
                        <span class="d-inline-block mr-3">
                            <div class="js-price-display" id="price_display">{{"182000" | money }}</div>
                        </span>
                    </div>
                {% endif %}

                <div class="divider"></div>

                {# Product installments #}

                <div href="#installments-modal" class="js-product-payments-container row mb-4">
                    <span class="js-max-installments-container js-max-installments col">
                        <span class="float-left mr-2">
                            <svg class="icon-inline svg-icon-text icon-lg"><use xlink:href="#credit-card"/></svg>
                        </span>
                        <span class="d-table text-inline">
                            <span>{{ "Hasta 12 cuotas" | translate }}</span>
                        </span>
                    </span>
                </div>

                {# Product form, includes: Variants, CTA and Shipping calculator #}

                <form id="product_form" class="js-product-form" method="post" action="">
                    <input type="hidden" name="add_to_cart" value="2243561" />

                    <div class="js-product-variants row">
                        <div class="col col-md-6">
                            <div class="form-group ">
                                <label class="form-label " for="variation_1">{{ "Color" | translate }}</label>
                                <select id="variation_1" class="form-select js-variation-option js-refresh-installment-data  " name="variation[0]">
                                    <option value="{{ "Verde" | translate }}">{{ "Verde" | translate }}</option>
                                    <option value="{{ "Rojo" | translate }}">{{ "Rojo" | translate }}</option>
                                </select>
                                <div class="form-select-icon">
                                    <svg class="icon-inline icon-w-14 icon-lg icon-rotate-90"><use xlink:href="#chevron"/></svg>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row mb-2">
                        <div class="col-4">
                            {% embed "snipplets/forms/form-input.tpl" with{
                            type_number: true, input_value: '1', 
                            input_name: 'quantity' ~ item.id, 
                            input_custom_class: 'js-quantity-input', 
                            input_label: false, 
                            input_append_content: true, 
                            input_group_custom_class: 'js-quantity form-quantity', 
                            form_control_container_custom_class: 'col', 
                            form_control_quantity: true,
                            input_min: '1'} %}
                                {% block input_prepend_content %}
                                <div class="row m-0 align-items-center">
                                    <span class="js-quantity-down form-quantity-icon btn">
                                        <svg class="icon-inline icon-w-12 icon-lg"><use xlink:href="#minus"/></svg>
                                    </span>
                                {% endblock input_prepend_content %}
                                {% block input_append_content %}
                                    <span class="js-quantity-up form-quantity-icon btn">
                                        <svg class="icon-inline icon-w-12 icon-lg"><use xlink:href="#plus"/></svg>
                                    </span>
                                </div>
                                {% endblock input_append_content %}
                            {% endembed %}
                        </div>
                        <div class="col-8">
                            <input type="submit" class="js-addtocart js-prod-submit-form btn btn-primary  mb-4 cart" value="{{ 'Agregar al carrito' | translate }}" />
                        </div>
                    </div>

                 </form>

                {# Product description #}

                <div class="product-description user-content">
                    <p>{{ "¡Este es un producto de ejemplo! Para poder probar el proceso de compra, debes" | translate }}
                        <a href="/admin/products" target="_top">{{ "agregar tus propios productos." | translate }}</a>
                    </p>
                </div>

                {# Product share #}

                {% include 'snipplets/social/social-share.tpl' %}

                {% if settings.show_product_fb_comment_box %}
                    <div class="fb-comments section-fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
                {% endif %}
                <div id="reviewsapp"></div>
            </div>
            
        </div>
    </div>  
</div>
<section id="related-products" class="section-products-related position-relative" data-store="related-products">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 text-center">
                <div class="section-title">
                    <h3 class="h5 mb-1">{{ "Productos relacionados" | translate }}</h3>
                </div>
            </div>
            <div class="col-12 p-0">
                <div class="js-swiper-related swiper-container">
                    <div class="swiper-wrapper">
                        {% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_1': true}  %}
                        {% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_2': true}  %}
                        {% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_4': true}  %}
                        {% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_6': true}  %}
                        {% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_7': true}  %}
                    </div>
                </div>
            </div>
            <div class="js-swiper-related-prev swiper-button-prev d-none d-md-block svg-square svg-icon-text">
                <svg class="icon-inline icon-lg icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
            </div>
            <div class="js-swiper-related-next swiper-button-next d-none d-md-block svg-square svg-icon-text">
                <svg class="icon-inline icon-lg"><use xlink:href="#chevron"/></svg>
            </div>
        </div>
    </div>
</section>