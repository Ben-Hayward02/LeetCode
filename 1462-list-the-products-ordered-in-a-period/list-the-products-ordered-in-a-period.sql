# Write your MySQL query statement below

SELECT
    p.product_name
    , SUM(o.unit) AS unit
FROM orders o 
JOIN products p
    ON o.product_id = p.product_id
    AND o.order_date >= '2020-02-01' AND o.order_date < '2020-03-01'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;