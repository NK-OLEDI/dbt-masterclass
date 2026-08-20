with 

source as (

    select * from {{ source('raw', 'orders') }}

),

renamed as (

    select
        order_id,
        user_id,
        {{ standardize_text ('status')}} as order_status,
        gender,
        created_at,
        returned_at,
        shipped_at,
        delivered_at,
        num_of_item

    from source

)

select * from renamed