# Write your MySQL query statement below
SELECT a.name as Employee
FROM Employee a
LEFT JOIN Employee b on a.managerId = b.id
WHERE a.salary > b.salary
AND a.managerId is not null