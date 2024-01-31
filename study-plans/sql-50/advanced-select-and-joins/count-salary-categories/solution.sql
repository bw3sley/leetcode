/* Write your T-SQL query statement below */
WITH SalaryCategories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary' AS category
    UNION ALL
    SELECT 'High Salary' AS category
),

AccountCounts AS (
    SELECT
        CASE
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category,

        COUNT(*) AS accounts_count
    
    FROM Accounts

    GROUP BY
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END
)

SELECT 
    SalaryCategories.category, 
    COALESCE(AccountCounts.accounts_count, 0) AS accounts_count 

FROM SalaryCategories SalaryCategories

LEFT JOIN AccountCounts AccountCounts
    ON SalaryCategories.category = AccountCounts.category