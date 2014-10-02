package model.service;



import java.util.Set;

import model.Account;
import model.AccountDAO;
import model.Ad;
import model.AdDAO;
import model.SpotDetail;
import model.dao.AccountDAOHibernate;
import model.dao.AdDAOHibernate;

public class ADService {
	AdDAO dao = new AdDAOHibernate();
	Ad ad = new Ad();
	//從account 去找他自己的景點
	//取得景點ID
	
	public static void main(String[] args) {
		

	}

	public Set<SpotDetail> findAdSpotId(String AccountId){
		
		
		AccountDAO daoAcc = new AccountDAOHibernate();
		Account acc = new Account();
		acc = daoAcc.selectById(AccountId);
		Set<SpotDetail> result = acc.getSpotDetails();
		
		
		
		
		return result;
		
	}
	public java.util.Date findDate(){
		
		java.util.Date date = new java.util.Date();
		date = dao.addDate(date, 7);
		return date;
	}
	
	public boolean AdInsert(String spotId ,String Adname,String Adtext,byte[] image){
		
		SpotDetail spot = new SpotDetail();
		spot.setSpotId(spotId);
		ad.setSpotDetail(spot);
		java.util.Date date = new java.util.Date();
		date = dao.addDate(date, 7);		
		ad.setValidDay(date);
		ad.setAdImg(image);
		
		dao.insert(ad);
		
		
		
		
		return true;
	}
	
}
