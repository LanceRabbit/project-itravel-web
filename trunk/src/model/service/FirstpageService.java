package model.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import model.Ad;
import model.AdDAO;
import model.SpotDetail;
import model.SpotDetailDAO;
import model.SpotImg;
import model.SpotLikeRecordDAO;
import model.TripLikeRecordDAO;
import model.dao.AdDAOHibernate;
import model.dao.SpotDetailDAOHibernate;
import model.dao.SpotLikeRecordDAOHibernate;
import model.dao.TripLikeRecordDAOHibernate;
import model.util.ImageIOUtil;

/**
 * 1.取得廣告 AD的資訊放進輪播 2.取得SpotLikeRecord的Top4資訊 3.取得TripLikeRecord的Top4資訊
 * 
 * */
public class FirstpageService {
	static AdDAO adDao = new AdDAOHibernate();
	SpotDetailDAO spotDetailDao = new SpotDetailDAOHibernate();
	
	SpotLikeRecordDAO spotLikeRecordDao = new SpotLikeRecordDAOHibernate();
	TripLikeRecordDAO tripLikeRecordDao = new TripLikeRecordDAOHibernate();

	public static void main(String[] args) {
		List<Ad> result = findAD();
		//System.out.println("取得的AD資料: "+result);
		
		
		
	}

	public static List<Ad> findAD() {

		List<Ad> result = adDao.selectTopN(5);
//		List<String> spotesult = new ArrayList<String>();
		//System.out.println(result);
		for(Ad o: result){
			String spotName = o.getSpotDetail().getSpotName();
			//System.out.println(o.getSpotDetail().getSpotName());	
			String spotInfo = o.getSpotDetail().getSpotIntro();
			byte[] spot = o.getAdImg();
			//System.out.println(spot);			
			
		}
		
		return result;

	}
	
	
	

}
