WITH 
    date_spine AS (
        SELECT
            * 
        FROM
            unnest(
                generate_date_array(
                    '2003-01-01',
                    '2005-12-31'
                )
            ) AS date_day
    ),

    final AS (
        SELECT
            date_day as date_key,
            date_day,
            extract(year from date_day) AS year,
            extract(quarter from date_day) AS quarter,
            extract(month from date_day) AS month,
            extract(day from date_day) AS day,
            format_date('%Y-%m', date_day) AS year_month,
            format_date('%A', date_day) AS day_name
        FROM
            date_spine
    )

SELECT 
    *
FROM
    final