{% include "snipplets/svg/empty-placeholders.tpl" %}

{# Slider that work as example #}

{% set slide_view_box = '0 0 1440 770' %}

<section class="js-home-slider-container" data-store="home-slider">
	<div class="container-fluid">
		<div class="row">
			<div class="col section-slider p-0">
				<div class="js-home-empty-slider nube-slider-home swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide slide-container">
							<svg viewBox='{{ slide_view_box }}'><use xlink:href="#slider-slide-placeholder"/></svg>
						</div>
						<div class="swiper-slide slide-container">
							<svg viewBox='{{ slide_view_box }}'><use xlink:href="#slider-slide-placeholder"/></svg>
						</div>
						<div class="swiper-slide slide-container">
							<svg viewBox='{{ slide_view_box }}'><use xlink:href="#slider-slide-placeholder"/></svg>
						</div>
					</div>
					<div class="placeholder-overlay placeholder-slider transition-soft">
						<div class="placeholder-info">
							<svg class="icon-inline icon-3x"><use xlink:href="#edit"/></svg>
							<div class="placeholder-description -xs">
								{{ "Podés subir imágenes principales desde" | translate }} <strong>"{{ "Carrusel de imágenes" | translate }}"</strong>
							</div>
							{% if not params.preview %}
								<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn  placeholder-button">{{ "Editar" | translate }}</a>
							{% endif %}
						</div>
					</div>
					<div class="js-swiper-empty-home-pagination swiper-pagination swiper-pagination-bullets d-block"></div>
					<div class="js-swiper-empty-home-prev swiper-button-prev d-none d-md-block svg-square svg-icon-text">
						<svg class="icon-inline icon-lg icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
					</div>
					<div class="js-swiper-empty-home-next swiper-button-next d-none d-md-block svg-square svg-icon-text">
						<svg class="icon-inline icon-lg"><use xlink:href="#chevron"/></svg>
					</div>
				</div>
				{% snipplet 'placeholders/home-slider-placeholder.tpl' %}
			</div>
		</div>
	</div>
</section>