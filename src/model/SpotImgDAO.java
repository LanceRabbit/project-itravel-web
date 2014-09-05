package model;

public interface SpotImgDAO {
	public abstract SpotImg insert(SpotImg img);
	public abstract int delete(SpotImg img);
	public abstract int deleteBySpotId(String spotId);
	public abstract SpotImg update(SpotImg img);
	public abstract SpotImg selectByImgId(String id);
	public abstract SpotImg selectBySpotId(String id);
}
