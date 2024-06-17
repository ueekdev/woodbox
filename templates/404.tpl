{# Only remove this if you want to take away the theme onboarding advices #}
{# {% set show_help = not has_products %} #}

<section id="404">
	<div class="container-fluid">
		<div class="container">
			<div class="not-found-grid">
				<div class="404-content">
					<h3>Oops!</h3>
					<h1>Página não encontrada</h1>
					<p>A página que você procura não existe mais ou foi movida.</p>
					<a href="{{ store.url }}" class="btn btn-primary accent">Ir para Home</a>
				</div>
				<div class="404-image">
                    {{ "images/404-page.svg" | static_url | img_tag("Logo Woodbox") }}
				</div>
			</div>
		</div>	
	</div>
</section>

{# Here we will add an example as a help, you can delete this after you upload your products #}
{# {% if show_help %}
    <div id="product-example">
        {% snipplet 'defaults/show_help_product.tpl' %}
    </div>
{% endif %} #}