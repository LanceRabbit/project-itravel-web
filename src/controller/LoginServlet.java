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
@WebServlet("/secure/login.controller")
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
// 驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("errorMsgs", errors);

		if(username==null || username.trim().length()==0) {
			errors.put("username", "Please enter ID");
		}
		if(password==null || password.trim().length()==0) {
			errors.put("password", "Please enter PWD");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"/secure/login.jsp").forward(request, response);
			return;
		}

//呼叫Model
		service = new AccountService();
		Account bean = service.login(username, password);
		
//根據Model執行結果呼叫View
		if(bean==null) {
			errors.put("password", "Login failed, please try again.");
			request.getRequestDispatcher(
					"/secure/login.jsp").forward(request, response);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("user", bean);
			String dest = (String) session.getAttribute("dest");
			if(dest!=null){
				response.sendRedirect(dest);
				session.removeAttribute("dest");
			}else{
				String path = request.getContextPath();
				response.sendRedirect(path+"/accountTest.jsp");
			}
			
			
//			response.setStatus(HttpServletResponse.SC_TEMPORARY_REDIRECT);
//			response.setHeader("Location", path+"/index.jsp");

		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
