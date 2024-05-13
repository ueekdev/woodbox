{# /* Style tokens */ #}

:root {

  {#/*============================================================================
    #Colors
  ==============================================================================*/#}

  {#### Colors settings #}

  {# Main colors #}

  {% set main_background = settings.background_color %}
  {% set main_foreground = settings.text_color %}

  {% set accent_color = settings.accent_color %}

  {% set button_background = settings.button_background_color %}
  {% set button_foreground = settings.button_foreground_color %}
  
  {% set label_background = settings.label_background_color %}
  {% set label_foreground = settings.label_foreground_color %}

  {# Optional colors #}

  {% set addbar_background = settings.adbar_colors ? settings.adbar_background_color : accent_color %}
  {% set addbar_foreground = settings.adbar_colors ? settings.adbar_foreground_color : main_background %}

  {% set header_background = settings.header_colors ? settings.header_background_color : main_background %}
  {% set header_foreground = settings.header_colors ? settings.header_foreground_color : main_foreground %}
  {% set header_transparent_foreground = settings.head_transparent_contrast_options ? settings.header_transparent_foreground_color : '' %}

  {% set footer_background = settings.footer_colors ? settings.footer_background_color : main_background %}
  {% set footer_foreground = settings.footer_colors ? settings.footer_foreground_color : main_foreground %}

  {#### CSS Colors #}

  {# Main colors #}

  --main-foreground: {{ main_foreground }};
  --main-background: {{ main_background }};

  --accent-color: {{ accent_color }};

  --button-background: {{ button_background }};
  --button-foreground: {{ button_foreground }};

  --label-background: {{ label_background }};
  --label-foreground: {{ label_foreground }};

  {# Optional colors #}

  --adbar-background: {{ addbar_background }};
  --adbar-foreground: {{ addbar_foreground }};

  --header-background: {{ header_background }};
  --header-foreground: {{ header_foreground }};
  --header-transparent-foreground: {{ header_transparent_foreground }};

  --footer-background: {{ footer_background }};
  --footer-foreground: {{ footer_foreground }};

  {# Color shades #}

  {# Opacity hex levels #}

  {% set opacity_05 = '0D' %}
  {% set opacity_08 = '14' %}
  {% set opacity_10 = '1A' %}
  {% set opacity_20 = '33' %}
  {% set opacity_30 = '4D' %}
  {% set opacity_40 = '66' %}
  {% set opacity_50 = '80' %}
  {% set opacity_60 = '99' %}
  {% set opacity_80 = 'CC' %}
  {% set opacity_90 = 'E6' %}

  --main-foreground-opacity-05: {{ main_foreground }}{{ opacity_05 }};
  --main-foreground-opacity-08: {{ main_foreground }}{{ opacity_08 }};
  --main-foreground-opacity-10: {{ main_foreground }}{{ opacity_10 }};
  --main-foreground-opacity-20: {{ main_foreground }}{{ opacity_20 }};
  --main-foreground-opacity-30: {{ main_foreground }}{{ opacity_30 }};
  --main-foreground-opacity-40: {{ main_foreground }}{{ opacity_40 }};
  --main-foreground-opacity-50: {{ main_foreground }}{{ opacity_50 }};
  --main-foreground-opacity-60: {{ main_foreground }}{{ opacity_60 }};
  --main-foreground-opacity-80: {{ main_foreground }}{{ opacity_80 }};
  --main-foreground-opacity-90: {{ main_foreground }}{{ opacity_90 }};

  --main-background-opacity-20: {{ main_background }}{{ opacity_20 }};
  --main-background-opacity-50: {{ main_background }}{{ opacity_50 }};
  --main-background-opacity-80: {{ main_background }}{{ opacity_80 }};
  --main-background-opacity-90: {{ main_background }}{{ opacity_90 }};

  --accent-color-opacity-20: {{ accent_color }}{{ opacity_20 }};

  --header-foreground-opacity-20: {{ header_foreground }}{{ opacity_20 }};
  --header-foreground-opacity-30: {{ header_foreground }}{{ opacity_30 }};

  --header-background-opacity-50: {{ header_background }}{{ opacity_50 }};

  --header-transparent-foreground-opacity-30: {{ header_transparent_foreground }}{{ opacity_30 }};

  --footer-foreground-opacity-20: {{ footer_foreground }}{{ opacity_20 }};
  --footer-foreground-opacity-30: {{ footer_foreground }}{{ opacity_30 }};
  --footer-foreground-opacity-50: {{ footer_foreground }}{{ opacity_50 }};
  --footer-foreground-opacity-60: {{ footer_foreground }}{{ opacity_60 }};
  --footer-foreground-opacity-80: {{ footer_foreground }}{{ opacity_80 }};

  {# Alert colors CSS #}

  --success: #4bb98c;
  --danger: #dd7774;
  --warning: #dc8f38;

  {#/*============================================================================
    #Fonts
  ==============================================================================*/#}

  {# Font families #}

  --heading-font:  "Source Serif 4", serif;
  --body-font:  "Source Serif 4", serif;
  --main-title-font: "Source Sans 3", sans-serif;
  --price-font: "Lexend", sans-serif;
}