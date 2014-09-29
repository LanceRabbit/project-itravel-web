package model.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import model.Account;
import model.AccountDAO;
import model.SpotOwner;
import model.SpotOwnerDAO;
import model.dao.AccountDAOHibernate;
import model.dao.SpotOwnerDAOHibernate;

public class AccountService {

	private AccountDAO dao = new AccountDAOHibernate();
	private SpotOwnerDAO daoOwner = new SpotOwnerDAOHibernate();
	private MessageDigest mDigest;

	public AccountService() {
	}

	private MessageDigest mDigest(byte[] temp) {
		try {
			mDigest = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return mDigest;
	}
	public Account signupAsMember(String email, String password, String nickname, byte[] image){
		Account account = new Account();
		account.setEmail(email);
		byte[] temp = password.getBytes();
		this.mDigest(temp);
		temp = mDigest.digest(temp);
		account.setPassword(temp);
		account.setNickname(nickname);
		if(image!=null){
			account.setImage(image);
		}else{
			account.setImage(null);//將圖設為預設圖示
		}
		account.setAccountLevel(3);
		Account result = dao.insert(account);
		return result;
		
	}
	public Account signupAsOwner(String email, String password, String nickname,String owner, byte[] image){
		Account account = new Account();
		
		account.setEmail(email);
		byte[] temp = password.getBytes();
		this.mDigest(temp);
		temp = mDigest.digest(temp);
		account.setPassword(temp);
		account.setNickname(nickname);
		if(image!=null){
			account.setImage(image);
		}else{
			account.setImage(null);//將圖設為預設圖示
		}
		account.setAccountLevel(5);
		Account result = dao.insert(account);
		if(result!=null){
			boolean insertOwnerOK = this.insertOwner(result.getAccountId(), owner);
			if(insertOwnerOK){
				return result;
			}else{
				return null;
			}
		}else{
			return null;
		}
		
	}
	private boolean insertOwner(String accountId, String owner){
		SpotOwner spotOwner = new SpotOwner();
		spotOwner.setAccountId(accountId);
		spotOwner.setOwnerName(owner);
		spotOwner = daoOwner.insert(spotOwner);
		if(spotOwner!=null){
			return true;
		}else{
			return false;
		}
		
	}
	public Account login(String email, String password) {
		Account bean = dao.selectByEmail(email);
		if (bean != null) {
			if (password != null) {
				byte[] pass = bean.getPassword();
				byte[] temp = password.getBytes();
				this.mDigest(temp);
				temp = mDigest.digest(temp);
				if (Arrays.equals(pass, temp)) {
					return bean;
				}
			}
		}
		return null;
	}

	public boolean changeAccount(String email, 
			String newPassword, String nickname, byte[] image) {
		Account account = this.selectByEmail(email);
		if (account != null) {
			if (newPassword != null) {
				byte[] temp = newPassword.getBytes();
				this.mDigest(temp);
				temp = mDigest.digest(temp);
				account.setPassword(temp);

			}
			if (nickname != null) {
				account.setNickname(nickname);
			}
			if (image != null) {
				account.setImage(image);
			}
			Account result = dao.update(account);
			if (result != null) {
				return true;
			}
		}
		return false;
	}
	public Account activateAccount(String accountId) {
		boolean result =false;
		int oAccLevel =(int) dao.selectById(accountId).getAccountLevel();
		//1--Member; 2--Owner;  3--UnactivateMember; 5--UnactivateOwner
		if(oAccLevel==3){
			result = dao.updateAccountLevel(accountId,1);
		}else if(oAccLevel==5){
			result = dao.updateAccountLevel(accountId,2);
		}
		if(result){
			return dao.selectById(accountId);
		}else{
			return null;
		}
		
	}
	public void setAccountLevelAsForgot(String accountId){
		int oAccLevel =(int) dao.selectById(accountId).getAccountLevel();
		//1--Member; 2--Owner;  6--ForgotPswMember; 7--ForgotPswOwner
		if(oAccLevel==1){
			dao.updateAccountLevel(accountId,6);
		}else if(oAccLevel==2){
			dao.updateAccountLevel(accountId,7);
		}
	}
	public Account resetAccountLevel(String accountId){
		boolean result =false;
		int oAccLevel =(int) dao.selectById(accountId).getAccountLevel();
		//1--Member; 2--Owner;  3--UnactivateMember; 5--UnactivateOwner
		if(oAccLevel==6){
			result = dao.updateAccountLevel(accountId,1);
		}else if(oAccLevel==7){
			result = dao.updateAccountLevel(accountId,2);
		}
		if(result){
			return dao.selectById(accountId);
		}else{
			return null;
		}
	}
	public Account selectByEmail(String email) {
		Account bean = dao.selectByEmail(email);
		if (bean != null) {
			return bean;
		}
		return null;
	}
	public Account selectById(String id) {
		Account bean = dao.selectById(id);
		if (bean != null) {
			return bean;
		}
		return null;
	}
	public boolean isUsableEmail(String email){
		Account bean = dao.selectByEmail(email);
		if (bean != null) {
			return false;
		}
		return true;
	}
	
	public static void main(String[] args) {
		AccountDAO dao = new AccountDAOHibernate();
		AccountService service = new AccountService();
//		Account bean = service.login("user2@gmail.com", "user2");
//		System.out.println(bean);
//		 boolean result = service.changeAccount("M14090001", "user1", null,
//		 "user1", null);
//		 System.out.println(result);
		
	}

}
