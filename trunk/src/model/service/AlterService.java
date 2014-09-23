package model.service;

import model.SpotDetail;
import model.SpotDetailDAO;
import model.dao.SpotDetailDAOHibernate;

public class AlterService {
	SpotDetailDAO dao = new SpotDetailDAOHibernate();
	SpotDetail spot = new SpotDetail();
	public static void main(String[] args) {
		
	}

	public SpotDetail alterSpot(SpotDetail spot){
		
//		SpotDetail result = 
		
		
		return  dao.update(spot);		
	}
	
}
