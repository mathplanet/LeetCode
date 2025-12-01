# Write your MySQL query statement below
SELECT class
FROM (
    SELECT class
    , count(*) as cnt
    FROM Courses
    GROUP BY class
) as A
WHERE cnt >= 5