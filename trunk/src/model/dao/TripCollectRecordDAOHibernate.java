package model.dao;

import java.util.List;

import model.SpotCollectRecord;
import model.SpotCollectRecordDAO;
import model.TripCollectRecord;
import model.TripCollectRecordDAO;
import model.TripCollectRecordId;
import model.util.HibernateUtil;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class TripCollectRecordDAOHibernate implements TripCollectRecordDAO {

	private SessionFactory sessionFactory = null;

	// 測試
	public static void main(String[] args) {
		TripCollectRecordDAO dao = new TripCollectRecordDAOHibernate();
		TripCollectRecordId tripColRec = new TripCollectRecordId();
		TripCollectRecord trip = null;

		 //test: insert
//		 tripColRec.setAccountId("M14090001");
//		 tripColRec.setTripId("T14090003");
//		 trip = new TripCollectRecord(tripColRec);
//		 trip = dao.insert(trip);
//		 System.out.println("已新增 ="+trip);

		// test: delet
//		 tripColRec.setAccountId("M14090001");
//		 tripColRec.setTripId("T14090003");
//		 trip = new TripCollectRecord(tripColRec);
//		 dao.delete(trip);
		//test: select by accountId + tripId
		//測試有沒有這筆使用者的收藏資料
//		 tripColRec.setAccountId("M14090001");
//		 tripColRec.setTripId("T14090003");
//		 trip = new TripCollectRecord(tripColRec);
//		 dao.select(trip);
//		 System.out.println(trip);		 

		// test: select by accountId
		 String accountId = "M14090001";
		 dao.select(accountId);
	}


	public TripCollectRecord insert(TripCollectRecord tripColRec) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			session.save(tripColRec);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}

		return tripColRec;		
	}

	public int delete(TripCollectRecord tripColRec) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			session.delete(tripColRec);

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

	public TripCollectRecord select(TripCollectRecord tripColRec) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			tripColRec = (TripCollectRecord)session.get(TripCollectRecord.class, tripColRec.getId());

			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}

		return tripColRec;
	}
	
	// 下HQL的select
		public void select(String accountId) {

			sessionFactory = HibernateUtil.getSessionFactory();
			Session session = this.sessionFactory.getCurrentSession();
			Transaction tx = null;

			try {
				tx = session.beginTransaction();
				List<?> trips = session
						.createQuery(
								"FROM TripCollectRecord trips where trips.id.accountId = ?")
						.setString(0, accountId).list();

				System.out.println("liked trips : " + trips.size());
				for (Object o : trips) {
					TripCollectRecord trip = (TripCollectRecord) o;
					System.out.println(accountId + "likes trip id: "
							+ trip.getId().getTripId());
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
		public int insert2(TripCollectRecord tripColRec) {
			sessionFactory = HibernateUtil.getSessionFactory();
			Session session = this.sessionFactory.getCurrentSession();
			Transaction tx = null;

			try {
				tx = session.beginTransaction();
				session.save(tripColRec);
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
