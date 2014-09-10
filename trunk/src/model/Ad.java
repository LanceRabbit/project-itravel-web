package model;

// Generated 2014/9/2 �U�� 08:47:27 by Hibernate Tools 4.0.0

import java.util.Date;

/**
 * Ad generated by hbm2java
 */
public class Ad implements java.io.Serializable {

	private String adId;
	private SpotDetail spotDetail;
	private Date validDay;
	private byte[] adImg;
	private String tempAdId;

	public Ad() {
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return adId+", "+spotDetail.getSpotId()+", "+validDay;
	}

	public Ad(String adId, SpotDetail spotDetail, Date validDay, String tempAdId) {
		this.adId = adId;
		this.spotDetail = spotDetail;
		this.validDay = validDay;
		this.tempAdId = tempAdId;
	}

	public Ad(String adId, SpotDetail spotDetail, Date validDay, byte[] adImg,
			String tempAdId) {
		this.adId = adId;
		this.spotDetail = spotDetail;
		this.validDay = validDay;
		this.adImg = adImg;
		this.tempAdId = tempAdId;
	}

	public String getAdId() {
		return this.adId;
	}

	public void setAdId(String adId) {
		this.adId = adId;
	}

	public SpotDetail getSpotDetail() {
		return this.spotDetail;
	}

	public void setSpotDetail(SpotDetail spotDetail) {
		this.spotDetail = spotDetail;
	}

	public Date getValidDay() {
		return this.validDay;
	}

	public void setValidDay(Date validDay) {
		this.validDay = validDay;
	}

	public byte[] getAdImg() {
		return this.adImg;
	}

	public void setAdImg(byte[] adImg) {
		this.adImg = adImg;
	}

	public String getTempAdId() {
		return this.tempAdId;
	}

	public void setTempAdId(String tempAdId) {
		this.tempAdId = tempAdId;
	}

}
