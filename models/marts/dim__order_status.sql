WITH
    order_status AS (
        SELECT DISTINCT
            order_status,
            order_status AS order_status_key
        FROM
            {{ ref('int__order_lines') }}
    )
SELECT
    *
FROM
    order_status