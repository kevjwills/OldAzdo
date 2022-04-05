CREATE TABLE [dbo].[TableOfJSON] (
    [Id]      INT            IDENTITY (1, 1) NOT NULL,
    [TheJson] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

