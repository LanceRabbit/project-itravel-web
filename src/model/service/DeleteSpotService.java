package model.service;

import model.SpotDetail;
import model.SpotDetailDAO;
import model.dao.SpotDetailDAOHibernate;

public class DeleteSpotService {
	
	// return 0 for success
	public int deleteSpotById(String spotId){
		int result = -1;
		
		SpotDetailDAO dao = new SpotDetailDAOHibernate();
		SpotDetail spot = dao.selectBySpotId(spotId);
		if(spot != null)
			result = dao.delete(spot);
		
		return result;
	}
}
