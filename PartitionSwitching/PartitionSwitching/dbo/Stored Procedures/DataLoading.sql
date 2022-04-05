create proc DataLoading AS


declare @start int

select @start = ISNULL(MAX(Id), 0) + 1
from Live


;with Numbers as (SELECT @start as n
					union ALL
				SELECT n + 1
				from Numbers
				where n+1 < = @start + 100)
insert Landing
select * from Numbers
option(maxrecursion 0);

--should be a check that partitions are empty first
alter table Landing switch partition 2 to Live Partition 2;

 -- this should really be its own stored proc:

  declare @current int;

  declare @new int;

  select @current = cast([value] as INT) from sys.partition_range_values -- add where clause to specify the function and any other expected limitations
  

  select @new = MAX(Id) + 1 
  from Live
  
  alter partition scheme 
[SchemeInteger] next used [PRIMARY];

alter partition function [FunctionInteger]() split range (@new)

alter partition function [FunctionInteger]() MERGE range (@current)

