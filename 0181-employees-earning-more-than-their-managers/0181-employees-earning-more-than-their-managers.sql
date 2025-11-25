# Write your MySQL query statement below
SELECT a.name as Employee
FROM Employee a
JOIN Employee b on b.id = a.managerId
WHERE a.salary > b.salary
AND a.managerId is not null