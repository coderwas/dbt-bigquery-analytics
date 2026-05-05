WITH
    orderdetails AS (
        SELECT 
            orderNumber as order_id,
            productCode AS product_id,
            quantityOrdered AS quantity,
            priceEach AS price_each,
            orderLineNumber AS line_id
            
        FROM
            {{ source('mysql', 'orderdetails') }}
    )
SELECT * FROM orderdetails