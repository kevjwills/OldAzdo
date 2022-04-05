CREATE TABLE [disk].[BigTable_Destination] (
    [Id]         INT              NOT NULL,
    [GuidColumn] UNIQUEIDENTIFIER NOT NULL default newsequentialid(),
    [Name]       VARCHAR (50)     NULL,
    PRIMARY KEY NONCLUSTERED ([Id] ASC) ON [disk]
) ON [disk];

