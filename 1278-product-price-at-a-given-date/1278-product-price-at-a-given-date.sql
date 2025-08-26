WITH ranked AS (
  SELECT
      product_id,
      new_price,
      change_date,
      ROW_NUMBER() OVER (
        PARTITION BY product_id
        ORDER BY change_date DESC
      ) AS rn
  FROM Products
  WHERE change_date <= '2019-08-16'
),
latest AS (
  SELECT product_id, new_price
  FROM ranked
  WHERE rn = 1
)
SELECT p.product_id,
       COALESCE(l.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) AS p
LEFT JOIN latest AS l
  ON p.product_id = l.product_id
ORDER BY p.product_id;