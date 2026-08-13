# Write your MySQL query statement below
SELECT
    w2.id
FROM weather w1
LEFT JOIN weather w2
ON DATE_ADD(w1.recordDate, INTERVAL 1 DAY) = w2.recordDate
WHERE w2.temperature - w1.temperature > 0;
