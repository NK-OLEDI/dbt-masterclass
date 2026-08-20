with orders as (

    select * from {{ ref('stg_raw__orders')}}

),

order_items as (

    select * from {{ ref('stg_raw__order_items')}}

),

order_revenue as (

    select
        order_id,
        sum(sale_price) as order_revenue
    from order_items
    group by order_id


),

order_with_revenue as (

    select 
        orders.order_id,
        orders.user_id,
        orders.created_at,
        coalesce(order_revenue.order_revenue, 0) as order_revenue

    from orders
    left join order_revenue
        on orders.order_id = order_revenue.order_id

),
user_rollup as (

    select 
        user_id,
        min(created_at)   as first_order_at,
        max(created_at)   as most_recent_order_at,
        count(distinct order_id) as lifetime_order_count,
        sum(order_revenue) as lifetime_revenue

    from order_with_revenue
    group by user_id


)
select * from user_rollup