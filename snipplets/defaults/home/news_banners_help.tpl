{# News banners that work as examples #}

<section class="section-banners-home" data-store="home-banner-news">
	<div class="container-fluid pl-0">
		<div class="row">
			<div class="col-md grid-item">
				<div class="textbanner">
					<div class="textbanner-image overlay textbanner-image-empty">
					</div>
					<div class="textbanner-text">
						<div class="h5">{{ "Nuevo" | translate }}</div>
						<div class="textbanner-arrow">
							<svg class="icon-inline icon-lg svg-icon-text"><use xlink:href="#arrow-long"/></svg>
						</div>
					</div>
					<div class="placeholder-overlay transition-soft">
						<div class="placeholder-info">
							<svg class="icon-inline icon-3x"><use xlink:href="#edit"/></svg>
							<div class="placeholder-description -xs">
								{{ "Podés mostrar tus últimas novedades desde" | translate }} <strong>"{{ "Banners de novedades" | translate }}"</strong>
							</div>
							{% if not params.preview %}
								<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn  placeholder-button">{{ "Editar" | translate }}</a>
							{% endif %}
						</div>
					</div>
				</div>
			</div>
			<div class="col-md grid-item">
				<div class="textbanner">
					<div class="textbanner-image overlay textbanner-image-empty">
					</div>
					<div class="textbanner-text">
						<div class="h5">{{ "Nuevo" | translate }}</div>
						<div class="textbanner-arrow">
							<svg class="icon-inline icon-lg svg-icon-text"><use xlink:href="#arrow-long"/></svg>
						</div>
					</div>
					<div class="placeholder-overlay transition-soft">
						<div class="placeholder-info">
							<svg class="icon-inline icon-3x"><use xlink:href="#edit"/></svg>
							<div class="placeholder-description -xs">
								{{ "Podés mostrar tus últimas novedades desde" | translate }} <strong>"{{ "Banners de novedades" | translate }}"</strong>
							</div>
							{% if not params.preview %}
								<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn  placeholder-button">{{ "Editar" | translate }}</a>
							{% endif %}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>