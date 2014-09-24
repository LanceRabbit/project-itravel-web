package controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Account;
import model.service.AccountService;

import org.apache.commons.io.IOUtils;

@WebServlet("/controller/SignupServlet")
@MultipartConfig(maxFileSize = 16177215)
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = -1623656324694499109L;
	private AccountService service = null;


	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 接收資料
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		byte[] image=null;
		InputStream inputStream = null;
		Part filePart = request.getPart("image");
		System.out.println("Print FilePart Size= "+filePart.getSize());
		//System.out.println(filePart);
		if (filePart.getSize() != 0) {  
            // debug messages  
//            System.out.println(filePart.getName());  
//            System.out.println(filePart.getSize());  
//            System.out.println(filePart.getContentType());  
  
            // obtains input stream of the upload file  
            try {
				inputStream = filePart.getInputStream();
				image = IOUtils.toByteArray(inputStream);
			} catch (Exception e) {
				e.printStackTrace();
			}
//            System.out.println(bytes);
        }else if(filePart.getSize() == 0){
        	System.out.println("here");
        	String path = request.getContextPath();
        	try {
				inputStream = new URL("http://localhost:8080/TravelWeb/images/default_profile_pic.jpg").openStream();
				System.out.println(inputStream);
				image = IOUtils.toByteArray(inputStream);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
		// 呼叫Model
		service = new AccountService();
		Account bean = service.signupAsMember(email, password, nickname, image);
		//System.out.println(bean);
		
		// 根據Model執行結果呼叫View
		if(bean!=null) {
			//EmailUtil.sendAccountActivateEmail(bean);//send email
			request.setAttribute("email", bean.getEmail());
			request.setAttribute("nickname", bean.getNickname());
			request.getRequestDispatcher("/account/signupSuccess.jsp").forward(
					request, response);
		} else {
			request.setAttribute("errorSignup","註冊發生錯誤，請重新註冊");
			request.getRequestDispatcher(
					"/secure/signup.jsp").forward(request, response);
		}
	}
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
