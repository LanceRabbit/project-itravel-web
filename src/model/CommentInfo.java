package model;

public class CommentInfo {
	private static final long serialVersionUID = 1L;
	
	private String commentId;
	private String commenterId;
	private String commenterNickname;
	private String comment;
	private String creationDate;
	
	public CommentInfo() {
	}
	
	public CommentInfo(SpotCommentRecord comment) {
		this.commentId = comment.getCommentId();
		this.commenterId = comment.getAccountId();
		this.comment = comment.getComment();
		this.creationDate = comment.getCmtDt().toString();
	}
	
	// getter and setter
	public String getCommentId() {
		return commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}
	
	public String getCommenterId() {
		return commenterId;
	}

	public void setCommenterId(String commenterId) {
		this.commenterId = commenterId;
	}

	public String getCommenterNickname() {
		return commenterNickname;
	}

	public void setCommenterNickname(String commenterNickname) {
		this.commenterNickname = commenterNickname;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}

}
