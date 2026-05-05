with 
    snapshot as (
        select * from {{ ref('dim__customer_snapshot') }}
    ),
    final as (
        select
        dbt_scd_id as customer_key,
        customer_id,
        customer_name,
        sales_rep_id,
        city,
        country,
        credit_limit,
        date(dbt_valid_from) as valid_from,
        date(dbt_valid_to) as valid_to,
        case 
            when dbt_valid_to is null then 1
            else 0
        end as is_current

    from snapshot
    )

select * from final