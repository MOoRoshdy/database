--- 1. Write a SQL query to find the names and salaries of the 
--- employees that take the minimal salary in the company. 
--- Use a nested SELECT statement.

select  CONCAT(FirstName,'',LastName) as 'full name',Salary from Employees where
	Salary=(select min(Salary)from Employees)
	--------another solve-----------------
declare @maisalary int=(select min(Salary from Employees ))
select CONCAT(FirstName,'',LastName) as'full',Salary from Employees
where Salary=@maisalary

--- 2. Write a SQL query to find the names and salaries 
--- of the employees that have a salary that is up to 
--- 10% higher than the minimal salary for the company.

declare @minmal int=(select (min(Salary)+min(Salary)*0.1) from Employees)
select CONCAT(FirstName,'',LastName) as 'full name',salary from Employees
	where Salary>@minmal order by Salary desc

	-------------------another solve----------------------------------

	SELECT CONCAT(e.FirstName, ' ', e.LastName), Salary
FROM Employees e
WHERE Salary >
    (SELECT (MIN(Salary) + MIN(Salary) * 0.1) FROM Employees)
ORDER BY Salary

--- 3. Write a SQL query to find the full name, salary and 
--- department of the employees that take the minimal salary 
--- in their department. Use a nested SELECT statement.

select CONCAT(e.FirstName,'',e.LastName) as'full name',e.Salary,d.Name from Employees e
inner join Departments d on e.DepartmentID=d.DepartmentID
	where Salary=(select min(em.Salary) from Employees em where em.DepartmentID=d.DepartmentID)
			order by Salary
--- 4. Write a SQL query to find the average 
--- salary in the department #1.

select ROUND(AVG(e.Salary),2) as'average' from Employees e
	where e.AddressID=1

--- 5. Write a SQL query to find the average 
--- salary in the "Sales" department.
select ROUND(AVG(e.Salary),2) as'average' from Employees e 
	inner join Departments d on e.DepartmentID=d.DepartmentID
			where d.Name='Sales'

--- 6. Write a SQL query to find the number 
--- of employees in the "Sales" department.

 select COUNT(e.FirstName) from Employees e inner join Departments d
	on e.DepartmentID=d.DepartmentID where d.Name='Sales'

--- 7. Write a SQL query to find the number 
--- of all employees that have manager.

select count(e.EmployeeID) from Employees e inner join Employees em
	on e.EmployeeID=em.ManagerID
-------------------another solve--------------------------------
SELECT COUNT(e.ManagerID)
FROM Employees e 

--- 8. Write a SQL query to find the number 
--- of all employees that have no manager.

SELECT COUNT(*) AS EmployeesWithoutManager
FROM Employees e
LEFT JOIN Employees m ON e.ManagerID = m.EmployeeID
WHERE m.EmployeeID IS NULL;
-----------------------------another solve----------------------------
	SELECT COUNT(e.EmployeeID)
FROM Employees e 
WHERE e.ManagerID IS NULL

--- 9. Write a SQL query to find all departments 
--- and the average salary for each of them.

select ROUND(AVG(e.Salary),2),d.Name   from Employees e inner join Departments d
	on e.DepartmentID=d.DepartmentID
	group by d.Name 

--- 10. Write a SQL query to find the count of all 
--- employees in each department and for each town.

select *from Employees
select *from Towns
select *from Addresses

select COUNT(e.EmployeeID) as'count emp',d.Name,t.Name from Employees e
	join Departments d on e.DepartmentID=d.DepartmentID
		join Addresses a on a.AddressID=e.AddressID
			join Towns t on t.TownID=a.TownID
	group by d.Name,t.Name
	
--- 11. Write a SQL query to find all managers that have 
--- exactly 5 employees. Display their first name and last name.

select e.EmployeeID as'magerID',CONCAT(e.FirstName,e.LastName) as'full name',COUNT(e.EmployeeID) as'number emp'  from Employees e
	join Employees ee on e.EmployeeID=ee.ManagerID
	group by e.FirstName,e.LastName,e.EmployeeID
		having count(e.EmployeeID)=5

--- 12. Write a SQL query to find all employees along with 
--- their managers. For employees that do not have manager 
--- display the value "(no manager)".

select concat(e.FirstName,e.LastName) as'emop name',
	ISNULL(ee.FirstName+''+ee.LastName,'no manger') as'manger '  from Employees e
	left join Employees ee on e.EmployeeID=ee.ManagerID

--- 13. Write a SQL query to find the names of all employees
--- whose last name is exactly 5 characters long. 
--- Use the built-in LEN(str) function.

select CONCAT(e.FirstName,e.LastName)as [full name]  from Employees e
where len(e.LastName)=5

--- 14. Write a SQL query to display the current date and time in the 
--- following format "day.month.year hour:minutes:seconds:milliseconds". 
--- Search in  Google to find how to format dates in SQL Server.

select FORMAT( GETDATE(),'dd.MM.yyyy HH:mm:ss:fff')

