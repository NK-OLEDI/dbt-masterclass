with joined as (

    select
        users.user_id,
        users.traffic_source,
        mapping.traffic_source,
        mapping.channel_group
    from {{ ref('stg_raw__users') }} as users
    left join {{ ref('traffic_source_channel_mapping') }} as mapping
        on users.traffic_source = mapping.traffic_source

),

coverage as (

    select
        countif(channel_group is null) as unmacthed_count,
        count(*)                       as total_count,
        safe_divide(countif(channel_group is null), count(*)) as unmatched_pct
    from joined

)

select * 
from coverage
where unmatched_pct > 0.05