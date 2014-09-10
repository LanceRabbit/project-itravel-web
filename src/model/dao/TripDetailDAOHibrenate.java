package model.dao;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.SpotDetail;
import model.SpotImg;
import model.SpotOwner;
import model.Trip;
import model.TripDetail;
import model.TripDetailDAO;
import model.util.HibernateUtil;
import model.util.ImageIOUtil;

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

	public List<TripDetail> selectAll(String id) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		List<TripDetail> result = null;
		try {
			tx = session.beginTransaction();
			// Using HQL to search
			List<?> trips = session
					.createQuery(
							"FROM TripDetail detail where detail.tripId = ? order by detail.tripDayOrder asc")
					.setString(0, id).list();
			for (Object trip : trips) {
				result.add((TripDetail) trip);
			}
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

		TripDetail tripDetail = new TripDetail();
		SpotImg img = new SpotImg();
		img.setImgId("I140900026");
		tripDetail.setSpotImg(img);

		SpotDetail spotDetail = new SpotDetail();
		spotDetail.setSpotId("RES14090001");
		tripDetail.setSpotDetail(spotDetail);

		Trip trip = new Trip();
		trip.setTripId("T14090003");
		tripDetail.setTrip(trip);
		tripDetail.setSpotOrder(3);
		tripDetail.setTripDayOrder(1);
		tripDetail.setStayTime(240);
		tripDetail.setTempTripDetailId("EMP");

		tripDetail = dao.insert(tripDetail);
		// tripDetail.s
		
		
		
//		TripDAOHibernate tripDao = new TripDAOHibernate();
//		
//		trip = tripDao.select("T14090001");
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

}
