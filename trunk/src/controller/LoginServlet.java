package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.service.AccountService;
@WebServlet("/controller/LoginServlet")
public class LoginServlet extends HttpServlet {
	private AccountService service = null;
	
//	@Override
//	public void init() throws ServletException {
//		ServletContext application = this.getServletContext();
//		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);
//		this.service = (CustomerService) context.getBean("customerService");
//	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
// 接收資料
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
// 驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errorMsgs", errors);

		if(email==null || email.trim().length()==0) {
			errors.put("email", "Please enter Email");
		}
		if(password==null || password.trim().length()==0) {
			errors.put("password", "Please enter Password");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"/first.jsp").forward(request, response);
			return;
		}

//呼叫Model
		service = new AccountService();
		Account bean = service.login(email, password);
		
//根據Model執行結果呼叫View
		//抓出request的最後一個"/"之後的資料，例如"/frist.jsp"
		String referer = request.getHeader("referer");
		String fromAndTo = referer.substring(referer.lastIndexOf("/"));
		HttpSession session = request.getSession();
		if(bean!=null) {
			session.setAttribute("user", bean);
			session.setAttribute("errorMsgs_login", "");
			request.getRequestDispatcher(
					fromAndTo).forward(request, response);
			return;
		} else {
			errors.put("login", "Email或密碼錯誤，請重新登入。");
			session.setAttribute("errorMsgs_login", "");
			request.getRequestDispatcher(
					fromAndTo).forward(request, response);
			
			
//			response.setStatus(HttpServletResponse.SC_TEMPORARY_REDIRECT);
//			response.setHeader("Location", path+"/index.jsp");
			return;
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
