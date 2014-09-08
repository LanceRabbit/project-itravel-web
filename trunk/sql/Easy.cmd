sqlcmd -E -i DB.sql

sqlcmd -E -i Scripts/Account.sql
sqlcmd -E -i Scripts/AD.sql
sqlcmd -E -i Scripts/BlacklistRecord.sql
sqlcmd -E -i Scripts/CodeList.sql
sqlcmd -E -i Scripts/SerNoLength.sql
sqlcmd -E -i Scripts/Coupons.sql
sqlcmd -E -i Scripts/SpotDetail.sql
sqlcmd -E -i Scripts/SpotImg.sql
sqlcmd -E -i Scripts/SpotLikeRecord.sql
sqlcmd -E -i Scripts/SpotCollectRecord.sql
sqlcmd -E -i Scripts/SpotCommentRecord.sql
sqlcmd -E -i Scripts/SpotOwner.sql
sqlcmd -E -i Scripts/Trip.sql
sqlcmd -E -i Scripts/TripCollectRecord.sql
sqlcmd -E -i Scripts/TripDetail.sql
sqlcmd -E -i Scripts/TripLikeRecord.sql


sqlcmd -E -i TRIGGER/T_ACCOUNT.sql
sqlcmd -E -i TRIGGER/T_AD.sql
sqlcmd -E -i TRIGGER/T_COUPONS.sql
sqlcmd -E -i TRIGGER/T_SPOT_COMMENT_RECORD.sql
sqlcmd -E -i TRIGGER/T_SPOT_DETAIL.sql
sqlcmd -E -i TRIGGER/T_SPOT_IMG.sql
sqlcmd -E -i TRIGGER/T_SPOT_LIKE_RECORD.sql
sqlcmd -E -i TRIGGER/T_TRIP.sql
sqlcmd -E -i TRIGGER/T_TRIP_DETAIL.sql
sqlcmd -E -i TRIGGER/T_TRIP_LIKE_RECORD.sql


pause