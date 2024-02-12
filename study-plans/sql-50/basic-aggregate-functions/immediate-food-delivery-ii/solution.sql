/* Write your T-SQL query statement below */
WITH FirstOrders AS (
    SELECT
        customer_id,

        MIN(order_date) AS first_order_date

    FROM Delivery

    GROUP BY customer_id
),

ImmediateFirstOrders AS (
    SELECT 
        FirstOrders.customer_id
    
    FROM FirstOrders FirstOrders
    
    INNER JOIN Delivery Delivery
        ON FirstOrders.customer_id = Delivery.customer_id
            AND FirstOrders.first_order_date = Delivery.order_date

    WHERE Delivery.order_date = Delivery.customer_pref_delivery_date
)

SELECT
    ROUND(COUNT(ImmediateFirstOrders.customer_id) * 100.0 / COUNT(FirstOrders.customer_id), 2) AS immediate_percentage

FROM FirstOrders FirstOrders

LEFT JOIN ImmediateFirstOrders
    ON FirstOrders.customer_id = ImmediateFirstOrders.customer_id