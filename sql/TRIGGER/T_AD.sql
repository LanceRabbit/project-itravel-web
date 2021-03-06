USE [iiiTravel]
GO

/****** Object:  Trigger [dbo].[T_AD]    Script Date: 2014/9/8 下午 07:48:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[T_AD] 
   ON  [dbo].[AD]
   INSTEAD OF INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @SER_NO_LENGTH INT
	DECLARE @CODE_HEAD VARCHAR(4)
	DECLARE @YYMM VARCHAR(4)
	DECLARE @SER_NO INT
	DECLARE @NEW_SER_NO INT
	DECLARE @NEW_AD_ID VARCHAR(8)

	-- 1.設定或取得相關變數
	SET @YYMM = SUBSTRING((convert(char(6), getdate(), 112)),3,4)
	SET @CODE_HEAD = 'D'

	-- 2.以CODE_HEAD 去SER_LENGTH表取得序號長度
	SELECT @SER_NO_LENGTH=SER_NO_LENGTH
	FROM SER_NO_LENGTH 
	WHERE CODE_HEAD = @CODE_HEAD

	-- 若沒設定SER_LENGTH, 則 RAISE ERROR
	IF @SER_NO_LENGTH IS NULL
		BEGIN
			RAISERROR(
			'Please create Code Head Length first',16,1)
			ROLLBACK TRANSACTION
		END

	-- 3.以CODE_HEAD + YYMM 去編碼表取目前最大序號
	SELECT @SER_NO=SER_NO FROM CODE_LIST
	WHERE CODE_HEAD = @CODE_HEAD
	AND YYMM = @YYMM

	-- CODE_LIST 沒有則 INSERT 一筆
	IF @SER_NO IS NULL
		BEGIN
			SET @NEW_SER_NO = 1

			INSERT INTO CODE_LIST(CODE_HEAD, YYMM, SER_NO, DESCRIPTION)
						   VALUES(@CODE_HEAD, @YYMM, @NEW_SER_NO, 'AD')	
		END
	
	-- CODE_LIST 有則 UPDATE
	ELSE
		BEGIN
			SET @NEW_SER_NO = @SER_NO + 1

			UPDATE CODE_LIST SET SER_NO = @NEW_SER_NO
			WHERE CODE_HEAD = @CODE_HEAD
			AND YYMM = @YYMM
		END
	
	-- 取得 P-KEY 號碼
	SET @NEW_AD_ID = 
			@CODE_HEAD + 
			@YYMM + 
			(REPLICATE('0',(@SER_NO_LENGTH-LEN(@NEW_SER_NO))) + RTRIM(CAST(@NEW_SER_NO AS CHAR)) )

	--SELECT  (REPLICATE('0',(@SER_NO_LENGTH-LEN(@NEW_SER_NO))) + RTRIM(CAST(@NEW_SER_NO AS CHAR)) )
	--SELECT @NEW_COMMERCIAL_ID
	
	-- 將資料寫回原TABLE
	INSERT INTO AD (AD_ID, 
					SPOT_ID, 
					AD_IMG, 
					VALID_DAY,
					TEMP_AD_ID)
			SELECT  @NEW_AD_ID, 
					INSERTED.SPOT_ID, 
					INSERTED.AD_IMG,
					INSERTED.VALID_DAY,
					INSERTED.TEMP_AD_ID
			   FROM INSERTED	
END





GO


