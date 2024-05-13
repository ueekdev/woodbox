{% set has_filters_available = products and has_filters_enabled and (filter_categories is not empty or product_filters is not empty) %}

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% paginate by 12 %}

{% if not show_help %}

{% set category_banner = (category.images is not empty) or ("banner-products.jpg" | has_custom_image) %}
{% if category_banner %}
    {% include 'snipplets/category-banner.tpl' %}
{% endif %}
<section class="container-fluid mt-3 d-md-none">
	{% include "snipplets/breadcrumbs.tpl" %}
</section>

{% set desktop_category_controls_transparent = settings.filters_desktop_modal and settings.head_fix_desktop and settings.head_transparent and settings.head_transparent_type == 'all' %}

<section class="js-category-controls-prev category-controls-sticky-detector"></section>
<section class="js-category-controls {% if desktop_category_controls_transparent %}js-category-controls-transparent-md category-controls-transparent-md{% endif %} category-controls {% if not settings.filters_desktop_modal %}position-relative-md{% endif %} container-fluid visible-when-content-ready">
	<div class="row align-items-center">
		<div class="col">
			<div class="row align-items-center">
				<div class="col-auto">
					<div class="category-breadcrumbs-container d-none d-md-block">
						{% include "snipplets/breadcrumbs.tpl" %}
					</div>
					{% embed "snipplets/page-header.tpl" with {'breadcrumbs': false} %}
					    {% block page_header_text %}{{ category.name }}{% endblock page_header_text %}
					{% endembed %}
				</div>
				<div class="visible-when-content-ready col text-right d-none d-md-block">
					{% include "snipplets/grid/filters.tpl" with {applied_filters: true} %}
				</div>
			</div>
		</div>
		<div class="col-12 col-md-auto d-none d-md-block">
			{% if products %}
				{% include 'snipplets/grid/sort-by.tpl' %}
			{% endif %}
		</div>
		<div class="visible-when-content-ready col-auto pl-0 {% if (settings.filters_desktop_modal and not has_filters_available) or not settings.filters_desktop_modal %}d-md-none{% endif %}">
			<a href="#" class="js-modal-open js-fullscreen-modal-open btn btn-default btn-medium" data-toggle="#nav-filters" data-modal-url="modal-fullscreen-filters" data-component="filter-button">
				<div class="row align-items-center">
					<div class="col font-weight-bold">
						{{ 'Filtrar' | t }}
					</div>
					<div class="col text-right">
						<svg class="icon-inline"><use xlink:href="#filter"/></svg>
					</div>
				</div>
			</a>
			{% embed "snipplets/modal.tpl" with{modal_id: 'nav-filters', modal_class: 'filters', modal_position: 'right', modal_position_desktop: right, modal_transition: 'slide', modal_header_title: true, modal_width: 'docked-md', modal_mobile_full_screen: 'true' } %}
				{% block modal_head %}
					{{'Filtros ' | translate }}
				{% endblock %}
				{% block modal_body %}
					<div class="d-block d-md-none">
						<div class="subtitle mb-2">{{ 'Ordenar por' | translate }}</div>
						{% include 'snipplets/grid/sort-by.tpl' %}
						<div class="divider mt-3 pt-2 mb-4"></div>
					</div>
					{% if has_filters_available %}
						{% if filter_categories is not empty %}
							{% include "snipplets/grid/categories.tpl" with {modal: true} %}
						{% endif %}
						{% if product_filters is not empty %}
					   		{% include "snipplets/grid/filters.tpl" with {modal: true} %}
					   	{% endif %}
						<div class="js-filters-overlay filters-overlay" style="display: none;">
							<div class="filters-updating-message">
								<span class="js-applying-filter h5 mr-2" style="display: none;">{{ 'Aplicando filtro' | translate }}</span>
								<span class="js-removing-filter h5 mr-2" style="display: none;">{{ 'Borrando filtro' | translate }}</span>
								<svg class="icon-inline h5 icon-spin svg-icon-text"><use xlink:href="#spinner-third"/></svg>
							</div>
						</div>
						<div class="js-sorting-overlay filters-overlay" style="display: none;">
							<div class="filters-updating-message">
								<span class="h5 mr-2">{{ 'Ordenando productos' | translate }}</span>
								<span>
									<svg class="icon-inline h5 icon-spin svg-icon-text"><use xlink:href="#spinner-third"/></svg>
								</span>
							</div>
						</div>
					{% endif %}
				{% endblock %}
			{% endembed %}
		</div>
	</div>
</section>
{% if category.description %} 
	<p class="mt-2 mb-3 mt-md-0 mb-md-4 container-fluid">{{ category.description }}</p> 
{% endif %}
<div class="container-fluid visible-when-content-ready d-md-none">
	{% include "snipplets/grid/filters.tpl" with {mobile: true, applied_filters: true} %}
</div>

<section class="js-category-body category-body mt-2 mt-md-{% if settings.filters_desktop_modal or (not settings.filters_desktop_modal and not has_filters_available) %}0{% else %}4 pt-md-1{% endif %}">
	<div class="container-fluid">
		<div class="row">
			{% if has_filters_available and not settings.filters_desktop_modal %} 
				<div class="filters-sidebar col col-md-2 d-none d-md-block visible-when-content-ready">
					{% if products %}
						{% if filter_categories is not empty %}
							{% include "snipplets/grid/categories.tpl" %}
						{% endif %}
						{% if product_filters is not empty %}	   
							{% include "snipplets/grid/filters.tpl" %}
						{% endif %}
					{% endif %}
				</div>
			{% endif %}
			<div class="col pl-0" data-store="category-grid-{{ category.id }}">
				{% if products %}
					<div class="js-product-table row">
						{% include 'snipplets/product_grid.tpl' %}
					</div>
					{% if pages.current == 1 and not pages.is_last %}
						<div class="text-center mt-5 mb-5">
							<a class="js-load-more btn btn-primary">
								{{ 'Mostrar más productos' | t }}
								<span class="js-load-more-spinner ml-2" style="display:none;">
									<svg class="icon-inline icon-spin"><use xlink:href="#spinner-third"/></svg>
								</span>
							</a>
						</div>
						<div id="js-infinite-scroll-spinner" class="mt-5 mb-5 text-center w-100" style="display:none">
							<svg class="icon-inline icon-lg svg-icon-text icon-spin"><use xlink:href="#spinner-third"/></svg>
						</div>
					{% endif %}
				{% else %}
					<div class="h6 text-center" data-component="filter.message">
						{{(has_filters_enabled ? "No tenemos resultados para tu búsqueda. Por favor, intentá con otros filtros." : "Próximamente") | translate}}
					</div>
				{% endif %}
			</div>
		</div>
	</div>
</section>
{% elseif show_help %}
	{# Category Placeholder #}
	{% include 'snipplets/defaults/show_help_category.tpl' %}
{% endif %}