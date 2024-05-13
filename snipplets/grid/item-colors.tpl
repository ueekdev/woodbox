{% if product.variations %}
    {% set own_color_variants = 0 %}
    {% set custom_color_variants = 0 %}

    {% for variation in product.variations %}
        <div class="js-color-variant-available-{{ loop.index }} {% if variation.name in ['Color', 'Cor'] %}js-color-variant-active{% endif %}" data-value="variation_{{ loop.index }}" data-option="{{ loop.index0 }}" >
            {% if variation.name in ['Color', 'Cor'] %}
                {% if variation.options | length > 1 %}
                    <div class="item-colors mb-2">
                        {% for option in variation.options | take(3) if option.custom_data %}
                            <span title="{{ option.name }}" data-option="{{ option.id }}" data-variation-id="{{ variation.id }}" class="js-color-variant item-colors-bullet " style="background: {{ option.custom_data }}"></span>
                        {% endfor %}

                        {% for option in variation.options %}
                            {% if option.custom_data %}
                                {# Quantity of our colors #}
                                {% set own_color_variants = own_color_variants + 1 %}
                            {% else %}
                                {# Quantity of custom colors #}
                                {% set custom_color_variants = custom_color_variants + 1 %}
                            {% endif %}
                        {% endfor %}

                        {% set more_color_variants = (own_color_variants - 3) + custom_color_variants %}

                        {% if own_color_variants and custom_color_variants %}
                            <span class="item-colors-bullet item-colors-bullet-more w-auto" title="{{ 'Ver más colores' | translate }}">
                                {% if own_color_variants > 3 %}
                                    +{{ more_color_variants }}
                                {% else %}
                                    +{{ custom_color_variants }}
                                {% endif %}
                            </span>
                        {% elseif own_color_variants > 3 %}
                            <span class="item-colors-bullet item-colors-bullet-more w-auto" title="{{ 'Ver más colores' | translate }}">+{{ own_color_variants - 3 }}</span>
                        {% elseif custom_color_variants %}
                            <span class="item-colors-bullet item-colors-bullet-more w-auto px-2" title="{{ 'Ver más colores' | translate }}">{{ custom_color_variants }} {{ 'colores' | translate }}</span>
                        {% endif %}
                    </div>
                {% endif %}
            {% endif %}
        </div>
    {% endfor %}
{% endif %}