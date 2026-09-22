# Write your MySQL query statement below
WITH f AS (
    SELECT
    accepter_id AS friends
FROM requestaccepted

UNION ALL

SELECT
    requester_id AS friends
FROM requestaccepted)

SELECT
    friends AS id
    , COUNT(*) AS num
FROM f
GROUP BY friends
ORDER BY num DESC
LIMIT 1;
