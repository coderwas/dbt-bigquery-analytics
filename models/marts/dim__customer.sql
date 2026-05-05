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
        dbt_valid_from AS valid_from,
        dbt_valid_to AS valid_to,
        case 
            when dbt_valid_to is null then 1
            else 0
        end as is_current

    from snapshot
    )

select * from final