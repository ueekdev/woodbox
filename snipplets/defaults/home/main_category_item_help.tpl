{# Main categories item demo #}

{% set item_view_box = '0 0 1000 1000' %}

<div class="swiper-slide w-auto text-center">
    <div class="home-category">
        <div class="home-category-image">
            {% if help_item_1 %}
                <svg viewBox="{{ item_view_box }}"><use xlink:href="#main-category-placeholder-1"/></svg>
            {% elseif help_item_2 %}
                <svg viewBox="{{ item_view_box }}"><use xlink:href="#main-category-placeholder-2"/></svg>
            {% elseif help_item_3 %}
                <svg viewBox="{{ item_view_box }}"><use xlink:href="#main-category-placeholder-3"/></svg>
            {% endif %}
        </div>
        <div class="home-category-name  mt-2">{{ 'Categoría' | translate }}</div>
    </div>
</div>