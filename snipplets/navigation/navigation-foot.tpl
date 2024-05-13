<ul class="list">
	{% for item in menus[settings.footer_menu] %}
		<li class="footer-menu-item">
	        <a class="footer-menu-link" href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
		</li>
	{% endfor %}
</ul>