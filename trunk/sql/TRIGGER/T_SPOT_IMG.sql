USE [iiiTravel]
GO

/****** Object:  Trigger [dbo].[T_SPOT_IMG]    Script Date: 2014/9/8 �U�� 07:49:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[T_SPOT_IMG] 
   ON  [dbo].[SPOT_IMG]
   INSTEAD OF INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @codeLength INT
	DECLARE @codeHead VARCHAR(4)
	DECLARE @yymm VARCHAR(4)
	DECLARE @serNo INT
	DECLARE @newSerNo INT
	DECLARE @newImgId VARCHAR(10)

	-- 1.�]�w�Ψ��o�����ܼ�
	SET @yymm = SUBSTRING((convert(char(6), getdate(), 112)),3,4)
	SET @codeHead = 'I'

	-- 2.�HCODE_HEAD �hSER_LENGTH����o�Ǹ�����
	SELECT @codeLength=SER_NO_LENGTH
	FROM SER_NO_LENGTH
	WHERE code_Head = @codeHead

	-- �Y�S�]�wSER_LENGTH, �h RAISE ERROR
	IF @codeLength IS NULL
		BEGIN
			RAISERROR(
			'Please create Code Head Length first',16,1)
			ROLLBACK TRANSACTION
		END

	-- 3.�HCODE_HEAD + YYMM �h�s�X����ثe�̤j�Ǹ�
	SELECT @serNo=ser_No FROM CODE_LIST
	WHERE code_Head = @codeHead
	AND yymm = @yymm

	-- CODE_LIST �S���h INSERT �@��
	IF @serNo IS NULL
		BEGIN
			SET @newSerNo = 1

			INSERT INTO CODE_LIST(code_Head, yymm, ser_No, DESCRIPTION)
						   VALUES(@codeHead, @yymm, @newSerNo, 'Spot Image')	
		END
	
	-- CODE_LIST ���h UPDATE
	ELSE
		BEGIN
			SET @newSerNo = @serNo + 1

			UPDATE CODE_LIST SET ser_No = @newSerNo
			WHERE code_Head = @codeHead
			AND yymm = @yymm
		END
	
	-- ���o P-KEY ���X
	SET @newImgId = 
			@codeHead + 
			@yymm + 
			(REPLICATE('0',(@codeLength-LEN(@newSerNo))) + RTRIM(CAST(@newSerNo AS CHAR)) )

	--SELECT  (REPLICATE('0',(@SER_NO_LENGTH-LEN(@NEW_SER_NO))) + RTRIM(CAST(@NEW_SER_NO AS CHAR)) )
	--SELECT @NEW_COMMERCIAL_ID
	
	-- �N��Ƽg�^��TABLE
	INSERT INTO SPOT_IMG (img_Id, 
							spot_Id, 
							spot_Img,
							TEMP_IMG_ID)
					SELECT  @newImgId, 
							INSERTED.spot_Id, 
							INSERTED.spot_Img,
							INSERTED.TEMP_IMG_ID
					FROM INSERTED	
END




GO


