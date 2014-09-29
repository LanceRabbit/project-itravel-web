package controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.Account;
import model.service.AccountService;
import model.util.EmailUtil;

import org.apache.commons.io.IOUtils;

@WebServlet("/controller/SignupServlet")
@MultipartConfig(maxFileSize = 8388608) //limitation 8MB
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = -1623656324694499109L;
	private AccountService service = null;


	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 接收資料
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String email = null;
		String password = null;
		String nickname = null;
		String owner = null;
		byte[] image = null;
		try {
			email = request.getParameter("email");
			password = request.getParameter("password");
			nickname = request.getParameter("nickname");
			System.out.println("Servlet Nickname="+nickname);
			owner = request.getParameter("owner");
			InputStream inputStream = null;
			Part filePart = request.getPart("image");
			//System.out.println("Print FilePart Size= "+filePart.getSize());
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
				//System.out.println("here");
				String path = request.getContextPath();
				try {
					inputStream = new URL("http://localhost:8080/TravelWeb/images/default_profile_pic.jpg").openStream();
					System.out.println(inputStream);
					image = IOUtils.toByteArray(inputStream);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (IllegalStateException e) {
			if(owner==null){
				request.setAttribute("errorImageMember", "圖片檔案過大!");
				request.getRequestDispatcher(
						"/first.jsp").forward(request, response);
				return;
			}else{
				request.setAttribute("errorImageOwner", "圖片檔案過大!");
				request.getRequestDispatcher(
						"/first.jsp").forward(request, response);
				return;
			}
			
		}
		// 呼叫Model
		service = new AccountService();
		Account bean = null;
		if(owner!=null){
			bean = service.signupAsOwner(email, password, nickname,owner, image);
		}else{
			bean = service.signupAsMember(email, password, nickname, image);
		}
		
		//System.out.println(bean);
		
		// 根據Model執行結果呼叫View
		HttpSession session = request.getSession();
		String path = request.getContextPath();
		if(bean!=null) {
			EmailUtil.sendAccountActivateEmail(bean);//send email
			session.setAttribute("signupOK", "true");
			response.sendRedirect(path+"/first.jsp");
//			request.setAttribute("email", bean.getEmail());
//			request.setAttribute("nickname", bean.getNickname());
//			request.getRequestDispatcher("/account/signupSuccess.jsp").forward(
//					request, response);
			return;
		} else {
			session.setAttribute("signupOK", "false");
			response.sendRedirect(path+"/first.jsp");
//			request.setAttribute("errorSignup","註冊發生錯誤，請重新註冊");
//			request.getRequestDispatcher(
//					"/secure/signup.jsp").forward(request, response);
		}
	}
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
