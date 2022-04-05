CREATE TABLE [dbo].[tblNumbers] (
    [n] INT NOT NULL
);




GO
CREATE CLUSTERED COLUMNSTORE INDEX [ix_CC_Numbers]
    ON [dbo].[tblNumbers]
    ON [Numbers001];

