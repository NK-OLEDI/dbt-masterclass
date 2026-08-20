{% macro days_between(start_date, end_date) %}
    timestamp_diff({{ end_date }}, {{ start_date }}, day)
{% endmacro %}
