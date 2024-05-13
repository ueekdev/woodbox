{% if settings.show_instafeed and store.instagram and store.hasInstagramToken() %}
    <section class="section-instafeed-home" data-store="home-instagram-feed">
        <div class="container-fluid">
            <div class="row">
                {% set instuser = store.instagram|split('/')|last %}
                <div class="col-12">
                    <a target="_blank" href="{{ store.instagram }}" class="mb-0" aria-label="{{ 'Instagram de' | translate }} {{ store.name }}">
                        <div class="instafeed-title">
                            <div class="row">
                                <div class="col-md-auto">
                                    <svg class="icon-inline icon-lg mr-1 svg-icon-text"><use xlink:href="#instagram"/></svg>
                                    <h2 class="instafeed-user h5 mb-0">{{ instuser }}</h2>
                                </div>
                                {# Instagram fallback info in case feed fails to load #}
                                <div class="js-ig-fallback col">
                                    <p class="m-0">{{ 'Estamos en Instagram' | translate }} <span class="btn btn-secondary  ml-2">{{ 'Seguinos' | translate }}</span></p>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        {% if store.hasInstagramToken() %}
            <div class="js-ig-success js-swiper-instafeed swiper-container" data-transition="fade-in-up">
                <div class="swiper-wrapper"
                data-ig-feed
                data-ig-items-count="6"
                data-ig-item-class="swiper-slide"
                data-ig-link-class="instafeed-link"
                data-ig-image-class="instafeed-img w-100 fade-in"
                data-ig-aria-label="{{ 'Publicación de Instagram de' | translate }} {{ store.name }}"
                style="display: none;">
                </div>
            </div>
        {% endif %}
    </section>
{% endif %}