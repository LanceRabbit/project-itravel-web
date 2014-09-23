package model;

import java.util.Set;

public interface SpotImgDAO {
	public abstract SpotImg insert(SpotImg img);
	public abstract int delete(SpotImg img);
	public abstract int deleteBySpotId(String spotId);
	public abstract SpotImg update(SpotImg img);
	public abstract SpotImg selectByImgId(String id);
	public abstract Set<SpotImg> selectBySpotId(String id);
	public abstract SpotImg selectOneBySpotId(String id, int index);
}
