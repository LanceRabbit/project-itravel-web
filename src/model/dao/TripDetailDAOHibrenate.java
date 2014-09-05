package model.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.SpotDetail;
import model.SpotImg;
import model.Trip;
import model.TripDetail;
import model.TripDetailDAO;
import model.util.HibernateUtil;

public class TripDetailDAOHibrenate implements TripDetailDAO {
	private SessionFactory sessionFactory = null;
	
	public TripDetail insert(TripDetail tripDetail) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
		
			session.save(tripDetail);		
			tripDetail = (TripDetail)session.get(TripDetail.class, tripDetail.getTripDetailId());
			tripDetail.setTempTripDetailId(tripDetail.getTripDetailId());
			
			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
			
		return tripDetail;
	}

	public int delete(TripDetail tripDetail) {
		// TODO Auto-generated method stub
		return 0;
	}

	public TripDetail update(TripDetail tripDetail) {
		// TODO Auto-generated method stub
		return null;
	}

	public TripDetail selectById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<TripDetail> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public static void main(String[] args) {
		TripDetailDAOHibrenate dao = new TripDetailDAOHibrenate();
		
		TripDetail tripDetail = new TripDetail();
		SpotImg img = new SpotImg();
		img.setImgId("I1409000001");
		tripDetail.setSpotImg(img);
		
		SpotDetail spotDetail = new SpotDetail();
		spotDetail.setSpotId("RES14090003");
		tripDetail.setSpotDetail(spotDetail);
		
		Trip trip = new Trip ();
		trip.setTripId("T14090002");
		tripDetail.setTrip(trip);
		tripDetail.setSpotOrder(1);
		tripDetail.setStayTime(240);
		tripDetail.setTempTripDetailId("EMP");
		
		
		tripDetail= dao.insert(tripDetail);
//		tripDetail.s

	}

}
