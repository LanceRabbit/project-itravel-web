package model;

import java.util.List;

public interface AdDAO {
	public abstract Ad insert(Ad ad);

	public abstract int delete(Ad ad);

	public abstract Ad update(Ad ad);

	public abstract Ad selectById(String id);
	
	public abstract List<Ad> selectTopN(int num);
	
}
