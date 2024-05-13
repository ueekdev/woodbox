<a href="#" class="js-product-thumb {% if loop.last and last_open_modal %}js-product-thumb-modal{% endif %} product-thumb d-block position-relative mb-3 {% if loop.first %}selected{% endif %}" style="padding-bottom: {{ image.dimensions['height'] / image.dimensions['width'] * 100}}%;" data-thumb-loop="{{loop.index0}}">
    <img data-sizes="auto" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset='{{  image | product_image_url('large') }} 480w, {{  image | product_image_url('huge') }} 640w' class="img-absolute img-absolute-centered lazyautosizes lazyload" {% if image.alt %}alt="{{image.alt}}"{% endif %} />

    {% if loop.last and last_open_modal %}
    	
    	{% set remaining_imgs = product.images_count - (loop.index - 1)%}

	    <div class="thumb-see-more">
	    	<span class="label">+{{ remaining_imgs }}</span>
	    </div>
    {% endif %}
</a>