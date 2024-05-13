<div class="js-addtocart js-addtocart-placeholder btn btn-primary btn-block btn-transition {{ custom_class }} disabled" style="display: none;">
    <div class="d-inline-block">
        <span class="js-addtocart-text">{% if direct_add %}{{ 'Comprar' | translate }}{% else %}{{ 'Agregar al carrito' | translate }}{% endif %}</span>
        <span class="js-addtocart-success transition-container">
            {{ '¡Listo!' | translate }}
        </span>
        <div class="js-addtocart-adding transition-container">
            {{ 'Agregando...' | translate }}
        </div>
    </div>
</div>