package model;

// Generated 2014/9/2 �U�� 08:47:27 by Hibernate Tools 4.0.0

/**
 * TripLikeRecordId generated by hbm2java
 */
public class TripLikeRecordId implements java.io.Serializable {

	private String accountId;
	private String tripId;

	public TripLikeRecordId() {
	}

	public TripLikeRecordId(String accountId, String tripId) {
		this.accountId = accountId;
		this.tripId = tripId;
	}

	public String getAccountId() {
		return this.accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getTripId() {
		return this.tripId;
	}

	public void setTripId(String tripId) {
		this.tripId = tripId;
	}

}