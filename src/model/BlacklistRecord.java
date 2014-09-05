package model;

// Generated 2014/9/2 �U�� 08:47:27 by Hibernate Tools 4.0.0

import java.util.Date;

/**
 * BlacklistRecord generated by hbm2java
 */
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

	public BlacklistRecordId getId() {
		return this.id;
	}

	public void setId(BlacklistRecordId id) {
		this.id = id;
	}

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getReportDt() {
		return this.reportDt;
	}

	public void setReportDt(Date reportDt) {
		this.reportDt = reportDt;
	}

}
