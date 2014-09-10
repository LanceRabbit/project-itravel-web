package model;

import java.util.List;


public interface SpotDetailDAO {
	public abstract SpotDetail insert(SpotDetail spot);
	public abstract int delete(SpotDetail spot);
	public abstract SpotDetail update(SpotDetail spot);
	public abstract SpotDetail select(String id);
	
	public abstract List<SpotDetail> select(int pageNo);
}
