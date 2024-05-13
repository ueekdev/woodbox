{% if applied_filters %}

    {# Applied filters chips #}

    {% if has_applied_filters %}
        {% if modal %}
            {# Show subtitle only for modal applied filters #}
            <div class="mt-4 mb-2">{{ 'Filtro aplicado:' | translate }}</div>
        {% endif %}
        {% for product_filter in product_filters %}
            {% for value in product_filter.values %}

                {# List applied filters as tags #}
                
                {% if value.selected %}
                    <button class="js-remove-filter chip" data-filter-name="{{ product_filter.key }}" data-filter-value="{{ value.name }}" data-component="filter.pill-{{ product_filter.type }}" data-component-value="{{ product_filter.key }}">
                        {{ value.pill_label }}
                        <svg class="icon-inline chip-remove-icon"><use xlink:href="#times"/></svg>
                    </button>
                {% endif %}
            {% endfor %}
        {% endfor %}
        <a href="#" class="js-remove-all-filters btn-link d-inline-block mt-1" data-component="filter-delete">{{ 'Borrar filtros' | translate }}</a> 
    {% endif %}
{% else %}
    {% if product_filters is not empty %}
        
        {# Filters list #}

        <div id="filters" class="visible-when-content-ready" data-store="filters-nav">
            {% if not modal %}
                <h5 class="title-section mb-2 d-none d-md-block">{{ "Filtrar por" | translate }}</h5>
            {% endif %}
            {% for product_filter in product_filters %}
                {% if product_filter.type == 'price' %}

                    {% if modal %}
                        {% set btn_price_classes = 'btn-price-filter' %}
                    {% else %}
                        {% set btn_price_classes = 'btn-square btn-icon chevron' %}
                    {% endif %}
                    {{ component(
                        'price-filter',
                        {'group_class': 'price-filter-container', 'title_class': 'mb-3 mt-4 subtitle', 'button_class': 'btn btn-secondary  ' ~  btn_price_classes }
                    ) }}

                    <div class="divider mt-3 pt-2"></div>

                {% else %}
                    {% if product_filter.has_products %}
                    
                        <div class="js-accordion-container" data-store="filters-group" data-component="list.filter-{{ product_filter.type }}" data-component-value="{{ product_filter.key }}">
                            <div class="mb-3 mt-4 subtitle">{{product_filter.name}}</div>
                            {% set index = 0 %}
                            {% for value in product_filter.values %}
                                {% if value.product_count > 0 %}
                                    {% set index = index + 1 %}

                                    <label class="js-filter-checkbox {% if not value.selected %}js-apply-filter{% else %}js-remove-filter{% endif %} checkbox-container" data-filter-name="{{ product_filter.key }}" data-filter-value="{{ value.name }}" data-component="filter.option" data-component-value="{{ value.name }}">
                                        <input type="checkbox" autocomplete='off' {% if value.selected %}checked{% endif %}/>
                                        <span class="checkbox">
                                            <span class="checkbox-icon"></span>
                                            <span class="checkbox-text with-color">
                                                {{ value.name }} <span class="opacity-50 ">({{ value.product_count }})</span>
                                            </span>
                                            {% if product_filter.type == 'color' and value.color_type == 'insta_color' %}
                                                <span class="checkbox-color" style="background-color: {{ value.color_hexa }};"></span>
                                            {% endif %}
                                        </span>
                                    </label>
                                    {% if index == 8 and product_filter.values_with_products > 8 %}
                                        <div class="js-accordion-content" style="display: none;">
                                    {% endif %}
                                    
                                {% endif %}
                                {% if loop.last and product_filter.values_with_products > 8 %}
                                    </div>
                                    <a href="#" class="js-accordion-toggle d-inline-block btn btn-secondary ">
                                        <span class="js-accordion-toggle-inactive">{{ 'Ver todos' | translate }}</span>
                                        <span class="js-accordion-toggle-active" style="display: none;">{{ 'Ver menos' | translate }}</span>
                                    </a>
                                {% endif %}
                            {% endfor %}
                        </div>
                        <div class="divider mt-3 pt-2"></div>
                    {% endif %}
                {% endif %}
            {% endfor %}
        </div>
    {% endif %}
{% endif %}