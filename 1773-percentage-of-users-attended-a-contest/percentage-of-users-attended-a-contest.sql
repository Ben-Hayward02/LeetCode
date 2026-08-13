# Write your MySQL query statement below
SELECT 
    contest_id
    ,ROUND(COUNT(DISTINCT r.user_id) / (SELECT COUNT(user_id) FROM users), 4) * 100 AS percentage
FROM register r
GROUP BY r.contest_id
ORDER BY percentage DESC, contest_id ASC;


