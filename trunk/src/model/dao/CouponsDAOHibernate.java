package model.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.Account;
import model.Ad;
import model.Coupons;
import model.CouponsDAO;
import model.SpotDetail;
import model.Trip;
import model.TripDetail;
import model.util.HibernateUtil;

public class CouponsDAOHibernate implements CouponsDAO {
	private SessionFactory sessionFactory = null;
	
	public Coupons insert(Coupons coupon) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();

			session.save(coupon);
			coupon = (Coupons) session.get(Coupons.class,
					coupon.getCouponId());
			coupon.setTempCouponId(coupon.getCouponId());

			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}

		return coupon;
	}

	public int delete(Coupons coupon) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();

		// 0 for success
		int result = 0;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(coupon);
			tx.commit();
		} catch (Exception e) {
			result = 1;
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}

	public Coupons update(Coupons coupon) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		Coupons result = null;
		try {
			tx = session.beginTransaction();

			result = (Coupons) session.get(Coupons.class, coupon.getCouponId());

			if (result != null) {
				result.setCouponImg(coupon.getCouponImg());
				result.setCouponDescription(coupon.getCouponDescription());
				result.setSpotDetail(coupon.getSpotDetail());
				result.setValidDay(coupon.getValidDay());
			}
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}

	public Coupons selectById(String id) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		Coupons result = null;

		try {
			tx = session.beginTransaction();
			result = (Coupons) session.get(Coupons.class, id);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}

		return result;
	}

	
	
	public static void main(String[] args) {
		CouponsDAOHibernate dao = new CouponsDAOHibernate();
		Coupons coupon = new Coupons();
		
//		SpotDetail spot = new SpotDetail();
//		spot.setSpotId("RES14090004");
//		coupon.setSpotDetail(spot);
//		
//		java.util.Date date = new java.util.Date();
//		coupon.setValidDay(date);
//		coupon.setTempCouponId("EMP");
////		coupon = dao.insert(coupon);
//	
//		coupon.setCouponId("C1409001");
//		coupon.setCouponDescription("Wa ta si no Lance de s!!");
//		coupon = dao.update(coupon);
//		System.out.println(coupon);
		
//		coupon = dao.selectById("STR14100001");
//		if(coupon !=null){
//			dao.delete(coupon);
//			System.out.println("成功刪除");
//		}else{
//			System.out.println("刪除失敗");
//		}
		List<Coupons> result =dao.selectBySpotId("NAT14100001");
		System.out.println(result);
	}

	@Override
	public List<Coupons> selectByAccountId(String accountId) {

		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		List<Coupons> result = null;

		try {
			tx = session.beginTransaction();
			
			result = session.createQuery("From Coupons c where c.spotDetail.accountId='"+accountId+"'").list();
			
			
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Coupons> selectAll() {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		List<Coupons> result = null;
		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("from Coupons");//用HQL寫
			result = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Coupons> selectBySpotId(String spotId) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		List<Coupons> result = null;
		try {
			tx = session.beginTransaction();
			result = session.createQuery("From Coupons c where c.spotDetail.spotId='"+spotId+"' AND  (c.validDay > getDate()-1 ) order by c.validDay ASC").list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
		
	}

}
