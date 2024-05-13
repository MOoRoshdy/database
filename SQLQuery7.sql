WITH RankedEmployees AS (
    SELECT 
        YEAR(HireDate) AS HireYear,
        salary,
        CONCAT(FirstName, ' ', LastName) AS employee_name,
        ROW_NUMBER() OVER (PARTITION BY YEAR(HireDate) ORDER BY salary DESC) AS high_salary_rank,
        ROW_NUMBER() OVER (PARTITION BY YEAR(HireDate) ORDER BY salary ASC) AS low_salary_rank
    FROM 
        employees
)
SELECT 
    HireYear,
    MAX(CASE WHEN high_salary_rank = 1 THEN salary END) AS highest_salary,
    MAX(CASE WHEN high_salary_rank = 1 THEN employee_name END) AS employee_name_high,
    MIN(CASE WHEN low_salary_rank = 1 THEN salary END) AS lowest_salary,
    MAX(CASE WHEN low_salary_rank = 1 THEN employee_name END) AS employee_name_low
FROM 
    RankedEmployees
GROUP BY 
    HireYear;
	----------------------------------------------------------------------------
	select year(HireDate)as year ,FirstName+' '+LastName as Employy_n_s,Salary
	from Employees e
	where Salary=(select max(Salary)from Employees Where year(HireDate)=year(e.HireDate))
