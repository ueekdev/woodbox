{# /*============================================================================
  #Modal
==============================================================================*/

#Properties
    // ID
    // Position - Top, Right, Bottom, Left
    // Transition - Slide and Fade
    // Width - Full and Box
    // modal_form_action - For modals that has a form
    // modal_fixed_footer - For modals with fixed footer. Need to include the fixed part inside the footer


#Topbar
    // Block - modal_topbar
#Head
    // Block - modal_head
#Body
    // Block - modal_body
#Footer
    // Block - modal_footer

#}

{% set modal_overlay = modal_overlay | default(true) %}

<div id="{{ modal_id }}" class="js-modal {% if modal_mobile_full_screen %}js-fullscreen-modal{% endif %} {% if desktop_overlay_only %}js-modal-overlay-md{% endif %} modal modal-{{ modal_class }} modal-{{modal_position}} modal-{{modal_position_desktop}}-md transition-{{modal_transition}} modal-{{modal_width}} transition-soft {% if modal_zindex_top %}modal-zindex-top{% endif %} {% if settings.show_tab_nav %}modal-with-tabnav{% endif %}" style="display: none;" {% if data_component %}data-component="{{ data_component }}"{% endif %}>
    {% if modal_form_action %}
    <form action="{{ modal_form_action }}" method="post" class="{{ modal_form_class }} {% if modal_footer and modal_fixed_footer %}modal-with-fixed-footer{% endif %}" {% if modal_form_hook %}data-store="{{ modal_form_hook }}"{% endif %}>
    {% endif %}
    {% if modal_footer and modal_fixed_footer %}
        <div class="modal-with-fixed-footer">
            <div class="modal-scrollable-area">
    {% endif %}
                <div class="js-modal-close {% if modal_mobile_full_screen %}js-fullscreen-modal-close{% endif %} {% if modal_zindex_top %}js-close-over-modal{% endif %} modal-header {% if not modal_header_title %}text-left{% endif %} {{ modal_header_class }}">
                    {% if modal_header_title %}
                        <div class="row align-items-center">
                            <div class="col text-left h1">
                                {% block modal_head %}{% endblock %}
                            </div>
                            <div class="col-2 text-right">
                                <a class="js-modal-close">
                                    <svg class="icon-inline icon-lg svg-icon-text"><use xlink:href="#times"/></svg>
                                </a>
                            </div>
                        </div>
                    {% else %}
                        <span class="js-modal-close {% if modal_zindex_top %}js-close-over-modal{% endif %} modal-close ml-1 no-header {{ modal_close_class }}">
                            <svg class="icon-inline icon-lg svg-icon-text"><use xlink:href="#times"/></svg>
                        </span>
                    {% endif %}
                </div>
                <div class="modal-body {{ modal_body_class }}">
                    {% block modal_body %}{% endblock %}
                </div>
    {% if modal_footer and modal_fixed_footer %}
            </div>
    {% endif %}
    {% if modal_footer %}
            <div class="modal-footer text-right {% if not modal_fixed_footer %}d-md-block{% endif %} {{ modal_footer_class }}">
                {% block modal_foot %}{% endblock %}
            </div>
        {% if modal_fixed_footer %}
        </div>
        {% endif %}
    {% endif %}

    {% if modal_form_action %}
    </form>
    {% endif %}
</div>

<div class="js-modal-overlay modal-overlay {% if modal_zindex_top %}modal-zindex-top{% endif %} {% if settings.show_tab_nav %}modal-overlay-with-tabnav{% endif %}" data-modal-id="#{{ modal_id }}" style="display: none;"></div>
