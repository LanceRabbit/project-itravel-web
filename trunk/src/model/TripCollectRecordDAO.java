package model;

import java.util.List;

public interface TripCollectRecordDAO {
	 
	public abstract TripCollectRecord insert(TripCollectRecord spotRec);
	public abstract int delete(TripCollectRecord spotRec);	
	public abstract TripCollectRecord select(TripCollectRecord spotRec);
	public abstract void select(String accountId);
	public abstract int insert2(TripCollectRecord spotRec);
	public abstract List<TripCollectRecord> selectListByAccountId(String accountId);
}
