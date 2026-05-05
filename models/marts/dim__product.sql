WITH
    product AS (
        SELECT
            product_id AS product_key,
            product_id,
            product_name,
            product_line,
            buy_price,
            msrp
        FROM
            {{ ref('stg__products') }}
    )
SELECT 
    *
FROM 
    product