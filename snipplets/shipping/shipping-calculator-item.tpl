{# On first calculation select as default the first option: If store only has pickup option selects pickup else selects shipping option #}

{% if has_featured_shipping %}
    {% set checked_option = featured_option and loop.first and not pickup %}
{% else %}
    {% set checked_option = featured_option and loop.first and pickup %}
{% endif %}

{% if store.has_smart_shipping_no_auto_select %}
    {% set checked_option = false %}
{% endif %}

<li class="js-shipping-list-item radio-button-item" data-store="shipping-calculator-item-{{ option.code }}">
    <label class="js-shipping-radio radio-button list-item" data-loop="shipping-radio-{{loop.index}}" data-shipping-type="{% if pickup %}pickup{% else %}delivery{% endif %}" data-component="shipping.option">
        <input
        id="{% if featured_option %}featured-{% endif %}shipping-{{loop.index}}" 
        class="js-shipping-method {% if not featured_option %}js-shipping-method-hidden{% endif %} {% if pickup %}js-pickup-option{% endif %} shipping-method" 
        data-price="{{option.cost.value}}" 
        data-code="{{option.code}}" 
        data-name="{{option.name}}" 
        data-cost="{% if option.show_price %} {% if option.cost.value == 0 %}{{ 'Gratis' | translate }}{% else %}{{option.cost}}{% endif %}{% else %} {{ 'A convenir' | translate }} {% endif %}" 
        type="radio" 
        value="{{option.code}}" 
        {% if checked_option %}checked="checked"{% endif %} name="option" 
        style="display:none" />
        <div class="radio-button-content">
            <div class="radio-button-icons-container">
                <div class="radio-button-icons">
                    <span class="radio-button-icon unchecked"></span>
                    <span class="radio-button-icon checked"></span>
                </div>
            </div>
            <div class="radio-button-label">

                {# Improved shipping option with no carrier img and ordered shipping info #}
                <div class="radio-button-text row"> 
                    <div class="col  mt-1 px-0">
                        <div class="shipping-option-name {% if option.payment_rules or option.time or option.suboptions is not empty %}mb-1{% endif %}" data-component="option.name">
                            {{option.short_name}} <span class="ml-1">{{ option.method == 'branch'  ? option.extra.extra  :  '' }}</span>
                        </div>
                        {% if option.time %}
                            <div class="opacity-60 {% if option.suboptions is not empty or option.payment_rules %}mb-2{% endif %}" data-component="option.date">
                                {% if store.has_smart_dates %}
                                    {{option.dates}}
                                {% else %}
                                    {{option.time}}
                                {% endif %}
                            </div>
                        {% endif %}
                        {% if option.suboptions is not empty %}
                            <div {% if option.payment_rules %}class="mb-1"{% endif %}>
                                {% include "snipplets/shipping_suboptions/#{option.suboptions.type}.tpl" with {'suboptions': option.suboptions} %}
                            </div>
                        {% endif %}
                        {% if option.payment_rules %}
                            <div>
                                <i>{{option.payment_rules}}</i>
                            </div>
                        {% endif %}
                    </div>
                    {% if option.show_price %} 
                        <div class="col-auto text-right" data-component="option.price">
                            <p class="mb-0 d-inline-block {% if option.cost.value == 0  %}text-accent{% endif %}">
                                {% if option.cost.value == 0  %}
                                    {{ 'Gratis' | translate }}
                                {% else %}
                                    {{option.cost}}
                                {% endif %}
                                {% if option.cost.value == 0 and option.old_cost.value %}
                                    <div class="price-compare  opacity-50 mr-0 mt-1">{{option.old_cost}}</div>
                                {% endif %}
                            </p>
                        </div>
                    {% endif %}

                    {% if option.warning['enable'] %}
                        <div class="w-100 mb-0 mt-2 alert alert-warning">
                          {{ option.warning['message'] }}
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </label>
</li>