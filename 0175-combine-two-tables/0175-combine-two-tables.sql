# Write your MySQL query statement below
SELECT a.firstName, a.lastName, b.city, b.state
FROM Person AS a
left JOIN Address AS b ON a.personId = b.personId;