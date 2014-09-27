package model.service;

import java.util.List;
import java.util.Set;

import org.json.JSONArray;
import org.json.JSONObject;

import model.SpotDetail;
import model.SpotImg;
import model.Trip;
import model.dao.SpotDetailDAOHibernate;
import model.dao.TripDAOHibernate;
import model.util.ConstantsUtil;

public class SearchTripService {
	private TripDAOHibernate dao = new TripDAOHibernate();
	
	public List<SpotDetail> searchSpotByGeoInfo() {
		return null;
	}
	
	public List<Trip> searchTrip(String input, int days) {
		List<Trip> result = null;
	
		if (days != -1) {
			result = dao.selectByDay(days);
		} else {
			result = dao.selectByInput(input);
		}
		return result;
		 
	}


	
	public static void main(String[] args) {
		TripDAOHibernate dao = new TripDAOHibernate();
		List<Trip> result = null;
		
		result = dao.selectByInput("東");
		 if (result!=null) {
		 for (Object o : result) {
		 System.out.println(o);
		 } 
		 } else {
			 
			 System.out.println("Can not find out for this search");
		 }


		

	}
}
