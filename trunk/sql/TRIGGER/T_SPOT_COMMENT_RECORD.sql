USE [iiiTravel]
GO

/****** Object:  Trigger [dbo].[T_SPOT_COMMENT_RECORD]    Script Date: 2014/9/8 �U�� 07:48:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[T_SPOT_COMMENT_RECORD] 
   ON  [dbo].[SPOT_COMMENT_RECORD]
   INSTEAD OF INSERT
AS 
BEGIN
	SET NOCOUNT ON; -- for what???
	DECLARE @codeLength INT
	DECLARE @CODE_HEAD VARCHAR(4)
	DECLARE @yymm VARCHAR(4)
	DECLARE @SER_NO INT
	DECLARE @newSER_NO INT
	DECLARE @newCmdRecId VARCHAR(12)

	-- 1.�]�w�Ψ��o�����ܼ�
	SET @yymm = SUBSTRING((convert(char(6), getdate(), 112)),3,4)
	SELECT @CODE_HEAD = 'CMT'

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
						   VALUES(@CODE_HEAD, @yymm, @newSER_NO, 'SPOT_DETAIL : '+@code_Head)	
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
	SET @newCmdRecId = 
			@CODE_HEAD + 
			@yymm + 
			(REPLICATE('0',(@codeLength-LEN(@newSER_NO))) + RTRIM(CAST(@newSER_NO AS CHAR)) )

	--SELECT  (REPLICATE('0',(@SER_NO_LENGTH-LEN(@NEW_SER_NO))) + RTRIM(CAST(@NEW_SER_NO AS CHAR)) )
	--SELECT @NEW_COMMERCIAL_ID
	
	-- �N��Ƽg�^��TABLE
	-- �Y�쥻insert null�hinserted???
	INSERT INTO SPOT_COMMENT_RECORD (
							 COMMENT_ID, 
							 ACCOUNT_ID, 
							 SPOT_ID, 
							 COMMENT,
							 CMT_DT,
							 TEMP_COMMENT_ID
							 )
					SELECT  @newCmdRecId, 
							INSERTED.ACCOUNT_ID, 
							INSERTED.SPOT_ID,
							INSERTED.COMMENT, 
							INSERTED.CMT_DT,
							INSERTED.TEMP_COMMENT_ID
					FROM INSERTED	
END




GO


