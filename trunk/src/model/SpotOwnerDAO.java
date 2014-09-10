package model;

import java.util.List;

public interface SpotOwnerDAO {
	public abstract SpotOwner insert(SpotOwner spotOwner);
	public abstract SpotOwner update(SpotOwner spotOwner);
	public abstract SpotOwner selectById(String id);
	public abstract List<SpotOwner> selectAll();
	public abstract int delete(String id);
}
