package model.dao;

import javafx.scene.effect.Light.Spot;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.Account;
import model.SpotCommentRecord;
import model.SpotCommentRecordDAO;
import model.SpotDetail;
import model.Trip;
import model.util.HibernateUtil;

public class SpotCommentRecordDAOHibernate implements SpotCommentRecordDAO {
	private SessionFactory sessionFactory = null;
	public static void main(String[] args) {
		SpotCommentRecordDAO dao = new SpotCommentRecordDAOHibernate();
		SpotCommentRecord spot = new SpotCommentRecord();
		
		//test: insert 
		
		java.util.Date date = new java.util.Date();
		spot.setCmtDt(date);
		spot.setComment("it's a good place!!");		
		spot.setTempCommentId("CMT");//設定temp 之後trigger再取產生的CommentId
		spot.setAccountId("M14090003");
		spot.setSpotId("RES14090007");
		
//		spot.setSpotDetail(testspot);
//		spot.setAccount(test);
		//spotComRec.setCommentId("");
		spot = dao.insert(spot);
		System.out.println(spot);
		

	}

	
	public SpotCommentRecord insert(SpotCommentRecord spotComRec) {
		
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			session.save(spotComRec);
			spotComRec = (SpotCommentRecord)session.get(SpotCommentRecord.class, spotComRec.getCommentId());
			spotComRec.setTempCommentId(spotComRec.getCommentId());			
					
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}

		return spotComRec;

	}

	public SpotCommentRecord delte(String commId) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			
			
			
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}
		return null;
	}

	public SpotCommentRecord select(SpotCommentRecord spotComRec) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			
			
			
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}
		return null;
	}

	public SpotCommentRecord selectBySpot(String spotId) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			
			
			
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}
		return null;
	}

	
}
