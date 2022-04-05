CREATE TABLE [oltp].[BigTable_Destination] (
    [Id]         INT              NOT NULL,
    [GuidColumn] UNIQUEIDENTIFIER NOT NULL default newsequentialid(),
    [Name]       VARCHAR (50)     NULL,
    PRIMARY KEY NONCLUSTERED ([Id] ASC) 
) WITH (MEMORY_OPTIMIZED=ON, DUrability=schema_and_data)

