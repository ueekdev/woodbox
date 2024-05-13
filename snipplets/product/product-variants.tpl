<div class="js-product-variants {% if quickshop %}js-product-quickshop-variants mb-3{% endif %} form-row pt-2">
	{% set has_size_variations = false %}
	{% if settings.bullet_variants %}
		{% set hidden_variant_select = ' d-none' %}
	{% endif %}
	{% for variation in product.variations %}

		<div class="js-product-variants-group {% if variation.name in ['Color', 'Cor'] %}js-color-variants-container{% endif %} {% if quickshop %}col-12 {% else %} col-12 {% if settings.bullet_variants %}mb-2{% else %}{% if loop.length == 3 %} col-md-4 {% else %} col-md-6{% endif %}{% endif %}{% endif %}" data-variation-id="{{ variation.id }}">
			{% if quickshop %}
				{% embed "snipplets/forms/form-select.tpl" with{select_label: true, select_label_name: '' ~ variation.name ~ '', select_for: 'variation_' ~ loop.index , select_id: 'variation_' ~ loop.index, select_name: 'variation' ~ '[' ~ variation.id ~ ']', select_group_custom_class: 'form-group-small mb-2' ~ hidden_variant_select, select_custom_class: 'js-variation-option js-refresh-installment-data form-control-small', select_label_custom_class:'mb-1'} %}
					{% block select_options %}
						{% for option in variation.options %}
							<option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
						{% endfor %}
					{% endblock select_options%}
				{% endembed %}
			{% else %}
				{% embed "snipplets/forms/form-select.tpl" with{select_label: true, select_label_name: '' ~ variation.name ~ '', select_for: 'variation_' ~ loop.index , select_id: 'variation_' ~ loop.index, select_name: 'variation' ~ '[' ~ variation.id ~ ']', select_custom_class: 'js-variation-option js-refresh-installment-data', select_group_custom_class: hidden_variant_select} %}
					{% block select_options %}
						{% for option in variation.options %}
							<option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
						{% endfor %}
					{% endblock select_options%}
				{% endembed %}
			{% endif %}
			{% if settings.bullet_variants %}
				<div class="row">
					<div class="col-auto">
						<label class="form-label d-inline-block mt-2">{{ variation.name }}</label>
					</div>
					<div class="col pl-0">
						{% for option in variation.options if option.custom_data %}
							<a data-option="{{ option.id }}" class="js-insta-variant btn btn-variant{% if product.default_options[variation.id] == option.id %} selected{% endif %}" title="{{ option.name }}" data-option="{{ option.id }}" data-variation-id="{{ variation.id }}">
								<span class="btn-variant-content"{% if variation.name in ['Color', 'Cor'] %} style="background: {{ option.custom_data }}; border: 1px solid #eee"{% endif %} data-name="{{ option.name }}">
								{% if not(variation.name in ['Color', 'Cor']) %}
									{{ option.name }}
								{% endif %}
								</span>
							</a>
						{% endfor %}
						{% for option in variation.options if not option.custom_data %}
							<a data-option="{{ option.id }}" class="js-insta-variant btn btn-variant{% if product.default_options[variation.id] == option.id %} selected{% endif %}" data-variation-id="{{ variation.id }}">
								<span class="btn-variant-content" data-name="{{ option.name }}">{{ option.name }}</span>
							</a>
						{% endfor %}
					</div>
				</div>
			{% endif %}
		</div>
		{% if variation.name in ['Talle', 'Talla', 'Tamanho', 'Size'] %}
			{% set has_size_variations = true %}
		{% endif %}
	{% endfor %}
	{% if show_size_guide and settings.size_guide_url and has_size_variations %}
		{% set has_size_guide_page_finded = false %}
		{% set size_guide_url_handle = settings.size_guide_url | trim('/') | split('/') | last %}

		{% for page in pages if page.handle == size_guide_url_handle and not has_size_guide_page_finded %}
			{% set has_size_guide_page_finded = true %}
			{% if has_size_guide_page_finded %}
				<a data-toggle="#size-guide-modal" data-modal-url="modal-fullscreen-size-guide" class="js-modal-open js-fullscreen-modal-open btn-link  col-12 mb-3">
					<svg class="icon-inline icon-lg svg-icon-text mr-1"><use xlink:href="#ruller"/></svg>
					{{ 'Guía de talles' | translate }}
				</a>
				{% embed "snipplets/modal.tpl" with{modal_id: 'size-guide-modal',modal_class: 'bottom-md', modal_position: 'right', modal_transition: 'slide', modal_header_title: true, modal_footer: true, modal_width: 'centered', modal_mobile_full_screen: 'true'} %}
					{% block modal_head %}
						{{ 'Guía de talles' | translate }}
					{% endblock %}
					{% block modal_body %}
						<div class="user-content">
							{{ page.content }}
						</div>
					{% endblock %}
				{% endembed %}
			{% endif %}
		{% endfor %}
	{% endif %}
</div>