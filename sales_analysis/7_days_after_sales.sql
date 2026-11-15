--Average Views before and after sales (7days)

WITH sales_dates AS (
    SELECT
        date AS sale_date,
        product
    FROM daily_performance
    WHERE sales > 0
),

sales_impact AS (
    SELECT
        sd.product,
        sd.sale_date,

        AVG(dp.views) FILTER (
            WHERE dp.date BETWEEN
                sd.sale_date - 7 AND sd.sale_date - 1
        ) AS avg_views_before,

        AVG(dp.views) FILTER (
            WHERE dp.date BETWEEN
                sd.sale_date + 1 AND sd.sale_date + 7
        ) AS avg_views_after

    FROM sales_dates sd

    JOIN daily_performance dp
        ON sd.product = dp.product
        AND dp.date BETWEEN
            sd.sale_date - 7 AND sd.sale_date + 7

    GROUP BY
        sd.product,
        sd.sale_date
)

SELECT
    *,
    ROUND(
        (avg_views_after - avg_views_before)
        / NULLIF(avg_views_before, 0) * 100,
        2
    ) AS views_change_pct

FROM sales_impact
ORDER BY product, sale_date;