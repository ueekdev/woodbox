{% set has_banner = has_banner | default(false) and settings.banner %}
{% set has_banner_promotional = has_banner_promotional | default(false) and settings.banner_promotional %}
{% set has_banner_news = has_banner_news | default(false) and settings.banner_news %}

{% if has_banner or has_banner_promotional or has_banner_news %}
    {% if has_banner %}
        <section class="section-banners-home position-relative" data-store="home-banner-categories">
                {% include 'snipplets/home/home-banners-grid.tpl' with {'banner': true} %}
        </section>
    {% endif %}
    {% if has_banner_promotional %}
        <section class="section-banners-home position-relative" data-store="home-banner-promotional">
            {% include 'snipplets/home/home-banners-grid.tpl' with {'banner_promotional': true} %}
        </section>
    {% endif %}
    {% if has_banner_news %}
        <section class="section-banners-home position-relative" data-store="home-banner-news">
            {% include 'snipplets/home/home-banners-grid.tpl' with {'banner_news': true} %}
        </section>
    {% endif %}
    </section>
{% endif %}
