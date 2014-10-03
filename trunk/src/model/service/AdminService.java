package model.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import model.Account;
import model.AccountDAO;
import model.BlacklistRecord;
import model.BlacklistRecordDAO;
import model.BlacklistRecordId;
import model.SpotCommentRecord;
import model.SpotCommentRecordDAO;
import model.dao.AccountDAOHibernate;
import model.dao.BlacklistRecordDAOHibernate;
import model.dao.SpotCommentRecordDAOHibernate;

public class AdminService {
	public static void main(String[] args) {

	}
	
	private AccountDAO dao = new AccountDAOHibernate();
	private BlacklistRecordDAO bdao = new BlacklistRecordDAOHibernate();
	private SpotCommentRecordDAO scdao = new SpotCommentRecordDAOHibernate();
	public AdminService(){
		
	}
	
	public boolean addBlacklist(String accountId, String deadline, String commentId ,String reporterId){
		//加入黑名單
		int oAccLevel =(int) dao.selectById(accountId).getAccountLevel();
		//1--Member; 2--Owner;  41--BlackeMember; 42--BlackeOwner
		boolean result1 = false;
		if(oAccLevel==1){
			result1 = dao.updateAccountLevel(accountId,41);
		}else if(oAccLevel==2){
			result1 = dao.updateAccountLevel(accountId,42);
		}
		//設定恢復權限日期
		boolean result2 = dao.updateBlackDeadline(accountId, deadline);
		//將不當comment改掉
		boolean result3 = scdao.update(commentId, "不當評論已屏蔽。");
		//更新blackListRecord處理狀態，原本為0，現改為1
		boolean result4 = this.updateBlacklistRecordStatus(reporterId, accountId, commentId);
		if(result1 && result2 && result3 && result4){
			return true;
		}else{
			return false;
		}
	}
	public boolean updateBlacklistRecordStatus(String reporterId,String reportedId,String commentId){
		BlacklistRecordId id = new BlacklistRecordId(reporterId,reportedId,commentId);
		boolean result = bdao.updateStatus(id);
		if(result){
			return true;
		}else{
			return false;
		}
	}
	public Account removeBlacklist(String accountId){
		int oAccLevel =(int) dao.selectById(accountId).getAccountLevel();
		//1--Member; 2--Owner;  41--BlackeMember; 42--BlackeOwner
		boolean result1 = false;
		if(oAccLevel==41){
			result1 = dao.updateAccountLevel(accountId,1);
		}else if(oAccLevel==42){
			result1 = dao.updateAccountLevel(accountId,2);
		}
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date current = new Date();
		String deadline = dateFormat.format(current);
		boolean result2 = dao.updateBlackDeadline(accountId, deadline);
		if(result1 && result2){
			Account account = dao.selectById(accountId);
			return account;
		}else{
			return null;
		}
		
	}
	public List<BlacklistRecord> getInitialBlacklist(int status){
		return bdao.selectByStatus(status);
	}
	public List<Account> getTempBlacklist(){
		List<Account> blacks = dao.selectBlackList();
		List<Account> result = new ArrayList<>();
		Date current = new Date();
		Calendar calendar = Calendar.getInstance();
    	calendar.setTime(current);
		for (Account black : blacks) {
			System.out.println("getTempBlacklist black= "+black);
			Date deadline = black.getLastLogonDt();
	    	calendar.add(Calendar.MONTH, 2);
			if(deadline.before(calendar.getTime())){
				result.add(black);
			}
		}
		return result;
	}
	public List<Account> getPermBlacklist(){
		List<Account> blacks = dao.selectBlackList();
		List<Account> result = new ArrayList<>();
		Date current = new Date();
		Calendar calendar = Calendar.getInstance();
    	calendar.setTime(current);
		for (Account black : blacks) {
			System.out.println("getPermBlacklist black= "+black);
			Date deadline = black.getLastLogonDt();
	    	calendar.add(Calendar.MONTH, 2);
			if(deadline.after(calendar.getTime())){
				result.add(black);
			}
		}
		return result;
	}
	public SpotCommentRecord getSpotCommentRecorByCommentId(String commentId){
		return scdao.selectByCommentId(commentId);
	}
	public String getAccountLevelById(String adccountId){
		int accountLevel = dao.selectById(adccountId).getAccountLevel();
		if(accountLevel==1 || accountLevel==41){
			return "使用者";
		}else if(accountLevel==2 || accountLevel==42){
			return "店家";
		}
		return null;
	}
	
}
