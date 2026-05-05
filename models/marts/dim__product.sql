with 
    snapshot as (
        select * from {{ ref('dim__product_snapshot') }}
    ),

    final as (
        select
        dbt_scd_id as product_key,
        product_id,
        product_name,
        product_line,
        buy_price,
        msrp,
        date(dbt_valid_from) as valid_from,
        date(dbt_valid_to) as valid_to,
        case 
            when dbt_valid_to is null then 1 
            else 0 
        end as is_current
    from snapshot
    )

select * from final