{% set has_main_slider = settings.slider and settings.slider is not empty %}
{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}

{% if has_mobile_slider %}
    {% set slider = settings.slider_mobile %}
{% else %}
    {% set slider = settings.slider %}
{% endif %}

{% if settings.home_order_position_1 == 'slider' and (has_main_slider or has_mobile_slider) %}
    {% for slide in slider %}
        {% if loop.first %}
            <link rel="preload" as="image" href="{{ slide.image | static_url | settings_image_url('original') }}" imagesrcset="{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w">
        {% endif %}
    {% endfor %}
{% endif %}

{% set has_banner = settings.banner and settings.banner is not empty %}

{% if settings.home_order_position_1 == 'categories' and has_banner %}
    {% for slide in settings.banner %}
        {% if loop.first %}
            <link rel="preload" as="image" href="{{ slide.image | static_url | settings_image_url('original') }}" imagesrcset="{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w">
        {% endif %}
    {% endfor %}
{% endif %}

{% set has_promotional_banner = settings.banner_promotional and settings.banner_promotional is not empty %}

{% if settings.home_order_position_1 == 'promotional' and has_promotional_banner %}
    {% for slide in settings.banner_promotional %}
        {% if loop.first %}
            <link rel="preload" as="image" href="{{ slide.image | static_url | settings_image_url('original') }}" imagesrcset="{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w">
        {% endif %}
    {% endfor %}
{% endif %}

{% set has_video = settings.video_embed %}

{% if settings.home_order_position_1 == 'video' and has_video %}
    {% if "video_image.jpg" | has_custom_image %}
        {% set video_image_src = 'video_image.jpg' | static_url | settings_image_url("original") %}
    {% else %}
        <link rel="preconnect" href="https://img.youtube.com/" />
        {% set video_url = settings.video_embed %}
        {% if '/watch?v=' in settings.video_embed %}
            {% set video_format = '/watch?v=' %}
        {% elseif '/youtu.be/' in settings.video_embed %}
            {% set video_format = '/youtu.be/' %}
        {% elseif '/shorts/' in settings.video_embed %}
            {% set video_format = '/shorts/' %}
        {% endif %}
        {% set video_id = video_url|split(video_format)|last %}
        {% set video_image_src = 'https://img.youtube.com/vi_webp/' ~ video_id ~ '/maxresdefault.webp' %}
    {% endif %}
    <link rel="preload" as="image" href="{{ video_image_src }}"{% if "video_image.jpg" | has_custom_image %} imagesrcset="{{ 'video_image.jpg' | static_url | settings_image_url('large') }} 480w, {{ 'video_image.jpg' | static_url | settings_image_url('huge') }} 640w, {{ 'video_image.jpg' | static_url | settings_image_url('original') }} 1024w"{% endif %}>
{% endif %}