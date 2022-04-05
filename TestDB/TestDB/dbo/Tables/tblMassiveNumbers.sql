CREATE TABLE [dbo].[tblMassiveNumbers] (
    [Id]       BIGINT IDENTITY (1, 1) NOT NULL,
    [BITVALUE] BIT    NOT NULL
);



GO
CREATE CLUSTERED COLUMNSTORE INDEX [ClusteredColumnStoreIndex-20170402-115505]
    ON [dbo].[tblMassiveNumbers]
    ON [TenMillionNumbers] ([Id]);

