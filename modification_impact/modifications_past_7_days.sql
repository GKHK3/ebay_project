SELECT
    dp.date,
    dp.product,

    COUNT(lc.change_id) AS modifications_previous_7_days

FROM daily_performance dp

LEFT JOIN listing_changes lc
    ON dp.product = lc.product

    AND lc.date BETWEEN
        dp.date - 6 AND dp.date

GROUP BY
    dp.date,
    dp.product

ORDER BY
    dp.product,
    dp.date;