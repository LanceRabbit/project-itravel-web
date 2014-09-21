package controller;

import java.io.IOException;
import java.io.InputStream;

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
		//System.out.println(filePart);
		if (filePart != null) {  
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
        }  
		// 呼叫Model
		service = new AccountService();
		Account bean = service.signupAsMember(email, password, nickname, image);
		System.out.println(bean);
		
		
		// 根據Model執行結果呼叫View

		if(bean==null) {
			
			request.getRequestDispatcher(
					"/secure/signup.jsp").forward(request, response);
		} else {
			EmailUtil.sendAccountActivateEmail(bean);//send email
			HttpSession session = request.getSession();
			session.setAttribute("user", bean);
				String path = request.getContextPath();
				response.sendRedirect(path+"/account/signupSuccess.jsp");
		}
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
