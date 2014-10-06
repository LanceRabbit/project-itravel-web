package model;

import java.util.List;
import java.util.Set;


public interface TripDetailDAO {
	public abstract TripDetail insert(TripDetail tripDetail);
	public abstract int delete(TripDetail tripDetail);
	public abstract int delete(String tripId);
	public abstract TripDetail update(TripDetail tripDetail);
	public abstract TripDetail selectByTripDetailId(String id);
	public abstract List<TripDetail> selectByTripId(String id, Integer index);
	public abstract TripDetail selectOneByTripId(String id, Integer index);
}
