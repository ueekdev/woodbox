{# /*============================================================================
#Page header
==============================================================================*/

#Properties

#Title

#Breadcrumbs

#}

<section class="page-header {% if template != 'product' %}container-fluid{% endif %} {% if template != 'category' %}pt-4{% endif %}" data-store="page-title">
	{% if not (template == 'product' or template == 'category') %}
	<div class="container">
		<div class="row">
			<div class="col">
				{% endif %}
				{% if template != 'product' %}{% include 'snipplets/breadcrumbs.tpl' %}{% endif %}
				<h1 class="{% if template == 'product' %}js-product-name {% endif %}h4" {% if template=="product"
					%}data-store="product-name-{{ product.id }}" {% endif %}>{% block page_header_text %}{% endblock %}
				</h1>
				{% if not (template == 'product' or template == 'category') %}
			</div>
		</div>
	</div>
	{% endif %}
</section>
