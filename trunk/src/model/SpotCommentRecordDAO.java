package model;

import java.util.List;

public interface SpotCommentRecordDAO {
	public abstract  SpotCommentRecord insert(SpotCommentRecord spotComRec);
	public abstract  int delte(SpotCommentRecord spotComRec);
	public abstract  SpotCommentRecord select(SpotCommentRecord spotComRec);
	public abstract  SpotCommentRecord selectByCommentId(String commId);
	//此景點下的所有評論
	public abstract List<SpotCommentRecord> selectBySpot(String spotId);
	public abstract boolean update(String commentId, String comment);
	
}
