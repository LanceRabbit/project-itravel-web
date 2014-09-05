package model;


public interface TripDAO {
	public abstract Trip insert(Trip trip);
	public abstract int delete(Trip trip);
	public abstract Trip update(Trip trip);
	public abstract Trip select(String id);
}
