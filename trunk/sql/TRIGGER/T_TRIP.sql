USE [iiiTravel]
GO

/****** Object:  Trigger [dbo].[T_TRIP]    Script Date: 2014/9/8 �U�� 07:50:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[T_TRIP] 
   ON  [dbo].[TRIP]
   INSTEAD OF INSERT
AS 
BEGIN
	SET NOCOUNT ON; -- for what???
	DECLARE @codeLength INT
	DECLARE @CODE_HEAD VARCHAR(4)
	DECLARE @yymm VARCHAR(4)
	DECLARE @SER_NO INT
	DECLARE @newSER_NO INT
	DECLARE @newTRIPId VARCHAR(11)

	-- 1.�]�w�Ψ��o�����ܼ�
	SET @yymm = SUBSTRING((convert(char(6), getdate(), 112)),3,4)
	SET @CODE_HEAD = 'T'

	-- 2.�HCODE_HEAD �hSER_LENGTH����o�Ǹ�����
	SELECT @codeLength=SER_NO_Length
	FROM SER_NO_LENGTH
	WHERE CODE_HEAD = @CODE_HEAD

	-- �Y�S�]�wSER_LENGTH, �h RAISE ERROR
	IF @codeLength IS NULL
		BEGIN
			RAISERROR(
			'Please create Code Head Length first',16,1)
			ROLLBACK TRANSACTION
		END

	-- 3.�HCODE_HEAD + YYMM �h�s�X����ثe�̤j�Ǹ�
	SELECT @SER_NO=ser_No FROM CODE_LIST
	WHERE CODE_HEAD = @CODE_HEAD
	AND yymm = @yymm

	-- CODE_LIST �S���h INSERT �@��
	IF @SER_NO IS NULL
		BEGIN
			SET @newSER_NO = 1

			INSERT INTO CODE_LIST(code_Head, yymm, SER_NO, DESCRIPTION)
						   VALUES(@CODE_HEAD, @yymm, @newSER_NO, 'TRIP')	
		END
	
	-- CODE_LIST ���h UPDATE
	ELSE
		BEGIN
			SET @newSER_NO = @SER_NO + 1

			UPDATE CODE_LIST SET SER_NO = @newSER_NO
			WHERE CODE_HEAD = @CODE_HEAD
			AND yymm = @yymm
		END
	
	-- ���o P-KEY ���X
	SET @newTRIPId = 
			@CODE_HEAD + 
			@yymm + 
			(REPLICATE('0',(@codeLength-LEN(@newSER_NO))) + RTRIM(CAST(@newSER_NO AS CHAR)) )

	--SELECT  (REPLICATE('0',(@SER_NO_LENGTH-LEN(@NEW_SER_NO))) + RTRIM(CAST(@NEW_SER_NO AS CHAR)) )
	--SELECT @NEW_COMMERCIAL_ID
	
	-- �N��Ƽg�^��TABLE
	-- �Y�쥻insert null�hinserted???
	INSERT INTO TRIP 		(TRIP_ID, 
							 TRIP_NAME, 
							 ACCOUNT_ID, 
							 TOTAL_DAY,
							 START_DATE,
							 LIKE_COUNT,
							 TEMP_TRIP_ID)
					SELECT  @newTRIPId, 
							INSERTED.TRIP_NAME, 
							INSERTED.ACCOUNT_ID,
							INSERTED.TOTAL_DAY, 
							INSERTED.START_DATE,
							INSERTED.LIKE_COUNT,
							INSERTED.TEMP_TRIP_ID
					FROM INSERTED	
END





GO


