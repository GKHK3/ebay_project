--Days since modification made (New)
WITH actual_modifications AS (
    SELECT
        product,
        date::date AS modification_date,
        STRING_AGG(DISTINCT change_type, ', ') AS modification_category
    FROM listing_changes
    WHERE NULLIF(TRIM(change_type), '') IS NOT NULL
    GROUP BY
        product,
        date::date
)

SELECT
    dp.date,
    dp.product,
    dp.views,
    dp.watchers,
    dp.price,
    dp.sales,

    -- Most recent actual modification
    lm.modification_date AS last_modification_date,

    -- Days since the last actual modification
    dp.date::date - lm.modification_date AS days_since_modification,

    -- Actual modification on the current date
    am.modification_category,

    -- Event indicator
    CASE
        WHEN am.modification_date IS NOT NULL THEN 1
        ELSE 0
    END AS modification_event

FROM daily_performance dp

-- Find the most recent genuine modification
LEFT JOIN LATERAL (
    SELECT
        MAX(modification_date) AS modification_date
    FROM actual_modifications
    WHERE product = dp.product
      AND modification_date <= dp.date::date
) lm ON TRUE

-- Identify modifications happening on this particular day
LEFT JOIN actual_modifications am
    ON am.product = dp.product
   AND am.modification_date = dp.date::date

ORDER BY
    dp.product,
    dp.date;
