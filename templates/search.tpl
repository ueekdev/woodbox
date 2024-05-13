{% paginate by 12 %}

{% embed "snipplets/page-header.tpl" with { breadcrumbs: false } %}
	{% block page_header_text %}
		{% if products %}
			{{ 'Resultados de búsqueda' | translate }}
		{% else %}
			{{ "No encontramos nada para" | translate }}<span class="ml-2">"{{ query }}"</span>
		{% endif %}
	{% endblock page_header_text %}
{% endembed %}

<section class="js-category-body category-body">
	<div class="container-fluid">
		{% if products %}
			<h2 class="h6 mt-2 mb-4">
				{{ "Mostrando los resultados para" | translate }}<span class="ml-2">"{{ query }}"</span>
			</h2>
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
			<h2 class="h6 my-4 py-4">
				{{ "Escribilo de otra forma y volvé a intentar." | translate }}
			</h2>
		{% endif %}
	</div>
</section>