package model;

// Generated 2014/9/2 �U�� 08:47:27 by Hibernate Tools 4.0.0

/**
 * SpotLikeRecordId generated by hbm2java
 */
public class SpotLikeRecordId implements java.io.Serializable {

	private String accountId;
	private String spotId;

	public SpotLikeRecordId() {
	}

	public SpotLikeRecordId(String accountId, String spotId) {
		this.accountId = accountId;
		this.spotId = spotId;
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

	@Override
	public String toString() {
		
		return "AccountId = "+accountId +"," +"SpotId = " + spotId ;
	}

	
	
}
