{% docs order_status_grain %}
Order status is tracked independently at the order level (stg_thelook__orders.order_status) and the line-item level (stg_thelook__order_items.order_status), and the two are not guaranteed to match at any given momment - and order can show as in-progress overall while an individual item has already shipped.
{% enddocs %}

{% docs dataset_is_live %}
Confirmed directly against the live table. This source data is showing the matching date
{% enddocs %}