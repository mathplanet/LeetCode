SELECT 
a.user_id
, ROUND(AVG(CASE WHEN b.action = 'confirmed' then 1 else 0 end), 2) as confirmation_rate
FROM Signups a
LEFT JOIN Confirmations b on a.user_id = b.user_id
GROUP BY a.user_id