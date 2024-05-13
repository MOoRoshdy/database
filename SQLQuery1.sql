select *from Employees where EmployeeID=ManagerID


select * from Employees


SELECT e.ManagerID,e.EmployeeID,FirstName,Salary
FROM Employees e order by ManagerID