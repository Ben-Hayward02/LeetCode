# Write your MySQL query statement below
WITH ranked_orders AS (
    SELECT
        delivery_id
        ,customer_id
        ,order_date
        ,customer_pref_delivery_date
        ,RANK() OVER (PARTITION BY customer_id ORDER BY order_date) AS order_rank
    FROM delivery
)


SELECT
    ROUND(SUM(CASE
        WHEN order_date = customer_pref_delivery_date THEN 1
        ELSE 0
        END) / COUNT(DISTINCT delivery_id), 4) * 100 AS immediate_percentage
FROM ranked_orders
WHERE order_rank = 1;

