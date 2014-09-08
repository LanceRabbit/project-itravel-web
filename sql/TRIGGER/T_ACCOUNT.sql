USE [iiiTravel]
GO

/****** Object:  Trigger [dbo].[T_ACCOUNT]    Script Date: 2014/9/8 �U�� 07:47:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[T_ACCOUNT] 
   ON  [dbo].[ACCOUNT]
   INSTEAD OF INSERT
AS 
BEGIN
	SET NOCOUNT ON; -- for what???
	DECLARE @codeLength INT
	DECLARE @CODE_HEAD VARCHAR(4)
	DECLARE @yymm VARCHAR(4)
	DECLARE @SER_NO INT
	DECLARE @newSER_NO INT
	DECLARE @newAccount VARCHAR(9)

	-- 1.�]�w�Ψ��o�����ܼ�
	SET @yymm = SUBSTRING((convert(char(6), getdate(), 112)),3,4)
	SELECT @CODE_HEAD = 'M'

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
						   VALUES(@CODE_HEAD, @yymm, @newSER_NO, 'ACCOUNT : '+@code_Head)	
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
	SET @newAccount = 
			@CODE_HEAD + 
			@yymm + 
			(REPLICATE('0',(@codeLength-LEN(@newSER_NO))) + RTRIM(CAST(@newSER_NO AS CHAR)) )

	--SELECT  (REPLICATE('0',(@SER_NO_LENGTH-LEN(@NEW_SER_NO))) + RTRIM(CAST(@NEW_SER_NO AS CHAR)) )
	--SELECT @NEW_COMMERCIAL_ID
	
	-- �N��Ƽg�^��TABLE
	-- �Y�쥻insert null�hinserted???
	INSERT INTO ACCOUNT (
						ACCOUNT_ID,
						EMAIL,
						PASSWORD,
						NICKNAME,
						ACCOUNT_LEVEL,
						LAST_LOGON_DT,
						IMAGE,
						BLACKLIST_LEVEL
							 )
					SELECT  @newAccount, 
							INSERTED.EMAIL, 
							INSERTED.PASSWORD,
							INSERTED.NICKNAME, 
							INSERTED.ACCOUNT_LEVEL,
							INSERTED.LAST_LOGON_DT,
							INSERTED.IMAGE, 
							INSERTED.BLACKLIST_LEVEL
					FROM INSERTED	
END





GO


