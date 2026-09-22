# Write your MySQL query statement below

SELECT
    employee_id
FROM employees
WHERE (manager_id) NOT IN (SELECT DISTINCT employee_id FROM employees)
    AND salary < 30000
ORDER BY employee_id;