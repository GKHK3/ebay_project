--Price change, difference, previous price
SELECT
   date,
   product,
   price,

   LAG(price) OVER (
    PARTITION BY product
    ORDER BY date
   ) AS previous_day_price,

   price - LAG(price) OVER(
    PARTITION BY product
    ORDER BY date
   ) AS price_change

FROM daily_performance
ORDER BY product, date;