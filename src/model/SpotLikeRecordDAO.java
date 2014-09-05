package model;

public interface SpotLikeRecordDAO {
	 
	public abstract SpotLikeRecord insert(SpotLikeRecord spotRec);
	public abstract int delete(SpotLikeRecord spotRec);	
	public abstract SpotLikeRecord select(SpotLikeRecord spotRec);
	public abstract void select(String accountId);
}
