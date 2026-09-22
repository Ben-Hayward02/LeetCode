# Write your MySQL query statement below
WITH prev_and_next AS(
    SELECT 
        num
        ,LAG(num, 1) OVER (ORDER BY id) AS prev_num
        ,LEAD(num, 1) OVER (ORDER BY id) AS next_num
    FROM logs
)

SELECT
    DISTINCT num AS ConsecutiveNums
FROM prev_and_next
WHERE num = prev_num
    AND num = next_num;