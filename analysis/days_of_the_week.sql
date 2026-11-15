--Get all the details with Monday-Sunday 
SELECT
    date,
    product,
    price,
    views,
    watchers,

    TO_CHAR(date, 'Day') AS day_of_week,

    EXTRACT(ISODOW FROM date) AS day_number

FROM daily_performance
ORDER BY date;