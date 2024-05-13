--- 4. Write a SQL query to find all information about 
--- all departments (use "TelerikAcademy" database).

select *from Departments

--- 5. Write a SQL query to find all department names.

select  Name from Departments 

--- 6. Write a SQL query to find the salary of each employee.
select CONCAT(FirstName,' ' ,LastName,'recive $') as full_name,Salary  from Employees

SELECT CONCAT(FirstName, ' ', LastName, ' receives $', Salary)
FROM Employees
--- 8. Write a SQL query to find the email addresses of each employee 
--- (by his first and last name). Consider that the mail domain is 
--- telerik.com. Emails should look like “John.Doe@telerik.com". 
--- The produced column should be named "Full Email Addresses".

select CONCAT(FirstName,'.',LastName,'@telerik.com') as "Full Email Addresses"  from Employees

--- 9. Write a SQL query to find all different employee salaries.
select distinct Salary from Employees

--- 10. Write a SQL query to find all information about 
--- the employees whose job title is “Sales Representative“.

select  *from Employees where JobTitle='Sales Representative';

--- 11. Write a SQL query to find the names of all 
--- employees whose first name starts with "SA".

select CONCAT(FirstName,' ',LastName) as full_name  from Employees where FirstName like 'SA%'

--- 12. Write a SQL query to find the names of 
--- all employees whose last name contains "ei".

select CONCAT(FirstName,' ',LastName) as full_name  from Employees where LastName like '%ei%'
--- 13. Write a SQL query to find the salary of all 
--- employees whose salary is in the range [20000…30000].
select  CONCAT(FirstName,LastName) as'full name',Salary from Employees where Salary >=20000 and
	Salary <=30000 order by Salary asc 

--- 14. Write a SQL query to find the names of all 
--- employees whose salary is 25000, 14000, 12500 or 23600.

select CONCAT(FirstName,LastName) as'full name',Salary from Employees
	where Salary in (25000, 14000, 12500 , 23600) order by Salary asc

--- 15. Write a SQL query to find all employees that do not have manager.

select CONCAT(FirstName,LastName) as'full name', ManagerID from Employees
	where ManagerID is null
--- 16. Write a SQL query to find all employees that have 
--- salary more than 50000. Order them in decreasing order by salary.

select CONCAT(FirstName,LastName),Salary from Employees
   WHERE Salary>50000 ORDER BY Salary desc

--- 17. Write a SQL query to find the top 5 best paid employees.

select top 5 CONCAT(FirstName,LastName),Salary from Employees
	order by Salary desc

--- 18. Write a SQL query to find all employees along with 
--- their address. Use inner join with ON clause.

SELECT e.EmployeeID, e.FirstName, e.LastName, a.AddressText, e.AddressID, a.AddressID
FROM Employees e 
JOIN Addresses a
    ON e.AddressID = a.AddressID

--- 19. Write a SQL query to find all employees and their address. 
--- Use equijoins (conditions in the WHERE clause).

SELECT e.EmployeeID, e.FirstName, e.LastName, a.AddressText, e.AddressID, a.AddressID
FROM Employees e , Addresses a
    where e.AddressID = a.AddressID

--- 20. Write a SQL query to find all employees along with their manager.
select CONCAT(e.FirstName,e.LastName) as' manger name',CONCAT(a.FirstName,a.LastName) as 'employee'
from Employees e inner join Employees a on e.EmployeeID=a.ManagerID

--- 21. Write a SQL query to find all employees, along with 
--- their manager and their address. Join the 3 tables: 
--- Employees e, Employees m and Addresses a.

select CONCAT(e.FirstName,e.LastName) as' manger name',CONCAT(m.FirstName,m.LastName) as 'employee',a.AddressText
from Employees e inner join
	Employees m on e.EmployeeID=m.ManagerID
inner join
	Addresses a on m.AddressID=a.AddressID order by m.FirstName

---------------------------------------------
	SELECT CONCAT(e.FirstName, ' ', e.LastName, ' [Address: ', a.AddressText, ']') AS Employee,
       CONCAT(m.FirstName, ' ', m.LastName) AS Manager
FROM Employees e 
JOIN Employees m
    ON e.ManagerID = m.EmployeeID
JOIN Addresses a
    ON e.AddressID = a.AddressID
----------------------------------------------------

--- 22. Write a SQL query to find all departments 
--- and all town names as a single list. Use UNION.

select d.Name from Departments d 
	union 
select t.Name from Towns t
-------------------------------------------------
--- 23. Write a SQL query to find all the employees and the 
--- manager for each of them along with the employees that 
--- do not have manager. Use right outer join. 
--- Rewrite the query to use left outer join.

SELECT CONCAT(e.FirstName, ' ', e.LastName) as Employee,
       CONCAT(m.FirstName, ' ', m.LastName) as Manager
FROM Employees m 
RIGHT JOIN Employees e
    ON e.ManagerID = m.EmployeeID

--- 

SELECT CONCAT(e.FirstName, ' ', e.LastName) as Employee,
       CONCAT(m.FirstName, ' ', m.LastName) as Manager
FROM Employees e 
LEFT JOIN Employees m
    ON e.ManagerID = m.EmployeeID


--- 24. Write a SQL query to find the names of all employees 
--- from the departments "Sales" and "Finance" whose hire 
--- year is between 1995 and 2005.

SELECT CONCAT(e.FirstName, ' ', e.LastName, ' - ', d.Name )
FROM Employees e 
JOIN Departments d
    ON e.DepartmentID = d.DepartmentID   
WHERE d.Name IN ('Sales', 'Finance')
    AND DATEPART(YEAR, e.HireDate) BETWEEN 1995 AND 2005
