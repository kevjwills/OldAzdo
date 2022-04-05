CREATE TABLE [SourceDb].[MyNames] (
    [PK_Int]   INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Forename] VARCHAR (30) NULL,
    [Surname]  VARCHAR (30) NULL,
    PRIMARY KEY CLUSTERED ([PK_Int] ASC)
);

