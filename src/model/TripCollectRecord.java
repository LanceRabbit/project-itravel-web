package model;

// Generated 2014/9/2 �U�� 08:47:27 by Hibernate Tools 4.0.0

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * TripCollectRecord generated by hbm2java
 */
@Entity
@Table(name = "TRIP_COLLECT_RECORD", schema = "dbo", catalog = "iiiTravel")
public class TripCollectRecord implements java.io.Serializable {

	private TripCollectRecordId id;

	public TripCollectRecord() {
	}

	public TripCollectRecord(TripCollectRecordId id) {
		this.id = id;
	}

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "accountId", column = @Column(name = "ACCOUNT_ID", nullable = false, length = 9)),
			@AttributeOverride(name = "tripId", column = @Column(name = "TRIP_ID", nullable = false, length = 9)) })
	public TripCollectRecordId getId() {
		return this.id;
	}

	public void setId(TripCollectRecordId id) {
		this.id = id;
	}
	@Override
	public String toString() {
		
		return id.toString();
	}
}
