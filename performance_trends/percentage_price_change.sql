--Previous Price, Price change percentage
WITH price_changes AS (
    SELECT
       date,
       product,
       price,

       LAG(price) OVER(
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

   ROUND(
    ((price - previous_price) / NULLIF(previous_price, 0)) * 100, 2
    ) AS price_change_pct

FROM price_changes
ORDER BY product, date;