package model;

public interface SpotCommentRecordDAO {
	public abstract  SpotCommentRecord insert(SpotCommentRecord spotComRec);
	public abstract  SpotCommentRecord delte(String commId);
	public abstract  SpotCommentRecord select(SpotCommentRecord spotComRec);
	//此景點下的所有評論
	public abstract SpotCommentRecord selectBySpot(String spotId);
	
	
}
