# Write your MySQL query statement below
WITH ranking AS (
SELECT
    id
    , name
    , departmentId
    , salary
    , DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS dep_rank
FROM employee
)

SELECT
    d.name AS Department
    , r.name AS Employee
    , r.salary AS Salary
FROM ranking r
JOIN department d
    ON r.departmentId = d.id
WHERE r.dep_rank <= 3;


-- SELECT
--     d.name AS Department
--     , e.name AS Employee
--     , e.salary AS Salary
-- FROM employee e
-- JOIN department d
--     ON e.departmentId = d.id
-- JOIN ranking r
--     ON e.id = r.id
-- WHERE r.dep_rank >= 3;