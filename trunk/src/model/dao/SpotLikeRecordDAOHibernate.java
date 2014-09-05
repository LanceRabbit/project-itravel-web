package model.dao;

import java.util.List;

import model.SpotDetail;
import model.SpotLikeRecord;
import model.SpotLikeRecordDAO;
import model.SpotLikeRecordId;
import model.util.HibernateUtil;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class SpotLikeRecordDAOHibernate implements SpotLikeRecordDAO {
	private SessionFactory sessionFactory = null;

	public static void main(String[] args) {

		SpotLikeRecordDAO dao = new SpotLikeRecordDAOHibernate();
		SpotLikeRecordId spotRec = new SpotLikeRecordId();
		SpotLikeRecord spot =null;
		
		//test: insert 
		//測試新增須先檢查DB內有沒有重複值
		/*
		spotRec.setAccountId("M14090001");
		spotRec.setSpotId("RES14090010");
		spot = new SpotLikeRecord(spotRec);
		spot = dao.insert(spot);
		System.out.println(spot);
		*/
		
		//test: delet
		//測試刪除須先檢查DB內有無資料
		/*
		spotRec.setAccountId("M14090001");
		spotRec.setSpotId("RES14090010");
		spot = new SpotLikeRecord(spotRec);
		dao.delete(spot);
		*/
		
		//test: select by accountId + spotId
		//spotRec.setAccountId("M14090003");
		//spotRec.setSpotId("RES14090002");
		//spot.setId(spotRec);
		//System.out.println(spot.getId());
		
		//test: select by account id
		String accountId = "M14090002";
		dao.select(accountId);
		
		
	}

	public SpotLikeRecord insert(SpotLikeRecord spotRec) {

		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			session.save(spotRec);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}
		return spotRec;
	}

	public int delete(SpotLikeRecord spotRec) {

		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		
		
		try {
			tx = session.beginTransaction();
			session.delete(spotRec);
			
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

	public SpotLikeRecord select(SpotLikeRecord spotid) {
		
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		
		
		try {
			tx = session.beginTransaction();
			
			spotid = (SpotLikeRecord) session.get(SpotLikeRecord.class,spotid);
			
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}
		
		
		return spotid;
	}

	//下HQL的select

	public void select(String accountId) {


		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		
		
		try {
			tx = session.beginTransaction();
			List<?> spots = session.createQuery("FROM SpotLikeRecord spot where spot.id.accountId = ?").setString(0, accountId).list();
			
			System.out.println("liked spots : " + spots.size());
			for (Object o : spots) {
				SpotLikeRecord spot = (SpotLikeRecord)o;
			    System.out.println(accountId + "likes spot id: " + spot.getId().getSpotId());
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
}
