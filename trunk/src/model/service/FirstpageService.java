package model.service;

import java.util.ArrayList;
import java.util.List;

import model.Ad;
import model.AdDAO;
import model.SpotDetail;
import model.SpotDetailDAO;
import model.SpotLikeRecordDAO;
import model.TripLikeRecordDAO;
import model.dao.AdDAOHibernate;
import model.dao.SpotDetailDAOHibernate;
import model.dao.SpotLikeRecordDAOHibernate;
import model.dao.TripLikeRecordDAOHibernate;

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
		List<Ad> result = new ArrayList<Ad>();
		result=findAD();
		//System.out.println(result);
	}

	public static List<Ad> findAD() {

		List<Ad> result = new ArrayList<Ad>();
		result = adDao.selectTopN(5);
		//System.out.println(result);
		for(Ad o: result){
			o.getSpotDetail();
			System.out.println(o.getSpotDetail());
			
		}

		return result;

	}

}
