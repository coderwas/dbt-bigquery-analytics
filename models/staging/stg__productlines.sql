WITH
    productlines AS (
        SELECT
            productLine AS product_id,
            textDescription AS text_description,
            htmlDescription AS html_description,
            image
        FROM {{ source('mysql', 'productlines') }}
    )

SELECT * FROM productlines