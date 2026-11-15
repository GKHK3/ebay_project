--Everytime price changes it shows previous price and how many days since it last changed
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
),

price_changes AS (
    SELECT
        date,
        product,
        price,
        previous_price,
        CASE
            WHEN price <> previous_price
            THEN date
        END AS price_change_date
    FROM price_history
),

final_results AS (
    SELECT
        date,
        product,
        price,
        previous_price,

        MAX(price_change_date) OVER (
            PARTITION BY product
            ORDER BY date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS last_price_change_date,

        date - MAX(price_change_date) OVER (
            PARTITION BY product
            ORDER BY date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS days_since_price_change

    FROM price_changes
)

SELECT *
FROM final_results
WHERE days_since_price_change IS NOT NULL
  AND days_since_price_change <> 0
ORDER BY product, date;