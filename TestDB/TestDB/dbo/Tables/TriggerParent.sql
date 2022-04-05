CREATE TABLE [dbo].[TriggerParent] (
    [Id] INT IDENTITY (1, 1) NOT NULL,
    [TextValue] NCHAR(10) NOT NULL, 
    CONSTRAINT PK_ParentTrigger PRIMARY KEY CLUSTERED ([Id] ASC)
);



GO
-- =============================================
-- Author:		Kev Williams
-- Create date: 19/09/2016
-- Description:	
-- =============================================
CREATE TRIGGER dbo.trg_InsertChild 
   ON  dbo.TriggerParent 
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(SELECT * FROM deleted)

	INSERT INTO TriggerDeleted
	SELECT * FROM (
	DELETE FROM TriggerChild
	output deleted.*
	WHERE ParentID = (SELECT deleted.Id FROM deleted where Id = ParentID)
	) AS d

	ELSE

	INSERT INTO dbo.TriggerChild(ParentID, DateAdded)
	SELECT Id, GETDATE() from inserted



END