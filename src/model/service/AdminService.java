package model.service;

import java.util.Date;

import model.Account;
import model.AccountDAO;
import model.BlacklistRecordDAO;
import model.dao.AccountDAOHibernate;
import model.dao.BlacklistRecordDAOHibernate;

public class AdminService {
	public static void main(String[] args) {

	}
	
	private AccountDAO dao = new AccountDAOHibernate();
	private BlacklistRecordDAO bdao = new BlacklistRecordDAOHibernate();
	public AdminService(){
		
	}
	
	public void addBlacklist(String accountId, Date deadline){
		
	}
	public Account removeBlacklist(String accountId){
		int oAccLevel =(int) dao.selectById(accountId).getAccountLevel();
		//1--Member; 2--Owner;  41--BlackeMember; 42--BlackeOwner
		if(oAccLevel==41){
			dao.updateAccountLevel(accountId,1);
		}else if(oAccLevel==42){
			 dao.updateAccountLevel(accountId,2);
		}
		dao.updateBlackDeadline(accountId, null);
		Account account = dao.selectById(accountId);
		return account;
	}
	

}
