package model;

import java.util.List;

public interface SpotCollectRecordDAO {
	public abstract  SpotCollectRecord insert(SpotCollectRecord spotColRec);
	public abstract  int insert2(SpotCollectRecord spotColRec);
	public abstract int delete(SpotCollectRecord spotColRec);
	public abstract SpotCollectRecord select(SpotCollectRecord spotColRec);
	public abstract boolean selectByAccount(String accountId);
	public abstract List<SpotCollectRecord> selectListByAccountId(String accountId);
	
}
