{% set banner = banner | default(false) %}
{% set banner_promotional = banner_promotional | default(false) %}
{% set banner_news = banner_news | default(false) %}

{% if banner %}
    {% set section_banner = settings.banner %}
    {% set section_slider = settings.banner_slider %}
    {% set section_slider_id = 'banners' %}
    {% set section_columns_mobile_2 = settings.banner_columns_mobile == 2 %}
    {% set section_columns_desktop_4 = settings.banner_columns_desktop == 4 %}
    {% set section_columns_desktop_3 = settings.banner_columns_desktop == 3 %}
    {% set section_columns_desktop_2 = settings.banner_columns_desktop == 2 %}
    {% set section_columns_desktop_1 = settings.banner_columns_desktop == 1 %}
    {% set section_same_size = settings.banner_same_size %}
    {% set section_text_outside = settings.banner_text_outside %}
{% endif %}
{% if banner_promotional %}
    {% set section_banner = settings.banner_promotional %}
    {% set section_slider = settings.banner_promotional_slider %}
    {% set section_slider_id = 'banners-promotional' %}
    {% set section_columns_mobile_2 = settings.banner_promotional_columns_mobile == 2 %}
    {% set section_columns_desktop_4 = settings.banner_promotional_columns_desktop == 4 %}
    {% set section_columns_desktop_3 = settings.banner_promotional_columns_desktop == 3 %}
    {% set section_columns_desktop_2 = settings.banner_promotional_columns_desktop == 2 %}
    {% set section_columns_desktop_1 = settings.banner_promotional_columns_desktop == 1 %}
    {% set section_same_size = settings.banner_promotional_same_size %}
    {% set section_text_outside = settings.banner_promotional_text_outside %}
{% endif %}
{% if banner_news %}
    {% set section_banner = settings.banner_news %}
    {% set section_slider = settings.banner_news_slider %}
    {% set section_slider_id = 'banners-news' %}
    {% set section_columns_mobile_2 = settings.banner_news_columns_mobile == 2 %}
    {% set section_columns_desktop_4 = settings.banner_news_columns_desktop == 4 %}
    {% set section_columns_desktop_3 = settings.banner_news_columns_desktop == 3 %}
    {% set section_columns_desktop_2 = settings.banner_news_columns_desktop == 2 %}
    {% set section_columns_desktop_1 = settings.banner_news_columns_desktop == 1 %}
    {% set section_same_size = settings.banner_news_same_size %}
    {% set section_text_outside = settings.banner_news_text_outside %}
{% endif %}

<div class="container-fluid">
    <div class="row">
        <div class="col-12 {% if section_slider %}p-0{% else %}pl-0{% endif %}">
            {% if section_slider %}
                <div class="js-swiper-{{ section_slider_id }} swiper-container">
                    <div class="swiper-wrapper">
            {% else %}
                <div class="row">
            {% endif %}
            {% for slide in section_banner %}
                <div class="{% if section_slider %}swiper-slide slide-container{% else %}grid-item {% if section_columns_mobile_2 %}col-6 {% endif %}{% if section_columns_desktop_4 %}col-md-3{% elseif section_columns_desktop_3 %}col-md-4{% elseif section_columns_desktop_2 %}col-md-6{% elseif section_columns_desktop_1 %}col-md-12{% endif %}{% endif %}" data-transition="fade-in-up">
                    {% set has_banner_text = slide.title or slide.description or slide.button %}
                    <div class="textbanner">
                        {% if slide.link %}
                            <a href="{{ slide.link | setting_url }}" class="textbanner-link" aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}">
                        {% endif %}
                        <div class="textbanner-image{% if not section_same_size %} p-0{% endif %}{% if has_banner_text and not section_text_outside %} overlay{% endif %}">
                            <img {% if slide.width and slide.height %} width="{{ slide.width }}" height="{{ slide.height }}" {% endif %} src="{{ 'images/empty-placeholder.png' | static_url }}" data-sizes="auto" data-expand="-10" data-srcset="{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w" class="textbanner-image-effect {% if section_same_size %}textbanner-image-background{% else %}img-fluid d-block w-100{% endif %} lazyautosizes lazyload fade-in" {% if slide.title %}alt="{{ banner_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} />
                            <div class="placeholder-fade"></div>
                        {% if section_text_outside %}
                            </div>
                        {% endif %}
                        {% if has_banner_text %}
                            <div class="textbanner-text{% if not section_text_outside %} over-image{% endif %}{% if slide.link %} pr-5{% endif %}">
                                {% if slide.title %}
                                    <h3 class="h5 mb-0">{{ slide.title }}</h3>
                                {% endif %}
                                {% if slide.description %}
                                    <div class="textbanner-paragraph">{{ slide.description }}</div>
                                {% endif %}
                                {% if slide.button and slide.link %}
                                    <div class="btn btn-secondary  mt-2">{{ slide.button }}</div>
                                {% endif %}
                                {% if slide.link %}
                                    <div class="textbanner-arrow">
                                        <svg class="icon-inline icon-lg svg-icon-text"><use xlink:href="#arrow-long"/></svg>
                                    </div>
                                {% endif %}
                            </div>
                        {% endif %}
                        {% if not section_text_outside %}
                            </div>
                        {% endif %}
                        {% if slide.link %}
                            </a>
                        {% endif %}
                    </div>
                </div>
            {% endfor %}
            {% if section_slider %}
                    </div>
                </div>
            {% else %}
                </div>
            {% endif %}
        </div>
    </div>
</div>
{% if section_slider and (section_banner and section_banner is not empty) %}
    <div class="js-swiper-{{ section_slider_id }}-prev swiper-button-prev d-none d-md-block svg-square svg-icon-text">
        <svg class="icon-inline icon-lg icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
    </div>
    <div class="js-swiper-{{ section_slider_id }}-next swiper-button-next d-none d-md-block svg-square svg-icon-text">
        <svg class="icon-inline icon-lg"><use xlink:href="#chevron"/></svg>
    </div>
{% endif %}