{# Informative banners that work as examples #}

<section class="section-informative-banners" data-store="banner-services">
	<div class="container">
		<div class="row">
			<div class="js-informative-banners swiper-container">
				<div class="swiper-wrapper">
					{% include 'snipplets/defaults/help_banner_services_item.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_banner_services_item.tpl' with {'help_item_2': true} %}
					{% include 'snipplets/defaults/help_banner_services_item.tpl' with {'help_item_3': true} %}
				</div>
				<div class="js-informative-banners-pagination service-pagination swiper-pagination swiper-pagination-black"></div>
			</div>
		</div>
	</div>
</section>