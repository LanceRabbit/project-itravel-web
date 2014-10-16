package model.dao;

import java.util.ArrayList;
import java.util.List;

import model.Account;
import model.SpotDetail;
import model.SpotDetailDAO;
import model.Trip;
import model.service.SearchSpotService;
import model.util.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class SpotDetailDAOHibernate implements SpotDetailDAO {
	private SessionFactory sessionFactory = null;
		
	public SpotDetail insert(SpotDetail spot) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		
		try {
			tx = session.beginTransaction();

			if(spot.getCreationTime() == null)
				spot.setCreationTime(new java.util.Date());
			
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
			
			if(spot.getCreationTime() == null)
				spot.setCreationTime(new java.util.Date());
			
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

	public List<SpotDetail> selectAll() {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
	
		List<SpotDetail> spots = new ArrayList<SpotDetail>();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("FROM SpotDetail spot ORDER BY spot.creationTime DESC");
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
	
	public SpotDetail selectBySpotId(String id) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		
		SpotDetail spot = null;
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			spot = (SpotDetail)session.get(SpotDetail.class, id);
			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return spot;
	}

	public List<SpotDetail> selectByPageNo(int pageNo) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
	
		List<SpotDetail> spots = new ArrayList<SpotDetail>();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("FROM SpotDetail spot ORDER BY spot.creationTime DESC");
			query.setFirstResult((pageNo-1)*SearchSpotService.SPOTS_PER_PAGE+0);
			query.setMaxResults(SearchSpotService.SPOTS_PER_PAGE);
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
				//System.out.println("selectByHQL : page no : " + pageNo);
				query.setFirstResult((pageNo-1)*SearchSpotService.SPOTS_PER_PAGE+0);
				query.setMaxResults(SearchSpotService.SPOTS_PER_PAGE);
			}
			
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
	
	public static void main(String[] args) {
		SpotDetailDAO dao = new SpotDetailDAOHibernate();
//		SpotDetail spot = new SpotDetail();
		
		// insert
//		spot.setAccountId("M14090002");
//		spot.setSpotName("Pizza");
//		spot.setCityId(1);
//		spot.setCategoryId(1);
//		spot.setSubcategoryId("DEP");
//		spot.setTempSpotId("EMP");
//		//spot.setCreationTime(new java.util.Date());
//		
//		spot = dao.insert(spot);
//		System.out.println("test : insert================================");
//		System.out.println(spot.toString());
		
		// update 
//		spot.setAddress("Taipei City");
//		spot = dao.update(spot);
//		System.out.println("test : update================================");
//		System.out.println(spot.toString());
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
//		}
		
		// select 
//		List<SpotDetail> spots = dao.selectAll();
//		for(SpotDetail spot : spots) {
//			System.out.println(spot.toString());
//		}
		
		// select first 9 spots
//		List<SpotDetail> spots = dao.selectByPageNo(1);
//		for(SpotDetail spot : spots) {
//			System.out.println(spot.toString());
//		}
		
		String query = "FROM SpotDetail spot ORDER BY spot.creationTime DESC";
		//String query = "FROM SpotDetail spot WHERE spot.spotName LIKE '%蘭%' ORDER BY spot.creationTime DESC";
		SpotDetailDAOHibernate hibernateDAO = new SpotDetailDAOHibernate();
		List<SpotDetail> list =hibernateDAO.selectByHQL(query, 2);
		if(list != null) {
			for (SpotDetail o : list) {
				//System.out.println(o.toString());
			}
		}
		else {
			//System.out.println("null list....");
		}
	}
}
