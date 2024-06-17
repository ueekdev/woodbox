{% set show_thumbs = not settings.scroll_product_images and (product.images_count > 1 or product.video_url) %}
<div class="product-gallery-composition" data-store="product-image-{{ product.id }}"> 
	{# {% if show_thumbs %}
		<div class="col-2 d-none d-md-block">
			
			
		</div>
	{% endif %} #}
	{% include 'snipplets/breadcrumbs.tpl' %}
	{% if product.images_count > 0 %}
		<div class="product-image-container ">
			<div class="js-swiper-product{% if settings.scroll_product_images %} product-detail-slider{% endif %} swiper-container" style="visibility:hidden; height:0;" data-product-images-amount="{{ product.images_count }}">
				{% include 'snipplets/labels.tpl' with {'product_detail': true} %}
			    <div class="swiper-wrapper">
			    	{% for image in product.images %}
			         <div class="swiper-slide js-product-slide slider-slide" data-image="{{image.id}}" data-image-position="{{loop.index0}}">
			         	<a href="{{ image | product_image_url('original') }}" data-fancybox="product-gallery" class="js-product-slide-link d-block position-relative" style="padding-bottom: {{ image.dimensions['height'] / image.dimensions['width'] * 100}}%;">
		         			<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset='{{  image | product_image_url('large') }} 480w, {{  image | product_image_url('huge') }} 640w, {{  image | product_image_url('original') }} 1024w' data-sizes="auto" class="js-product-slide-img product-slider-image img-absolute img-absolute-centered lazyautosizes lazyload" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
		         			<img src="{{ image | product_image_url('tiny') }}" class="js-product-slide-img product-slider-image img-absolute img-absolute-centered blur-up" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
			        	</a>
 					</div>
					{% endfor %}
					{% include 'snipplets/product/product-video.tpl' %}
				</div>
				<div class="js-swiper-product-pagination swiper-pagination"></div>
			</div>
			{% snipplet 'placeholders/product-detail-image-placeholder.tpl' %}
		</div>
	{% endif %}

	<div class="images-preview">
		{% if product.images_count > 5 %}
			{% for image in product.images | take(5) %}
				{% include 'snipplets/product/product-image-thumb.tpl' with {last_open_modal: true} %}
			{% endfor %}
		{% else %}
			{% for image in product.images %}
				{% include 'snipplets/product/product-image-thumb.tpl' %}
			{% endfor %}
		{% endif %}

		{# Video thumb #}

		{% if product.images_count > 5 %}
			<div class="mt-2">
		{% endif %}
				{% include 'snipplets/product/product-video.tpl' with {thumb: true} %}
		{% if product.images_count > 5 %}
			</div>
		{% endif %}
	</div>
</div>