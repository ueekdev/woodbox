<ul class="contact-info">
	{% if store.whatsapp %}
		<li class="footer-menu-item">
			<a href="{{ store.whatsapp }}" class="contact-link">
				<iconify-icon icon="ic:baseline-whatsapp"></iconify-icon>
				{{ store.whatsapp |trim('https://wa.me/') }}
			</a>
		</li>
	{% endif %}
	{% if store.phone %}
		<li class="footer-menu-item">
			<a href="tel:{{ store.phone }}" class="contact-link">
				<iconify-icon icon="lucide:phone"></iconify-icon>
				{{ store.phone }}
			</a>
		</li>
	{% endif %}
	{% if store.email %}
		<li class="footer-menu-item">
			<a href="mailto:{{ store.email }}" class="contact-link">
				<iconify-icon icon="system-uicons:mail"></iconify-icon>
				{{ store.email }}
			</a>
		</li>
	{% endif %}
	{% if not phone_and_mail_only %}
		{% if store.address and not is_order_cancellation %}
			<li class="footer-menu-item">{{ store.address }}</li>
		{% endif %}
		{% if store.blog %}
			<li class="footer-menu-item"><a target="_blank" href="{{ store.blog }}" class="contact-link">{{ "Visita nuestro Blog!" | translate }}</a></li>
		{% endif %}
	{% endif %}
</ul>