with 
    base as (
        select * from {{ ref('int__order_lines') }}
    ),

    dim_customer as (
        select customer_id, customer_key, valid_from, valid_to from {{ ref('dim__customer') }}
    ),

    dim_product as (
        select product_id, product_key, valid_from, valid_to, buy_price from {{ ref('dim__product') }}
    ),

    dim_date as (
        select date_day, date_key from {{ ref('dim__date') }}
    ),

    dim_order_status as (
        select order_status, order_status_key from {{ ref('dim__order_status') }}
    ),
    final as (
        select
        b.order_line_id as order_line_key,
        dc.customer_key,
        dp.product_key,
        dd_order.date_key as order_date_key,
        dd_ship.date_key as shipped_date_key,
        dos.order_status_key,
        b.quantity AS quantity_ordered,
        b.price_each,
        b.revenue,
        dp.buy_price * b.quantity as cost,
        b.revenue - (dp.buy_price * b.quantity) as profit,
        safe_divide(
             b.revenue - (dp.buy_price * b.quantity),
             b.revenue
        ) as margin,
        b.is_delayed,
        b.is_cancelled

        from base as b

        left join dim_customer as dc
            on b.customer_id = dc.customer_id
            and b.order_date >= dc.valid_from
            and (b.order_date < dc.valid_to or dc.valid_to is null)

        left join dim_product as dp
            on b.product_id = dp.product_id
            and b.order_date >= dp.valid_from
            and (b.order_date < dp.valid_to or dp.valid_to is null)

        left join dim_date as dd_order
            on b.order_date = dd_order.date_day

        left join dim_date as dd_ship
            on b.shipped_date = dd_ship.date_day

        left join dim_order_status as dos
            on b.order_status = dos.order_status
    )

select * from final