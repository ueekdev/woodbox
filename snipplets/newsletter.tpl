{% set newsletter_contact_error = contact.type == 'newsletter' and not contact.success %}

{% if settings.news_show %}
    <div class="js-newsletter newsletter pb-2 mb-3">
        <div class="subtitle mb-3">{{ settings.news_title }}</div>
        {% if contact and contact.type == 'newsletter' %}
            {% if contact.success %}
                <div class="alert alert-success">{{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}</div>
            {% else %}
                <div class="alert alert-danger">{{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}</div>
            {% endif %}
        {% endif %}

        <form method="post" action="/winnie-pooh" onsubmit="this.setAttribute('action', '');" data-store="newsletter-form">
            <div class="newsletter-form input-append">
              
                {% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_name: 'email', input_id: 'email', input_placeholder: 'Email' | translate, input_aria_label: 'Email' | translate } %}
                {% endembed %}

            <div class="winnie-pooh" style="display: none;">
                <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
                <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
            </div>
            <input type="hidden" name="name" value="{{ "Sin nombre" | translate }}" />
            <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
            <input type="hidden" name="type" value="newsletter" />
            <input type="submit" name="contact" class="btn newsletter-btn" value="{{ "Enviar" | translate }}" />
            <svg class="icon-inline newsletter-btn"><use xlink:href="#arrow-long"/></svg>
            </div>
        </form>
    </div>
{% endif %}