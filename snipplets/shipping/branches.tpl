<div class="js-accordion-container js-toggle-branches mb-3">
    <a href="#" class="js-accordion-toggle py-1 row">
        <div class="col">
            <svg class="icon-inline icon-w svg-icon-text mr-1"><use xlink:href="#store-alt"/></svg>
            <span class="subtitle">
                {% if store.branches|length > 1 %}
                    {{ 'Nuestros locales' | translate }}
                {% else %}
                    {{ 'Nuestro local' | translate }}
                {% endif %}
            </span>
        </div>
        <div class="col-auto">
            <span class="js-accordion-toggle-inactive">
                <svg class="icon-inline svg-icon-text icon-rotate-90"><use xlink:href="#chevron"/></svg>
            </span>
            <span class="js-accordion-toggle-active" style="display: none;">
                <svg class="icon-inline svg-icon-text icon-rotate-90-neg"><use xlink:href="#chevron"/></svg>
            </span>
        </div>
    </a>
    <div class="js-accordion-content" style="display: none;">
    {% if not product_detail %}
        <div class="radio-buttons-group">
    {% else %}
        <div class="list">
    {% endif %}
            <ul class="list-unstyled radio-button-container mt-2">

                {% for branch in store.branches %}
                    <li class="{% if product_detail %}list-item list-item-shipping radio-button{% else %}radio-button-item{% endif %}" data-store="branch-item-{{ branch.code }}">

                        {# If cart use radiobutton #}

                        {% if not product_detail %}
                            <label class="js-shipping-radio js-branch-radio radio-button" data-loop="branch-radio-{{loop.index}}">
                        
                                <input 
                                class="js-branch-method {% if cart.shipping_data.code == branch.code %} js-selected-shipping-method {% endif %} shipping-method" 
                                data-price="0" 
                                {% if cart.shipping_data.code == branch.code %}checked{% endif %} type="radio" 
                                value="{{branch.code}}" 
                                data-name="{{ branch.name }} - {{ branch.extra }}"
                                data-code="{{branch.code}}" 
                                data-cost="{{ 'Gratis' | translate }}"
                                name="option" 
                                style="display:none">
                                <div class="shipping-option row-fluid radio-button-content">
                                   <div class="radio-button-icons-container">
                                        <div class="radio-button-icons">
                                            <div class="radio-button-icon unchecked"></div>
                                            <div class="radio-button-icon checked"></div>
                                        </div>
                                    </div>
                        {% endif %}
                                    <div class="{% if product_detail %}list-item-content{% else %}radio-button-label{% endif %}">
                                        <div class="row">
                                            <div class="col  {% if not product_detail %}mt-1 px-0{% endif %}">
                                                <div>{{ branch.name }} - {{ branch.extra }}</div>
                                            </div>
                                            <div class="col-auto text-right">
                                                <p class="text-accent mb-0 d-inline-block">{{ 'Gratis' | translate }}</p>
                                            </div>
                                        </div>
                                    </div>
                        {% if not product_detail %}
                                </div>
                            </label>
                        {% endif %}
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>
</div>