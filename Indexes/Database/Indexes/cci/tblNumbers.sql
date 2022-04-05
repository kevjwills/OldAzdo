CREATE TABLE [cci].[tblNumbers_CCI]
(
	[n] INT NOT NULL, 
    [GUIDValue] VARCHAR(36) NOT NULL
)
--on cci;
GO
CREATE CLUSTERED COLUMNSTORE INDEX ix_CCI on cci.tblNumbers_CCI on ncci