{% if settings.main_categories and settings.slider_categories and settings.slider_categories is not empty %}
    <section class="section-categories-home position-relative" data-store="home-categories-featured">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 pr-0">
                    <div class="js-swiper-categories swiper-container">
                        <div class="swiper-wrapper">
                            {% for slide in settings.slider_categories %}
                                <div class="swiper-slide w-auto text-center">
                                    {% if slide.link %}
                                        <a href="{{ slide.link | setting_url }}" class="js-home-category" aria-label="{{ 'Categoría' | translate }} {{ loop.index }}">
                                    {% endif %}
                                        <div class="home-category">
                                            <div class="home-category-image">
                                                <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ slide.image | static_url | settings_image_url('small') }}" class="swiper-lazy" alt="{{ 'Categoría' | translate }} {{ loop.index }}">
                                                <div class="placeholder-fade"></div>
                                            </div>
                                    {% if slide.link %}
                                                {% set category_handle = slide.link | trim('/') | split('/') | last %}
                                                {% include 'snipplets/home/home-categories-name.tpl' %}
                                            </div>
                                        </a>
                                    {% else %}
                                        </div>
                                    {% endif %}
                                </div>
                            {% endfor %}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="js-swiper-categories-prev swiper-button-prev d-none d-md-block svg-square svg-icon-text">
            <svg class="icon-inline icon-lg icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
        </div>
        <div class="js-swiper-categories-next swiper-button-next d-none d-md-block svg-square svg-icon-text">
            <svg class="icon-inline icon-lg"><use xlink:href="#chevron"/></svg>
        </div>
    </section>
{% endif %}
