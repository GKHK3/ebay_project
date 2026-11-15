--Engagement rate. How many watchers per view?
SELECT
    product,
    ROUND(
        (SUM(watchers)::NUMERIC / NULLIF(SUM(views), 0)) * 100,
        2
    ) AS engagement_rate
FROM daily_performance
GROUP BY product
ORDER BY engagement_rate DESC;