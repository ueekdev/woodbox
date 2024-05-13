{# Site Overlay #}
<div class="js-overlay site-overlay" style="display: none;"></div>


{# Header #}

{# Logo mobile dynamic classes #}

{% set logo_mobile_classes = settings.logo_position_mobile == 'center' or settings.show_tab_nav ? 'logo-center text-center' : 'order-first text-left' %}
{% set logo_mobile_center_with_big_search_classes = settings.logo_position_mobile == 'center' and settings.search_big_mobile and not settings.show_tab_nav ? 'logo-center-with-big-search' : '' %}

{# Logo desktop dynamic classes + utilities desktop order #}

{% set logo_desktop_classes = settings.logo_position_desktop == 'center' ? 'logo-md-center order-md-0 logo-md-offset text-md-center' : 'order-md-first text-md-left' %}
{% set menu_desktop_utility_order_class = settings.logo_position_desktop == 'center' ? 'order-md-first' : 'order-md-last' %}

{# Utilities dynamic classes #}

{% set head_utilities_desktop_classes = settings.utilities_type_desktop == 'icons_text' ? 'head-utilities-md-text' : 'head-utilities-md-icon' %}

{# Utilities mobile order #}

{% set menu_mobile_utility_order_class = settings.logo_position_mobile == 'center' ? 'order-first' : 'order-last' %}

{# Header logo classes #}

{% set head_logo_desktop_classes = settings.logo_position_desktop == 'center' ? 'head-logo-md-center' : 'head-logo-md-left' %}

{# Header navigation classes #}

{% set head_navigation_desktop_classes = settings.hamburger_desktop ? 'head-hamburger-md' : '' %}

{# Header search classes #}

{% set head_search_desktop_classes = settings.search_big_desktop ? 'head-big-search-md' : '' %}

{# Hide elements on tabnav active #}

{% set hide_mobile_on_tabnav_active = settings.show_tab_nav ? 'd-none d-md-inline-block' : '' %}

{# Conditions for transparent head on page load #}

{# Slider and video presence #}

{% set has_main_slider = settings.slider and settings.slider is not empty %}
{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}
{% set has_slider = has_main_slider or has_mobile_slider %}
{% set has_slider_above_the_fold = settings.home_order_position_1 == 'slider' and has_slider %}
{% set has_video_above_the_fold = settings.home_order_position_1 == 'video' and settings.video_embed %}
{% set is_video_or_slider_above_the_fold = template == 'home' and (has_slider_above_the_fold or has_video_above_the_fold) %}

{# Transparent head conditions #}

{% set head_transparent_type_on_section = template == 'home' and settings.head_transparent and settings.head_transparent_type == 'slider_and_video' and (has_slider or settings.video_embed) %}
{% set head_transparent_type_on_section_above_the_fold = settings.head_transparent and is_video_or_slider_above_the_fold %}
{% set head_transparent_type_always = settings.head_transparent and settings.head_transparent_type == 'all' %}
{% set head_transparent = (head_transparent_type_on_section or head_transparent_type_always) %}

{% if settings.show_tab_nav %}
    {% if head_transparent and is_video_or_slider_above_the_fold %}
        {% set head_position_mobile = 'position-absolute' %}
    {% else %}
        {% set head_position_mobile = 'position-relative' %}
    {% endif %}
{% else %}
    {% if head_transparent and is_video_or_slider_above_the_fold %}
        {% set head_position_mobile = 'position-fixed' %}
    {% else %}
        {% set head_position_mobile = 'position-sticky' %}
    {% endif %}
{% endif %}

{% if settings.head_fix_desktop %}
    {% set head_position_desktop = 'position-fixed-md' %}
{% elseif head_transparent and is_video_or_slider_above_the_fold %}
    {% set head_position_desktop = 'position-absolute-md' %}
{% else %}
    {% set head_position_desktop = 'position-relative-md' %}
{% endif %}

{% set header_with_transparent_logo = settings.head_transparent_contrast_options and "logo-transparent.jpg" | has_custom_image %}
{% set header_logo_transparent_classes = header_with_transparent_logo ? 'head-logo-transparent' : '' %}

<header class="js-head-main {% if head_transparent %}js-head-mutator{% endif %} {% if head_transparent_type_always %}head-transparent{% endif %} {% if head_transparent_type_on_section_above_the_fold %}head-transparent-on-section{% endif %} {% if head_transparent and settings.head_transparent_contrast_options %}head-transparent-contrast{% endif %} head-main {{ head_position_mobile }} {{ head_position_desktop }} {{ header_logo_transparent_classes }} {{ head_utilities_desktop_classes }} {{ head_logo_desktop_classes }} {{ head_search_desktop_classes }} {{ head_navigation_desktop_classes }} transition-soft" data-store="head">
    {# Adversiting bar #}
    {% if settings.ad_bar %}
        {% snipplet "header/header-advertising.tpl" %}
    {% endif %}
	<div class="container-fluid">
        <div class="container">
            <div class="{% if not settings.head_fix_desktop %}js-nav-logo-bar{% endif %} row no-gutters align-items-center">

                {# Menu icon #}

                {% if settings.hamburger_desktop or not settings.show_tab_nav %}
                    <div class="col-auto col-utility {{ menu_mobile_utility_order_class }} {{ menu_desktop_utility_order_class }} {% if settings.show_tab_nav %}d-none{% endif %} {% if settings.hamburger_desktop %}d-md-block{% else %}d-md-none{% endif %}">
                        {% include "snipplets/header/header-utilities.tpl" with {use_menu: true} %}
                    </div>
                {% endif %}

                {# Desktop navigation next to logo #}

                {% if not settings.hamburger_desktop and settings.logo_position_desktop == 'left_inline' %}
                    {# Desktop nav next logo #}
                    <div class="col d-none d-md-inline-block">
                        {% snipplet "navigation/navigation.tpl" %}
                    </div>
                {% endif %}

                {# Search: Icon or box #}

                <div class="col-auto col-utility {{ hide_mobile_on_tabnav_active }} {% if settings.search_big_mobile %}d-none d-md-inline-block{% endif %}">
                    {% set use_big_search_val = false %}
                    {% if settings.search_big_desktop %}
                        {% set use_big_search_val = true %}
                    {% endif %}
                    {% if settings.search_big_desktop and not settings.search_big_mobile %}
                        <span class="d-none d-md-block">
                    {% endif %}
                            {% include "snipplets/header/header-search.tpl" with {use_big_search: use_big_search_val} %}
                    {% if settings.search_big_desktop and not settings.search_big_mobile %}
                        </span>
                        <span class="d-inline-block d-md-none">
                            {% include "snipplets/header/header-search.tpl" %}
                        </span>
                    {% endif %}
                </div>

                {# Logo #}

                <div class="col {% if not settings.hamburger_desktop and settings.logo_position_desktop == 'left_inline' %}col-md-auto{% endif %} {{ logo_mobile_classes }} {{ logo_desktop_classes }}">
                    {% set logo_size_class = settings.logo_size == 'small' ? 'logo-img-small' : settings.logo_size == 'big' ? 'logo-img-big' %}
                    {{ component('logos/logo', {logo_img_classes: 'transition-soft '  ~ logo_mobile_center_with_big_search_classes ~ logo_size_class, logo_text_classes: 'h3 m-0'}) }}
                    {% if header_with_transparent_logo %}
                        {{ component('logos/logo-transparent-header', {logo_img_name: 'logo-transparent.jpg', logo_img_classes: 'transition-soft ' ~ logo_mobile_center_with_big_search_classes ~ logo_size_class}) }}
                    {% endif %}
                </div>

                {# Account #}

                <div class="col-auto col-utility {{ hide_mobile_on_tabnav_active }}">
                    {% include "snipplets/header/header-utilities.tpl" with {use_account: true} %}
                </div>

                {# Cart/Bag #}

                <div class="col-auto col-utility {{ hide_mobile_on_tabnav_active }}">
                    {% include "snipplets/header/header-utilities.tpl" %}
                </div>
            </div>
            {% if settings.ajax_cart %}
                <div class="{% if settings.show_tab_nav %}d-none{% endif %} {% if settings.head_fix_desktop %}d-md-block{% else %}d-md-none{% endif %}">
                    {% include "snipplets/notification.tpl" with {add_to_cart: true} %}
                </div>
            {% endif %}

            {# Desktop navigation below logo #}

            {% if not settings.hamburger_desktop and settings.logo_position_desktop != 'left_inline' %}
                {# Desktop nav below logo #}
                <div class="row d-none d-md-block">
                    <div class="{% if settings.logo_position_desktop == 'center' %}text-center{% endif %}">
                        {% snipplet "navigation/navigation.tpl" %}
                    </div>
                </div>
            {% endif %}

            {# Mobile search big #}

            {% if settings.search_big_mobile and not settings.show_tab_nav %}
                <div class="row no-gutters pb-3 d-block d-md-none">
                    {% include "snipplets/header/header-search.tpl" with {use_big_search: true} %}
                </div>
            {% endif %}
        </div>    
    </div>    
    {# {% include "snipplets/notification.tpl" with {order_notification: true} %} #}
</header>

{# Show cookie validation message #}

{% include "snipplets/notification.tpl" with {show_cookie_banner: true} %}

{# Add to cart notification for non fixed header or tabnav header #}

{% if settings.ajax_cart and (not settings.head_fix_desktop or settings.show_tab_nav) %}
    <div class="{% if not settings.show_tab_nav %}d-none{% endif %} {% if settings.head_fix_desktop %}d-md-none{% else %}d-md-block{% endif %}">
        {% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_fixed: true} %}
    </div>
{% endif %}

{% include "snipplets/header/header-modals.tpl" %}
