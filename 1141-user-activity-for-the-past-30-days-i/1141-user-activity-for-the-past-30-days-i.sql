# Write your MySQL query statement below
SELECT activity_date as day
, count(DISTINCT user_id) as active_users
FROM Activity
WHERE activity_date between '2019-06-28' and '2019-07-27'
GROUP BY day