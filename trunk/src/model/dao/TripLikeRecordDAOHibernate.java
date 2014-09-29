package model.dao;

import java.util.List;

import model.SpotLikeRecord;
import model.TripLikeRecord;
import model.TripLikeRecordDAO;
import model.TripLikeRecordId;
import model.util.HibernateUtil;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class TripLikeRecordDAOHibernate implements TripLikeRecordDAO {
	private SessionFactory sessionFactory = null;

	public static void main(String[] args) {

		TripLikeRecordDAO dao = new TripLikeRecordDAOHibernate();
		TripLikeRecordId tripRec = new TripLikeRecordId();
		TripLikeRecord trip = null;

		
		
		// test: insert
		// 測試新增須先檢查DB內有沒有重複值
		
		tripRec.setAccountId("M14090001");
		tripRec.setTripId("T14090003");
		trip = new TripLikeRecord(tripRec);
		trip = dao.insert(trip);
		System.out.println("已新增 ="+trip);

		// test: delet
		// 測試刪除須先檢查DB內有無資料
		
//		tripRec.setAccountId("M14090001"); 
//		tripRec.setTripId("T14090003");
//		trip = new TripLikeRecord(tripRec); 
//		dao.delete(trip);
		 

		// test: select by accountId + tripId
		//測試有沒有這筆使用者的按讚資料
//		 tripRec.setAccountId("M14090001");
//		 tripRec.setTripId("T14090003");
//		 trip= new TripLikeRecord(tripRec);
//		 dao.select(trip);
//		 System.out.println(trip);
		
		//test: select by account id
//		String accountId = "M14090001";
//		dao.select(accountId);

	}

	public TripLikeRecord insert(TripLikeRecord TripRec) {

		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			session.save(TripRec);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}

		return TripRec;
	}

	public int delete(TripLikeRecord TripRec) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			session.delete(TripRec);

			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				System.out.println(e.getMessage());
			}
			return -100;
		}

		return 100;

	}

	public TripLikeRecord select(TripLikeRecord TripRec) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();

			TripRec = (TripLikeRecord) session.get(TripLikeRecord.class,
					TripRec.getId());

			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}

		return TripRec;
	}

	// 下HQL的select
	public void select(String accountId) {


		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		
		
		try {
			tx = session.beginTransaction();
			List<?> trips = session.createQuery("FROM TripLikeRecord trips where trips.id.accountId = ?").setString(0, accountId).list();
			
			System.out.println("liked trips : " + trips.size());
			for (Object o : trips) {
				TripLikeRecord trip = (TripLikeRecord)o;
			    System.out.println(accountId + "likes trip id: " + trip.getId().getTripId());
			}			
			
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}
	}

	@Override
	public int insert2(TripLikeRecord TripRec) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			session.save(TripRec);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				System.out.println(e.getMessage());
			}
			return -100;
		}

		
		return 100;
	}

}
