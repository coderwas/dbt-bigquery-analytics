{% snapshot dim__employee_snapshot %}
    {{
        config(
            unique_key='employee_id',
            strategy='check',
            check_cols=[
                'last_name',
                'first_name',
                'email',
                'manager_id',
                'job_title',
                'office_id'
            ]
        )
    }}

    SELECT 
        employee_id,
        first_name,
        last_name,
        job_title,
        office_id,
        extension,
        email,
        manager_id
    FROM
        {{ ref('stg__employees') }} 
        
{% endsnapshot %}