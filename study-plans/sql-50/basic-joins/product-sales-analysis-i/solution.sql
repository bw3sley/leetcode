/* Write your T-SQL query statement below */
SELECT
    Product.product_name AS product_name,
    
    Sales.year AS year,
    Sales.price AS price

FROM Sales Sales

INNER JOIN Product Product
    ON Sales.product_id = Product.product_id
