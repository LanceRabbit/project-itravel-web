package model;

// Generated 2014/9/2 �U�� 08:47:27 by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * BlacklistRecordId generated by hbm2java
 */
@Embeddable
public class BlacklistRecordId implements java.io.Serializable {

	private String reporterId;
	private String reportedId;
	private String commentId;

	public BlacklistRecordId() {
	}

	public BlacklistRecordId(String reporterId, String reportedId,
			String commentId) {
		this.reporterId = reporterId;
		this.reportedId = reportedId;
		this.commentId = commentId;
	}

	@Override
	public String toString() {
		return reporterId+";"+reportedId+";"+commentId;
	}


	@Column(name = "REPORTER_ID", nullable = false, length = 9)
	public String getReporterId() {
		return this.reporterId;
	}

	public void setReporterId(String reporterId) {
		this.reporterId = reporterId;
	}

	@Column(name = "REPORTED_ID", nullable = false, length = 9)
	public String getReportedId() {
		return this.reportedId;
	}

	public void setReportedId(String reportedId) {
		this.reportedId = reportedId;
	}

	@Column(name = "COMMENT_ID", nullable = false, length = 12)
	public String getCommentId() {
		return this.commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

}