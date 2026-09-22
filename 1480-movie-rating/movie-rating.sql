# Write your MySQL query statement below
(
SELECT
    u.name AS results
FROM users u
JOIN movierating mr
    ON u.user_id = mr.user_id
GROUP BY u.name
ORDER BY COUNT(*) DESC, name ASC
LIMIT 1
)
UNION ALL
(
SELECT
    m.title AS results
FROM movies m
JOIN movierating mr
    ON m.movie_id = mr.movie_id
WHERE created_at >= '2020-02-01'
    AND created_at < '2020-03-01'
GROUP BY m.title
ORDER BY AVG(rating) DESC, m.title ASC
LIMIT 1
);