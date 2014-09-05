package model;

public interface SpotCollectRecordDAO {
	public abstract  SpotCollectRecord insert(SpotCollectRecord spotColRec);
	public abstract int delete(SpotCollectRecord spotColRec);
	public abstract SpotCollectRecord select(SpotCollectRecord spotColRec);
	
	
}
