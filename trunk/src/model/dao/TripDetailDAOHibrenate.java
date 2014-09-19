package model.dao;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.SpotDetail;
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
			tripDetail = (TripDetail) session.get(TripDetail.class,
					tripDetail.getTripDetailId());
			tripDetail.setTempTripDetailId(tripDetail.getTripDetailId());

			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}

		return tripDetail;
	}

	public int delete(TripDetail tripDetail) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();

		// 0 for success
		int result = 0;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(tripDetail);
			tx.commit();
		} catch (Exception e) {
			result = 1;
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}

	public TripDetail update(TripDetail tripDetail) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		TripDetail result = null;
		try {
			tx = session.beginTransaction();

			result = (TripDetail) session.get(TripDetail.class,
					tripDetail.getTripDetailId());

			if (result != null) {
				result.setStayTime(tripDetail.getStayTime());
				result.setSpotOrder(tripDetail.getSpotOrder());
				result.setTripDescription(tripDetail.getTripDescription());
				result.setTripDayOrder(tripDetail.getTripDayOrder());

			}
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}

	public TripDetail selectById(String id) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		TripDetail result = null;

		try {
			tx = session.beginTransaction();
			result = (TripDetail) session.get(TripDetail.class, id);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}

		return result;
	}
//"FROM TripDetail detail where detail.tripId = :id order by detail.tripDayOrder detail.spotOrder asc group by detail.tripDayOrder
	public List<TripDetail> selectAllByTripId(String id) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		List<TripDetail> result = null;
		try {
			tx = session.beginTransaction();
			// Using HQL to search
			Query query = session
					.createQuery(
							"FROM TripDetail detail where detail.trip.tripId=? "
					+"group by detail.tripDayOrder "
					+"order by detail.spotOrder asc")
				    .setParameter(0, id);
			result = query.list();

			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return result;
	}

	public static void main(String[] args) {
		TripDetailDAOHibrenate dao = new TripDetailDAOHibrenate();
		List<Set<TripDetail>> aaa = dao.selectByTripId("T14090004");
		
		
		
		
//        for(List<TripDetail> arr : aaa){
//            System.out.println(Arrays.toString(arr));
//        }
//	   List<TripDetail> trips = aaa[0].iterator();
//	   aaa.
//	   Iterator<TripDetail> tripDetail =
//			
//			while(tripDetail.hasNext()) {
//				Trip tripss = (Trip)tripDetail.next();
//				System.out.println(tripss);
//			}
		
		
//		List<TripDetail> all = dao.selectAllByTripId("T14090004");
//		for (TripDetail trip : aaa) {
//			for (int i = 0 ; i < trip.length; i++){
//			System.out.println(trip[i]);
//			}
//		}
		Trip trip = new Trip();
//		TripDetail tripDetail = new TripDetail();
//
//		SpotDetail spotDetail = new SpotDetail();
//		spotDetail.setSpotId("RES14090008");
//		tripDetail.setSpotDetail(spotDetail);
//

//		trip.setTripId("T14090003");
//		tripDetail.setTrip(trip);
//		tripDetail.setSpotOrder(3);
//		tripDetail.setTripDayOrder(1);
//		tripDetail.setStayTime(240);
//		tripDetail.setTempTripDetailId("EMP");
//
//		tripDetail = dao.insert(tripDetail);
		// tripDetail.s
		
		
		
//		TripDAOHibernate tripDao = new TripDAOHibernate();
//		
//		trip = tripDao.select("T14090004");
//		
//		Set<TripDetail> tripDetails = trip.getTripDetails();
//		Iterator<TripDetail> tripDetail = tripDetails.iterator();
//		
//		int count = 0;
//		while(tripDetail.hasNext()) {
//			count++; 
//			TripDetail trips = (TripDetail)tripDetail.next();
//			System.out.println(trips);
//		}

	}

	@Override
	public List<Set<TripDetail>> selectByTripId(String id) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		List<Set<TripDetail>> result = null;
		try {
			tx = session.beginTransaction();
			// Using HQL to search
			Query query = session
					.createQuery(
							"select detail.tripDayOrder FROM TripDetail detail where detail.trip.tripId=? "
					+"group by detail.tripDayOrder "
					)
				    .setParameter(0, id);
			result = query.list();

			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return result;
		
		
	}

}
