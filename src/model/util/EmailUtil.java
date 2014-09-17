package model.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import model.Account;

public class EmailUtil {
	private static final String FROM = "itravelcecj05@gmail.com";
	private static final String PASSWORD = "asdfuiop";
	
	
    /** 
     * 注册成功后,向用户发送帐户激活链接的邮件 
     * @param user 未激活的用户 
     */  
    public static void sendAccountActivateEmail(Account user) {  
    	Session session = getSession();
        MimeMessage message = new MimeMessage(session);  
        try {  
            message.setSubject("iTravel帳號驗證");  
            message.setSentDate(new Date());  
            message.setFrom(new InternetAddress(FROM,"愛旅遊客服中心"));  
            message.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));  
            message.setContent("<a href='" + GenerateLinkUtil.generateActivateLink(user)+"'>點擊驗證帳號</a><br/><br/>愛旅遊客服中心","text/html;charset=utf-8");  
            //發送郵件  
            Transport.send(message);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }
    /** 
     * 发送重设密码链接的邮件 
     */  
    public static void sendResetPasswordEmail(Account user) {  
        Session session = getSession();  
        MimeMessage message = new MimeMessage(session);  
        try {  
            message.setSubject("iTravel忘記密碼");  
            message.setSentDate(new Date());  
            message.setFrom(new InternetAddress(FROM,"愛旅遊客服中心"));  
            message.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));  
            message.setContent("要使用新的密碼, 請使用以下連結啟用密碼:<br/><a href='" + GenerateLinkUtil.generateResetPwdLink(user) +"'>點擊重新設置密碼</a><br/><br/>愛旅遊客服中心","text/html;charset=utf-8");  
            // 發送郵件  
            Transport.send(message);  
        } catch (Exception e) {  
            e.printStackTrace();  
        } 
        
    }  
    public static Session getSession() {  
        Properties props = new Properties(); 
        
        props.setProperty("mail.transport.protocol", "smtp");  
        props.setProperty("mail.smtp.host", "smtp.gmail.com");  
        props.setProperty("mail.smtp.port", "465");  //465、587
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.ssl.enable", "true");
        Session session = Session.getInstance(props, new Authenticator() {  
        @Override  
        protected PasswordAuthentication getPasswordAuthentication() {  
            return new PasswordAuthentication(FROM, PASSWORD);  
        }  
          
    });    
        return session;  
    } 
    
	public static void main(String[] args) {
		

	}

}

