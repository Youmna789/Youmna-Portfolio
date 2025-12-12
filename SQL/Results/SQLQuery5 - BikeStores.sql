--------- their first name starts with a or m
select *
from sales.customers
where first_name like 'a%'
or first_name like 'm%'
-- or
select *
from sales.customers
where first_name like '[am]%'
--------- their first name starts with k or l or m or n or o
select *
from sales.customers
where first_name like '[k-o]%'
--------------
select concat (first_name , ' ' , last_name )
	, UPPER(first_name) 
	, LOWER(last_name)
from sales.customers
-----
select email , LEN(email) [No. Characters]
from sales.customers
-----
select product_name 
, SUBSTRING(product_name , LEN(product_name) - 4 + 1 , 4 ) [Year of Production]
from production.products

select phone 
, CHARINDEX('-' , phone , 1 )
, SUBSTRING(phone , CHARINDEX('-' , phone , 1 ) + 1 , 4 )
from sales.stores
--- extract category type , bike type
select category_name 
, LEFT( category_name , CHARINDEX(' ' , category_name , 1 ) - 1 ) [Category Type]
, RIGHT( category_name , LEN(category_name) - CHARINDEX(' ' , category_name , 1 )) [Bike Type]
from production.categories
--------------
select TRIM( '     Ahmed    Ali     Ahmed          Mohamed       ')
select REVERSE('Ahmed Ali')
select phone , ISNULL(phone , '5555' )
from sales.customers

select * , REPLACE(state , 'NY' , 'New York')
from sales.customers

select * , case when state = 'NY' then 'New York'
				when state = 'CA' then 'California'
				when state = 'TX' then 'Texas' 
				end as [State Name]
		 , case when state = 'NY' then 'New York'
				when state = 'CA' then 'California'
				else 'Texas' 
				end "State Name"
from sales.customers
--------------
-- Get First Name , Last Name , Full Name in Initial Cap letters
-- , Username , Domain Name , Extension from email column

select email
	, CHARINDEX('.' , email , 1) [. Index]
	, LEFT(email , CHARINDEX('.' , email , 1) - 1 ) [first name]
	, UPPER(left(LEFT(email , CHARINDEX('.' , email , 1) - 1 ) , 1  )) [First Letter of First Name]
	, lower(SUBSTRING(LEFT(email , CHARINDEX('.' , email , 1) - 1 ) , 2 , LEN(LEFT(email , CHARINDEX('.' , email , 1) - 1 )) - 1 )) [Rest Letters of First Name]
	, CONCAT(UPPER(left(LEFT(email , CHARINDEX('.' , email , 1) - 1 ) , 1  )) , lower(SUBSTRING(LEFT(email , CHARINDEX('.' , email , 1) - 1 ) , 2 , LEN(LEFT(email , CHARINDEX('.' , email , 1) - 1 )) - 1 ))) [First Name]
	, SUBSTRING(email , CHARINDEX('.' , email , 1) + 1 , CHARINDEX('@' , email , 1) - CHARINDEX('.' , email , 1) - 1 ) [last name]
	, UPPER(LEFT(SUBSTRING(email , CHARINDEX('.' , email , 1) + 1 , CHARINDEX('@' , email , 1) - CHARINDEX('.' , email , 1) - 1 ) , 1 )) [First Letter of Last Name]
	, LOWER(SUBSTRING(SUBSTRING(email , CHARINDEX('.' , email , 1) + 1 , CHARINDEX('@' , email , 1) - CHARINDEX('.' , email , 1) - 1 ) , 2 , LEN(SUBSTRING(email , CHARINDEX('.' , email , 1) + 1 , CHARINDEX('@' , email , 1) - CHARINDEX('.' , email , 1) - 1 )) - 1 )) [Rest Letters of Last Name]
	, CONCAT(UPPER(LEFT(SUBSTRING(email , CHARINDEX('.' , email , 1) + 1 , CHARINDEX('@' , email , 1) - CHARINDEX('.' , email , 1) - 1 ) , 1 )) , LOWER(SUBSTRING(SUBSTRING(email , CHARINDEX('.' , email , 1) + 1 , CHARINDEX('@' , email , 1) - CHARINDEX('.' , email , 1) - 1 ) , 2 , LEN(SUBSTRING(email , CHARINDEX('.' , email , 1) + 1 , CHARINDEX('@' , email , 1) - CHARINDEX('.' , email , 1) - 1 )) - 1 ))) [Last Name]
	, CONCAT( CONCAT(UPPER(left(LEFT(email , CHARINDEX('.' , email , 1) - 1 ) , 1  )) , lower(SUBSTRING(LEFT(email , CHARINDEX('.' , email , 1) - 1 ) , 2 , LEN(LEFT(email , CHARINDEX('.' , email , 1) - 1 )) - 1 ))) , ' ' , CONCAT(UPPER(LEFT(SUBSTRING(email , CHARINDEX('.' , email , 1) + 1 , CHARINDEX('@' , email , 1) - CHARINDEX('.' , email , 1) - 1 ) , 1 )) , LOWER(SUBSTRING(SUBSTRING(email , CHARINDEX('.' , email , 1) + 1 , CHARINDEX('@' , email , 1) - CHARINDEX('.' , email , 1) - 1 ) , 2 , LEN(SUBSTRING(email , CHARINDEX('.' , email , 1) + 1 , CHARINDEX('@' , email , 1) - CHARINDEX('.' , email , 1) - 1 )) - 1 )))) [Full Name]
	, LEFT(email , CHARINDEX('@' , email , 1) - 1 ) [Username]
	, RIGHT(email , len(email) - CHARINDEX('@' , email , 1))
	, LEFT(RIGHT(email , len(email) - CHARINDEX('@' , email , 1)) , CHARINDEX('.' , RIGHT(email , len(email) - CHARINDEX('@' , email , 1)) , 1) - 1 ) [Domain Name 1]
	, SUBSTRING(email , CHARINDEX('@' , email , 1 ) + 1 , charindex('.' , email , CHARINDEX('@' , email , 1 )) - CHARINDEX('@' , email , 1 ) - 1 )	  [Domain Name 2]
	, RIGHT(email , len(email) - charindex('.' , email , CHARINDEX('@' , email , 1 ))) [Extension]
from sales.customers



