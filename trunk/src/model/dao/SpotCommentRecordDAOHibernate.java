package model.dao;

import java.util.List;




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

		// test: insert

		 java.util.Date date = new java.util.Date();
		 spot.setCmtDt(date);
		 spot.setComment("是我吃過最好吃的pizza了!!!");
		 spot.setTempCommentId("CMT");
		 spot.setAccountId("M14090001");
		 spot.setSpotId("RES14090019");
		 spot = dao.insert(spot);
		 //System.out.println(spot);
		

		// test: select
//		java.util.Date date = new java.util.Date();
//		spot.setCmtDt(date);
//		spot.setComment("景色優美東西好吃!!!");
//		spot.setCommentId("CMT140900001");
//		spot.setAccountId("M14090001");
//		spot.setSpotId("RES14090002");
//		 spot=dao.select(spot);
//		 System.out.println("select:"+spot);

		// test: delet
		//先找有沒有這筆評論Id ，再殺資料
//		String commId = spot.getCommentId();
//		spot = dao.selectByCommentId(commId);
//		dao.delte(spot);
		
		//test: 景點的comment selectBySpot		
//		List<SpotCommentRecord> spotlist=null;
//		spot.setSpotId("RES14090002");
//		String spotId = spot.getSpotId(); 
//		spotlist = dao.selectBySpot(spotId);
//		System.out.println(spotlist);
		
		
		
		
	}

	public SpotCommentRecord insert(SpotCommentRecord spotComRec) {

		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			session.save(spotComRec);
			spotComRec = (SpotCommentRecord) session.get(
					SpotCommentRecord.class, spotComRec.getCommentId());
			spotComRec.setTempCommentId(spotComRec.getCommentId());

			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				//System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}

		return spotComRec;

	}

	public int delte(SpotCommentRecord spotComRec) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;		
		try {
			tx = session.beginTransaction();
			session.delete(spotComRec);

			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				//System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}
		return 0;
	}

	public SpotCommentRecord select(SpotCommentRecord spotComRec) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			spotComRec = (SpotCommentRecord) session.get(
					SpotCommentRecord.class, spotComRec.getCommentId());

			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				//System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}
		return spotComRec;
	}

	public List<SpotCommentRecord> selectBySpot(String spotId) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		List<SpotCommentRecord> result = null;
		try {
			tx = session.beginTransaction();
			  result = session.createQuery("FROM SpotCommentRecord sp where sp.spotId = ?").setString(0, spotId).list();
			//System.out.println(result.size());

			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				//System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public SpotCommentRecord selectByCommentId(String commId) {
		SpotCommentRecord result = null;
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		
		try {
			tx = session.beginTransaction();
			result = (SpotCommentRecord)session.get(SpotCommentRecord.class, commId);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				//System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public boolean update(String commentId, String comment) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		int result = 0;
		try {
			tx = session.beginTransaction();
			result = session.createQuery("update SpotCommentRecord acr set acr.comment = '"+comment+"'"+
		    				" where acr.commentId = '"+commentId+"'").executeUpdate();
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		if(result==1){
			return true;
		}else{
			return false;
		}
		
	}

}
