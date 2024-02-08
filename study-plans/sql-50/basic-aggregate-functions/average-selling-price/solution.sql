/* Write your T-SQL query statement below */
SELECT 
    Prices.product_id, 
    
    ISNULL(ROUND(SUM(Prices.price * UnitsSold.units * 1.0) / SUM(UnitsSold.units), 2), 0) AS average_price
    
FROM Prices Prices 

LEFT JOIN UnitsSold UnitsSold
    ON Prices.product_id = UnitsSold.product_id 
        AND UnitsSold.purchase_date BETWEEN Prices.Start_date and Prices.end_date

GROUP BY Prices.product_id