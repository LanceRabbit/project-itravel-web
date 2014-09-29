package model;

public interface TripLikeRecordDAO {

	public abstract TripLikeRecord insert(TripLikeRecord TripRec);
	public abstract int delete(TripLikeRecord TripRec);	
	public abstract TripLikeRecord select(TripLikeRecord TripRec);
	public abstract void select(String accountId);
	public abstract int insert2(TripLikeRecord TripRec);
}
