/* Write your T-SQL query statement below */
SELECT 
    Product.product_id,
    COALESCE(
        (SELECT top 1 new_price 
         FROM Products Product2 
         WHERE Product.product_id = Product2.product_id 
           AND Product2.change_date <= '2019-08-16'
         ORDER BY Product2.change_date DESC), 
        10) AS price
FROM (SELECT DISTINCT product_id FROM Products) Product