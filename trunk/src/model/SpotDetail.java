package model;

// Generated 2014/9/4 �U�� 03:29:37 by Hibernate Tools 4.0.0

import java.util.HashSet;
import java.util.Set;

/**
 * SpotDetail generated by hbm2java
 */
public class SpotDetail implements java.io.Serializable {

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
	private Set<TripDetail> tripDetails = new HashSet<TripDetail>(0);
	private Set<Ad> ads = new HashSet<Ad>(0);
	private Set<Coupons> couponses = new HashSet<Coupons>(0);
	private Set<SpotImg> spotImgs = new HashSet<SpotImg>(0);
	private Set<SpotCommentRecord> spotCommentRecords = new HashSet<SpotCommentRecord>(
			0);
	private Set<Account> collector = new HashSet<Account>(0);
	private Set<Account> admirer = new HashSet<Account>(0);

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
			String tempSpotId, Set<TripDetail> tripDetails, Set<Ad> ads,
			Set<Coupons> couponses, Set<SpotImg> spotImgs,
			Set<SpotCommentRecord> spotCommentRecords, Set<Account> collector,
			Set<Account> admirer) {
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
		this.tripDetails = tripDetails;
		this.ads = ads;
		this.couponses = couponses;
		this.spotImgs = spotImgs;
		this.spotCommentRecords = spotCommentRecords;
		this.collector = collector;
		this.admirer = admirer;
	}

	public String getSpotId() {
		return this.spotId;
	}

	public void setSpotId(String spotId) {
		this.spotId = spotId;
	}

	public String getAccountId() {
		return this.accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getLeader() {
		return this.leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	public String getSpotName() {
		return this.spotName;
	}

	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}

	public int getCityId() {
		return this.cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Double getLongitude() {
		return this.longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return this.latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public String getSpotIntro() {
		return this.spotIntro;
	}

	public void setSpotIntro(String spotIntro) {
		this.spotIntro = spotIntro;
	}

	public Integer getLikeCount() {
		return this.likeCount;
	}

	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}

	public int getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getSubcategoryId() {
		return this.subcategoryId;
	}

	public void setSubcategoryId(String subcategoryId) {
		this.subcategoryId = subcategoryId;
	}

	public String getTempSpotId() {
		return this.tempSpotId;
	}

	public void setTempSpotId(String tempSpotId) {
		this.tempSpotId = tempSpotId;
	}

	public Set<TripDetail> getTripDetails() {
		return this.tripDetails;
	}

	public void setTripDetails(Set<TripDetail> tripDetails) {
		this.tripDetails = tripDetails;
	}

	public Set<Ad> getAds() {
		return this.ads;
	}

	public void setAds(Set<Ad> ads) {
		this.ads = ads;
	}

	public Set<Coupons> getCouponses() {
		return this.couponses;
	}

	public void setCouponses(Set<Coupons> couponses) {
		this.couponses = couponses;
	}

	public Set<SpotImg> getSpotImgs() {
		return this.spotImgs;
	}

	public void setSpotImgs(Set<SpotImg> spotImgs) {
		this.spotImgs = spotImgs;
	}

	public Set<SpotCommentRecord> getSpotCommentRecords() {
		return this.spotCommentRecords;
	}

	public void setSpotCommentRecords(Set<SpotCommentRecord> spotCommentRecords) {
		this.spotCommentRecords = spotCommentRecords;
	}

	public Set<Account> getCollector() {
		return this.collector;
	}

	public void setCollector(Set<Account> collector) {
		this.collector = collector;
	}

	public Set<Account> getAdmirer() {
		return this.admirer;
	}

	public void setAdmirer(Set<Account> admirer) {
		this.admirer = admirer;
	}

}
