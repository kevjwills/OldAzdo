set statistics  time on
set statistics io off
declare @Number INT = rand() * 1000.0

--select @Number

exec disk.up_DeleteRandomRows @Number = @Number

exec oltp.up_DeleteRandomRows @Number = @Number

