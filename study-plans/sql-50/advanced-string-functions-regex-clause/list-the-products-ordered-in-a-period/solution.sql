/* Write your T-SQL query statement below */
SELECT 
    Products.product_name, 
    SUM(Orders.unit) AS unit 
FROM Products Products 
INNER JOIN Orders Orders 
    ON Products.product_id = Orders.product_id
WHERE YEAR(Orders.order_date) = 2020 
    AND MONTH(Orders.order_date) = 2 
GROUP BY Products.product_name
HAVING SUM(Orders.unit) >= 100