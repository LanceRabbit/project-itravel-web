package model.service;

import java.util.Set;

import model.Trip;
import model.TripDAO;
import model.TripDetail;
import model.dao.TripDAOHibernate;

public class TripDetailService {
	private TripDAO dao = new TripDAOHibernate();
	
	public Set<TripDetail> findTripDetails(String id) {
		Trip trip = new Trip();//		List<TripDetail> result 
		 
		 
		trip = dao.select(id);
		
		Set<TripDetail> result = trip.getTripDetails();
		
		return result;

	}
}
