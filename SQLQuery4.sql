UPDATE Employees
SET Salary = CASE
               WHEN JobTitle = 'Manager' THEN
                 CASE
                   WHEN YEAR(HireDate) >= 1998 THEN Salary + 5500
                   ELSE Salary
                 END
               ELSE
                 CASE
                   WHEN YEAR(HireDate) >= 1998 THEN Salary + 5000
                   WHEN YEAR(HireDate) >= 1999 THEN Salary + 4500
                   WHEN YEAR(HireDate) >= 2000 THEN Salary + 3500
                   WHEN YEAR(HireDate) >= 2001 THEN Salary + 2500
                   WHEN YEAR(HireDate) >= 2002 THEN Salary + 1500
                   ELSE Salary
                 END
             END;
