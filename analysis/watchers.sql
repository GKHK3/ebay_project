--Total Watchers
SELECT
   product,
   SUM(watchers) AS Total_Watchers
FROM daily_performance

GROUP BY product
