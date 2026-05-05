with snapshot as (

    select * from {{ ref('dim__employee_snapshot') }}

),

final as (

    select
        dbt_scd_id as employee_key,
        employee_id,
        first_name,
        last_name,
        job_title,
        office_id,
        extension,
        email,
        manager_id,
        case 
            when row_number() over (partition by employee_id order by dbt_valid_from) = 1
                then date('1900-01-01')
            else date(dbt_valid_from)
        end as valid_from,
        date(dbt_valid_to) as valid_to,
        case 
            when dbt_valid_to is null then 1 
            else 0 
        end as is_current

    from snapshot
)

select * from final