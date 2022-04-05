set statistics time on

exec disk.up_DeleteRows

/*

SQL Server Execution Times:
   CPU time = 8329 ms,  elapsed time = 11308 ms.

   NOTHING TO DELETE
    SQL Server Execution Times:
   CPU time = 1515 ms,  elapsed time = 1408 ms.


*/

exec oltp.up_DeleteRows

/*

 SQL Server Execution Times:
   CPU time = 5673 ms,  elapsed time = 5286 ms.

   NOTHING TO DELETE - TAKES LONGER
    SQL Server Execution Times:
   CPU time = 4094 ms,  elapsed time = 4228 ms.

*/