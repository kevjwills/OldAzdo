CREATE TABLE [DW].[Dim_People] (
    [sk_PersonID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [nk_PersonID] INT          NOT NULL,
    [Forename]    VARCHAR (30) NOT NULL,
    [Surname]     VARCHAR (30) NOT NULL,
    [StartDate]   DATE         NOT NULL,
    [EndDate]     DATE         NULL,
    [CurrentFlag] BIT          DEFAULT ((1)) NULL,
    [LastUpdate]  DATETIME     NULL,
    [IsDeleted]   BIT          NULL,
    CONSTRAINT [PK_Dim_People] PRIMARY KEY CLUSTERED ([sk_PersonID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ix_NaturalKey]
    ON [DW].[Dim_People]([nk_PersonID] ASC);

