package model.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.Account;
import model.AccountDAO;
import model.Trip;
import model.TripDAO;
import model.util.HibernateUtil;

public class TripDAOHibernate implements TripDAO {
	private SessionFactory sessionFactory = null;
	
	public Trip insert(Trip trip) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();

			session.save(trip);
			trip = (Trip) session.get(Trip.class, trip.getTripId());
			trip.setTempTripId(trip.getTripId());
			
			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
			
		return trip;
	}

	public int delete(Trip trip) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		
		// 0 for success
		int result = 0; 
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(trip);
			tx.commit();
		} catch (Exception e) {
			result = 1;
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return result;
	}

	public Trip update(Trip trip) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		Trip result = null;
		try {
			tx = session.beginTransaction();
			
			result = (Trip)
					session.get(Trip.class, trip.getTripId());
			
			if(result!=null) {
				result.setStartDate(trip.getStartDate());
				result.setTotalDay(trip.getTotalDay());
				result.setTripName(trip.getTripName());
			}
			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}

	public Trip select(String id) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		Trip result= null;

		try {
			tx = session.beginTransaction();
			result = (Trip)session.get(Trip.class, id);
			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
			
		return result;
	}
	
	
	public static void main (String[] args){
		TripDAOHibernate dao = new TripDAOHibernate();
		Account test = new Account ();
		test.setAccountId("M14090004");
		Trip trip = new Trip ();
		
		// insert 
		trip.setAccount(test);
		trip.setTripName("3D2N");
		java.util.Date date = new java.util.Date();
		trip.setStartDate(date);
		trip.setTempTripId("EMP");

		
//		trip = dao.insert(trip);
		System.out.println("test : insert================================");
		System.out.println(trip);
		
//		trip.setTripId("T14090001");
//		//Trip tripId = spot.getSpotId();
//		trip = dao.select(trip.getTripId());
//		int i = dao.delete(trip);
//		System.out.println(i);
//		System.out.println("test : select================================");
//		System.out.println(trip);
//		System.out.println("test : update================================");
//		trip.setAccount(test);
//		trip.setTripName("4D2N");
//
//		java.util.Date date = new java.util.Date();
//		trip.setStartDate(date);
//		trip = dao.update(trip);
//		System.out.println(trip);
		
		//find out all of trip via account
//		AccountDAO aDao = new AccountDAOHibernate();
//		Account acc = null;
//		acc = aDao.selectById("M14090001");
//		if (acc != null ){
//			Set<Trip> trips = acc.getTrips();
//			Iterator<Trip> tripDetail = trips.iterator();
//			
//			while(tripDetail.hasNext()) {
//				Trip tripss = (Trip)tripDetail.next();
//				System.out.println(tripss);
//			}
//			
//		}
		
		
		 List<Trip> list = new ArrayList<Trip>();
		 list = dao.selectTopN(5);
		 for (Object o : list) {
		 System.out.println(o);
		 }
			
	}

    //select like top 5
	public List<Trip> selectTopN(int num) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		List<Trip> trip = new ArrayList<Trip>();
		try {
			tx = session.beginTransaction();

			Query query = session
					.createQuery("FROM Trip trip order by trip.likeCount DESC");
			query.setMaxResults(num);
			for (Object o : query.list()) {
				trip.add((Trip) o);
			}

			// System.out.println("Top 10 Ad : " + ads.size());
			// for (Object o : spots) {
			// SpotCollectRecord spot = (SpotCollectRecord) o;
			// System.out.println(accountId + "likes spot id: "
			// + spot.getId().getSpotId());
			// }
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return trip;		
	
	}
}
