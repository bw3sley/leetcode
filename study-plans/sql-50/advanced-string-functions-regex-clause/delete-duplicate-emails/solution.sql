/* Write your T-SQL query statement below */
DELETE Person 
FROM Person Person
INNER JOIN Person Person2
    ON Person.email = Person2.email
        AND Person.id > Person2.id