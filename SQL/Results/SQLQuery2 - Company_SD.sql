-- SQL Assignment 2
-- 1
select Dnum , Dname , Fname + ' ' + Lname as "Manager Name"
from Departments , Employee
where Departments.MGRSSN = Employee.SSN

-- 2
select Dname , Pname
from Departments d join Project p
on d.Dnum = p.Dnum

-- 3
select d.* , Fname + ' ' + Lname as [Employee Name]
from Dependent join Employee
on ESSN = SSN

-- 4
select Pnumber , Pname , Plocation , City
from Project
where City = 'cairo' or City = 'alex'

-- 5
select *
from Project
where Pname like 'A%'

-- 6
select *
from Employee
where Dno = 30 and Salary between 1000 and 2000

-- 7
select e.Fname + ' ' + e.Lname as [Full Name]
from Employee e inner join Works_for w
on e.SSN = w.ESSn join Project p
on w.Pno = p.Pnumber
and e.Dno = 30 and p.Pname = 'Pitcho american' and w.Hours >= 10

-- or

select e.Fname + ' ' + e.Lname as [Full Name]
from Employee e , Works_for w , Project p
where e.SSN = w.ESSn and w.Pno = p.Pnumber 
and e.Dno = 30 and p.Pname = 'Pitcho american' and w.Hours >= 10

-- 8
select e.Fname + ' ' + e.Lname as [Full Name]
from Employee e inner join Employee s
on e.Superssn = s.SSN
where s.Fname = 'Noha' and s.Lname = 'Mohamed'

-- 9
select Fname + ' ' + Lname as [Full Name] , Pname
from Employee join Works_for
on SSN = ESSn join Project
on Pno = Pnumber
order by Pname

-- 10
select p.Pnumber , d.Dname , e.Lname , e.Address , e.Bdate
from Employee e , Departments d , Project p
where p.City = 'Cairo' and p.Dnum = d.Dnum and d.MGRSSN = e.SSN

-- 11
-- Display All Data of the managers ( Dept. Managers or Supervisors )
select distinct m.*
from Employee m left outer join Departments d
on m.SSN = d.MGRSSN left outer join Employee e
on m.SSN = e.Superssn
where d.MGRSSN is not null or e.Superssn is not null

-- or

select s.*
from Employee e , Employee s
where e.Superssn = s.SSN

union

select e.*
from Employee e , Departments d
where e.SSN = d.MGRSSN

-- or

select distinct m.*
from Employee m , Departments d , Employee e
where m.SSN = d.MGRSSN or m.SSN = e.Superssn

-- Display All Data of the managers ( Dept. Managers and Supervisors at the same time )
select distinct m.*
from Employee m left outer join Departments d
on m.SSN = d.MGRSSN left outer join Employee e
on m.SSN = e.Superssn
where d.MGRSSN is not null and e.Superssn is not null

-- or

select s.*
from Employee e , Employee s
where e.Superssn = s.SSN

intersect

select e.*
from Employee e , Departments d
where e.SSN = d.MGRSSN

-- or

select distinct m.*
from Employee m , Departments d , Employee e
where m.SSN = d.MGRSSN and m.SSN = e.Superssn


-- Display All Data of the managers ( Dept. Managers, but not Supervisors )
select distinct m.*
from Employee m left outer join Departments d
on m.SSN = d.MGRSSN left outer join Employee e
on m.SSN = e.Superssn
where d.MGRSSN is not null and e.Superssn is null

-- or

select e.*
from Employee e , Departments d
where e.SSN = d.MGRSSN

except

select s.*
from Employee e , Employee s
where e.Superssn = s.SSN

-- Display All Data of the managers ( Supervisors, but not Dept. Managers )
select distinct m.*
from Employee m left outer join Departments d
on m.SSN = d.MGRSSN left outer join Employee e
on m.SSN = e.Superssn
where d.MGRSSN is null and e.Superssn is not null

-- or

select s.*
from Employee e , Employee s
where e.Superssn = s.SSN

except

select e.*
from Employee e , Departments d
where e.SSN = d.MGRSSN

-- 12
select *
from Employee e left outer join Dependent d
on e.SSN = d.ESSN

------------------------------------------------------------
select *
from Employee
where Salary > (select Salary
			    from Employee
			    where Fname + Lname = 'ahmedali')

------------------------------------------------------------
-- Single Row Operators ( = , != , <> , > , >= , < , <= )
-- Multi Row Operators  ( IN , ALL , ANY )
select *
from Employee
where Salary > all (select Salary
					from Employee
					where Dno = 20)
-- define:
select *
from Employee
where Salary > 750 and Salary > 1600

-------------
select *
from Employee
where Salary > any (select Salary
					from Employee
					where Dno = 20)
-- define:
select *
from Employee
where Salary > 750 or Salary > 1600

-------------