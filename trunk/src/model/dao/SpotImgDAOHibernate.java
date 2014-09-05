package model.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;

import model.SpotDetail;
import model.SpotImg;
import model.SpotImgDAO;
import model.util.HibernateUtil;
import model.util.ImageIOUtil;

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
		// TODO Auto-generated method stub
		return 0;
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
			images.removeAll((Collection<SpotImg>)images);

			tx.commit();
		} catch (Exception e) {
			if(tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		
		return rest;
	}
	
	public SpotImg update(SpotImg img) {
		// TODO Auto-generated method stub
		return null;
	}

	public SpotImg selectByImgId(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public SpotImg selectBySpotId(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public static void main(String[] args) {
		SpotImgDAOHibernate dao = new SpotImgDAOHibernate();
		
		for(int i=0; i<3; i++) {
			SpotImg spotImg = new SpotImg();
			spotImg.setSpotId("RES14090001");
			spotImg.setSpotImg(ImageIOUtil.getImageByFilename("taipei_"+(i+1)+".jpg"));
			spotImg.setImgOrder(i+1);
			spotImg.setTempImgId("DUMMY");
			
			dao.insert(spotImg);
		}
		
		SpotDetailDAOHibernate spotDetailDAO = new SpotDetailDAOHibernate();
		SpotDetail spot = spotDetailDAO.select("RES14090001");
		
		Set<SpotImg> images = spot.getSpotImgs();
		Iterator<SpotImg> it = images.iterator();
		
		int count = 0;
		while(it.hasNext()) {
			count++; 
			SpotImg image = (SpotImg)it.next();
			ImageIOUtil.saveImage(count+".jpg", image.getSpotImg());
		}
		
		dao.deleteBySpotId("RES14090001");
	}
}
