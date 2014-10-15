package model.dao;

import java.io.Serializable;
import java.util.List;

import model.Account;
import model.AccountDAO;
import model.SpotOwner;
import model.SpotOwnerDAO;
import model.util.HibernateUtil;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class SpotOwnerDAOHibernate implements SpotOwnerDAO {
	
	public static void main(String[] args) {
		SpotOwnerDAO dao = new SpotOwnerDAOHibernate();
		SpotOwner sp = new SpotOwner();
		
//		AccountDAO dao1 = new AccountDAOHibernate();
//		Account acc = null;
//		acc = dao1.selectById("M14090002");
//		System.out.println(acc);
		
//		sp.setAccount(acc);
		//Insert & Update Test
		sp.setAccountId("M14090002");
		sp.setOwnerName("Adela");
//		sp = dao.insert(sp);
//		sp = dao.update(sp);
		
		//SelectById Test
		sp = dao.selectById("M14090001");
		//System.out.println("SelectById Test: "+sp);
		
		//SelectAll Test
		List<SpotOwner> sp1 = dao.selectAll();
		//System.out.println("SelectAll Test: "+sp1);
		
		//Delete Test
//		int result = dao.delete("M14090002");
//		System.out.println("Delete Test: "+result);
	}
	private SessionFactory sessionFactory = null;
	public SpotOwner insert(SpotOwner spotOwner) {
		//SpotOwner result = null;
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			//System.out.println("spot owner : accountId = " + spotOwner.getAccountId());
			//System.out.println("spot owner : name = " + spotOwner.getOwnerName());
			session.save(spotOwner);
			//Serializable id = session.save(spotOwner);
			//result = (SpotOwner)session.get(SpotOwner.class, id);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return spotOwner;
	}

	public SpotOwner update(SpotOwner spotOwner) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		SpotOwner result = null;
		try {
			tx = session.beginTransaction();
			session.update(spotOwner);
			result = (SpotOwner) session.get(SpotOwner.class,
					spotOwner.getAccountId());
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}

	public SpotOwner selectById(String id) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		SpotOwner result = null;
		try {
			tx = session.beginTransaction();
			result = (SpotOwner) session.get(SpotOwner.class, id);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}

	public List<SpotOwner> selectAll() {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		List<SpotOwner> result = null;
		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("from SpotOwner");//用HQL寫
			result = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}

	public int delete(String id) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		int result = 0;
		try {
			tx = session.beginTransaction();
			SpotOwner spotOwner = (SpotOwner) session.load(SpotOwner.class, id);
			session.delete(spotOwner);
			tx.commit();
			result=1;
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
				//System.out.println(e.getMessage());
			}
			e.printStackTrace();
		}
		return result;
	}

}
