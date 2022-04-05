/****** Script for SelectTopNRows command from SSMS  ******/
SELECT package_name
		,avg(DATEDIFF(millisecond, start_time, end_time)) as AvgTimeInMilliseconds
		,count(*) AS Runs
		,MIN(DATEDIFF(millisecond, start_time, end_time)) AS MinTime
		,MAX(DATEDIFF(millisecond, start_time, end_time)) AS MaxTime
		,max(start_time)
  FROM [SSISDB].[catalog].[executions]
  where package_name in ('SQL.dtsx', 'cSharp.dtsx')
  and cast(start_time as datetime) >'20180624 14:55:00'
  group by package_name