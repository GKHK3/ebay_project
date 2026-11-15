--Average views before and after modification/ changes (3days)

WITH modifications AS (
    -- Identify actual listing modifications
    SELECT
        product,
        date::date AS modification_date,
        STRING_AGG(DISTINCT change_type, ', ') AS modification_type
    FROM listing_changes
    WHERE NULLIF(TRIM(change_type), '') IS NOT NULL
    GROUP BY
        product,
        date::date
),

modification_performance AS (
    SELECT
        m.product,
        m.modification_date,
        m.modification_type,

        -- Average views 3 days BEFORE modification
        AVG(dp.views) FILTER (
            WHERE dp.date::date >= m.modification_date - 3
              AND dp.date::date < m.modification_date
        ) AS avg_views_before,

        -- Average views 3 days AFTER modification
        AVG(dp.views) FILTER (
            WHERE dp.date::date > m.modification_date
              AND dp.date::date <= m.modification_date + 3
        ) AS avg_views_after,

        -- Number of days available in each period
        COUNT(dp.views) FILTER (
            WHERE dp.date::date >= m.modification_date - 3
              AND dp.date::date < m.modification_date
        ) AS days_before,

        COUNT(dp.views) FILTER (
            WHERE dp.date::date > m.modification_date
              AND dp.date::date <= m.modification_date + 3
        ) AS days_after

    FROM modifications m

    LEFT JOIN daily_performance dp
        ON dp.product = m.product
        AND dp.date::date BETWEEN
            m.modification_date - 7
            AND m.modification_date + 7

    GROUP BY
        m.product,
        m.modification_date,
        m.modification_type
)

SELECT
    *,
    ROUND(
        (avg_views_after - avg_views_before)::numeric,
        2
    ) AS views_difference,

    ROUND(
        (
            (avg_views_after - avg_views_before)
            / NULLIF(avg_views_before, 0) * 100
        )::numeric,
        2
    ) AS percentage_change

FROM modification_performance

ORDER BY
    product,
    modification_date;
