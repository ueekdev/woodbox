{% embed "snipplets/page-header.tpl" %}
{% block page_header_text %}{{ page.name }}{% endblock page_header_text %}
{% endembed %}

{# Institutional page #}

<section class="user-content container-fluid pb-5">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col text-gray">
				{{ page.content }}
			</div>
		</div>
	</div>
</section>
