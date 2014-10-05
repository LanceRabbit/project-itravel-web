package model.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Set;

import model.Trip;
import model.TripDAO;
import model.TripDetail;
import model.TripDetailDAO;
import model.dao.TripDAOHibernate;
import model.dao.TripDetailDAOHibrenate;

public class AddTripService {
	private TripDAO tripDao = new TripDAOHibernate();
	private TripDetailDAO detailDao = new TripDetailDAOHibrenate();
	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy/MM/dd");
	public java.util.Date convertDate(String data) {
		java.util.Date result = null;
		try {
			result = sFormat.parse(data);
		} catch (ParseException e) {
			e.printStackTrace();
			result = new java.util.Date(0);
		}
		return result;
	}
	
	public Trip creatTrip (Trip trip) {
		return tripDao.insert(trip);
	}
	
	public TripDetail addTripDetail (TripDetail tripDetail) {
		return detailDao.insert(tripDetail);
	}
	

}
