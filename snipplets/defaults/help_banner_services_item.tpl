<div class="service-item-container col-md swiper-slide p-0 px-md-3">
	<div class="service-item mx-4 mx-md-0">
		<div class="text-center">
			{% if help_item_1 %}
				<svg class="icon-inline icon-7x svg-icon-text mb-3"><use xlink:href="#truck-big"/></svg>
				<h3 class="h4 mb-3">{{ "Medios de envío" | translate }}</h3>
			{% elseif help_item_2 %}
				<svg class="icon-inline icon-7x svg-icon-text mb-3"><use xlink:href="#credit-card-big"/></svg>
				<h3 class="h4 mb-3">{{ "Tarjetas de crédito" | translate }}</h3>
			{% elseif help_item_3 %}
				<svg class="icon-inline icon-7x svg-icon-text mb-3"><use xlink:href="#whatsapp-big"/></svg>
				<h3 class="h4 mb-3">{{ "WhatsApp" | translate }}</h3>
			{% endif %}
		</div>
	</div>
</div>