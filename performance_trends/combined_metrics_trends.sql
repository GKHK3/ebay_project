--7 day average, Price change, price change percentage
WITH calculated_data AS (
    SELECT
        date,
        product,
        views,
        watchers,
        price,
        sales,

        LAG(price) OVER (
            PARTITION BY product
            ORDER BY date
        ) AS previous_price,

        AVG(views) OVER (
            PARTITION BY product
            ORDER BY date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS views_7day_avg,

        AVG(watchers) OVER (
            PARTITION BY product
            ORDER BY date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS watchers_7day_avg

    FROM daily_performance
)

SELECT
    date,
    product,
    views,
    watchers,
    price,
    sales,

    ROUND(
        watchers::NUMERIC / NULLIF(views, 0) * 100,
        2
    ) AS engagement_rate,

    previous_price,

    ROUND(
        price - previous_price,
        2
    ) AS price_change,

    ROUND(
        (price - previous_price) /
        NULLIF(previous_price, 0) * 100,
        2
    ) AS price_change_pct,

    ROUND(views_7day_avg, 2) AS views_7day_avg,
    ROUND(watchers_7day_avg, 2) AS watchers_7day_avg

FROM calculated_data
ORDER BY product, date;