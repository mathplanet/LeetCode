SELECT Department, Employee, salary
FROM (
    SELECT d.name AS Department,
           e.name AS Employee,
           e.salary,
           DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) AS rnk
    FROM Employee e
    JOIN Department d ON e.departmentId = d.id
) t
WHERE rnk = 1;