{% if store.allows_checkout_styling %}

{#/*============================================================================
checkout.scss.tpl

    -This file contains all the theme styles related to the checkout based on settings defined by user from config/settings.txt
    -Rest of styling can be found in:
        -static/css/style-colors.scss --> For color and font styles related to config/settings.txt
        -static/css/style-async.scss --> For non critical styles witch will be loaded asynchronously
        -static/css/style-critical.scss --> For critical CSS rendered inline before the rest of the site

==============================================================================*/#}

{#/*============================================================================
  Global
==============================================================================*/#}

{# /* // Colors */ #}

$accent-brand-color: {{ settings.accent_color | default('rgb(77, 190, 207)' | raw ) }};
$foreground-color: {{ settings.text_color | default('rgb(102, 102, 102)' | raw ) }};
$background-color: {{ settings.background_color | default('rgb(252, 252, 252)' | raw ) }};

{% if settings.header_colors %}
  $header-background: {{ settings.header_background_color }};
  $header-foreground: {{ settings.header_foreground_color }};
{% else %}
  $header-background: {{ settings.background_color }};
  $header-foreground: {{ settings.text_color }};
{% endif %}

$button-background: {{ settings.button_background_color }};
$button-foreground: {{ settings.button_foreground_color }};

$label-background: {{ settings.label_background_color }};
$label-foreground: {{ settings.label_foreground_color }};

{# /* // Font */ #}

$heading-font: {{ settings.font_headings | default('Muli') | raw }};
$body-font: {{ settings.font_rest | default('Muli') | raw }};

{# /* // Box */ #}
$box-border-color: rgba($foreground-color, .3);

$box-radius: 4px;
$box-background: lighten($background-color, 10%);
$box-shadow: none;
$form-control-radius: 6px;

{# /* // Functions */ #}

@function set-background-color($background-color) {
  @if lightness($background-color) > 95% {
    @return lighten($background-color, 10%);
  } @else {
    @return desaturate(lighten($background-color, 7%), 5%);
  }
}

@function set-input-color($background-color, $foreground-color) {
  @if lightness($background-color) > 70% {
    @return desaturate(lighten($foreground-color, 5%), 80%);
  } @else {
    @return desaturate(lighten($background-color, 5%), 80%);
  }
}

{# /* // Mixins */ #}

@mixin prefix($property, $value, $prefixes: ()) {
	@each $prefix in $prefixes {
    	#{'-' + $prefix + '-' + $property}: $value;
	}
   	#{$property}: $value;
}

{#/*============================================================================
  React
==============================================================================*/#}

{# /* // Box */ #}

$box-background: lighten($background-color, 10%);
$box-text-shadow: null;
@if lightness($foreground-color) > 95% {
  $box-text-shadow: 0 2px 1px rgba(darken($foreground-color, 80%), 0.1);
} @else {
  $box-text-shadow: 0 2px 1px rgba(lighten($foreground-color, 80%), 0.1);
}

$base-red: #c13a3a;

$xs: 0;
$sm: 576px;
$md: 768px;
$lg: 992px;
$xl: 1200px;

body {
  font-family: $body-font;
  color: $foreground-color;
  background-color: $background-color;
  font-size: 12px;
}
a {
  color: $foreground-color;
  text-decoration: none;
  &:hover, &:focus {
    color: rgba($foreground-color, .6);
    
    svg {
      fill: $foreground-color;
    }
  }

  svg {
    fill: $accent-brand-color;
  }
}

{# /* // Text */ #}

.title {
  color: $foreground-color;
}

.heading-small {
  font-size: 16px;
  font-weight: normal;
}

.text-small {
  font-size: 11px;
}

{# /* // Header */ #}

.header { 
  background-color: lighten($background-color, 10%);
  border-color: $accent-brand-color;
}

.security-seal {
  color: $header-foreground;
}

{# /* // Headbar */ #}

.headbar {
  background: $header-background;
  box-shadow: none;

  .container {
    .row {
      -ms-flex-align: center;
      align-items: center;

      {% if settings.logo_position_desktop == 'center' %}
        -ms-flex-pack: center!important;
        justify-content: center!important;

        > .text-left {
          text-align: center !important;
          -ms-flex: 0 0 50%;
          flex: 0 0 50%;
          max-width: 50%;
          margin-left: 25%;
        }
      {% endif %}
    }
  }
}

.headbar-logo-img {
  max-width: 100%;
  max-height: 60px;
}

.headbar-logo-text {
  float: none;
  color: $header-foreground;
  font-weight: 700;

  &:hover {
    color: $header-foreground;
    opacity: .8;
  }

  &:focus {
    color: $background-color;
  }
}

.headbar-continue {
  margin: 0 !important;
  font-weight: 400;
  color: $header-foreground;
  &:hover,
  &:focus {
    color: $header-foreground;
    opacity: .8;

    .headbar-continue-icon {
      fill: $header-foreground;
    }
  }
  &-icon {
    margin-left: 5px;
    fill: $header-foreground;
  }
}

{# /* // Form */ #}

.form-control {
  background: $background-color;
  border-color: $box-border-color;
  color: $foreground-color;
  font-family: $body-font;
  border-radius: $box-radius;

  &:focus {
    border-color: $foreground-color;
    outline: none;    
  }
}
.form-group.form-group-error .form-control {
  border-radius: $box-radius;
}
.form-options-content {
  font-size: 12px;
  line-height: 16px;
  color: rgba($foreground-color, .6);
  border: 0;
}
.form-group input[type="radio"] + .form-options-content .unchecked {
  fill: darken($background-color, 10%);
}
.form-group input[type="radio"] + .form-options-content .checked {
  fill: $accent-brand-color;
}
.form-group input[type="radio"]:checked + .form-options-content {
  border: 1px solid $accent-brand-color;
  border-color: darken($background-color, 10%);
  
  + .form-options-accordion {
    border-color: darken($background-color, 10%);
  }
  
  .checked {
    fill: $accent-brand-color;
  }
}
.form-group input[type="checkbox"]:checked + .form-options-content .checked {
  fill: $foreground-color;
}
.form-group input[disabled] + .form-options-content {
  border-color: darken($background-color, 10%) !important;
  
  .form-options-label {
    color: $foreground-color !important;
  }
  .checked {
    fill: $foreground-color !important;
  }
}
.form-group input[type="checkbox"] + .form-options-content .form-group-icon {
  border-radius: 2px;
  overflow: hidden;
}
.form-group input[type="checkbox"] + .form-options-content svg {
  width: 13px;
  height: 13px;
}
.form-group input[type="checkbox"] + .form-options-content .unchecked {
  width: 13px;
  fill: $foreground-color;
}

{# /* // Input */ #}

.has-float-label>span,
.has-float-label label {
  padding: 1px 0 0 7px;
  font-weight: 400;
}

.input-label {
  color: $foreground-color;
}

.select-icon {
  fill: $foreground-color;
  svg {
    width: 10px;
  }
}

{# /* // Buttons */ #}

.btn-primary {
  padding: 17px 10px;
  color: #fff;
  background: #E4B36C;
  border-radius: 30px;
  font-size: 1rem;
  line-height: 100%;

  &:hover,
  &:focus,
  &:active {
    color: #fff;
    background: darken(#E4B36C, 10%);
  }
}
.btn-secondary {
  padding: 17px 10px;
  color: #fff;
  background: transparent;
  border-radius: 30px;
  font-size: 1rem;
  line-height: 100%;

  &:hover,
  &:focus,
  &:active,
  &:active:focus {
    background: #fff;
    color: #E4B36C;
    border-color: #fff;
    opacity: .8;

    .btn-icon-right {
      fill: #E4B36C;
    }
  }
  .btn-icon-right {
    fill: $accent-brand-color;
  }
}
.btn-transparent {
  color: $foreground-color;

  &:hover {
    color: $foreground-color;
    opacity: .6;
    
    .btn-icon-right {
      fill: $foreground-color;
    }
  }

  .btn-icon-right {
    width: 10px;
    fill: $foreground-color;
  }
}

.btn-link {
  color: $foreground-color;
  font-weight: normal;
  text-decoration: none;

  &:hover {
    color: rgba($foreground-color, .6);

    svg {
      fill: rgba($foreground-color, .6);
    }
  }
}

.btn:active {
  box-shadow: none;
}

.btn-picker {
  border-color: $box-border-color;
  border-radius: $box-radius;
}

.login-info {
  margin: 10px 0 0;
  font-size: 12px;
  text-align: left;
}

{# /* // Breadcrumb */ #}

.breadcrumb li .breadcrumb-step {
  margin: 0;
  font-size: 10px;
  color: rgba($foreground-color, .6);
  background: none;
  text-transform: none;

  &.active {
    color: $foreground-color;
    background: none;

    &:before,
    &:after {
      position: relative;
      margin: 0 10px;
      border: 0;
      content: ".";
      opacity: .6;
    }
  }

  &.visited {
    color: rgba($foreground-color, .6);
    background: none;
  }
}
.breadcrumb li:first-child .breadcrumb-step,
.breadcrumb li:last-child .breadcrumb-step {
  padding: 0;
}

{# /* // Accordion */ #}

.accordion {
  color: $foreground-color;
  background-color: $background-color;
  border-radius: $box-radius;
  box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04);
  border-color: rgba($foreground-color, .15); 
}

.accordion-section-header-icon {
  fill: $foreground-color;
}

.accordion-rotate-icon {
  fill: $foreground-color;
}

{# /* // Summary */ #}

.mobile-discount-coupon_btn {
  border-radius: $box-radius;
  border-color: darken($background-color, 10%);
  color: lighten($foreground-color, 20%);
  
  .icon {
    color: lighten($foreground-color, 20%);
  }
}
.summary .overlay + .summary-container {
  border: 0;
}
.summary-details {
  background: $background-color;
}
.summary-container {
  background: $background-color;
  border-bottom: 1px solid rgba($foreground-color, .1);
  box-shadow: none;
}
.summary-total {
  font-size: 16px;
  color: $foreground-color;
  background: $background-color;
}
.summary-img-thumb {
  border-radius: 0;
  background: none;
}

.summary-img img {
  max-height: fit-content;
}

.summary-arrow-rounded {
  width: auto;
  background: none;
  .summary-arrow-icon {
    fill: $foreground-color;
  }
}

.summary-title {
  color: $foreground-color;
  font-size: 12px;
}

{# /* // Radio */ #}

.radio-group {

  &.radio-group-accordion {
    border: none;
    overflow: hidden;

    .radio {
      padding: 10px 0;
      border: 0;
      &.active {
        .description {
          color: $background-color;
        }
        .payment-item-discount {
          color: $background-color;
        }
      }
      .description {
        width: calc(100% - 35px);
        margin-left: 35px;
        font-weight: 400;
      }
    }
  }
}

.radio input:checked + .selector:before {
  background: $background-color;
  border-color: $foreground-color;
}
.radio input:checked + .selector:after {
  position: absolute;
  top: 15px;
  left: 5px;
  width: 6px;
  height: 6px;
  content: '';
  background-color: $foreground-color;
}
.radio input:disabled:checked + .selector:before {
  background-image: radial-gradient(circle, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.5) 50%, transparent 50%, transparent 100%);
}
.radio .selector {
  position: relative;

  &:before {
    width: 16px;
    height: 16px;
    margin: 1px 15px 0 0;
    border-color: rgba($foreground-color, 0.5);
    border-radius: 3px;
  }
}

.radio-content {
  margin-bottom: 10px;
  padding: 10px 0 0;
  background: $background-color;
  border: 0;
  border-bottom: 1px solid $box-border-color;
  box-shadow: none;
  border-radius: 0 !important;

  .text-center {
    text-align: left !important;
  }
  .p-all {
    padding-top: 0 !important;
  }
}

.shipping-option {
  position: relative;
  margin-bottom: 0;
  padding: 10px 5px 10px 25px;
  background: $background-color;
  border-radius: 0;
  border-color: transparent;

  &.active {
    border: none;
  }

  .selector {
    position: absolute;
    top: 0;
    left: 0;
    width: 16px;
    margin: 0;
    text-align: center;
    &:before {
      margin: 10px 0 0 0;
    }
  }

  input:checked + .selector:after {
    top: 15px;
    left: 5px;
    border-radius: 2px;
  }
}

{# /* // Panel */ #}

.panel {
  padding: 0;
  color: $foreground-color;
  background-color: $background-color;
  border-radius: 0;
  box-shadow: $box-shadow;
  border: 0;
  &.panel-with-header {
    padding-top: 0;
    p {
      margin-top: 0;
    }
  }
  &.text-center {
    text-align: left !important;
  }
  .shipping-address-container .panel-subheader:before {
    display: none;
  }
}
.panel-header {
  margin: 0;
  font-size: 16px;
  color: $foreground-color;
  text-align: left;
  border: 0;
  text-shadow: none;
}
.panel-header-tooltip {
  padding: 0 5px;
}
.panel-header-sticky {
  background-color: $background-color;
}
.panel-header-button {
  position: absolute;
  top: 9px;
  right: 0;
  z-index: 2;
  width: auto;
}
.panel-subheader {
  margin-top: 5px;
  padding-bottom: 5px;
  font-size: 8px;
  font-weight: normal;
  text-transform: uppercase;
  letter-spacing: 1px;
  border-bottom: 1px solid rgba($foreground-color, .1);
}
.panel-footer {
  border-bottom-right-radius: $box-radius;
  border-bottom-left-radius: $box-radius;
  background: darken($background-color, 2%);
  &-wa {
    border-color: darken($background-color, 5%);
  }
}
.panel-footer-form {
  input {
    border-color: $foreground-color;
  }
  .input-group-addon {
    background: $background-color;
    border-color: $foreground-color;
  }
  .disabled {
    background: darken($background-color, 15%) !important;
  }
}

{# /* // Table */ #}

.table-footer {
  font-size: 18px;
  color: $foreground-color;
  border: 0;
}

.table-subtotal {
  padding-top: 10px;
  border-color: rgba($foreground-color, .15);
  .text-semi-bold {
    font-weight: 400;
  }
}

.table .table-discount-coupon,
.table .table-discount-promotion {
  color: $accent-brand-color;
  border: 0;
}

{# /* // Shipping Options */ #}

.shipping-options {
  color: lighten($foreground-color, 7%);

  .radio-group {
    border-radius: $box-radius;
    box-shadow: 0 1px 3px -1px rgba($foreground-color,0.04);
    overflow: hidden;
  }

  .btn {
    margin: 0;
    background: $background-color;
  }
}

.shipping-options-ship, 
.shipping-options-pickup {
  overflow: hidden;
}

.new-shipping-flow .shipping-options .radio-group {
  box-shadow: none;
  overflow: inherit;
}

.new-shipping-flow .shipping-options .btn {
  margin-top: -10px;
  padding-top: 20px;
  border: 0;
}

.shipping-method-item > span {
  width: 100%;
}

.shipping-method-item-desc,
.shipping-method-item-name {
  max-width: 70%;
  color: $foreground-color;
  font-size: 12px;
  font-weight: normal;
}

.shipping-method-item-desc {
  opacity: .6 !important;
}

.shipping-method-item-price {
  float: right;
  font-weight: normal;
  color: $foreground-color;
  text-align: right;
}

.price-striked {
  display: block;
  margin: 5px 0 0 !important;
  font-size: 10px;
  color: rgba($foreground-color, .6);
}

{# /* // Discount Coupon */ #}

.box-discount-coupon button {
  color: $foreground-color;
  background: none;

  &:hover {
    opacity: .6;
    background: none;
  }
  svg {
    fill: $foreground-color;
  }
}
.box-discount-coupon-applied {
  padding: 5px;
  color: $foreground-color;
  background: none;
  border: 1px solid $foreground-color !important;
  border-radius: $box-radius;
  font-size: 8px;
  line-height: 10px;
  letter-spacing: 1px;
  text-transform: uppercase;

  .btn-link {
    color: $foreground-color;
    &:hover {
      color: rgba($foreground-color, .6);
    }
  }
  .coupon-icon {
    display: none;
  }
}

{# /* // Order Status */ #}

.orderstatus {
  border-bottom: 1px solid rgba($foreground-color, .15);
}

{# /* // Support */ #}

.support svg {
  width: 14px;
  vertical-align: middle;
}

{# /* // User Detail */ #}

.user-detail-icon {
  width: 40px;
  svg {
    left: initial;
    width: 15px;
    height: 16px;
    fill: $foreground-color;
  }
}

.user-detail-content {
  width: calc(100% - 50px);
  .text-semi-bold {
    font-size: 10px;
    font-weight: 400;
    letter-spacing: 1px;
  }
}

{# /* // History */ #}

.history-item-done .history-item-title {
  color: $foreground-color;
}
.history-item-failure .history-item-title {
  color: $base-red;
}
.history-item-progress-icon svg {
  width: 20px;
  fill: rgba($foreground-color, .3);
}
.history-item-progress-icon:after {
  top: 20px;
  margin-left: -11px;
  fill: rgba($foreground-color, .3);
  border-left: 2px solid rgba($foreground-color, .3);
}
.history-item-progress-icon-failure svg {
  fill: $base-red;
}
.history-item-progress-icon-success svg {
  fill: $foreground-color;
}
.history-item-progress-icon-success:after {
  border-color: $foreground-color;
}

{# /* // History Canceled */ #}

.history-canceled {
  border-top-right-radius: $box-radius;
  border-top-left-radius: $box-radius;
  
  &-round {
    border-bottom-right-radius: $box-radius;
    border-bottom-left-radius: $box-radius;
  }
}
.history-canceled-header {
  border-color: rgba($box-border-color, 0.7);
  border-top-left-radius: $box-radius;
  border-top-right-radius: $box-radius;
}
.history-canceled-icon svg {
  fill: darken($background-color, 45%);
}

{# /* // Offline Payment */ #}

.ticket-coupon {
  background: darken($background-color, 4%);
  border-color: $box-border-color;
}

{# /* // Status, Destination & Sign Up */ #}

.status,
.destination,
.signup {
  border-bottom: 1px solid rgba($foreground-color, .15); 
  padding: 25px 0;
  &-icon {
    width: 70px;
    margin: 0;
    svg {
      left: initial;
      width: 15px;
      fill: $foreground-color;
    }
  }
  &-content {
    width: calc(100% - 80px);
  }
}

.orderstatus .destination {
  padding: 10px 0 0;
  border: 0;
}

{# /* // Tracking */ #}

.history-item-progress {
  width: 70px;
  margin: -2px 0 0 0;
}

.history-item-content {
  width: calc(100% - 80px);
  max-width: 100%;
}

.history-item-message {
  max-width: 100%;
  font-size: 10px;
}

.tracking-item-time {
  color: $foreground-color;
}

{# /* // WhatsApp Opt-in */ #}

.whatsapp-form input, 
.whatsapp-form .input-group-addon {
  border-color: $accent-brand-color;
}

{# /* // Helpers */ #}

.border-top {
  border-color: rgba($box-border-color, .4);
}

{# /* // Errors */ #}

.alert-danger-bagged {
  margin-top: 5px;
  border-radius: 0;
  float: left;
  background: none;
  color: #cc4845;
}

.general-error {
  background: $base-red;
  border-color: lighten($base-red, 10%);
}

{# /* // Badge */ #}

.badge {
  border: 0;
}

{# /* // Payment */ #}

.payment-category-label {
  font-size: 8px;
  text-transform: uppercase;
  letter-spacing: 1px;

  &.text-semi-bold {
    font-weight: normal;
  }
}

.payment-item-discount {
  display: inline-block;
  float: left;
  clear: initial;
  margin: -1px 0 0 10px;
  padding: 4px 6px;
  color: $label-foreground;
  background: $label-background;
  border-radius: 6px;
  font-size: 8px;
  letter-spacing: 1px;
  text-transform: uppercase;
}

.payment-option {
  border-radius: $box-radius;
  color: $foreground-color;
  background-color: $background-color;
  border-color: rgba($foreground-color, .15);
  box-shadow: 0 1px 3px -1px rgba($foreground-color, 0.05);
}

.radio-content.payment-option-content {
  background: darken($background-color, 2%);
  border: 1px solid rgba($foreground-color, .15);
  border-top: 0;
  border-bottom-right-radius: $box-radius;
  border-bottom-left-radius: $box-radius;
}


{# /* // Overlay */ #}

.overlay {
  background: rgba(darken($background-color, 10%), 0.6);
}
.overlay-title {
  color: rgba($foreground-color, .7);
}

{# /* // List Picker */ #}

.list-picker .unchecked {
  fill: $foreground-color;
}
.list-picker li {
  border-color: $box-border-color;
  background: lighten($background-color, 10%);

  &:hover {
    color: $accent-brand-color;
  }

  &.active {
    background: $background-color;
    color: $accent-brand-color;

    .checked {
      fill: $accent-brand-color;
    }
  }
}

.list-picker-content {
  background: lighten($background-color, 10%);
  border-color: $box-border-color;
}

{# /* // Loading */ #}

.loading {
  background: rgba(darken($background-color, 2%), 0.5);
  color: $accent-brand-color;
}
.loading-spinner {
  color: $accent-brand-color;
}
.loading-skeleton-radio {
  margin: 0 0 -1px 0;
  padding: 20px 0;
  border: 0;
  border-radius: 0;
  &:last-child {
    border-radius: 0;
  }
}

{# /* // Spinner */ #}

.round-spinner {
  border-color: $accent-brand-color;
  border-left-color: darken($accent-brand-color, 5%);
  
  &:after {
    border-color: $accent-brand-color;
    border-left-color: darken($accent-brand-color, 5%);
  }
}

.spinner > .spinner-elem {
  width: 6px;
  height: 6px;
}

.spinner-inverted > .spinner-elem {
  background: $button-foreground;
}

{# /* // Modal */ #}

.modal-dialog,
.modal .modal-dialog {
  background: $background-color;
}

{# /* // List */ #}

.list-group-item {
  border-color: rgba($foreground-color, .15);
}

{# /* // Announcement */ #}

.announcement {
  color: darken($accent-brand-color, 10%);

  &-bg {
    background: $accent-brand-color;
    box-shadow: 0px 3px 5px -1px rgba(darken($accent-brand-color, 20%), 0.35);
    border-radius: $box-radius;
  }

  &-close {
    color: $accent-brand-color;
  }
}

{# /* // Alert */ #}

.alert {
  font-size: 10px;

  &-info {
    background-color: rgba($accent-brand-color, .15);
    border-color: rgba($accent-brand-color, .2);
    color: $accent-brand-color;
    .alert-icon {
      fill: $accent-brand-color;
    }
  }
  .alert-icon {
    width: 12px;
    min-width: auto;
  }
}

{# /* // Chip */ #}

.chip {
  background-color: rgba($accent-brand-color, .15);
  color: $accent-brand-color;
  border-radius: 5px;
}

{# /* // Review Block Detailed  */ #}
.price--display__free {
  color: $accent-brand-color;
}

.review-block-detailed {
  border: 0;
}

.review-block-detailed-item {
  width: 100%;
  border-bottom: 1px solid rgba($foreground-color, .15);
  border-radius: 0;
}

.review-block-detailed-item .icon-area {
  flex-basis: 30px;
}

{# /* // Tooltip */ #}

.tooltip-icon {
  fill: $foreground-color;
}

{# /* // Tabs */ #}

.tabs-wrapper {
  border-top-right-radius: $box-radius;
  border-top-left-radius: $box-radius;
  background: darken($background-color, 5%);
  border-bottom-color: darken($background-color, 10%);
}

.tab-item.active {
  color: $accent-brand-color;
  font-weight: bold;
}

.tab-indicator {
  background-color: $accent-brand-color;
}

{#/*============================================================================
  #Media queries
==============================================================================*/ #}

{# /* // Max width 576px */ #}

@media (max-width: $sm) {

  .headbar .container .row .col {
    flex-basis: auto;
    &.text-left {
      flex: 0 0 100%;
      max-width: 100%;
      order: 2;
      margin: 0;
      {% if settings.logo_position_mobile == 'center' %}
        text-align: center !important;
      {% else %}
        text-align: left !important;
      {% endif %}
    }
    &.text-right {
      margin: -12px 0 15px 0;
      background: #aac67b;
      text-align: center !important;
    }
  }

  .headbar-logo-text {
    display: inline-block;
    margin: 8px 0;
  }

  .security-seal {
    color: #000000;

    .d-inline-block:first-child {
      position: absolute;
      top: 1px;
      left: 50%;
      margin-left: -13px;
    }
    p {
      display: inline-block;
      &.text-semi-bold {
        margin-right: 50px !important;
      }
    }
    &-badge {
      margin: 0;
    }
  }

  .summary .panel {
    border: 0;
  }

  .panel.summary-details {
    border: 0;
  }

  .payment-list-item .accordion-section-header-label {
    flex-direction: column;
  }

  .accordion-section-header-label {
    align-items: start;
    align-content: start;
  }

  .payment-item-discount {
    margin: 8px 0 0;
  }

  .user-detail-icon {
    width: 70px;
  }

  .user-detail-content {
    width: calc(100% - 80px);
  }

  .orderstatus-footer {
    background: $background-color;
  }

}

{# /* // Min width 768px */ #}

@media (min-width: $md) {

  .status,
  .signup {
    padding: 25px 0;
  }

}

{# /* // Max width 0px */ #}

@media (max-width: $xs) {

  .modal-xs {
    background: $background-color;
  }

}

{% endif %}
