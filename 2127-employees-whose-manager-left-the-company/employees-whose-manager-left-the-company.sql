# Write your MySQL query statement below

WITH sub AS (
    SELECT
        *
    FROM employees
    WHERE salary < 30000
)

SELECT
    employee_id
FROM sub
WHERE (manager_id) NOT IN (SELECT DISTINCT employee_id FROM employees)
ORDER BY employee_id;