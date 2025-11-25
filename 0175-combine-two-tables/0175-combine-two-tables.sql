# Write your MySQL query statement below
SELECT a.firstname
, a.lastname
, b.city
, b.state
FROM Person a
LEFT OUTER JOIN Address b on a.personId = b.personId
 