package model;

// Generated 2014/9/2 �U�� 08:47:27 by Hibernate Tools 4.0.0

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * SpotLikeRecord generated by hbm2java
 */
@Entity
@Table(name = "SPOT_LIKE_RECORD", schema = "dbo", catalog = "iiiTravel")
public class SpotLikeRecord implements java.io.Serializable {

	private SpotLikeRecordId id;

	public SpotLikeRecord() {
	}

	public SpotLikeRecord(SpotLikeRecordId id) {
		this.id = id;
	}

	@EmbeddedId
	@AttributeOverrides({
			@AttributeOverride(name = "accountId", column = @Column(name = "ACCOUNT_ID", nullable = false, length = 9)),
			@AttributeOverride(name = "spotId", column = @Column(name = "SPOT_ID", nullable = false, length = 11)) })
	public SpotLikeRecordId getId() {
		return this.id;
	}

	public void setId(SpotLikeRecordId id) {
		this.id = id;
	}

	@Override
	public String toString() {
		
		
		return id.toString();
	}

	

}
