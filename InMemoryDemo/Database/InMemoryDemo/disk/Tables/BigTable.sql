CREATE TABLE [disk].[BigTable] (
    [Id]         INT              IDENTITY (1, 1) NOT NULL,
    [GuidColumn] UNIQUEIDENTIFIER NOT NULL default newsequentialid(),
    [Name]       VARCHAR (50)     NULL,
    PRIMARY KEY NONCLUSTERED ([Id] ASC) ON [disk]
) ON [disk];

