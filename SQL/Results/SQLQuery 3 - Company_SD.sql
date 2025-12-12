-------------------------
select distinct *
from Employee 
where SSN in (select distinct MGRSSN
				from Departments
				where MGRSSN is not null) or SSN in ( select distinct Superssn
													  from Employee
													  where  Superssn is not null)
-------------------------
select *
from Employee
where Salary > (select Salary
			    from Employee
			    where Fname + Lname = 'AhmedAli')
-------------------------
-- Single Row Operators ( =, !=, <> , <, <= , >, >= )
-- Multi Row Operators ( INN , ALL , ANY )
select *
from Employee
where Salary > all (select salary
					from Employee
					where Dno = 20)

select *
from Employee
where Salary > 750 and Salary > 1600
-----------------------
select *
from Employee
where Salary > any (select salary
					from Employee
					where Dno = 20)

select *
from Employee
where Salary > 750 or Salary > 1600
-----------------------
select dno , AVG(salary) average_salary
from Employee
where Dno is not null
group by dno
having MAX(Salary) > 1800
-----------------------
select COUNT(*) x , COUNT(ssn) y , count(salary) z
from Employee
-----------------------
select d.Dnum , d.Dname , MAX(e.salary) as [Maximum Salary] , AVG(salary) avg
from Departments d inner join Employee e
on d.MGRSSN = e.SSN
group by d.Dnum , d.Dname
having AVG(salary) > 1500
order by d.Dname
-----------------------
--------------------
/* Select Statment Execution Sequence:
1- from
2- where
3- group by
4- Aggregate functions
5- having
6- select ( select columns to be shown in result set ) ( distinct )
7- order by
8- Top / Limit / Row Number ( limit no. rows in result set )
*/
--------------------
--
select MAX(salary) -- 2500
	 , MIN(salary) -- 750
	 , SUM(salary) -- 11450
	 , AVG(salary) -- 11450 / 8
	 , count(salary) -- 8
	 , COUNT(*)		 -- 9
	 , count(ssn)	 -- 9
from Employee

select MAX(salary) as [Maximum Salary]
	,  MIN(salary) as [Minimum Salary]
from Employee
------------
select dno , AVG(salary)
from Employee
group by Dno
having MAX(salary) > 1800
------------
select Dname , MAX(salary) as [Maximum Salary]
from Employee join Departments
on Dno = Dnum
group by dno , Dname 
having AVG(salary) > 1200 
order by Dname
----------------------------

