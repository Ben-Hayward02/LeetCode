# Write your MySQL query statement below

SELECT
    c.customer_id
FROM customer c
GROUP BY customer_id
HAVING COUNT(DISTINCT c.product_key) = (SELECT COUNT(DISTINCT product_key) FROM product);

