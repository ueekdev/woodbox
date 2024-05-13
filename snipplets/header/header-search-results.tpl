<ul class="search-suggest-list">
    {% set search_suggestions = products | take(6) %}
    {% for product in search_suggestions %}
        <li class="search-suggest-item container-fluid">
            <a href="{{ product.url }}" class="search-suggest-link row justify-content-md-center m-0">
                <div class="search-suggest-image-container col-xs-auto">
                    {{ product.featured_image | product_image_url("tiny") | img_tag(product.featured_image.alt, {class: 'search-suggest-image'}) }}
                </div>
                <div class="search-suggest-text col">
                	<p class="search-suggest-name">
                		{{ product.name | highlight(query) }}
                	</p>
                    {% if product.display_price %}
                    	<p>
                    		{{ product.price | money }}

                            {% set product_can_show_installments = product.show_installments and product.display_price and product.get_max_installments.installment > 1 and settings.product_installments %}
                            {% if product_can_show_installments %}
                                {% set max_installments_without_interests = product.get_max_installments(false) %}
                                {% if max_installments_without_interests and max_installments_without_interests.installment > 1 %}
                                    <span>| {{ "Hasta <span class='installment-amount'>{1}</span> cuotas sin interés" | t(max_installments_without_interests.installment) }}</span>
                                {% endif %}
                            {% endif %}
                    	</p>
                    {% endif %}
                </div>
            </a>
        </li>
    {% endfor %}
    <div class="text-center mt-3">
        <a href="#" class="js-search-suggest-all-link btn btn-secondary d-inline-block">{{ 'Ver todos los resultados' | translate }}</a>
    </div>
</ul>
