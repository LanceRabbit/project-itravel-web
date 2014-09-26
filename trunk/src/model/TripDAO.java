package model;

import java.util.List;


public interface TripDAO {
	public abstract Trip insert(Trip trip);
	public abstract int delete(Trip trip);
	public abstract Trip update(Trip trip);
	public abstract Trip select(String id);
	public abstract List<Trip> selectTopN(int num);
	public abstract List<Trip> selectByDay(int day);
}
