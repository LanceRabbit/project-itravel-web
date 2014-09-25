package model.dao;

import java.util.ArrayList;
import java.util.List;

import model.Account;
import model.SpotDetail;
import model.SpotDetailDAO;
import model.Trip;
import model.util.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class SpotDetailDAOHibernate implements SpotDetailDAO {
	private SessionFactory sessionFactory = null;
	
	private static void printSpotInfo (SpotDetail theSpot) {
		System.out.println("spot : " + theSpot.getSpotName());
		System.out.println("spot id : " + theSpot.getSpotId());
		if(theSpot.getAddress() != null)
			System.out.println("spot address : " + theSpot.getAddress());
	}
	
	public SpotDetail insert(SpotDetail spot) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		
		try {
			tx = session.beginTransaction();
			
			//spot.setAccount(account);
			//spot.setAccountId("M14090002");
			
			// test : add a new spot_detail
			// modified by Lance.
			session.save(spot);		
			spot = (SpotDetail)session.get(SpotDetail.class, spot.getSpotId());
			spot.setTempSpotId(spot.getSpotId());

			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return spot;
	}

	public int delete(SpotDetail spot) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		
		// 0 for success
		int result = 0; 
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(spot);
			tx.commit();
		} catch (Exception e) {
			result = 1;
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return result;
	}

	public SpotDetail update(SpotDetail spot) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		
		SpotDetail restSpot = null;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.update(spot);
			restSpot = (SpotDetail)session.get(SpotDetail.class, spot.getSpotId());
			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return restSpot;
	}

	public SpotDetail select(String id) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		
		SpotDetail spot = null;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			spot = (SpotDetail)session.get(SpotDetail.class, id);
			
			// test : account
			Account creater = spot.getAccount();
			System.out.println("test account================================");
			System.out.println("Account with id : " + creater.getAccountId() + " created spot("+ id + ")");
			
//			// test : list spot_like_record
//			Set<SpotDetail> likedSpots = account.getSpotDetails_1();
//			Iterator<SpotDetail> it = likedSpots.iterator();
//			int i = 0;
//			while(it.hasNext()) {
//				i++;
//				System.out.println((i) + " :");
//				printSpotInfo(it.next());
//			}
//			
//			// test : add a record into table spot_like_record
//			Set<SpotDetail> newLikedSpots = new HashSet<SpotDetail>();
//			newLikedSpots.add((SpotDetail)session.get(SpotDetail.class, "SWT14090002"));
//			account.setSpotDetails_1(newLikedSpots);
//			session.saveOrUpdate(account);

			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return spot;
	}

	public List<SpotDetail> select(int pageNo) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
	
		List<SpotDetail> spots = new ArrayList<SpotDetail>();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("FROM SpotDetail spot ORDER BY spot.spotId");
			query.setFirstResult((pageNo-1)*4+1);
			query.setMaxResults(4);
			for(Object o : query.list()) {
				spots.add((SpotDetail)o);
			}
					
			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return spots;
	}
	
	public List<SpotDetail> selectTopN(int num) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
	
		List<SpotDetail> spots = new ArrayList<SpotDetail>();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();

			Query query = session
					.createQuery("FROM SpotDetail spot order by spot.likeCount DESC");
			query.setMaxResults(num);
			for (Object o : query.list()) {
				spots.add((SpotDetail) o);
			}
					
			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return spots;
	}
	
	public List<SpotDetail> selectByHQL(String queryStr) {
		if((queryStr == null) || (queryStr.length() <= 0))
			return null;
			
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
	
		List<SpotDetail> spots = new ArrayList<SpotDetail>();
		Transaction tx = null;
		
		try {
			tx = session.beginTransaction();

			Query query = session.createQuery(queryStr);
			for (Object o : query.list())
				spots.add((SpotDetail) o);
					
			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return spots;
	}
	
	public List<SpotDetail> selectByHQL(String queryStr, int pageNo) {
		if((queryStr == null) || (queryStr.length() <= 0))
			return null;
			
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
	
		List<SpotDetail> spots = new ArrayList<SpotDetail>();
		Transaction tx = null;
		
		try {
			tx = session.beginTransaction();
			Query query = session.createQuery(queryStr);
			if(pageNo > 0) {
				query.setFirstResult((pageNo-1)*4+1);
				query.setMaxResults(4);
			}
			
			for (Object o : query.list())
				spots.add((SpotDetail) o);
					
			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return spots;
	}
	
	public static void main(String[] args) {
		SpotDetailDAO dao = new SpotDetailDAOHibernate();
//		SpotDetail spot = new SpotDetail();
		
		// insert 
//		spot.setTempSpotId("EMP");
//		spot.setSpotName("Pizza");
//		spot.setCityId(1);
//		spot.setCategoryId(1);
//		spot.setSubcategoryId("RES");
//		
//		spot = dao.insert(spot);
//		System.out.println("test : insert================================");
//		SpotDetailDAOHibernate.printSpotInfo(spot);
		
		// select first 9 spots
//		List<SpotDetail> spots = dao.select(1);
//		for(SpotDetail spot : spots) {
//			SpotDetailDAOHibernate.printSpotInfo(spot);
//		}
		// select 
//		String spotId = spot.getSpotId();
//		spot = dao.select(spotId);
//		System.out.println("test : select================================");
//		SpotDetailDAOHibernate.printSpotInfo(spot);
		
		
		// update 
//		spot.setAddress("Taipei City");
//		spot = dao.update(spot);
//		System.out.println("test : update================================");
//		SpotDetailDAOHibernate.printSpotInfo(dao.select(spot.getSpotId()));
//		
		// delete
//		if( spot != null && dao.delete(spot) == 0) {
//			if(dao.select(spotId) == null) {
//				System.out.println("test : delete================================");
//				System.out.println("Spot (" + spotId + ") has been deleted.");
//			}
//		}
//		else 
//			System.out.println("ERROR!!");
		
//		List<SpotDetail> list =dao.selectTopN(5);
//		for (Object o : list) {
//			 System.out.println(o);
//			 }
		
		String query = "FROM SpotDetail spot  WHERE spot.cityId = 2 AND spot.spotName LIKE '%花博%'";
		SpotDetailDAOHibernate hibernateDAO = new SpotDetailDAOHibernate();
		List<SpotDetail> list =hibernateDAO.selectByHQL(query);
		if(list != null) {
			for (Object o : list) {
				System.out.println(o);
			}
		}
		else {
			System.out.println("null list....");
		}
	}
}
