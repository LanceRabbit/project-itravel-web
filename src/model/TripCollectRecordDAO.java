package model;

public interface TripCollectRecordDAO {
	 
	public abstract TripCollectRecord insert(TripCollectRecord spotRec);
	public abstract int delete(TripCollectRecord spotRec);	
	public abstract TripCollectRecord select(TripCollectRecord spotRec);
	public abstract void select(String accountId);
}
