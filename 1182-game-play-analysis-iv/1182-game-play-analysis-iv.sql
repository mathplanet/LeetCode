SELECT ROUND(
    COUNT(DISTINCT f.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity),
    2
) AS fraction
FROM (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) f
WHERE EXISTS (
    SELECT 1
    FROM Activity a
    WHERE a.player_id = f.player_id
      AND a.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY)
);