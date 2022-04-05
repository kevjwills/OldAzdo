CREATE TABLE [idx].[tblNumbers_RowStore]
(
	[n] INT NOT NULL, 
    [GUIDValue] VARCHAR(36) NOT NULL 
)
--on idx;
GO
CREATE CLUSTERED INDEX ix_RowStore on idx.tblNumbers_RowStore(n) on idx
GO
CREATE NONCLUSTERED INDEX ix_GUIDRowStore on idx.tblNumbers_RowStore(GUIDValue);