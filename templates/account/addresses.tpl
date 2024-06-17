{# {% embed "snipplets/page-header.tpl" %}
    {% block page_header_text %}{{ "Mis direcciones" | translate }}{% endblock page_header_text %}
{% endembed %} #}

<section class="account-page mb-0">
    <div class="container-fluid">
        <div class="container">      
            <div class="row">      
                <div class="text-center mt-5 w-100">
                    {% include 'snipplets/breadcrumbs.tpl' %}
                    <h3 class="title-internal">Meus endereços</h3>
                </div>
                {% for address in customer.addresses %}

                    {# User addresses listed - Main Address #}

                    {% if loop.first %}
                        <div class="col-md-4 col-12 address-item">
                            <div class="p-3 w-100"> 
                                <h3 class="mt-1">{{ 'Principal' | translate }}</h3>

                    {# User addresses listed - Other Addresses #}

                    {% elseif loop.index == 2 %}
                        <div class="col-md-4 col-12">
                            <div class="p-3"> 
                                <h5 class="mt-1">{{ 'Otras direcciones' | translate }}</h5>

                    {% endif %}

                                <h3 class="mb-0">{{ address.name }} {{ 'Editar' | translate | a_tag(store.customer_address_url(address), '', 'btn-link btn-link-primary  float-right') }}</h3>
                                <div class="divider mx-0 mt-2 mb-2"></div>
                                <p class="">{{ address | format_address }}</p>

                    {% if loop.first %} 
                                <a class="btn-link btn-link-primary " href="{{ store.customer_new_address_url }}"> {{ 'Agregar una nueva dirección' | translate }}</a>
                            </div>
                        </div>
                    {% elseif loop.last %}
                            </div>
                        </div>
                    {% endif %}
                {% endfor %}
            </div>
        </div>
    </div>
</section>