sqlcmd -E -i DB.sql

sqlcmd -E -i Scripts/Account.sql

sqlcmd -E -i Scripts/BLACKLIST.sql

sqlcmd -E -i Scripts/CODE_LIST.sql


sqlcmd -E -i Scripts/SER_NO_LENGTH.sql

sqlcmd -E -i Scripts/SPOT_DETAIL.sql
sqlcmd -E -i Scripts/SPOT_IMG.sql
sqlcmd -E -i Scripts/SPOT_LIKE_RECORD.sql
sqlcmd -E -i Scripts/SPOT_COLLECT_RECORD.sql
sqlcmd -E -i Scripts/SPOT_COMMENT_RECORD.sql
sqlcmd -E -i Scripts/SPOT_OWNER.sql
sqlcmd -E -i Scripts/AD.sql
sqlcmd -E -i Scripts/Coupons.sql
sqlcmd -E -i Scripts/TRIP.sql
sqlcmd -E -i Scripts/TRIP_COLLECT_RECORD.sql
sqlcmd -E -i Scripts/TRIP_DETAIL.sql
sqlcmd -E -i Scripts/TRIP_LIKE_RECORD.sql


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