WITH
    productlines AS (
        SELECT
            productLine AS product_line,
            textDescription AS text_description,
            htmlDescription AS html_description,
            image
        FROM {{ source('mysql', 'productlines') }}
    )

SELECT * FROM productlines