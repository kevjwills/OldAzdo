declare @i int = 1
while @i <= 100
begin


while exists(select * FROM [SSISDB].[catalog].[executions]
where end_time is null)
begin
continue;
end


Declare @execution_id bigint
EXEC [SSISDB].[catalog].[create_execution] @package_name=N'SQL.dtsx', @execution_id=@execution_id OUTPUT, @folder_name=N'msdb', @project_name=N'JSON', @use32bitruntime=False, @reference_id=Null, @runinscaleout=False
--Select @execution_id
DECLARE @var0 smallint = 1
EXEC [SSISDB].[catalog].[set_execution_parameter_value] @execution_id,  @object_type=50, @parameter_name=N'LOGGING_LEVEL', @parameter_value=@var0
EXEC [SSISDB].[catalog].[start_execution] @execution_id

set @i +=1


end

