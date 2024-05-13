{% embed "snipplets/forms/form-select.tpl" with{select_label: false, select_custom_class: "js-lang-select", select_group_custom_class: "mb-0 form-vertical-align", select_small: true} %}
    {% block select_options %}
        {% for language in languages %}
            <option value="{{ language.country }}" data-country-url="{{ language.url }}" {% if language.active %}selected{% endif %}>{{ language.country_name }}</option>
        {% endfor %}
    {% endblock select_options%}
{% endembed %}
