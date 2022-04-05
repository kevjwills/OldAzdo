CREATE TABLE [ncci].[tblNumbers_NCCI]
(
	[n] INT NOT NULL, 
    [GUIDValue] VARCHAR(36) NOT NULL, 
    CONSTRAINT [PK_tblNumbers_NCCI] PRIMARY KEY ([n])
)
on ncci;
GO
CREATE NONCLUSTERED COLUMNSTORE INDEX ix_NCCI on ncci.tblNumbers_NCCI(GUIDValue)

