package model.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.Ad;
import model.SpotCollectRecord;
import model.SpotCollectRecordDAO;
import model.SpotCollectRecordId;
import model.SpotLikeRecord;
import model.util.HibernateUtil;

public class SpotCollectRecordDAOHibernate implements SpotCollectRecordDAO {

	private SessionFactory sessionFactory = null;

	// 測試
	public static void main(String[] args) {
		SpotCollectRecordDAO dao = new SpotCollectRecordDAOHibernate();
		SpotCollectRecordId spotColRec = new SpotCollectRecordId();
		SpotCollectRecord spot = null;

		// test: insert
		spotColRec.setAccountId("M14090002");
		spotColRec.setSpotId("RES14090002");
		spot = new SpotCollectRecord(spotColRec);
		spot = dao.insert(spot);
		System.out.println("已新增 =" + spot);

		// test: delet
		// spotColRec.setAccountId("M14090002");
		// spotColRec.setSpotId("RES14090002");
		// spot = new SpotCollectRecord(spotColRec);
		// dao.delete(spot);
		// test: select by accountId + spotId
		// 測試有沒有這筆使用者的收藏資料
		// spotColRec.setAccountId("M14090001");
		// spotColRec.setSpotId("RES14090002");
		// spot = new SpotCollectRecord(spotColRec);
		// spot.setId(spotColRec);
		// System.out.println(spot);
		// test: select by accountId
		// String accountId = "M14090001";
		// dao.select(accountId);
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
			return -100;
			
		}

		return 1000;
	}

	public SpotCollectRecord select(SpotCollectRecord spotColRec) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			spotColRec = (SpotCollectRecord) session.get(
					SpotCollectRecord.class, spotColRec.getId());

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

	public void select(String accountId) {

		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			List<?> spots = session
					.createQuery(
							"FROM SpotCollectRecord spots where spots.id.accountId = ?")
					.setString(0, accountId).list();

			System.out.println("liked spots : " + spots.size());
			for (Object o : spots) {
				SpotCollectRecord spot = (SpotCollectRecord) o;
				System.out.println(accountId + "likes spot id: "
						+ spot.getId().getSpotId());
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
	public int insert2(SpotCollectRecord spotColRec) {
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
			return -100;
		}
		return 100;
	
	}

}
