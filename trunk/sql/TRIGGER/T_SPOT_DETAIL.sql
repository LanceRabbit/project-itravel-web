USE [iiiTravel]
GO

/****** Object:  Trigger [dbo].[T_SPOT_DETAIL]    Script Date: 2014/9/8 下午 07:49:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[T_SPOT_DETAIL] 
   ON  [dbo].[SPOT_DETAIL]
   INSTEAD OF INSERT
AS 
BEGIN
	SET NOCOUNT ON; -- for what???
	DECLARE @codeLength INT
	DECLARE @CODE_HEAD VARCHAR(4)
	DECLARE @yymm VARCHAR(4)
	DECLARE @SER_NO INT
	DECLARE @newSER_NO INT
	DECLARE @newSpotId VARCHAR(11)

	-- 1.設定或取得相關變數
	SET @yymm = SUBSTRING((convert(char(6), getdate(), 112)),3,4)
	SELECT @CODE_HEAD = INSERTED.SUBCATEGORY_ID FROM INSERTED

	-- 2.以CODE_HEAD 去SER_LENGTH表取得序號長度
	SET @codeLength=4
/*	SELECT @codeLength=SER_NO_Length
	FROM SER_NO_LENGTH
	WHERE CODE_HEAD = @CODE_HEAD
	*/

	-- 若沒設定SER_LENGTH, 則 RAISE ERROR
	IF @codeLength IS NULL
		BEGIN
			RAISERROR(
			'Please create Code Head Length first',16,1)
			ROLLBACK TRANSACTION
		END

	-- 3.以CODE_HEAD + YYMM 去編碼表取目前最大序號
	SELECT @SER_NO=ser_No FROM CODE_LIST
	WHERE CODE_HEAD = @CODE_HEAD
	AND yymm = @yymm

	-- CODE_LIST 沒有則 INSERT 一筆
	IF @SER_NO IS NULL
		BEGIN
			SET @newSER_NO = 1

			INSERT INTO CODE_LIST(code_Head, yymm, SER_NO, DESCRIPTION)
						   VALUES(@CODE_HEAD, @yymm, @newSER_NO, 'SPOT_DETAIL : '+@code_Head)	
		END
	
	-- CODE_LIST 有則 UPDATE
	ELSE
		BEGIN
			SET @newSER_NO = @SER_NO + 1

			UPDATE CODE_LIST SET SER_NO = @newSER_NO
			WHERE CODE_HEAD = @CODE_HEAD
			AND yymm = @yymm
		END
	
	-- 取得 P-KEY 號碼
	SET @newSpotId = 
			@CODE_HEAD + 
			@yymm + 
			(REPLICATE('0',(@codeLength-LEN(@newSER_NO))) + RTRIM(CAST(@newSER_NO AS CHAR)) )

	--SELECT  (REPLICATE('0',(@SER_NO_LENGTH-LEN(@NEW_SER_NO))) + RTRIM(CAST(@NEW_SER_NO AS CHAR)) )
	--SELECT @NEW_COMMERCIAL_ID
	
	-- 將資料寫回原TABLE
	-- 若原本insert null則inserted???
	INSERT INTO SPOT_DETAIL (SPOT_ID, 
							 ACCOUNT_ID, 
							 LEADER, 
							 SPOT_NAME,
							 CITY_ID,
							 address,
							 phone,
							 longitude,
							 latitude,
							 SPOT_INTRO,
							 CATEGORY_ID,
							 SUBCATEGORY_ID,
							 LIKE_COUNT,
							 TEMP_SPOT_ID)
					SELECT  @newSpotId, 
							INSERTED.ACCOUNT_ID, 
							INSERTED.leader,
							INSERTED.SPOT_NAME, 
							INSERTED.CITY_ID,
							INSERTED.address,
							INSERTED.phone, 
							INSERTED.longitude,
							INSERTED.latitude, 
							INSERTED.SPOT_INTRO,
							INSERTED.CATEGORY_ID,
							INSERTED.SUBCATEGORY_ID,
							INSERTED.LIKE_COUNT,
							INSERTED.TEMP_SPOT_ID
					FROM INSERTED	
END




GO


