--Average views on sales day/ on non-sales day
SELECT
    product,

    CASE
        WHEN sales > 0 THEN 'Sales'
        ELSE 'No Sales'
    END AS sales_status,

    ROUND(AVG(views), 2) AS avg_views,

    ROUND(AVG(watchers), 2) AS avg_watchers,

    SUM(sales) AS total_sales,

    COUNT(*) AS total_days

FROM daily_performance

GROUP BY
    product,
    sales_status

ORDER BY
    product,
    sales_status;