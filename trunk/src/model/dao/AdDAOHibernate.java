package model.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.Ad;
import model.AdDAO;
import model.Coupons;
import model.SpotCollectRecord;
import model.SpotDetail;
import model.SpotImg;
import model.util.HibernateUtil;
import model.util.ImageIOUtil;

public class AdDAOHibernate implements AdDAO {
	private SessionFactory sessionFactory = null;

	public Ad insert(Ad ad) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();

			session.save(ad);
			ad = (Ad) session.get(Ad.class, ad.getAdId());
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

	@Override
	public List<Ad> selectTopN(int num) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		List<Ad> ads = new ArrayList<Ad>();
		try {
			tx = session.beginTransaction();

			Query query = session
					.createQuery("FROM Ad ads where (ads.validDay > getDate()-1 ) order by ads.validDay ASC");
			query.setMaxResults(num);
			for (Object o : query.list()) {
				ads.add((Ad) o);
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

		return ads;
	}

	private static Calendar fromCal = Calendar.getInstance();
	private static DateFormat dateFormat = new SimpleDateFormat("(yyyy,MM,dd)");

	// 計算七天後到期日期
	public static java.util.Date addDate(java.util.Date now, int day) {
		try {

			now.setTime(now.getTime() + day * 1000 * 60 * 60 * 24);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return now;
	}

	public static void main(String[] args) {
		AdDAOHibernate dao = new AdDAOHibernate();
		Ad ad = new Ad();			
		SpotDetail spot = new SpotDetail();
		// spot.setSpotId("RES14090019");
		// ad.setSpotDetail(spot);
		 java.util.Date date = new java.util.Date();
		// //計算7天後到期的日期
		 date=addDate(date, 7);
		//
		// ad.setValidDay(date);
		// ad.setTempAdId("EMP");
		// ad = dao.insert(ad);

		// System.out.println(ad);
		// spot.setSpotId("RES14090007");
		// ad = dao.update(ad);
		// System.out.println(ad);

		// List<Ad> list = new ArrayList<Ad>();
		// list = dao.selectTopN(10);
		// for (Object o : list) {
		// System.out.println(o);
		// }

		// 放圖片		
//		  	spot.setSpotId("SWT14090001");
//			String adImgId = "D1409010";
//			ad.setAdId(adImgId);
//			ad.setValidDay(date);
//			ad.setSpotDetail(spot);
//			ad.setAdImg(ImageIOUtil.getImageByFilename("slide5.jpg"));
//			
//			dao.update(ad);
		

	}

}