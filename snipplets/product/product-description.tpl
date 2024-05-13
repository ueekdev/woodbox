<div id="product-description" style="display: none;" class="mt-4 {% if settings.full_width_description %}col-12 p-0 px-md-3{% endif %}" data-store="product-description-{{ product.id }}">
    {# Product description #}

    {% if product.description is not empty %}
        <div class="product-description user-content">
            {{ product.description }}
        </div>
    {% endif %}

    {% if settings.show_product_fb_comment_box %}
        <div class="fb-comments section-fb-comments d-block mb-4" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
    {% endif %}
    <div id="reviewsapp"></div>

    {# Product share #}

    {% include 'snipplets/social/social-share.tpl' %}
</div>