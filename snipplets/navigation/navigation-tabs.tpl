<section class="tabnav d-md-none">
	<div class="container-fluid p-0">
		<div class="row no-gutters">
			<div class="col text-center">
				<a href="{{ store.url }}" aria-label="{{ store.name }}" class="tabnav-link">
					<svg class="tabnav-icon tabnav-icon-open icon-inline utilities-icon"><use xlink:href="#home"/></svg>
				</a>
			</div>
			<div class="col text-center">
				{% include "snipplets/header/header-utilities.tpl" with {tabnav: true, use_menu: true} %}
			</div>
			<div class="col text-center">
				{% include "snipplets/header/header-search.tpl" with {tabnav: true} %}
			</div>
			<div class="col text-center">
				{% include "snipplets/header/header-utilities.tpl" with {tabnav: true,use_account: true} %}
			</div>
			<div class="col text-center">
				{% include "snipplets/header/header-utilities.tpl" with {tabnav: true} %}
			</div>
		</div>
	</div>
</section>