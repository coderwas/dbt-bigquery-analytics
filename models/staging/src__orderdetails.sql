WITH
    orderdetails AS (
        SELECT 
            orderLineNumber AS order_line_id,
            priceEach AS price_each,
            quantityOrdered AS quantity_ordered,
            productCode AS product_code,
            orderNumber as order_id
        FROM
            {{ source('mysql', 'orderdetails') }}
    )
SELECT * FROM orderdetails