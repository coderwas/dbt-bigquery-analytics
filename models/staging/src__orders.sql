WITH
    orders AS (
        SELECT
            orderNumber as order_id,
            customerNumber AS customer_id,
            comments,
            status,
            requiredDate AS required_date,
            orderDate AS order_date,
            shippedDate AS shipped_date
        FROM {{ source('mysql', 'orders') }}
            
    )
SELECT * FROM orders