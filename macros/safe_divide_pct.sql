{% macro safe_divide_pct(numerator, denominator) %}
    safe_divide({{ numerator }}, {{ denominator }}) * 100
{% endmacro %}