package model.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import model.SpotDetail;
import model.SpotImg;
import model.SpotImgDAO;
import model.util.HibernateUtil;
import model.util.ImageIOUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class SpotImgDAOHibernate implements SpotImgDAO {
	private SessionFactory sessionFactory = null;
	
	public SpotImg insert(SpotImg spotImg) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		
		SpotImg rest = null;
		try {
			tx = session.beginTransaction();
			
			// test : add a new spot_img
			Serializable spotSerialied = session.save(spotImg);		
			rest = (SpotImg)session.get(SpotImg.class, spotSerialied);
			rest.setTempImgId(spotImg.getImgId());

			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return rest;
	}

	public int delete(SpotImg img) {
		int rest = 0;
		
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		
		try {
			tx = session.beginTransaction();
			session.delete(img);	
			tx.commit();
		} catch (Exception e) {
			rest = 1;
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return rest;
	}

	public int deleteBySpotId(String spotId) {
		int rest = 0;
		
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		
		try {
			tx = session.beginTransaction();
				
			SpotDetail spot = (SpotDetail)session.get(SpotDetail.class, spotId);
			Set<SpotImg> images = spot.getSpotImgs();
			for(SpotImg image : images) {
				System.out.println("image id: " + image.getImgId());
				System.out.println("spot id: " + image.getSpotId());
				session.delete(image);	
			}
			
			//spot.setSpotImgs(null);
			//session.update(spot);

			tx.commit();
		} catch (Exception e) {
			rest = 1;
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return rest;
	}
	
	public SpotImg update(SpotImg img) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		
		SpotImg rest = null;
		try {
			tx = session.beginTransaction();
			session.update(img);
			
			rest = (SpotImg)session.get(SpotImg.class, img.getImgId());

			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return rest;
	}

	public SpotImg selectByImgId(String id) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		
		SpotImg rest = null;
		try {
			tx = session.beginTransaction();
			rest = (SpotImg)session.get(SpotImg.class, id);
			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return rest;
	}

	public Set<SpotImg> selectBySpotId(String id) {
		Set<SpotImg> rest = new HashSet<SpotImg>();
		
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		
		try {
			tx = session.beginTransaction();
			List<?> imgs = session.createQuery("FROM SpotImg img where img.spotId = ? order by img.imgOrder asc").setString(0, id).list();	
			for(Object img : imgs) {
				rest.add((SpotImg)img);
			}

			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return rest;
	}

	public static void main(String[] args) {
		SpotImgDAOHibernate dao = new SpotImgDAOHibernate();
//		String spotId = "RES14090019";
//		
//		for(int i=0; i<3; i++) {
//			SpotImg spotImg = new SpotImg();
//			spotImg.setSpotId(spotId);
//			spotImg.setSpotImg(ImageIOUtil.getImageByFilename(spotId+"_"+(i+1)));
//			spotImg.setImgOrder(i+1);
//			spotImg.setTempImgId("DUMMY");
//			
//			dao.insert(spotImg);
//		}
//		
//		SpotDetailDAOHibernate spotDetailDAO = new SpotDetailDAOHibernate();
//		SpotDetail spot = spotDetailDAO.selectBySpotId(spotId);
//		
//		Set<SpotImg> images = spot.getSpotImgs();
//		Iterator<SpotImg> it = images.iterator();
//		
//		while(it.hasNext()) {
//			SpotImg image = (SpotImg)it.next();
//			ImageIOUtil.saveImage(spotId, image.getImgId(), image.getSpotImg());
//		}
		
		dao.deleteBySpotId("PAR14090001");
	}

	@Override
	public SpotImg selectOneBySpotId(String id, int index) {
		SpotImg result = null;
		
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		
		try {
			tx = session.beginTransaction();
			Query query = session
					.createQuery("FROM SpotImg img where img.spotId = ? and img.imgOrder = ?")
					.setString(0, id)
					.setInteger(1, index);
					
			for(Object obj : query.list()) {
				result = (SpotImg)obj;
			}

			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return result;
	}
}
