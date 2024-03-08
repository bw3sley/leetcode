/* Write your T-SQL query statement below */
SELECT 
    Customer.customer_id 
    
FROM Customer Customer 

INNER JOIN Product Product 
    ON Customer.product_key = Product.product_key

GROUP BY 
    Customer.customer_id

HAVING COUNT(DISTINCT Customer.product_key) = (SELECT COUNT(*) FROM Product)