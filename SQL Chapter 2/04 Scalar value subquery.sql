declare @SomeDates TABLE(MyDate Date)

;with DatesLoop as (SELECT CAST('19000101' AS DATE) AS MyDate
						UNION ALL
					SELECT DATEADD(d, 1, MyDate) 
					from DatesLoop
					WHERE DATEADD(d, 1, MyDate) < GETDATE())
insert @SomeDates(MyDate)
Select * FROM DatesLoop
option (maxrecursion 0)

delete from @SomeDates
where day(MyDate) = 31

select * 
from @SomeDates
where MyDate <=  (Select MAX(MyDate) FROM @SomeDates  where MyDate between '20170801' and '20170831')
order by 1 desc