<div class="social-links-list">
    {% for sn in ['instagram', 'facebook', 'youtube', 'tiktok', 'twitter', 'pinterest'] %}
        {% set sn_url = attribute(store,sn) %}
        {% if sn_url %}
            <a class="social-link" href="{{ sn_url }}" target="_blank" aria-label="{{ sn }} {{ store.name }}">
                {# {% if sn == "facebook" %}
                    {% set social_network = sn ~ '-f' %}
                {% else %}
                    {% set social_network = sn %}
                {% endif %}
                <svg class="icon-inline icon-lg"><use xlink:href="#{{ social_network }}"/></svg> #}

                {% if sn == "instagram" %}
                    <iconify-icon icon="lucide:instagram"></iconify-icon>
                {% elseif sn == "facebook" %}
                    <iconify-icon icon="ic:baseline-facebook"></iconify-icon>
                {% elseif sn == "youtube" %}
                    <iconify-icon icon="lucide:youtube"></iconify-icon>
                {% elseif sn == "tiktok" %}
                    <iconify-icon icon="ri:tiktok-line"></iconify-icon>
                {% elseif sn == "twitter" %}
                    <iconify-icon icon="ri:twitter-x-fill"></iconify-icon>
                {% elseif sn == "pinterest" %}
                    <iconify-icon icon="akar-icons:pinterest-fill"></iconify-icon>
                {% endif %}
            </a>
        {% endif %}
    {% endfor %}
</div>