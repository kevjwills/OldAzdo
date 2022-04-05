set statistics time on

exec disk.up_InsertTenPercent
/*
 SQL Server Execution Times:
   CPU time = 6751 ms,  elapsed time = 6850 ms.

    SQL Server Execution Times:
   CPU time = 6734 ms,  elapsed time = 6259 ms.

    SQL Server Execution Times:
   CPU time = 7156 ms,  elapsed time = 6861 ms.

*/


exec oltp.up_InsertTenPercent

/*
SQL Server Execution Times:
   CPU time = 3578 ms,  elapsed time = 4807 ms.

    SQL Server Execution Times:
   CPU time = 2156 ms,  elapsed time = 2264 ms.

   
 SQL Server Execution Times:
   CPU time = 2125 ms,  elapsed time = 2360 ms.

*/