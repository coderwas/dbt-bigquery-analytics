WITH
    products AS (
        SELECT
            productCode AS product_code,
            productName As product_name,
            productDescription AS product_description,
            productVendor AS product_vendor,
            buyPrice AS buy_price,
            quantityInStock AS quantity_in_stock,
            MSRP AS msrp,
            productScale AS product_scale,
            productLine AS product_line
        FROM {{ source('mysql', 'products') }}    
            
    )
SELECT * FROM products