WITH
    payments AS (
        SELECT
            amount,
            paymentDate AS payment_date,
            checkNumber AS check_number,
            customerNumber AS customer_id
        FROM {{ source('mysql', 'payments') }}
    )
SELECT * FROM payments