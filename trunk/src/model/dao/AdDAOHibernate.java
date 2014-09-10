package model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.Ad;
import model.AdDAO;
import model.Coupons;
import model.SpotDetail;
import model.util.HibernateUtil;

public class AdDAOHibernate implements AdDAO {
	private SessionFactory sessionFactory = null;
	
	public Ad insert(Ad ad) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();

			session.save(ad);
			ad = (Ad) session.get(Ad.class,
					ad.getAdId());
			ad.setTempAdId(ad.getAdId());

			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}

		return ad;
	}

	public int delete(Ad ad) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();

		// 0 for success
		int result = 0;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(ad);
			tx.commit();
		} catch (Exception e) {
			result = 1;
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}

	public Ad update(Ad ad) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		Ad result = null;
		try {
			tx = session.beginTransaction();

			result = (Ad) session.get(Ad.class, ad.getAdId());

			if (result != null) {
				result.setAdImg(ad.getAdImg());
				result.setValidDay(ad.getValidDay());
				result.setSpotDetail(ad.getSpotDetail());
			}
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}

	public Ad selectById(String id) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		Ad result = null;

		try {
			tx = session.beginTransaction();
			result = (Ad) session.get(Ad.class, id);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}

		return result;
	}

	public static void main(String[] args) {
		AdDAOHibernate dao = new AdDAOHibernate();
		Ad ad = new Ad();
		
		SpotDetail spot = new SpotDetail();
		spot.setSpotId("RES14090004");
		ad.setSpotDetail(spot);
		
		java.util.Date date = new java.util.Date();
		ad.setValidDay(date);
		ad.setTempAdId("EMP");
		ad = dao.insert(ad);
		
		System.out.println(ad);
		spot.setSpotId("RES14090007");
		ad = dao.update(ad);
		System.out.println(ad);
	}

}
