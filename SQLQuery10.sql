select top 1 d.DepartmentID,d.Name,sum(Salary) from Departments d left join Employees e on d.DepartmentID=e.DepartmentID
group by d.DepartmentID,d.Name order by SUM(Salary) ASC
-----------------------------------------------------------------
select d.DepartmentID,d.Name, sum(Salary) as allsalary
	from 
		Departments d left join Employees e on d.DepartmentID=e.DepartmentID
	group by d.DepartmentID,d.Name
	
	Having SUM(e.Salary) = (SELECT MIN(allsalary) FROM (SELECT SUM(Salary) AS TotalSalaries FROM Employees GROUP BY DepartmentID) AS Subquery);


------------------------------------------------------------------------------
SELECT 
    d.DepartmentID,
    d.Name AS DepartmentName,
    SUM(e.Salary) AS Salaries
FROM 
    Departments d
LEFT JOIN 
    Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY 
    d.DepartmentID, d.Name
HAVING 
    SUM(e.Salary) = (SELECT MIN(Salaries) 
					FROM
					(SELECT SUM(Salary) AS Salaries FROM Employees GROUP BY DepartmentID) AS query);
