{# /*============================================================================
  #Item grid
==============================================================================*/

#Properties

#Slide Item

#}

{% set slide_item = slide_item | default(false) %}
{% set columns = settings.grid_columns %}

{% set item_view_box = '0 0 1000 1000' %}

{% if slide_item %}
    <div class="swiper-slide">
{% endif %}
<div class="{% if slide_item %} js-item-slide p-0{% endif %}{% if not slide_item %} col-{% if columns_mobile == 1 %}12{% elseif columns_mobile == 2 %}6{% else %}4{% endif %} col-md-{% if columns_desktop == 2 %}6{% elseif columns_desktop == 3 %}4{% else %}3{% endif %}{% endif %} item item-product grid-item">
    <div class="item-image">
        <div class="p-relative">
            <a href="{{ store.url }}/product/example" title="{{ "Producto de ejemplo" | translate }}">
                {% if help_item_1 %}
                    <svg viewBox="{{ item_view_box }}"><use xlink:href="#item-product-placeholder-1"/></svg>
                {% elseif help_item_2 %}
                    <svg viewBox="{{ item_view_box }}"><use xlink:href="#item-product-placeholder-2"/></svg>
                {% elseif help_item_3 %}
                    <svg viewBox="{{ item_view_box }}"><use xlink:href="#item-product-placeholder-3"/></svg>
                {% elseif help_item_4 %}
                    <svg viewBox="{{ item_view_box }}"><use xlink:href="#item-product-placeholder-4"/></svg>
                {% elseif help_item_5 %}
                    <svg viewBox="{{ item_view_box }}"><use xlink:href="#item-product-placeholder-5"/></svg>
                {% elseif help_item_6 %}
                    <svg viewBox="{{ item_view_box }}"><use xlink:href="#item-product-placeholder-6"/></svg>
                {% elseif help_item_7 %}
                    <svg viewBox="{{ item_view_box }}"><use xlink:href="#item-product-placeholder-7"/></svg>
                {% elseif help_item_8 %}
                    <svg viewBox="{{ item_view_box }}"><use xlink:href="#item-product-placeholder-8"/></svg>
                {% endif %}
            </a>
            {% if help_item_1 %}
                <div class="labels">
                    <div class="label label-accent">{{ "20% OFF" | translate }}</div>
                </div>
            {% elseif help_item_2 %}
                <div class="labels">
                    <div class="label label-accent">{{ "Envío gratis" | translate }}</div>
                </div>
            {% elseif help_item_3 %}
                <div class="labels">
                    <div class="label label-accent">{{ "35% OFF" | translate }}</div>
                </div>
            {% elseif help_item_7 %}
                <div class="labels">
                    <div class="label label-accent">{{ "20% OFF" | translate }}</div>
                </div>
            {% endif %}
        </div>
    </div>
    <div class="item-description">
        <a href="{{ store.url }}/product/example" title="{{ "Producto de ejemplo" | translate }}" class="item-link">
            <div class="item-name mb-2">{{ "Producto de ejemplo" | translate }}</div>
            <div class="item-price-container mb-2">
                {% if help_item_1 %}
                    {% if store.country == 'BR' %}
                        <span id="compare_price_display" class="js-compare-price-display price-compare">
                            {{"120000" | money }}
                        </span>
                        <span id="price_display" class="js-price-display item-price font-weight-bold">
                            {{"9600" | money }}
                        </span>
                    {% else %}
                        <span id="compare_price_display" class="js-compare-price-display price-compare">
                            {{"1200000" | money }}
                        </span>
                        <span id="price_display" class="js-price-display item-price font-weight-bold">
                            {{"96000" | money }}
                        </span>
                    {% endif %}
                {% elseif help_item_2 %}
                    {% if store.country == 'BR' %}
                        <span id="price_display" class="js-price-display item-price font-weight-bold">
                            {{"68000" | money }}
                        </span>
                    {% else %}
                        <span id="price_display" class="js-price-display item-price font-weight-bold">
                            {{"680000" | money }}
                        </span>
                    {% endif %}
                {% elseif help_item_3 %}
                    {% if store.country == 'BR' %}
                        <span id="compare_price_display" class="js-compare-price-display price-compare">
                            {{"28000" | money }}
                        </span>
                        <span id="price_display" class="js-price-display item-price font-weight-bold">
                            {{"18200" | money }}
                        </span>
                    {% else %}
                        <span id="compare_price_display" class="js-compare-price-display price-compare">
                            {{"280000" | money }}
                        </span>
                        <span id="price_display" class="js-price-display item-price font-weight-bold">
                            {{"182000" | money }}
                        </span>
                    {% endif %}
                {% elseif help_item_4 %}
                    {% if store.country == 'BR' %}
                        <span id="price_display" class="js-price-display item-price font-weight-bold">
                            {{"32000" | money }}
                        </span>
                    {% else %}
                        <span id="price_display" class="js-price-display item-price font-weight-bold">
                            {{"320000" | money }}
                        </span>
                    {% endif %}
                {% elseif help_item_5 %}
                    {% if store.country == 'BR' %}
                        <span id="price_display" class="js-price-display item-price font-weight-bold">
                            {{"24900" | money }}
                        </span>
                    {% else %}
                        <span id="price_display" class="js-price-display item-price font-weight-bold">
                            {{"249000" | money }}
                        </span>
                    {% endif %}
                {% elseif help_item_6 %}
                    {% if store.country == 'BR' %}
                        <span id="price_display" class="js-price-display item-price font-weight-bold">
                            {{"42000" | money }}
                        </span>
                    {% else %}
                        <span id="price_display" class="js-price-display item-price font-weight-bold">
                            {{"420000" | money }}
                        </span>
                    {% endif %}
                {% elseif help_item_7 %}
                    {% if store.country == 'BR' %}
                        <span id="compare_price_display" class="js-compare-price-display price-compare">
                            {{"46000" | money }}
                        </span>
                        <span id="price_display" class="js-price-display item-price font-weight-bold">
                            {{"36800" | money }}
                        </span>
                    {% else %}
                        <span id="compare_price_display" class="js-compare-price-display price-compare">
                            {{"460000" | money }}
                        </span>
                        <span id="price_display" class="js-price-display item-price font-weight-bold">
                            {{"368000" | money }}
                        </span>
                    {% endif %}
                {% elseif help_item_8 %}
                    {% if store.country == 'BR' %}
                        <span id="price_display" class="js-price-display item-price font-weight-bold">
                            {{"12200" | money }}
                        </span>
                    {% else %}
                        <span id="price_display" class="js-price-display item-price font-weight-bold">
                            {{"122000" | money }}
                        </span>
                    {% endif %}
                {% endif %}
            </div>
        </a>
    </div>
</div>
{% if slide_item %}
    </div>
{% endif %}