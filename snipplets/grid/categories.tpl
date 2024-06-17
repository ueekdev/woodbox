{% if not modal %}
    <div class="visible-when-content-ready">
        {% if parent_category and parent_category.id!=0 %}
            <a href="{{ parent_category.url }}" title="{{ parent_category.name }}" class="category-back d-block{% if filter_categories %} mb-4{% endif %}">
                <svg class="icon-inline mr-2 svg-icon-text icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
                {{ parent_category.name }}
            </a>
        {% endif %}
{% endif %}

        {% if filter_categories %}
            {% if not modal %}
                <div class="d-none d-md-block">
            {% endif %}
                    {% if modal %}
                        <h3 class="">{{ "Categorías" | translate }}</h3>
                    {% endif %}
                    <ul class="js-accordion-container list-links-filter list-unstyled"> 
                        {% for category in filter_categories %}
                            <li data-item="{{ loop.index }}" ><a href="{{ category.url }}" title="{{ category.name }}" class="btn-link">{{ category.name }}</a></li>

                            {% if loop.index == 8 and filter_categories | length > 8 %}
                                <div class="js-accordion-content" style="display: none;">
                            {% endif %}
                            {% if loop.last and filter_categories | length > 8 %}
                                </div>
                                <a href="#" class="js-accordion-toggle d-inline-block btn btn-secondary ">
                                    <span class="js-accordion-toggle-inactive">{{ 'Ver más' | translate }}</span>
                                    <span class="js-accordion-toggle-active" style="display: none;">{{ 'Ver menos' | translate }}</span>
                                </a>
                            {% endif %}
                        {% endfor %}
                    </ul>
                    <div class="divider mt-3 pt-2"></div>
            {% if not modal %}
                </div>
            {% endif %}
        {% endif %}
{% if not modal %}
    </div>
{% endif %}