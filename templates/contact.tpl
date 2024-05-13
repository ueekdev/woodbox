{% embed "snipplets/page-header.tpl" %}
	{% if is_order_cancellation %}
		{% set form_title = "Pedí la cancelación de tu última compra" | translate %}
	{% else %}
		{% set form_title = "Contacto" | translate %}
	{% endif %}
	{% block page_header_text %}{{ form_title }}{% endblock page_header_text %}
{% endembed %}

{% set has_contact_info = store.whatsapp or store.phone or store.email or store.address or store.blog or store.contact_intro %}
{% set is_order_cancellation_without_id = params.order_cancellation_without_id == 'true' %}
<section class="contact-page">
	<div class="container-fluid">
		<div class="row">
			{% if has_contact_info and not is_order_cancellation %}
				<div class="col-md-3">
					{% if store.contact_intro %}
						<p class="mb-4">{{ store.contact_intro }}</p>
					{% endif %}
					{% include "snipplets/contact-links.tpl" %}
				</div>
			{% endif %}
			{% if is_order_cancellation %}
				<div class="col-md-3">
					<div class="text-center text-md-left mb-4">
						<p data-component="order-cancellation-disclaimer">{{ "Si te arrepentiste, podés pedir la cancelación enviando este formulario. Tenés como máximo hasta 10 días corridos desde que recibiste el producto." | translate }} </p>
						<a class="btn-link-primary" href="{{ status_page_url }}"><strong>{{'Ver detalle de la compra >' | translate}}</strong></a>
					</div>
					{% if has_contact_info %}
						<h5 class="mb-1 mt-4">{{ 'Si tenés problemas con otra compra, contactanos:' | translate }}</h5>
                		<div class="divider mt-0"></div>
						{% if store.contact_intro %}
							<p class="mb-4">{{ store.contact_intro }}</p>
						{% endif %}
						{% include "snipplets/contact-links.tpl" %}
					{% endif %}
				</div>	
			{% endif %}
			<div class="col-md-6">
				{% if product %}  
					<div class="mb-4">
						<div class="row align-items-center justify-content-md-left">
							<div class="col-auto">
								<img src="{{ product.featured_image | product_image_url('thumb') }}" title="{{ product.name }}" alt="{{ product.name }}" />
							</div>
							<div class="col-auto">
								<p>{{ "Estás consultando por el producto:" | translate }} </br> {{ product.name | a_tag(product.url) }}</p>
							</div>
						</div>
					</div>
				{% endif %}
				{% if contact %}
					{% if contact.success %}
						{% if is_order_cancellation %}
							<div class="alert alert-success" data-component="order-cancellation-success-message">{{ "¡Tu pedido de cancelación fue enviado!" | translate }} 
							<br>
							<p class="mb-0 mt-2">{{ "Vamos a ponernos en contacto con vos apenas veamos tu mensaje." | translate }}</p>
							<br> 
							<strong>{{ "Tu código de trámite es" | translate }} #{{ last_order_id }}</strong></div>
						{% else %}
							<div class="alert alert-success" data-component="contact-success-message">{{ "¡Gracias por contactarnos! Vamos a responderte apenas veamos tu mensaje." | translate }}</div>
						{% endif %}
					{% else %}
						<div class="alert alert-danger">{{ "Necesitamos tu nombre y un email para poder responderte." | translate }}</div>
					{% endif %}
				{% endif %}	

				{% if is_order_cancellation_without_id %}
					<p class="mb-3" data-component="order-cancellation-disclaimer">{{ "Si te arrepentiste de una compra, podés pedir la cancelación enviando este formulario <strong>con tu número de orden.</strong> Tenés como máximo hasta 10 días corridos desde que recibiste el producto." | translate }}</p>
				{% endif %}
				
				{% embed "snipplets/forms/form.tpl" with{form_id: 'contact-form', form_custom_class: 'js-winnie-pooh-form mb-4', form_action: '/winnie-pooh', submit_custom_class: 'btn-block', submit_name: 'contact', submit_text: 'Enviar' | translate, data_store: 'contact-form' }  %}
					{% block form_body %}

						{# Hidden inputs used to send attributes #}

						<div class="winnie-pooh hidden">
							<label for="winnie-pooh">{{ "No completar este campo" | translate }}:</label>
							<input type="text" id="winnie-pooh" name="winnie-pooh">
						</div>
						<input type="hidden" value="{{ product.id }}" name="product"/>

						{% if is_order_cancellation or is_order_cancellation_without_id %}
							<input type="hidden" name="type" value="order_cancellation" />
						{% else %}
							<input type="hidden" name="type" value="contact" />
						{% endif %}

						{# Name input #}

						{% embed "snipplets/forms/form-input.tpl" with{input_for: 'name', type_text: true, input_name: 'name', input_id: 'name', input_label_text: 'Nombre' | translate } %}
						{% endembed %}

						{# Email input #}

						{% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_name: 'email', input_id: 'email', input_label_text: 'Email' | translate } %}
						{% endembed %}

						{% if not is_order_cancellation %}

							{# Phone input #}

							{% embed "snipplets/forms/form-input.tpl" with{input_for: 'phone', type_tel: true, input_name: 'phone', input_id: 'phone', input_label_text: 'Teléfono' | translate } %}
							{% endembed %}

							{# Message textarea #}

							{% embed "snipplets/forms/form-input.tpl" with{text_area: true, input_for: 'message', input_name: 'message', input_id: 'message', input_rows: '7', input_label_text: 'Mensaje' | translate } %}
							{% endembed %}

						{% endif %}
					{% endblock %}
				{% endembed %}
			</div>
		</div>
	</div>
</section>