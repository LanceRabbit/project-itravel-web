USE [iiiTravel]
GO

/****** Object:  Trigger [dbo].[T_TRIP_LIKE_RECORD]    Script Date: 2014/9/8 �U�� 07:50:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[T_TRIP_LIKE_RECORD] 
   ON  [dbo].[TRIP_LIKE_RECORD]
   AFTER UPDATE, INSERT, DELETE
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @TRIP_ID VARCHAR(11)
	
	-- INSERT
	IF EXISTS(SELECT * FROM INSERTED)
	BEGIN
		SELECT @TRIP_ID = INSERTED.TRIP_ID FROM INSERTED
		UPDATE TRIP SET LIKE_COUNT = ISNULL(LIKE_COUNT,0) + 1
		WHERE TRIP_ID = @TRIP_ID
	END
	
	IF EXISTS(SELECT * FROM DELETED)
	BEGIN
		SELECT @TRIP_ID = DELETED.TRIP_ID FROM DELETED
		UPDATE TRIP SET LIKE_COUNT = LIKE_COUNT - 1
		WHERE TRIP_ID = @TRIP_ID
	END
END





GO


