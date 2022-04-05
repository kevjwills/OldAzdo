-- CTE's - what's wrong with these?

use tempdb

;WITH x as (

select * 
from sys.tables
order by name
)

Select * from x


--;WITH x as (

--select ROW_NUMBER()OVER() ORDER BY (SELECT NULL)
--from sys.tables
--)

--Select * from x

