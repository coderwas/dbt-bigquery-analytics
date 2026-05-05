{% snapshot dim__customer_snapshot %}
    {{
        config(
            unique_key='customer_id',
            strategy='check',
            check_cols=[
                'customer_name',
                'city',
                'country',
                'credit_limit'
            ]
        )
    }}
    SELECT
        customer_id,
        customer_name,
        sales_rep_id,
        city,
        country,
        credit_limit
    FROM {{ ref('stg__customers') }}
    
{% endsnapshot %}