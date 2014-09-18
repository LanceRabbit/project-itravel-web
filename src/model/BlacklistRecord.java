package model;

// Generated 2014/9/2 �U�� 08:47:27 by Hibernate Tools 4.0.0

import java.util.Date;
import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * BlacklistRecord generated by hbm2java
 */
@Entity
@Table(name = "BLACKLIST_RECORD", schema = "dbo", catalog = "iiiTravel")
public class BlacklistRecord implements java.io.Serializable {

	private BlacklistRecordId id;
	private String reason;
	private Date reportDt;

	public BlacklistRecord() {
	}

	public BlacklistRecord(BlacklistRecordId id) {
		this.id = id;
	}

	public BlacklistRecord(BlacklistRecordId id, String reason, Date reportDt) {
		this.id = id;
		this.reason = reason;
		this.reportDt = reportDt;
	}

	@Override
	public String toString() {
		return id+";"+reason+";"+reportDt;
	}

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "reporterId", column = @Column(name = "REPORTER_ID", nullable = false, length = 9)),
			@AttributeOverride(name = "reportedId", column = @Column(name = "REPORTED_ID", nullable = false, length = 9)),
			@AttributeOverride(name = "commentId", column = @Column(name = "COMMENT_ID", nullable = false, length = 12)) })
	public BlacklistRecordId getId() {
		return this.id;
	}

	public void setId(BlacklistRecordId id) {
		this.id = id;
	}

	@Column(name = "REASON")
	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "REPORT_DT", length = 10)
	public Date getReportDt() {
		return this.reportDt;
	}

	public void setReportDt(Date reportDt) {
		this.reportDt = reportDt;
	}

}