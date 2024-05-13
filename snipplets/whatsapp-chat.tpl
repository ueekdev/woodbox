{% if store.whatsapp %}
    <a href="{{ store.whatsapp }}" target="_blank" class="js-btn-fixed-bottom btn-whatsapp {% if settings.show_tab_nav %}btn-whatsapp-with-tabnav{% endif %}" aria-label="{{ 'Comunicate por WhatsApp' | translate }}">
        <svg><use xlink:href="#whatsapp"/></svg>
    </a>
{% endif %}
