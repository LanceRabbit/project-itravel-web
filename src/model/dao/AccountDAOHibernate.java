package model.dao;

import java.util.Date;
import java.util.List;

import model.Account;
import model.AccountDAO;
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

		// Insert Test
		// acc.setAccountId("M14090003");
		// acc.setEmail("user4@gmail.com");
		// acc.setPassword("user4");
		// acc.setNickname("user4");
		// acc = dao.insert(acc);
		// System.out.println("Insert Account Data: "+acc);

		// Update Test
		acc.setAccountId("M14090004");
		acc.setEmail("user4@gmail.com");
		acc.setPassword("user4");
		acc.setNickname("user4");
		acc.setLastLogonDt(new Date());
		acc = dao.update(acc);
		System.out.println("Update Test:" + acc);

		// SelectById Test
		acc = dao.selectById("M14090004");
		System.out.println("SelectById Test:" + acc);
		
		//SelectAll Test
		List<Account> accAll = dao.selectAll();
		System.out.println("SelectAll Test:"+accAll);
		
	}

	private SessionFactory sessionFactory = null;

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

	public Account update(Account account) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		Account result = null;
		try {
			tx = session.beginTransaction();
			session.update(account);
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
