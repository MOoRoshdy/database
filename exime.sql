create procedure eempp_salary(@id int)
 as
 begin
	begin try
		begin transaction 
			declare @total int
			set @total=0
			update Employees set Salary=salary*0.5 where Salary>=500 and EmployeeID=@id
			set @total=@@ROWCOUNT

			if(@total=1)
				begin
					commit
					print'committed'
				end

			if(@total<1)
				begin
					rollback
					print'rollback'
				end
	end try

	begin catch
		rollback
			print'catch rollback'
	end catch
	
		
 end


 select *from Employees

 exec eempp_salary 200




 select t.Name, CONCAT(e.FirstName,e.LastName) ,

(select count(*) from EmployeesProjects ep where ep.EmployeeID=e.EmployeeID ) 
from Employees e
inner join Addresses a on e.AddressID=a.AddressID
inner join Towns t on a.TownID= t.TownID
	where e.Salary=(select max(Salary) from Employees)






--inner join Addresses a on e.AddressID=a.AddressID
--inner join Towns t on a.TownID= t.TownID
--group by t.name
--order by
--having( select max(salary) from Employees)

--inner join Towns t on a.TownID= t.TownID
--inner join EmployeesProjects ep on e.EmployeeID=ep.EmployeeID
