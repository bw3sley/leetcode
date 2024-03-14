/* Write your T-SQL query statement below */
WITH FirstYearSales AS (
    SELECT 
        product_id,
        
        MIN(year) AS first_year

    FROM Sales

    GROUP BY
        product_id
)

SELECT 
    FirstYearSales.product_id,
    FirstYearSales.first_year,

    Sales.quantity,
    Sales.price

FROM Sales Sales

INNER JOIN FirstYearSales FirstYearSales
    ON Sales.product_id = FirstYearSales.product_id
        AND Sales.year = FirstYearSales.first_year