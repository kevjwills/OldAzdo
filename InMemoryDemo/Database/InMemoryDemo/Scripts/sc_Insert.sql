set statistics time on;

exec disk.up_InsertIntoBigTableDestination

/*

 --SQL Server Execution Times:
 --  CPU time = 72436 ms,  elapsed time = 79409 ms.
 SQL Server Execution Times:
   CPU time = 79906 ms,  elapsed time = 87156 ms.
    SQL Server Execution Times:
   CPU time = 80048 ms,  elapsed time = 86115 ms.


*/
exec.oltp.up_InsertIntoBigTableDestination

/*
 --SQL Server Execution Times:
 --  CPU time = 35766 ms,  elapsed time = 39226 ms.

 SQL Server Execution Times:
   CPU time = 25203 ms,  elapsed time = 28764 ms.

    SQL Server Execution Times:
   CPU time = 24797 ms,  elapsed time = 31080 ms.

 */

exec oltp.up_InsertIntoBigTableDestination_Native

/*
 --SQL Server Execution Times:
 --  CPU time = 18531 ms,  elapsed time = 24093 ms.

  SQL Server Execution Times:
   CPU time = 18469 ms,  elapsed time = 23533 ms.


    SQL Server Execution Times:
   CPU time = 18109 ms,  elapsed time = 22463 ms.
*/

 --select 24093.0/79409