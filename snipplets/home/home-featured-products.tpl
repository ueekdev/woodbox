{% set has_featured = has_featured | default(false) and sections.primary.products %}
{% set has_new = has_new | default(false) and sections.new.products %}
{% set has_sale = has_sale | default(false) and sections.sale.products %}

{% if has_featured or has_new or has_sale %}
    	{% if has_featured %}
            <section class="section-featured-home" data-store="home-products-featured">
        	    {% include 'snipplets/home/home-featured-grid.tpl' with {'featured_products': true} %}
            </section>
        {% endif %}
        {% if has_new %}
            <section class="section-featured-home" data-store="home-products-new">
                    {% include 'snipplets/home/home-featured-grid.tpl' with {'new_products': true} %}
            </section>
        {% endif %}
        {% if has_sale %}
            <section class="section-featured-home" data-store="home-products-sale">
                {% include 'snipplets/home/home-featured-grid.tpl' with {'sale_products': true} %}
            </section>
        {% endif %}
{% endif %}
