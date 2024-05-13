{# Products featured that work as examples #}

<section class="section-featured-home" data-store="{{ data_store }}">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 text-center">
				<div class="section-title">
					<h3 class="h5 mb-1">{{ products_title }}</h3>
				</div>
			</div>
			<div class="col-12 p-0">
				<div class="js-swiper-featured-demo swiper-container swiper-products p-md-1">
					<div class="swiper-wrapper">
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_1': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_2': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_3': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_4': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_5': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_6': true}  %}
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="js-swiper-demo-prev swiper-button-prev d-none d-md-block svg-square svg-icon-text">
		<svg class="icon-inline icon-lg icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
	</div>
	<div class="js-swiper-demo-next swiper-button-next d-none d-md-block svg-square svg-icon-text">
		<svg class="icon-inline icon-lg"><use xlink:href="#chevron"/></svg>
	</div>
</section>