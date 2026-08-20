{% macro standardize_text(column_name)%}
    trim(lower({{column_name}}))
{% endmacro %}