# Write your MySQL query statement below

WITH day_agg AS (
    SELECT
        visited_on
        , SUM(amount) AS amount
    FROM customer
    GROUP BY visited_on
),
window_avg AS (
    SELECT
        visited_on
        , SUM(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount
        , ROUND(AVG(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
    FROM day_agg
)

SELECT
    *
FROM window_avg
WHERE visited_on >= (SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY) FROM customer)
ORDER BY visited_on ASC;
