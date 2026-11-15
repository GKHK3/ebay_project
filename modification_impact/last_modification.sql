--Days since modification made
SELECT
    dp.date,
    dp.product,

    MAX(lc.date) AS last_modification_date,

    dp.date - MAX(lc.date) AS days_since_modification

FROM daily_performance dp

LEFT JOIN listing_changes lc 
    ON dp.product = lc.product
    AND lc.date <= dp.date

WHERE description IS NOT NULL

GROUP BY
    dp.date,
    dp.product

ORDER BY
    dp.product,
    dp.date;



