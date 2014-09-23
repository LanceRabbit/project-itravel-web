package model.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import model.Ad;
import model.AdDAO;
import model.SpotDetail;
import model.SpotDetailDAO;
import model.SpotImg;


import model.dao.AdDAOHibernate;
import model.dao.SpotDetailDAOHibernate;

import model.util.ImageIOUtil;

/**
 * 1.取得廣告 AD的資訊放進輪播 
 * 
 * */
public class FirstpageService {
	static AdDAO adDao = new AdDAOHibernate();
	static SpotDetailDAO spotDetailDao = new SpotDetailDAOHibernate();

	public static void main(String[] args) {
		List<Ad> result = findAD();
		// System.out.println("取得的AD資料: "+result);

	}

	public static List<SpotDetail> findTopSpot(){
		List<SpotDetail> result = spotDetailDao.selectTopN(5);
		
		
		return result;
	}
	
	public static List<Ad> findAD() {

		List<Ad> result = adDao.selectTopN(5);
		// List<String> spotesult = new ArrayList<String>();
		// System.out.println(result);
		for (Ad o : result) {
			String spotName = o.getSpotDetail().getSpotName();
			// System.out.println(o.getSpotDetail().getSpotName());
			String spotInfo = o.getSpotDetail().getSpotIntro();
			byte[] spot = o.getAdImg();
			// System.out.println(spot);

		}

		return result;

	}

}
