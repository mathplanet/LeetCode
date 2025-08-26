SELECT DISTINCT l1.num as ConsecutiveNums
FROM Logs l1
JOIN Logs l2 on l1.Id = l2.Id - 1
JOIN Logs l3 on l1.Id = l3.Id - 2
WHERE l1.num = l2.num
and l2.num = l3.num