------------------------------------------
------ FIRST QUESTION ---------------------
--------------------------------------------
SELECT Salary as ManagerSalary FROM Employees WHERE EmployeeID = 7;
select Salary as EmployeeSalaries from Employees where ManagerID = 7;

BEGIN TRANSACTION;

DECLARE @ManagerID INT = 7;
DECLARE @ManagerSalary MONEY = (SELECT Salary FROM Employees WHERE EmployeeID = @ManagerID);
DECLARE @EmployeeCount INT;

SELECT @EmployeeCount = COUNT(*)
FROM Employees
WHERE ManagerID = @ManagerID;

DECLARE @ManagerIncrease MONEY = @EmployeeCount * 1000;
--DECLARE @ManagerIncrease MONEY = 6000;

UPDATE Employees
SET Salary = Salary - 1000
WHERE ManagerID = @ManagerID;

UPDATE Employees
SET Salary = Salary + @ManagerIncrease
WHERE EmployeeID = @ManagerID;

IF EXISTS (
    SELECT 1 
    FROM Employees 
    WHERE ManagerID = @ManagerID 
    AND Salary = 0
)
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Rollback: Salary cannot be zero for any employee under the manager.';
END
ELSE
BEGIN
    COMMIT TRANSACTION;
    PRINT 'Transaction committed successfully.';
END

SELECT Salary as ManagerSalary FROM Employees WHERE EmployeeID = 7;
select Salary as EmployeeSalaries from Employees where ManagerID = 7;