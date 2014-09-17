package model.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import model.Account;
import model.AccountDAO;
import model.dao.AccountDAOHibernate;

public class AccountService {

	private AccountDAO dao = new AccountDAOHibernate();
	private MessageDigest mDigest;

	public AccountService() {
	}

	public AccountService(AccountDAO dao) {
		try {
			mDigest = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		this.dao = dao;
	}
	private MessageDigest mDigest(byte[] temp) {
		try {
			mDigest = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return mDigest;
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

	public boolean changeAccount(String id, String oldPassword,
			String newPassword, String nickname, byte[] image) {
		Account account = this.login(id, oldPassword);
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

	public Account selectByEmail(String email) {
		Account bean = dao.selectByEmail(email);
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
		Account bean = service.login("user2@gmail.com", "user2");
		System.out.println(bean);
//		 boolean result = service.changeAccount("M14090001", "user1", null,
//		 "user1", null);
//		 System.out.println(result);
	}

}
