package model;

import java.util.List;

public interface AdDAO {
	public abstract Ad insert(Ad ad);

	public abstract int delete(Ad ad);

	public abstract Ad update(Ad ad);

	public abstract List<Ad> selectBySpotId(String spotid);
	
	public abstract List<Ad> selectByAccountId(String accountid);
	
	public abstract List<Ad> selectTopN(int num);
	
	public abstract java.util.Date addDate(java.util.Date now, int day);
	
}
