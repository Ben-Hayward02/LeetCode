# Write your MySQL query statement below

WITH prices AS (
    SELECT
    product_id
    , new_price
    , change_date
    FROM products
    WHERE (product_id, change_date) IN (
                                        SELECT product_id, MAX(change_date)
                                        FROM products
                                        WHERE change_date <= '2019-08-16'
                                        GROUP BY product_id
                                            )
)


SELECT
    pro.product_id
    , CASE
        WHEN pri.new_price IS NULL THEN 10
        ELSE pri.new_price
        END AS price
FROM products pro
LEFT JOIN prices pri
    ON pro.product_id = pri.product_id
GROUP BY pro.product_id, pri.new_price;

-- SELECT *
-- FROM prices
