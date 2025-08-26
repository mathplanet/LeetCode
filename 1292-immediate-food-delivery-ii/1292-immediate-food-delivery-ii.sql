WITH first_order AS (
  SELECT
    customer_id,
    order_date,
    customer_pref_delivery_date,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
  FROM Delivery
)
SELECT
  ROUND(
    100 * SUM(order_date = customer_pref_delivery_date) / COUNT(*)
  , 2) AS immediate_percentage
FROM first_order
WHERE rn = 1;