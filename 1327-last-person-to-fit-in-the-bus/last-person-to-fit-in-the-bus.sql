# Write your MySQL query statement below
WITH rw AS (
SELECT
    person_name
    , SUM(weight) OVER(ORDER BY turn) AS running_weight
FROM queue
)

SELECT
    person_name
FROM rw
WHERE running_weight <= 1000
ORDER BY running_weight DESC
LIMIT 1;