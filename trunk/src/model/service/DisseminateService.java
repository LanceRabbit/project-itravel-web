package model.service;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import model.Account;
import model.AccountDAO;
import model.Ad;
import model.AdDAO;
import model.Coupons;
import model.CouponsDAO;
import model.SpotDetail;
import model.dao.AccountDAOHibernate;
import model.dao.AdDAOHibernate;
import model.dao.CouponsDAOHibernate;
import model.dao.SpotDetailDAOHibernate;

public class DisseminateService {
	AdDAO dao = new AdDAOHibernate();
	Ad ad = new Ad();
	CouponsDAO daoCoupon = new CouponsDAOHibernate();
	Coupons coupon = new Coupons();
	SpotDetailDAOHibernate daoSpotDetail = new SpotDetailDAOHibernate();
	// 從account 去找他自己的景點
	// 取得景點ID

	public static void main(String[] args) {

		DisseminateService s = new DisseminateService();
		//s.findAdsByAccountId("M14100001");
		s.findCouponsByAccountId("M14100001");
		System.out.println("DisseminateService getWholeCoupons = "+s.getWholeCoupons());
		
	}
	public List<Coupons> findCouponsByAccountId(String accountId) {

		List<Coupons> result = daoCoupon.selectByAccountId(accountId);	
		System.out.println("Coupon list:"+result);
				
		return result;
	}
	public List<Coupons> findCouponsBySpotId(String spotId) {

		List<Coupons> result = daoCoupon.selectBySpotId(spotId);	
		System.out.println("Coupon list:"+result);
				
		return result;
	}
	public Set<SpotDetail> findSpotId(String AccountId) {

		AccountDAO daoAcc = new AccountDAOHibernate();
		Account acc = new Account();
		acc = daoAcc.selectById(AccountId);
		Set<SpotDetail> result = acc.getSpotDetails();
		Iterator<SpotDetail> detail = acc.getSpotDetails().iterator();
		while (detail.hasNext()) {

			SpotDetail spot = detail.next();
			Iterator<Ad> ad = spot.getAds().iterator();

		}

		return result;

	}

//	public List<Ad> findAds(String spotId) {
//
//		List<Ad> result = dao.selectBySpotId(spotId);
//
//		return result;
//	}

	public List<Ad> findAdsByAccountId(String accountId) {

		List<Ad> result = dao.selectByAccountId(accountId);	
		System.out.println("Ad list:"+result);
		
		
		
		return result;
	}

	public java.util.Date findDate() {

		java.util.Date date = new java.util.Date();
		date = dao.addDate(date, 7);
		return date;
	}

	public boolean AdInsert(String spotId, byte[] image) {

		SpotDetail spot = new SpotDetail();
		spot.setSpotId(spotId);
		ad.setSpotDetail(spot);
		java.util.Date date = new java.util.Date();
		date = dao.addDate(date, 7);
		ad.setTempAdId("EMP");
		ad.setValidDay(date);
		ad.setAdImg(image);

		if (dao.insert(ad) != null) {
			return true;
		} else {
			return false;
		}

	}

	public boolean CouponInsert(String spotId, String text,
			java.util.Date date, byte[] image) {
		SpotDetail spot = new SpotDetail();
		spot.setSpotId(spotId);
		coupon.setSpotDetail(spot);
		coupon.setCouponDescription(text);
		coupon.setCouponImg(image);
		coupon.setValidDay(date);
		coupon.setTempCouponId("EMP");
		coupon = daoCoupon.insert(coupon);
		if (coupon != null) {
			System.out.println(coupon.toString());
			return true;
		} else {
			return false;
		}

	}
	
	public boolean AdDelet(String adId){
		
		Ad ad = dao.selectById(adId);
		if(ad !=null){
			dao.delete(ad);
			return true;
		}else{
			return false;
		}
		
		
		
		
	}
	
	public boolean CouponDelet(String couponId){
		
		Coupons coupon =daoCoupon.selectById(couponId);
		if(coupon!=null){
			daoCoupon.delete(coupon);
			return true;
		}else{
			return false;
		}
		
	}
	public List<Coupons> getWholeCoupons(){
		return daoCoupon.selectAll();
	}
	public SpotDetail getSpotDetail(String spotId){
		return daoSpotDetail.selectBySpotId(spotId);
	}
	 
	
	
}
