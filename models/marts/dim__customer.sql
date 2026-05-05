WITH
    customer AS (
        SELECT
            customer_id AS customer_key,
            customer_id,
            customer_name,
            sales_rep_id,
            city,
            country,
            credit_limit
        FROM
            {{ ref('stg__customers') }}
    )

SELECT
    *
FROM
    customer