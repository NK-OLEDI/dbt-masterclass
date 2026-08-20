with 

source as (

    select * from {{ source('raw', 'users') }}

),

traffic_source as (
    select * from {{ref('traffic_source_channel_mapping')}}
),


enriched as (

    select
        id as user_id,
        first_name,
        last_name,
        email,
        age,
        gender,
        state,
        street_address,
        postal_code,
        city,
        country,
        latitude,
        longitude,
        created_at,
        user_geom,
        channel_group,
        tc.traffic_source as traffic_source

    from source as s
    left join traffic_source as tc
    on s.traffic_source = tc.traffic_source

)

select * from enriched