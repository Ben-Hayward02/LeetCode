WITH first_login AS (
    SELECT player_id
        ,MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
)

SELECT
    ROUND(COUNT(DISTINCT f.player_id) / COUNT(DISTINCT A.player_id), 2) AS fraction
FROM Activity A
LEFT JOIN first_login f
    ON A.player_id = f.player_id
    AND A.event_date = DATE_ADD(f.first_date, INTERVAL 1 DAY)
