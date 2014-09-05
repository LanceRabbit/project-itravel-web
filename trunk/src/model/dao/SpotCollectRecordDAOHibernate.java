package model.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.SpotCollectRecord;
import model.SpotCollectRecordDAO;
import model.util.HibernateUtil;

public class SpotCollectRecordDAOHibernate implements SpotCollectRecordDAO {

	private SessionFactory sessionFactory = null;

	// 測試
	public static void main(String[] args) {
		//test: insert
		//test: delet
		//test: select by accountId + spotId
		//test: select by accountId
	}

	public SpotCollectRecord insert(SpotCollectRecord spotColRec) {

		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			session.save(spotColRec);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}
		
		return spotColRec;
	}

	public int delete(SpotCollectRecord spotColRec) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		
		
		try {
			tx = session.beginTransaction();
			session.delete(spotColRec);		
			
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}
	
		return 0;
	}

	public SpotCollectRecord select(SpotCollectRecord spotColRec) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		
		
		try {
			tx = session.beginTransaction();
			session.get(SpotCollectRecord.class, spotColRec);
			
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}
	
		
		return spotColRec;
	}

}
