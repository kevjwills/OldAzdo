set statistics time on

upDATE [disk].[BigTable_Destination]
SET Name = 'Tomas'


update oltp.BigTable_Destination
SET Name = 'Tomas'

exec oltp.up_UpdateNames