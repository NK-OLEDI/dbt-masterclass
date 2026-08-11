with 

source as (

    select * from {{ source('raw', 'products') }}

),

renamed as (

    select
        id as product_id,
        cost,
        category,
        name as product_name,
        brand,
        retail_price,
        department,
        sku,
        distribution_center_id

    from source

),

filtered as (
    select 
        product_id,
        product_name,
        brand,
        category,
        department,
        sku,
        cost,
        retail_price,
        distribution_center_id
    from renamed

)

select * from filtered