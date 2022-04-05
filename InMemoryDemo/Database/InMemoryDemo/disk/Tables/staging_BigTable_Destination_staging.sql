CREATE TABLE [disk].[staging_BigTable_Destination_staging] (
    [Id]         INT              NOT NULL,
    [GuidColumn] UNIQUEIDENTIFIER NOT NULL,
    [Name]       VARCHAR (50)     NULL,
    CONSTRAINT [staging_PK] PRIMARY KEY NONCLUSTERED ([Id] ASC) ON [disk],
    CONSTRAINT [chk_staging_BigTable_Destination_20170917-091030_partition_1] CHECK ([Id]<=N'1000000')
) ON [InMem] ([Id]);

