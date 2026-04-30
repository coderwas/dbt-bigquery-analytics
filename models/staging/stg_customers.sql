WITH
    customers AS (
        SELECT 
            customerNumber As customer_id,
            customerName AS customer_name,
            contactLastName AS contact_last_name,
            contactFirstName AS contact_first_name,
            phone,
            addressLine1 AS address_1,
            addressLine2 AS address_2,
            city,
            state,
            postalCode AS postal_code,
            country,
            salesRepEmployeeNumber AS sales_representative,
            creditLimit AS credit_limit

        FROM
            {{ source('mysql', 'customers') }}
    )

select * from customers