CREATE proc [dbo].[spTypeTwoInsert]
as
set nocount on
INSERT INTO DW.Dim_People(nk_PersonID
							, Forename
							, Surname
							, StartDate
							, EndDate
							, CurrentFlag
							,LastUpdate
							,IsDeleted)
SELECT PK_Int
			, Forename
			, Surname
			, StartDate
			, EndDate
			, CurrentFlag
			,LastUpdate
			,IsDeleted 
FROM
 ( MERGE DW.Dim_People CM
 USING SourceDb.MyNames CS
 ON (CM.nk_PersonID = CS.PK_Int)
 --Brand new Natural Keys, add new records
 WHEN NOT MATCHED THEN
 INSERT VALUES (CS.PK_Int
				, CS.Forename
				, CS.Surname
				, getDate() --StartDate
				, convert(date,'21991212') --EndDate
				, 1 --CurrentFlag
				, GetDate() --LastUpdate
				,0 --IsDeleted
								)
--Deleted in original system, so mark as deleted and update end dates
when not matched by source then 
update set CurrentFlag = 0, EndDate = GetDate() -1, LastUpdate = GetDate(), IsDeleted = 1

--If current match and either surname or forename have changed then update the old record
 WHEN MATCHED AND CM.CurrentFlag = 1
 AND (CM.Surname <> CS.Surname or CM.Forename <> CS.Forename ) THEN
 UPDATE SET CM.CurrentFlag = 0, CM.EndDate = getdate() - 1, CM.LastUPdate = getdate()
 --This becomes the output for the Insert statement above
 OUTPUT $Action Action_Out, CS.Pk_Int, CS.Forename, CS.Surname, convert(date,getdate()) StartDate, '21991212' as EndDate, 1 as CurrentFlag, GetDate() as LastUpdate, 0 as IsDeleted
 
 ) AS MERGE_OUT
 WHERE MERGE_OUT.Action_Out = 'UPDATE' 
	--don't return the deleted records for insert
	and MERGE_OUT.PK_Int is not null;

 