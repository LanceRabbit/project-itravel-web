package model;

import java.util.List;

public interface BlacklistRecordDAO {
	public abstract BlacklistRecord insert(BlacklistRecord bRecord);
	public abstract List<BlacklistRecord> select(BlacklistRecordId id);
	
}
