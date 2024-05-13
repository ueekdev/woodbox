<section class="js-adbar section-adbar {% if settings.ad_bar_animate %}section-adbar-animated{% endif %}">
    <div class="container-fluid">
        {% if settings.ad_url %}
            <a href="{{ settings.ad_url | setting_url }}">
        {% endif %}  
        <div class="{% if settings.ad_bar_animate %}js-adbar-animated adbar-animated{% endif %}  text-center">
            {% if settings.ad_bar and settings.ad_text %}
                {% if settings.ad_text %}
                    {% if settings.ad_bar_animate %}
                        <span class="js-adbar-text-container">
                        {% for i in 1..16 %}
                            <span class="adbar-text mr-4">
                                {{ settings.ad_text }}
                            </span>
                        {% endfor %}
                        </span>
                    {% else %}
                        {{ settings.ad_text }}
                    {% endif %}
                {% endif %} 
            {% endif %}         
        </div>
        {% if settings.ad_url %}
            </a>
        {% endif %}  
    </div>
</section>