package model;

import java.util.List;


public interface SpotDetailDAO {
	public abstract SpotDetail insert(SpotDetail spot);
	public abstract int delete(SpotDetail spot);
	public abstract SpotDetail update(SpotDetail spot);
	public abstract List<SpotDetail> selectAll();
	public abstract SpotDetail selectBySpotId(String id);	
	public abstract List<SpotDetail> selectByPageNo(int pageNo);
	public abstract List<SpotDetail> selectTopN(int num);
	
}
