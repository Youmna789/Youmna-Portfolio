-- SQL Assignment 1 
-- DML
-- 1
use Company_SD
insert into Employee (Fname , Lname , SSN , Bdate , Address , Sex , Salary , Superssn , Dno )
values ( 'Ziad' , 'Tamer' , 102672 , '2007-7-2' , 'Cairo' , 'M' , 2000 , 112233 , 30 )

-- 2
insert into Employee 
values ( 'Ahmed' , 'Hany' , 102660 , '2005-11-25' , 'Giza' , 'M' , null , null , 30 )

-- 3
insert into Departments (Dname , Dnum , MGRSSN , "MGRStart Date" )
values ( 'DEPT IT' , 100 , 112233 , '2010-11-01' )

-- 4
update Departments
set MGRSSN = 968574
where Dnum = 100

update Departments
set MGRSSN = 102672
where Dnum = 20

update Employee
set Superssn = 102672
where SSN = 102660

-- 5
update Departments
set MGRSSN = 102660 , [MGRStart Date] = '2025-8-15'
where MGRSSN = 223344

update Works_for
set ESSn = 102660 , Hours = 0
where ESSn = 223344

update Employee
set Superssn = 102660
where Superssn = 223344

delete from Dependent
where ESSN = 223344

delete from Employee
where SSN = 223344

-- 6
update Employee
set Salary = Salary * 1.2
where SSN = 102672
-- or
update Employee
set Salary *= 1.2
where SSN = 102672
-- or
update Employee
set Salary = Salary + Salary * 0.2
where SSN = 102672
-- or
update Employee
set Salary += Salary * 0.2
where SSN = 102672

-- DQL
-- 1
select *
from Employee

-- 2
select Fname , Lname , Salary , Dno
from Employee

-- 3
select p.Pname , p.Plocation , d.Dname
from Project as p , Departments as d
where d.Dnum = p.Dnum
-- or
select p.Pname , p.Plocation , d.Dname
from Project p inner join Departments d
on p.Dnum = d.Dnum

-- 4
select Fname + ' ' + Lname as [Full Name]
	, salary * 12 * 0.1 "ANNUAL COMM"
from Employee

-- 5
select SSN , Fname + ' ' + Lname as [Full Name]
from Employee
where Salary > 1000

-- 6
select SSN , Fname + ' ' + Lname as [Full Name]
from Employee
where Salary * 12 > 10000

-- 7
select Fname + ' ' + Lname as [Full Name] , Salary
from Employee
where sex = 'F'

-- 8
select Dnum , Dname
from Departments
where MGRSSN = 968574

-- 9
select Pnumber , Pname , Plocation
from Project
where Dnum = 10

-------------------------------------------
-- Cross Join / Cartesian
select *
from Employee , Departments
-- or
select *
from Employee cross join Departments
---------------------------
-- Inner Join
select fname + ' ' + Lname as [Full Name] , Dname as [Department Name]
from Employee , Departments
where Dno = Dnum
-- or
select fname + ' ' + Lname as [Employee Full Name] , Dname as [Department Name]
from Employee inner join Departments
on Dno = Dnum
-- or
select fname + ' ' + Lname as [Employee Full Name] , Dname as [Department Name]
from Employee join Departments
on Dno = Dnum
---------------------
------- Outer Join
-- Left
select fname + ' ' + Lname as [Employee Full Name] , Dname as [Department Name]
from Employee left outer join Departments
on Dno = Dnum
-- 
select fname + ' ' + Lname as [Employee Full Name] , Dname as [Department Name]
from Employee left join Departments
on Dno = Dnum
-- Right
select e.fname + ' ' + e.Lname as [Employee Full Name] , d.Dname as [Department Name]
from Employee as e right outer join Departments as d
on e.Dno = d.Dnum
-- Full
select e.fname + ' ' + e.Lname as [Employee Full Name] , d.Dname as [Department Name]
from Employee as e full outer join Departments as d
on e.Dno = d.Dnum
---------------------- 3 Table Join
select e.fname + ' ' + e.Lname as [Employee Full Name] , p.Pname , w.Hours
from Employee e , Project p , Works_for w
where e.SSN = w.ESSn and w.Pno = p.Pnumber
---------------------
------- Self Join / Recursive Join
select e.Fname + ' ' + e.Lname [Employee Name] 
, s.Fname + ' ' + s.Lname [Supervisor Name]
from Employee e , Employee s
where e.Superssn = s.SSN
