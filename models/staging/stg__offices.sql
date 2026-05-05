WITH
    offices AS (
        SELECT
            officeCode as office_id,
            territory,
            addressLine1 AS address_line_1,
            addressLine2 AS address_line_2,
            city
            state,
            country,
            phone
            
        FROM {{ source('mysql', 'offices') }}
    )
SELECT * FROM offices