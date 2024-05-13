<div class="service-item-container" data-transition="fade-in-up">
        {% if banner_services_url %}
            <a href="{{ banner_services_url | setting_url }}">
        {% endif %}
            {% if banner_services_icon == 'image' and banner_services_image %}
                <img class="service-item-image lazyload mb-3" src="{{ 'images/empty-placeholder.png' | static_url }}" data-src='{{ "#{banner}.jpg" | static_url | settings_image_url("large") }}' {% if banner_services_title %}alt="{{ banner_services_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} />
            {% elseif banner_services_icon == 'shipping' %}
                {# <svg class="icon-inline icon-7x svg-icon-text mb-3"><use xlink:href="#truck-big"/></svg> #}
                <iconify-icon icon="solar:box-outline"></iconify-icon>
            {% elseif banner_services_icon == 'card' %}
                {# <svg class="icon-inline icon-7x svg-icon-text mb-3"><use xlink:href="#credit-card-big"/></svg> #}
                <iconify-icon icon="teenyicons:credit-card-outline"></iconify-icon>
            {% elseif banner_services_icon == 'security' %}
                {# <svg class="icon-inline icon-7x svg-icon-text mb-3"><use xlink:href="#security-big"/></svg> #}
                <iconify-icon icon="ph:shield-star"></iconify-icon>
            {% elseif banner_services_icon == 'returns' %}
                <svg class="icon-inline icon-7x svg-icon-text mb-3"><use xlink:href="#returns-big"/></svg>
            {% elseif banner_services_icon == 'whatsapp' %}
                <svg class="icon-inline icon-7x svg-icon-text mb-3"><use xlink:href="#whatsapp-big"/></svg>
            {% elseif banner_services_icon == 'promotions' %}
                <svg class="icon-inline icon-7x svg-icon-text mb-3"><use xlink:href="#promotions-big"/></svg>
            {% elseif banner_services_icon == 'cash' %}
                <svg class="icon-inline icon-7x svg-icon-text mb-3"><use xlink:href="#cash-big"/></svg>
            {% endif %}
            {% if banner_services_title %}
                <h3 class="h4 mb-3">{{ banner_services_title }}</h3>
            {% endif %}
            {% if banner_services_description %}
                <p class="m-0">{{ banner_services_description }}</p>
            {% endif %}
        {% if banner_services_url %}
            </a>
        {% endif %}
</div>
