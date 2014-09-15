package model;

// Generated 2014/9/2 �U�� 08:47:27 by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * TripLikeRecordId generated by hbm2java
 */
@Embeddable
public class TripLikeRecordId implements java.io.Serializable {

	private String accountId;
	private String tripId;

	public TripLikeRecordId() {
	}

	public TripLikeRecordId(String accountId, String tripId) {
		this.accountId = accountId;
		this.tripId = tripId;
	}

	@Column(name = "ACCOUNT_ID", nullable = false, length = 9)
	public String getAccountId() {
		return this.accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	@Column(name = "TRIP_ID", nullable = false, length = 9)
	public String getTripId() {
		return this.tripId;
	}

	public void setTripId(String tripId) {
		this.tripId = tripId;
	}

	@Override
	public String toString() {
		
		return "accountId: "+accountId + ",tripId: "+tripId;
	}
}
