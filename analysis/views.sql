--Total Views
SELECT
   product,
   SUM(views) AS Total_Views
FROM daily_performance

GROUP BY product