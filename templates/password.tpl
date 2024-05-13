<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
    <head>
        <link rel="preconnect" href="{{ store_resource_hints }}" />
        <link rel="dns-prefetch" href="{{ store_resource_hints }}" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>{{ page_title }}</title>
        <meta name="description" content="{{ page_description }}" />
        <link rel="preload" href="{{ 'css/style-critical.scss' | static_url }}" as="style" />
        <link rel="preload" href="{{ 'css/style-colors.scss' | static_url }}" as="style" />
        
        {{ component('social-meta') }}
        {{ component('canary') }}

        {#/*============================================================================
            #CSS and fonts
        ==============================================================================*/#}

        {# Critical CSS needed to show first elements of store while CSS async is loading #}

        <style>
            {# Font families #}

            {% if params.preview %}

                {# If page is loaded from customization page on the admin, load all fonts #}

                @import url('https://fonts.googleapis.com/css?family=Montserrat:400,700|Muli:400,700|Lato:400,700|Nunito:400,700|Plus+Jakarta+Sans:400,700|Outfit:400,700|DM+Sans:400,700|Roboto+Mono:400,700|Playfair+Display:400,700|Fraunces:400,700|Literata:400,700|Zilla+Slab:400,700|Oooh+Baby|Handlee');

            {% else %}

                {# If page is NOT loaded from customization only load saved fonts #}

                {# Get only the saved fonts on settings #}

                @import url('{{ [settings.font_headings, settings.font_rest] | google_fonts_url('400, 700') | raw  }}');

            {% endif %}

            {# General CSS Tokens #}

            {% include "static/css/style-tokens.tpl" %}

        </style>

        {# Critical CSS #}

        {{ 'css/style-critical.scss' | static_url | static_inline }}

        {# Colors and fonts used from settings.txt and defined on theme customization #}

        {{ 'css/style-colors.scss' | static_url | static_inline }}

        {# Load async styling not mandatory for first meaningfull paint #}

        <link rel="stylesheet" href="{{ 'css/style-async.scss' | static_url }}" media="print" onload="this.media='all'">

        {# Loads custom CSS added from Advanced Settings on the admin´s theme customization screen #}

        <style>
            {{ settings.css_code | raw }}
        </style>

        {#/*============================================================================
            #Javascript: Needed before HTML loads
        ==============================================================================*/#}

        {# Defines if async JS will be used by using script_tag(true) #}

        {% set async_js = true %}

        {# Defines the usage of jquery loaded below, if nojquery = true is deleted it will fallback to jquery 1.5 #}

        {% set nojquery = true %}

        {# Jquery async by adding script_tag(true) #}

        {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' | script_tag(true) }}

        {# Loads private Tienda Nube JS #}

        {% head_content %}

        {# Structured data to provide information for Google about the page content #}

        {{ component('structured-data') }}

    </head>
    <body class="{% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }}">

        {# Theme icons #}

        {% include "snipplets/svg/icons.tpl" %}

        {# Back to admin bar #}

        {{back_to_admin}}

        {# Page content #}

        <header class="head-main">
            <div class="container">
                <div class="row justify-content-md-center">
                    <div class="col-md-8 text-center">
                        <div class="my-2">
                            {{ component('logos/logo', {logo_img_classes: 'transition-soft', logo_text_classes: 'h3 m-0'}) }}
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <section class="section-password py-5">
            <div class="container">
                <div class="row justify-content-md-center">
                    <div class="col-md-8 text-center">
                        <h2 class="mt-2 mb-5">{{ message }}</h2>
                        {% embed "snipplets/forms/form.tpl" with{form_id: 'password-form', submit_text: 'Desbloquear' | translate } %}
                            {% block form_body %}

                                {% embed "snipplets/forms/form-input.tpl" with{input_for: 'password', type_password: true, input_name: 'password', input_help: true, input_help_link: store.customer_reset_password_url, input_label_text: 'Contraseña de acceso' | translate } %}
                                    {% block input_form_alert %}
                                        {% if invalid_password == true %}
                                            <div class="alert alert-danger">{{ 'La contraseña es incorrecta.' | translate }}</div>
                                        {% endif %}
                                    {% endblock input_form_alert %}
                                {% endembed %}

                            {% endblock %}
                        {% endembed %}
                    </div>
                </div>
            </div>
        </section>


        {# Footer #}

        {% snipplet "footer/footer.tpl" %}

        {# Javascript needed to footer logos lazyload #}

        <script type="text/javascript">

            {# Libraries that do NOT depend on other libraries, e.g: Jquery #}

            {% include "static/js/external-no-dependencies.js.tpl" %}

        </script>

        {# Google survey JS for Tienda Nube Survey #}

        {% include "static/js/google-survey.js.tpl" %}

    </body>
</html>
