package model;

// Generated 2014/9/2 �U�� 08:47:27 by Hibernate Tools 4.0.0

/**
 * SpotCommentRecordId generated by hbm2java
 */
public class SpotCommentRecordId implements java.io.Serializable {

	private String commentId;
	private String accountId;
	private String spotId;

	public SpotCommentRecordId() {
	}

	public SpotCommentRecordId(String commentId, String accountId, String spotId) {
		this.commentId = commentId;
		this.accountId = accountId;
		this.spotId = spotId;
	}

	public String getCommentId() {
		return this.commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

	public String getAccountId() {
		return this.accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getSpotId() {
		return this.spotId;
	}

	public void setSpotId(String spotId) {
		this.spotId = spotId;
	}

}
