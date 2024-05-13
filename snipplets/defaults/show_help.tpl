{# Only remove this if you want to take away the theme onboarding advices #}

{% if not params.preview %}
	{% if is_theme_draft %}
		{% set admin_link = '/admin/themes/settings/draft/' %}
	{% else %}
		{% set admin_link = '/admin/themes/settings/active/' %}
	{% endif %}
{% endif %}

{# Slider that work as example #}
{% snipplet 'defaults/home/slider_help.tpl' %}

{# Products featured that work as examples #}
{% include 'snipplets/defaults/home/featured_products_help.tpl' with { products_title: 'Destacados' | translate, data_store: 'home-products-featured' }  %}

{# Categories banners that work as examples #}
{% snipplet 'defaults/home/category_banners_help.tpl' %}

{# Informative banners that work as examples #}
{% snipplet 'defaults/home/informative_banners_help.tpl' %}

{# Products featured that work as examples #}
{% include 'snipplets/defaults/home/featured_products_help.tpl' with { products_title: 'Novedades' | translate, data_store: 'home-products-new' }  %}

{# Video that work as examples #}
{% snipplet 'defaults/home/video_help.tpl' %}

{# Products featured that work as examples #}
{% include 'snipplets/defaults/home/featured_products_help.tpl' with { products_title: 'Ofertas' | translate, data_store: 'home-products-sale' }  %}

{# Promotional banners that work as examples #}
{% snipplet 'defaults/home/promotional_banners_help.tpl' %}

{# News banners that work as examples #}
{% snipplet 'defaults/home/news_banners_help.tpl' %}

{# Instagram feed that work as examples #}
{% snipplet 'defaults/home/instafeed_help.tpl' %}
