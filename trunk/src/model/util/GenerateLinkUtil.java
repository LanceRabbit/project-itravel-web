package model.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletRequest;

import model.Account;

public class GenerateLinkUtil {
	/**
	 * 生成帐户激活、重新设置密码的链接
	 */
	private static final String CHECK_CODE = "checkCode";

	/**
	 * 生成帐户激活链接
	 */
	public static String generateActivateLink(Account user) {
		return "http://localhost:8080/TravelWeb/controller/ActivateAccountServlet?email="
				+ user.getEmail() + "&" + CHECK_CODE + "="
				+ generateCheckcode(user);
	}

	/**
	 * 生成重设密码的链接
	 */
	public static String generateResetPwdLink(Account user) {
		return "http://localhost:8080/TravelWeb/controller/ResetPswServlet?email="
				+ user.getEmail()
				+ "&"
				+ CHECK_CODE
				+ "="
				+ generateCheckcodeForgotPassword(user);
	}

	/**
	 * 生成验证帐户的MD5校验码
	 * 
	 * @param user
	 *            要激活的帐户
	 * @return 将用户名和密码组合后，通过md5加密后的16进制格式的字符串
	 */
	public static String generateCheckcode(Account user) {
		return md5(user.getAccountId() + ":" + user.getAccountLevel());
	}
	
	public static String generateCheckcodeForgotPassword(Account user) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		//System.out.println(dateFormat.format(date));
		return md5(user.getAccountId() + ":" + dateFormat.format(date));
	}


	/**
	 * 验证校验码是否和注册时发送的验证码一致
	 * 
	 * @param user
	 *            要激活的帐户
	 * @param checkcode
	 *            注册时发送的校验码
	 * @return 如果一致返回true，否则返回false
	 */
	public static boolean verifyCheckcode(Account user, ServletRequest request) {
		String checkCode = request.getParameter(CHECK_CODE);
		return generateCheckcode(user).equals(checkCode);
	}
	public static boolean verifyCheckcodeForgotPassword(Account user, ServletRequest request) {
		String checkCode = request.getParameter(CHECK_CODE);
		return generateCheckcodeForgotPassword(user).equals(checkCode);
	}
	

	private static String md5(String string) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("md5");
			md.update(string.getBytes());
			byte[] md5Bytes = md.digest();
			return bytes2Hex(md5Bytes);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return null;
	}

	private static String bytes2Hex(byte[] byteArray) {
		StringBuffer strBuf = new StringBuffer();
		for (int i = 0; i < byteArray.length; i++) {
			if (byteArray[i] >= 0 && byteArray[i] < 16) {
				strBuf.append("0");
			}
			strBuf.append(Integer.toHexString(byteArray[i] & 0xFF));
		}
		return strBuf.toString();
	}

	public static void main(String[] args) {

	}

}
