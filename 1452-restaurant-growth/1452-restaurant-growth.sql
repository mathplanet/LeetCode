WITH daily AS (
  SELECT visited_on, SUM(amount) AS amount
  FROM Customer
  GROUP BY visited_on
),
win AS (
  SELECT
    visited_on,
    SUM(amount) OVER (
      ORDER BY visited_on
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS amount7,
    COUNT(*) OVER (
      ORDER BY visited_on
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS cnt7
  FROM daily
)
SELECT
  visited_on,
  amount7 AS amount,
  ROUND(amount7 / 7, 2) AS average_amount
FROM win
WHERE cnt7 = 7
ORDER BY visited_on;