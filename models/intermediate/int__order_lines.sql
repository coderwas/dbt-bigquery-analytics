WITH
    orders AS (
        SELECT
            *
        FROM
            {{ ref('stg__orders') }}
    ),
    orderdetails AS (
        SELECT
            *
        FROM
            {{ ref('stg__orderdetails') }}
    ),
    products AS (
        SELECT
            *
        FROM
            {{ ref('stg__products') }}
    )

SELECT
    CONCAT(CAST(o.order_id AS STRING), '-', CAST(od.line_id AS STRING)) AS order_line_id,
    o.order_id,
    od.line_id,
    o.customer_id,
    p.product_id,

    o.order_date,
    o.required_date,
    o.shipped_date,

    p.product_name,
    p.product_line,

    od.quantity,
    od.price_each,
    od.quantity * od.price_each AS revenue,
    o.status as order_status,
    CASE
        WHEN
            o.status = 'Cancelled'
        THEN
            'cancelled'
        WHEN
            o.shipped_date IS NULL
        THEN
            'not_shipped',
        WHEN
            o.shipped_date <= o.required_date
        THEN 
            'on_time',
        WHEN
            o.shipped_date > o.required_date
        THEN
            'delayed'
        ELSE
            'unknown'
    END AS shipment_status,
    
    date_diff(o.required_date, o.oreder_date, day) AS days_to_required,
    date_diff(o.shipped_date, o.order_date, day) AS days_to_shipped,
    date_diff(o.shipped_date, o.required_date, days) AS delay_days,

    CASE WHEN o.shipped_date IS NULL THEN 1 ELSE 0 END AS is_pending,
    CASE WHEN o.status = 'Cancelled' THEN 1 ELSE 0 END AS is_cancelled,
    CASE WHEN o.shipped_date > O.required_date THEN 1 ELSE 0 END AS is_delayed
FROM
    orderdetails AS od
LEFT JOIN 
    orders AS o
    ON
        od.order_id = o.order_id
LEFT JOIN
    products AS p 
    ON
        od.product_id = p.product_id