--Shows If price has been changed on that day
WITH price_history AS (
    SELECT
        date,
        product,
        price,

        LAG(price) OVER (
            PARTITION BY product
            ORDER BY date
        ) AS previous_price

    FROM daily_performance
)

SELECT
    date,
    product,
    price,
    previous_price,

    CASE
        WHEN previous_price IS NOT NULL
             AND price < previous_price
        THEN TRUE
        ELSE FALSE
    END AS price_reduction

FROM price_history
ORDER BY product, date;