package model;

import java.util.List;
import java.util.Set;


public interface TripDetailDAO {
	public abstract TripDetail insert(TripDetail tripDetail);
	public abstract int delete(TripDetail tripDetail);
	public abstract TripDetail update(TripDetail tripDetail);
	public abstract TripDetail selectById(String id);
	public abstract List<TripDetail> selectAllByTripId(String id);
	public abstract List<Set<TripDetail>> selectByTripId(String id);
}
