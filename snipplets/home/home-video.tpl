{% if settings.video_embed %}
    <section data-store="home-video">
        <div class="js-section-video section-video-home" data-transition="fade-in-up" {% if settings.head_transparent %}data-header-type="transparent-on-section"{% endif %}>
            <div class="container-fluid p-0">
                <div class="row no-gutters">
                    <div class="col-12">
                        {% set has_video_text = settings.video_title or settings.video_subtitle or settings.video_text or (settings.video_button and settings.video_button_url)  %}
                        <div class="js-home-video-container lazyload home-video embed-responsive embed-responsive-16by9{% if settings.video_vertical_mobile %} embed-responsive-1by1{% endif %} position-relative{% if has_video_text %} home-video-overlay{% endif %}">
                            {% if has_video_text %}
                                <div class="home-video-text">
                                    {% if settings.video_subtitle %}
                                        <div class="subtitle mb-3">{{ settings.video_subtitle }}</div>
                                    {% endif %}
                                    {% if settings.video_title %}
                                        <h2 class="h1 mb-3">{{ settings.video_title }}</h2>
                                    {% endif %}
                                    {% if settings.video_text %}
                                        <p class="mb-3">{{ settings.video_text }}</p>
                                    {% endif %}
                                    {% if settings.video_button and settings.video_button_url %}
                                        <a href="{{ settings.video_button_url }}" class="btn btn-secondary ">{{ settings.video_button }}</a>
                                    {% endif %}
                                </div>
                            {% endif %}
                            {% if settings.home_order_position_1 == 'video' %}
                                <div class="js-home-video-image d-block d-md-none">
                                    {% if "video_image.jpg" | has_custom_image %}
                                        {% set video_image_src = 'video_image.jpg' | static_url | settings_image_url("large") %}
                                    {% else %}
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
                                    <img class="home-video-image" src='{{ video_image_src }}'{% if "video_image.jpg" | has_custom_image %} srcset='{{ "video_image.jpg" | static_url | settings_image_url("original") }} 1024w, {{ "video_image.jpg" | static_url | settings_image_url("1080p") }} 1920w'{% endif %} alt="{{ 'Video de' | translate }} {{ store.name }}" />
                                    <div class="placeholder-shine placeholder-shine-invert"></div>
                                </div>
                            {% endif %}
                            <div class="js-home-video" id="player"></div>
                            <div class="home-video-hide-controls"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
{% endif %}
