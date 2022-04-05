CREATE TABLE [dbo].[tblNumbersClusteredTest] (
    [i] INT NULL
);


GO
CREATE CLUSTERED COLUMNSTORE INDEX [ix_CC_Numbers]
    ON [dbo].[tblNumbersClusteredTest]
    ON [Numbers003];

