{% embed "snipplets/page-header.tpl" %}
	{% block page_header_text %}{{ page.name }}{% endblock page_header_text %}
{% endembed %}

{# Institutional page  #}

<section class="user-content pb-5">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8">
				{{ page.content }}
			</div>
		</div>
	</div>
</section>
