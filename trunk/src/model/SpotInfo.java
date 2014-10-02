package model;

import java.util.ArrayList;
import java.util.List;

import model.util.ConstantsUtil;
import model.util.ImageIOUtil;

public class SpotInfo implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	//private String accountId;
	//private Account account;
	private String creater;
	private String leader;
	
	private String spotName;
	private String category; //private int categoryId;
	private String subcategory; //private String subcategoryId;
	private String city; //private int cityId;
	private String address;
	private String phone;
	private String longitude;
	private String latitude;
	private String spotIntro;
	private String likeCount;
	
	//private String tempSpotId;
	//private Set<TripDetail> tripDetails = new HashSet<TripDetail>(0);
	//private Set<Ad> ads = new HashSet<Ad>(0);
	private List<String> coupons = new ArrayList<String>(0); //private Set<Coupons> couponses = new HashSet<Coupons>(0);
	private List<String> spotImgs = new ArrayList<String>(0); //private Set<SpotImg> spotImgs = new HashSet<SpotImg>(0);
	private List<CommentInfo> spotComments = new ArrayList<CommentInfo>(0); //private Set<SpotCommentRecord> spotCommentRecords = new HashSet<SpotCommentRecord>(0);
	
	public SpotInfo() {
	}
	
	public SpotInfo(SpotDetail spotDetail, String viewer, String webAppURL, String deployDir) {
		creater = spotDetail.getAccount().getNickname();
		leader = spotDetail.getLeader();
		spotName = spotDetail.getSpotName();
		category = ConstantsUtil.getRevCategoryMap().get(spotDetail.getCategoryId());
		subcategory = ConstantsUtil.getRevSubcategoryMap().get(spotDetail.getSubcategoryId());
		city = ConstantsUtil.getRevCityMap().get(spotDetail.getCityId());
		address = spotDetail.getAddress();
		phone = spotDetail.getPhone();
		spotIntro = spotDetail.getSpotIntro();
		
		if(spotDetail.getLatitude() != null)
			longitude = (spotDetail.getLongitude()).toString();
		if(spotDetail.getLatitude() != null)
			latitude = (spotDetail.getLatitude()).toString();
		if(spotDetail.getLikeCount() != null)
			likeCount = spotDetail.getLikeCount().toString();

		// images
		if(spotDetail.getSpotImgs().size() == 0) {
			String path = webAppURL + "/images/team1.jpg"; System.out.println("img url : " + path);
			spotImgs.add(path);
		} else {
			int count = 0;
			for(SpotImg spotImg : spotDetail.getSpotImgs()) {
				byte[] data = spotImg.getSpotImg();
				if((data != null) && (data.length != 0)) {
					count++;
					String path = ImageIOUtil.generateImageDirPath(viewer, spotDetail.getSpotId());
					ImageIOUtil.saveImage((deployDir+path), spotImg.getImgId(), spotImg.getSpotImg());
					
					String imgURL = webAppURL + "/" + path + "/" + spotImg.getImgId();
					spotImgs.add(imgURL);
				}
			}
			
			if(count == 0) {
				String path = webAppURL + "/images/team1.jpg"; System.out.println("img url : " + path);
				spotImgs.add(path);
			}
		}
		
		// comments
		if(spotDetail.getSpotCommentRecords().size() > 0) {
			for(SpotCommentRecord record : spotDetail.getSpotCommentRecords()) {
				CommentInfo comment = new CommentInfo(record);
				spotComments.add(comment);
			}
		}
	}
	
	// getter and setter
	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getLeader() {
		return leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	public String getSpotName() {
		return spotName;
	}

	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getSpotIntro() {
		return spotIntro;
	}

	public void setSpotIntro(String spotIntro) {
		this.spotIntro = spotIntro;
	}

	public String getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(String likeCount) {
		this.likeCount = likeCount;
	}

	public List<String> getCoupons() {
		return coupons;
	}

	public void setCoupons(List<String> coupons) {
		this.coupons = coupons;
	}

	public List<String> getSpotImgs() {
		return spotImgs;
	}

	public void setSpotImgs(List<String> spotImgs) {
		this.spotImgs = spotImgs;
	}

	public List<CommentInfo> getSpotComments() {
		return spotComments;
	}

	public void setSpotComments(List<CommentInfo> spotComments) {
		this.spotComments = spotComments;
	}
}
