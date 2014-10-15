package model.dao;

import java.util.ArrayList;
import java.util.List;

import model.Account;
import model.BlacklistRecord;
import model.BlacklistRecordDAO;
import model.BlacklistRecordId;
import model.util.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class BlacklistRecordDAOHibernate implements BlacklistRecordDAO {
	public static void main(String[] args) {
		BlacklistRecordDAO dao =new BlacklistRecordDAOHibernate();
		//Insert Test
		BlacklistRecord bRecord = new BlacklistRecord();
		BlacklistRecordId id = new BlacklistRecordId();
		id.setReporterId("M14090001");
		id.setReportedId("M14090002");
		id.setCommentId("CMT140900003");
		bRecord.setId(id);
		bRecord.setReason("liar");
		bRecord.setReportDt(new java.util.Date());
		bRecord.setStatus(0);
		bRecord = dao.insert(bRecord);
		//System.out.println("Insert Test:"+bRecord);
		
//		//Select Test
//		List<BlacklistRecord> bRecord1 = null;
//		//select all, id=null;
//		//三條件隨意開關，測select排列組合
//		//id.setReporterId("M14090002");
//		//id.setReportedId("M14090003");
//		id.setCommentId("CMT140900001");
//		
//		bRecord1 = dao.select(id);
//		System.out.println("Select Test筆數:"+bRecord1.size());
//		System.out.println("Select Test:"+bRecord1);
		
	}

	private SessionFactory sessionFactory = null;

	public BlacklistRecord insert(BlacklistRecord bRecord) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(bRecord);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return bRecord;
	}
	
	public List<BlacklistRecord> select(BlacklistRecordId id) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		String reporterId = null;
		String reportedId = null;
		String commentId = null;
		
		try {
			reporterId = id.getReporterId();
			reportedId = id.getReportedId();
			commentId = id.getCommentId();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		List<BlacklistRecord> result = new ArrayList<BlacklistRecord>();

		try {
			tx = session.beginTransaction();
			if (reporterId != null) {
				if (reportedId != null) {
					if (commentId != null) {
						// 三者皆有
						BlacklistRecord temp = (BlacklistRecord)session.get(
								BlacklistRecord.class, id);
						result.add(temp);
						
					} else if (commentId == null) {
						// 無commentId
						result = (List<BlacklistRecord>) session
								.createQuery(
										"FROM BlacklistRecord br where br.id.reporterId = ? and br.id.reportedId = ?")
								.setString(0, reporterId)
								.setString(1, reportedId).list();
					}
				}
				if (reportedId == null) {
					if (commentId != null) {
						// 無reportedId
						result = (List<BlacklistRecord>) session
								.createQuery(
										"FROM BlacklistRecord br where br.id.commentId = ?")
								.setString(0, commentId).list();
					} else if (commentId == null) {
						// 只有reporterId
						result = (List<BlacklistRecord>) session
								.createQuery(
										"FROM BlacklistRecord br where br.id.reporterId = ?")
								.setString(0, reporterId).list();
					}

				}
			} else if (reporterId == null) {
				if (reportedId != null) {
					if (commentId != null) {
						// 無reporterId
						result = (List<BlacklistRecord>) session
								.createQuery(
										"FROM BlacklistRecord br where br.id.reportedId = ? and br.id.commentId = ?")
								.setString(0, reportedId)
								.setString(1, commentId).list();
					} else if (commentId == null) {
						// 只有reportedId
						result = (List<BlacklistRecord>) session
								.createQuery(
										"FROM BlacklistRecord br where br.id.reportedId = ?")
								.setString(0, reportedId).list();
					}
				}
				if (reportedId == null) {
					if (commentId != null) {
						// 只有commentId
						result = (List<BlacklistRecord>) session
								.createQuery(
										"FROM BlacklistRecord br where br.id.commentId = ?")
								.setString(0, commentId).list();

					} else if (commentId == null) {
						// 全無
						result = (List<BlacklistRecord>) session.createQuery(
								"from BlacklistRecord").list();// 用HQL寫
					}
				}
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
	public List<BlacklistRecord> selectByStatus(int status) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		List<BlacklistRecord> result = new ArrayList<BlacklistRecord>();
		try {
			tx = session.beginTransaction();
			result = (List<BlacklistRecord>) session
					.createQuery(
							"FROM BlacklistRecord br where br.status ="+status + "order by br.reportDt").list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean updateStatus(BlacklistRecordId id) {
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = this.sessionFactory.getCurrentSession();
		Transaction tx = null;
		String reporterId = null;
		String reportedId = null;
		String commentId = null;
		try {
			reporterId = id.getReporterId();
			reportedId = id.getReportedId();
			commentId = id.getCommentId();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		int result = 0;
		try {
			tx = session.beginTransaction();
			result = session.createQuery("update BlacklistRecord br set br.status = 1 "
					+ "where br.id.reporterId = '"+reporterId+"' "
							+ "and br.id.reportedId = '"+reportedId+"' "
									+ "and br.id.commentId = '"+commentId+"'").executeUpdate();
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

}
