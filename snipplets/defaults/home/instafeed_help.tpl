{# Instagram feed that work as examples #}

<section class="section-instafeed-home" data-store="home-instagram-feed">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="instafeed-title">
					<svg class="icon-inline icon-lg mr-1 svg-icon-text"><use xlink:href="#instagram"/></svg>
					<h3 class="instafeed-user h5 mb-0">{{ 'Instagram' | translate }}</h3>
				</div>
			</div>
		</div>
	</div>
	<div id="instafeed" class="row no-gutters position-relative">
		{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
		{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
		{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
		{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
		{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
		{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
		<div class="placeholder-overlay transition-soft">
			<div class="placeholder-info">
				<svg class="icon-inline icon-3x"><use xlink:href="#edit"/></svg>
				<div class="placeholder-description -xs">
					{{ "Podés mostrar tus últimas novedades desde" | translate }} <strong>"{{ "Publicaciones de Instagram" | translate }}"</strong>
				</div>
				{% if not params.preview %}
					<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn  placeholder-button">{{ "Editar" | translate }}</a>
				{% endif %}
			</div>
		</div>
	</div>
</section>