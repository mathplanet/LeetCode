# Write your MySQL query statement below
SELECT a.customer_number
FROM (
    SELECT customer_number
    ,COUNT(*) as cnt
    ,RANK() OVER(ORDER BY COUNT(*) DESC) as rnk
    FROM Orders
    Group BY customer_number
) a
WHERE rnk = 1