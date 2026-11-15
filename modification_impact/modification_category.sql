--Modification Category
WITH final_results AS(
SELECT
    dp.date,
    dp.product,

    COALESCE(
        STRING_AGG(
            DISTINCT lc.change_type,
            ', '
            ORDER BY lc.change_type
        ),
        'No modification'
    ) AS modification_category

FROM daily_performance dp

LEFT JOIN listing_changes lc
    ON dp.date = lc.date
    AND dp.product = lc.product

GROUP BY
    dp.date,
    dp.product

ORDER BY
    dp.product,
    dp.date
)

SELECT*

FROM final_results

WHERE modification_category <> 'No modification'
;