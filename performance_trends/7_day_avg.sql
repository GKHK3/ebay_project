--Average views per 7 days
SELECT
    date,
    product,
    views,
    watchers,

    ROUND(
        AVG(views) OVER (
            PARTITION BY product
            ORDER BY date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS views_7day_avg,

    ROUND(
        AVG(watchers) OVER (
            PARTITION BY product
            ORDER BY date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS watchers_7day_avg

FROM daily_performance
ORDER BY product, date;