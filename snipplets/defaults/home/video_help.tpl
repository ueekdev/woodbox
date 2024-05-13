{# Video that work as examples #}

<section class="section-video-home" data-store="home-video">
	<div class="container-fluid p-0">
		<div class="row no-gutters">
			<div class="col-12">
				<div class="js-home-video-container home-video embed-responsive embed-responsive-16by9">
					<svg viewBox="0 0 1130 635.63"><use xlink:href="#video-placeholder"/></svg>
					<div class="placeholder-overlay transition-soft">
					<div class="placeholder-info">
							<svg class="icon-inline icon-3x"><use xlink:href="#edit"/></svg>
							<div class="placeholder-description -xs">
								{{ "Podés subir tu video de YouTube" | translate }} <strong>"{{ "Video" | translate }}"</strong>
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