package model;

// Generated 2014/9/4 �U�� 03:29:37 by Hibernate Tools 4.0.0

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
//import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.OrderBy;
import org.hibernate.annotations.Parameter;

/**
 * SpotDetail generated by hbm2java
 */
@Entity
@Table(name = "SPOT_DETAIL", schema = "dbo", catalog = "iiiTravel")
public class SpotDetail implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	private String spotId;
	private String accountId;
	private Account account;
	private String leader;
	private String spotName;
	private int cityId;
	private String address;
	private String phone;
	private Double longitude;
	private Double latitude;
	private String spotIntro;
	private Integer likeCount;
	private int categoryId;
	private String subcategoryId;
	private String tempSpotId;
	private Date creationTime;
	private Set<TripDetail> tripDetails = new HashSet<TripDetail>(0);
	private Set<Ad> ads = new HashSet<Ad>(0);
	private Set<Coupons> couponses = new HashSet<Coupons>(0);
	private Set<SpotImg> spotImgs = new HashSet<SpotImg>(0);
	private Set<SpotCommentRecord> spotCommentRecords = new HashSet<SpotCommentRecord>(
			0);
//	private Set<Account> spotCollect = new HashSet<Account>(0);
//	private Set<Account> spotLike = new HashSet<Account>(0);

	public SpotDetail() {
	}

	public SpotDetail(String accountId, Account account, String spotName,
			int cityId, int categoryId, String subcategoryId, String tempSpotId) {
		this.accountId = accountId;
		this.account = account;
		this.spotName = spotName;
		this.cityId = cityId;
		this.categoryId = categoryId;
		this.subcategoryId = subcategoryId;
		this.tempSpotId = tempSpotId;
	}

	public SpotDetail(String accountId, Account account, String leader,
			String spotName, int cityId, String address, String phone,
			Double longitude, Double latitude, String spotIntro,
			Integer likeCount, int categoryId, String subcategoryId,
			String tempSpotId, Date creationTime, Set<TripDetail> tripDetails, Set<Ad> ads,
			Set<Coupons> couponses, Set<SpotImg> spotImgs,
			Set<SpotCommentRecord> spotCommentRecords, Set<Account> spotCollect,
			Set<Account> spotLike) {
		this.accountId = accountId;
		this.account = account;
		this.leader = leader;
		this.spotName = spotName;
		this.cityId = cityId;
		this.address = address;
		this.phone = phone;
		this.longitude = longitude;
		this.latitude = latitude;
		this.spotIntro = spotIntro;
		this.likeCount = likeCount;
		this.categoryId = categoryId;
		this.subcategoryId = subcategoryId;
		this.tempSpotId = tempSpotId;
		this.creationTime = creationTime;
		this.tripDetails = tripDetails;
		this.ads = ads;
		this.couponses = couponses;
		this.spotImgs = spotImgs;
		this.spotCommentRecords = spotCommentRecords;
//		this.spotCollect = spotCollect;
//		this.spotLike = spotLike;
	}

	@GenericGenerator(name = "generator", strategy = "select", parameters = @Parameter(name = "key", value = "tempSpotId"))
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "SPOT_ID", nullable = false, length = 11)
	public String getSpotId() {
		return this.spotId;
	}

	public void setSpotId(String spotId) {
		this.spotId = spotId;
	}

	@Column(name = "ACCOUNT_ID", nullable = false, length = 9)
	public String getAccountId() {
		return this.accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ACCOUNT_ID", nullable = false, insertable = false, updatable = false)
	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@Column(name = "LEADER", length = 10)
	public String getLeader() {
		return this.leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	@Column(name = "SPOT_NAME", nullable = false, length = 50)
	public String getSpotName() {
		return this.spotName;
	}

	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}

	@Column(name = "CITY_ID", nullable = false)
	public int getCityId() {
		return this.cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	@Column(name = "ADDRESS", length = 50)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "PHONE", length = 30)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "LONGITUDE", precision = 53, scale = 0)
	public Double getLongitude() {
		return this.longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	@Column(name = "LATITUDE", precision = 53, scale = 0)
	public Double getLatitude() {
		return this.latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	@Column(name = "SPOT_INTRO")
	public String getSpotIntro() {
		return this.spotIntro;
	}

	public void setSpotIntro(String spotIntro) {
		this.spotIntro = spotIntro;
	}

	@Column(name = "LIKE_COUNT")
	public Integer getLikeCount() {
		return this.likeCount;
	}

	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}

	@Column(name = "CATEGORY_ID", nullable = false)
	public int getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	@Column(name = "SUBCATEGORY_ID", nullable = false, length = 3)
	public String getSubcategoryId() {
		return this.subcategoryId;
	}

	public void setSubcategoryId(String subcategoryId) {
		this.subcategoryId = subcategoryId;
	}

	@Column(name = "TEMP_SPOT_ID", unique = true, nullable = false, length = 11)
	public String getTempSpotId() {
		return this.tempSpotId;
	}

	public void setTempSpotId(String tempSpotId) {
		this.tempSpotId = tempSpotId;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATION_TIME", length = 27)
//	@OrderBy(clause = "CREATION_TIME DESC")
	public Date getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "spotDetail")
	public Set<TripDetail> getTripDetails() {
		return this.tripDetails;
	}

	public void setTripDetails(Set<TripDetail> tripDetails) {
		this.tripDetails = tripDetails;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "spotDetail")
	public Set<Ad> getAds() {
		return this.ads;
	}

	public void setAds(Set<Ad> ads) {
		this.ads = ads;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "spotDetail")
	public Set<Coupons> getCouponses() {
		return this.couponses;
	}

	public void setCouponses(Set<Coupons> couponses) {
		this.couponses = couponses;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "spotDetail")
	@OrderBy(clause = "IMG_ORDER ASC")
	public Set<SpotImg> getSpotImgs() {
		return this.spotImgs;
	}

	public void setSpotImgs(Set<SpotImg> spotImgs) {
		this.spotImgs = spotImgs;
	}

	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name="SPOT_ID")
	public Set<SpotCommentRecord> getSpotCommentRecords() {
		return this.spotCommentRecords;
	}

	public void setSpotCommentRecords(Set<SpotCommentRecord> spotCommentRecords) {
		this.spotCommentRecords = spotCommentRecords;
	}

//	@ManyToMany(fetch = FetchType.EAGER, mappedBy = "spotCollect")
//	public Set<Account> getSpotCollect() {
//		return this.spotCollect;
//	}
//
//	public void setSpotCollect(Set<Account> spotCollect) {
//		this.spotCollect = spotCollect;
//	}
//
//	@ManyToMany(fetch = FetchType.EAGER, mappedBy = "spotLike")
//	public Set<Account> getSpotLike() {
//		return this.spotLike;
//	}
//
//	public void setSpotLike(Set<Account> spotLike) {
//		this.spotLike = spotLike;
//	}

	@Override
	public String toString() {
				
		return this.getSpotName()+","+this.getSpotId()+","+this.getCreationTime()+","+this.getCityId()+","+
				this.getCategoryId()+","+this.getSubcategoryId()+","+
				this.getSpotIntro()+","+this.getLikeCount();
	}

}
