package model.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;

import model.Account;
import model.AccountDAO;
import model.BlacklistRecord;
import model.util.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class AccountDAOHibernate implements AccountDAO {
	// 測試唷
	public static void main(String[] args) {
		AccountDAO dao = new AccountDAOHibernate();
		Account acc = new Account();
		MessageDigest mDigest = null;
		try {
			mDigest = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		String pass = "user4";
		byte[] temp = pass.getBytes();
		temp = mDigest.digest(temp);
		// Insert Test
//		 acc.setAccountId("M14090003");
//		 acc.setEmail("user4@gmail.com");
//		 acc.setPassword(temp);
//		 acc.setNickname("user4");
//		 acc.setLastLogonDt(new Date());
//		 acc = dao.insert(acc);
//		 System.out.println("Insert Account Data: "+acc);

		// Update Test
		acc.setAccountId("M14090004");
		acc.setEmail("user4@gmail.com");
		acc.setPassword(temp);
		acc.setNickname("user4");
		acc.setLastLogonDt(new Date());
		acc = dao.update(acc);
		System.out.println("Update Test:" + acc);

		// SelectById Test
		acc = dao.selectById("M14090001");
		//要抓景點或行程收藏時可直接用Account的get方法，Account.hbn.xml的lazy要設false
//		Set<Trip> tripDetails = acc.getTrips_1();
//		Iterator<Trip> tripDetail = tripDetails.iterator();
//		
//		int count = 0;
//		while(tripDetail.hasNext()) {
//			count++; 
//			Trip trips = (Trip)tripDetail.next();
//			System.out.println("GET TRIP FROM ACCOUNT: "+trips);
//		}
		System.out.println("SelectById Test:" + acc);
		
		//SelectByEmail Test
		acc = dao.selectByEmail("user1@gmail.com");
		System.out.println("SelectByEmail Test:" + acc);
		//SelectAll Test
		List<Account> accAll = dao.selectAll();
		System.out.println("SelectAll Test:"+accAll);
		
	}

	private SessionFactory sessionFactory = null;
	@Override
	public Account insert(Account account) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		Account result = null;
		try {
			tx = session.beginTransaction();
			session.save(account);
			result = (Account) session.get(Account.class,
					account.getAccountId());
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public Account update(Account account) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		Account result = null;
		try {
			tx = session.beginTransaction();
			result = (Account) session.get(Account.class,
					account.getAccountId());
			if(result!=null){
				result.setPassword(account.getPassword());
				result.setNickname(account.getNickname());
				result.setImage(account.getImage());
			}
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public boolean updateAccountLevel(String accountId, int accountLevel) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		int result = 0;
		try {
			tx = session.beginTransaction();
			result = session.createQuery("update Account ac set ac.accountLevel = "+accountLevel+
		    				" where ac.accountId = '"+accountId+"'").executeUpdate();
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		if(result==1){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public Account selectById(String id) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		Account result = null;
		try {
			tx = session.beginTransaction();
			result = (Account) session.get(Account.class, id);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public Account selectByEmail(String email) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		Account result = null;
		try {
			tx = session.beginTransaction();
			result = (Account) session
					.createQuery(
							"FROM Account ac where ac.email = ?")
					.setString(0, email).uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public List<Account> selectAll() {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		List<Account> result = null;
		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("from Account");//用HQL寫
			result = query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}
	

	

}
