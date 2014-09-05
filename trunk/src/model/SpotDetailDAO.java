package model;


public interface SpotDetailDAO {
	public abstract SpotDetail insert(SpotDetail spot);
	public abstract int delete(SpotDetail spot);
	public abstract SpotDetail update(SpotDetail spot);
	public abstract SpotDetail select(String id);
}
