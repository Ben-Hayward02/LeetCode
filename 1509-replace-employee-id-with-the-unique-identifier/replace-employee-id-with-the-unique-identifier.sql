# Write your MySQL query statement below
SELECT
    unique_id
    ,name
FROM employees e1
LEFT JOIN employeeuni e2
    ON e1.id = e2.id;