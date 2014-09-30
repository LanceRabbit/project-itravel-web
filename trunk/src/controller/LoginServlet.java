package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import model.service.AdminService;
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
		
		String fromAndTo = referer.substring(31);
		String end4 = referer.substring(referer.length()-4);
		HttpSession session = request.getSession();
		String path = request.getContextPath();
		if(end4.equals(".jsp")){
			session.setAttribute("redirectTo", referer);
			session.setAttribute("requestFrom", fromAndTo);
		}
		System.out.println("TEST==Redirect============="+(String)session.getAttribute("redirectTo"));
		System.out.println("TEST===Forward============"+(String)session.getAttribute("requestFrom"));
		if(bean!=null) {
			if(bean.getAccountLevel()==3||bean.getAccountLevel()==5){
				session.setAttribute("activated", "false");
				response.sendRedirect(path+"/first.jsp");
				return;
			}else if(bean.getAccountLevel()==6||bean.getAccountLevel()==7){
				bean = service.resetAccountLevel(bean.getAccountId());
			}else if(bean.getAccountLevel()==41 || bean.getAccountLevel()==42){
				//41=blackMember and 42=blackOwner
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date current = null;
				Date black = null;
				try {
					current = df.parse(df.format(new Date()));
					black = df.parse(df.format(bean.getLastLogonDt()));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				if(black==null){
					//accountLevel為4，卻沒有black時間，表示永久凍結
					session.setAttribute("accountLocked", "帳號停權中。");
					response.sendRedirect(path+"/first.jsp");
					return;
				}else{
					if(current.after(black) || current.equals(black)){
						//如果已經超過停權時間(同一天也算)，就1.更改accountLevel 2.remove停權日期 3.登入成功
						AdminService adservice = new AdminService();
						bean = adservice.removeBlacklist(bean.getAccountId());
					}else{
						//還在停權
						session.setAttribute("accountLocked", "帳號停權中，將於"+df.format(bean.getLastLogonDt())+"恢復權限。");
						response.sendRedirect(path+"/first.jsp");
						return;
						
					}
				}
				
			}
			session.setAttribute("user", bean);
			session.removeAttribute("requestFrom");
			String redirectTo = (String)session.getAttribute("redirectTo");
			session.removeAttribute("redirectTo");
			response.sendRedirect(redirectTo);
			return;
		} else {
			errors.put("login", "Email或密碼錯誤，請重新登入。");
//			session.setAttribute("errorMsgs_login", "Email或密碼錯誤，請重新登入。");
//			response.sendRedirect(referer);
			request.getRequestDispatcher(
					(String)session.getAttribute("requestFrom")).forward(request, response);
			
			
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
