{% embed "snipplets/page-header.tpl" %}
    {% block page_header_text %}{{ "Mis datos" | translate }}{% endblock page_header_text %}
{% endembed %}

{# Update account info form #}

<section class="account-page">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                {% embed "snipplets/forms/form.tpl" with{form_id: 'info-form', submit_custom_class: 'btn-block', submit_text: 'Guardar cambios' | translate } %}
                    {% block form_body %}

                        {# Name input #}
                        
                        {% embed "snipplets/forms/form-input.tpl" with{type_text: true, input_for: 'name', input_value: result.name | default(customer.name), input_name: 'name', input_id: 'name', input_label_text: 'Nombre' | translate } %}
                            {% block input_form_alert %}
                                {% if result.errors.name %}
                                    <div class="notification-danger notification-left">{{ 'Necesitamos saber tu nombre para actualizar tu información.' | translate }}</div>
                                {% endif %}
                            {% endblock input_form_alert %}
                        {% endembed %}

                        {# Email input #}

                        {% embed "snipplets/forms/form-input.tpl" with{type_email: true, input_for: 'email', input_value: result.email | default(customer.email), input_name: 'email', input_id: 'email', input_label_text: 'Email' | translate } %}
                            {% block input_form_alert %}
                                {% if result.errors.email == 'exists' %}
                                    <div class="notification-danger notification-left">{{ 'Encontramos otra cuenta que ya usa este email. Intentá usando otro.' | translate }}</div>
                                {% elseif result.errors.email %}
                                    <div class="notification-danger notification-left">{{ 'Necesitamos saber tu email para actualizar tu información.' | translate }}</div>
                                {% endif %}
                            {% endblock input_form_alert %}
                        {% endembed %}

                        {# Phone input #}

                        {% embed "snipplets/forms/form-input.tpl" with{type_tel: true, input_for: 'phone', input_value: result.phone | default(customer.phone), input_name: 'phone', input_id: 'phone', input_label_text: 'Teléfono (opcional)' | translate } %}
                        {% endembed %}
                    {% endblock %}
                {% endembed %}
                <p class="mt-3 text-center"> {{ "¿Querés cambiar tu contraseña?" | translate | a_tag(store.customer_reset_password_url, '', 'btn-link-primary') }}</p>
            </div>
        </div>
    </div>
</section>