package model;

// Generated 2014/9/2 �U�� 08:47:27 by Hibernate Tools 4.0.0

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.OrderBy;
import org.hibernate.annotations.Parameter;

/**
 * Trip generated by hbm2java
 */
@Entity
@Table(name = "TRIP", schema = "dbo", catalog = "iiiTravel")
public class Trip implements java.io.Serializable {

	private String tripId;
	private Account account;
	private String tripName;
	private Integer totalDay;
	private Date startDate;
	private Integer likeCount;
	private String tempTripId;
	private Set<Account> tripCollect = new HashSet<Account>(0);
	private Set<TripDetail> tripDetails = new HashSet<TripDetail>(0);
	private Set<Account> tripLike = new HashSet<Account>(0);

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return tripId+", "+tripName+", "+startDate+", "+likeCount+", "+totalDay;
	}
	public Trip() {
	}

	public Trip(Account account, Date startDate, String tempTripId) {
		this.account = account;
		this.startDate = startDate;
		this.tempTripId = tempTripId;
	}

	public Trip(Account account, String tripName, Integer totalDay,
			Date startDate, Integer likeCount, String tempTripId,
			Set<Account> tripCollect, Set<TripDetail> tripDetails,
			Set<Account> tripLike) {
		this.account = account;
		this.tripName = tripName;
		this.totalDay = totalDay;
		this.startDate = startDate;
		this.likeCount = likeCount;
		this.tempTripId = tempTripId;
		this.tripCollect = tripCollect;
		this.tripDetails = tripDetails;
		this.tripLike = tripLike;
	}

	@GenericGenerator(name = "generator", strategy = "select", parameters = @Parameter(name = "key", value = "tempTripId"))
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "TRIP_ID", nullable = false, length = 9)
	public String getTripId() {
		return this.tripId;
	}

	public void setTripId(String tripId) {
		this.tripId = tripId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ACCOUNT_ID", nullable = false)
	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@Column(name = "TRIP_NAME", length = 30)
	public String getTripName() {
		return this.tripName;
	}

	public void setTripName(String tripName) {
		this.tripName = tripName;
	}

	@Column(name = "TOTAL_DAY")
	public Integer getTotalDay() {
		return this.totalDay;
	}

	public void setTotalDay(Integer totalDay) {
		this.totalDay = totalDay;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "START_DATE", nullable = false, length = 10)
	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	@Column(name = "LIKE_COUNT")
	public Integer getLikeCount() {
		return this.likeCount;
	}

	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}

	@Column(name = "TEMP_TRIP_ID", unique = true, nullable = false, length = 9)
	public String getTempTripId() {
		return this.tempTripId;
	}

	public void setTempTripId(String tempTripId) {
		this.tempTripId = tempTripId;
	}

	@ManyToMany(fetch = FetchType.EAGER, mappedBy = "tripCollect")
	public Set<Account> getTripCollect() {
		return this.tripCollect;
	}

	public void setTripCollect(Set<Account> tripCollect) {
		this.tripCollect = tripCollect;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "trip")
	@OrderBy(clause = "TRIP_DAY_ORDER , SPOT_ORDER ASC")
	public Set<TripDetail> getTripDetails() {
		return this.tripDetails;
	}

	public void setTripDetails(Set<TripDetail> tripDetails) {
		this.tripDetails = tripDetails;
	}

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "tripLike")
	public Set<Account> getTripLike() {
		return this.tripLike;
	}

	public void setTripLike(Set<Account> tripLike) {
		this.tripLike = tripLike;
	}

}
