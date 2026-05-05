{% snapshot dim__product_snapshot %}
    {{
        config(
            unique_key='product_key',
            strategy='check',
            check_cols=[
                'product_name',
                'product_line',
                'buy_price',
                'msrp'
            ]
        )
    }}
    SELECT
            product_id AS product_key,
            product_id,
            product_name,
            product_line,
            buy_price,
            msrp
        FROM
            {{ ref('stg__products') }}
{% endsnapshot %}