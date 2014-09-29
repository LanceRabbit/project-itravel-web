package filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.service.AccountService;

@WebFilter(filterName="ResetPswFilter", 
		   urlPatterns={"/account/resetPsw.jsp",
		   })
public class ResetPswFilter implements Filter {
	Collection<String> url = new ArrayList<String>();
	String servletPath;
	String contextPath;
	String requestURI;

	public void init(FilterConfig fConfig) throws ServletException {
		Enumeration<String> e = fConfig.getInitParameterNames();
		while (e.hasMoreElements()) {
			String path = e.nextElement();
			url.add(fConfig.getInitParameter(path));
		}
	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		boolean isRequestedSessionIdValid = false;
		if (request instanceof HttpServletRequest
				&& response instanceof HttpServletResponse) {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			servletPath = req.getServletPath();
			contextPath = req.getContextPath();
			requestURI = req.getRequestURI();
			isRequestedSessionIdValid = req.isRequestedSessionIdValid();
			Map<String, String> errors = new HashMap<String, String>();
			request.setAttribute("errorMsgs", errors);
			HttpSession session = req.getSession();
			String email = (String) session.getAttribute("email");
			AccountService service = new AccountService();
			
			
			if (email!=null) { 
				Account account = service.selectByEmail(email);
				if(account.getAccountLevel()==3 || account.getAccountLevel()==5){
					session.setAttribute("activated", "false");
					resp.sendRedirect(req.getContextPath()+"/first.jsp");
					return;
				}else{
					chain.doFilter(request, response);
				}
			} else { 
//				HttpSession session = req.getSession();
//				session.setAttribute("errorMsgs_login", "請登入後使用。");
				resp.sendRedirect(contextPath + "/first.jsp");
				return;
			}

		} else {
			throw new ServletException("Request / Response 型態錯誤");
		}
	}

//	private boolean checkLogin(HttpServletRequest req) {
//		HttpSession session = req.getSession();
//		loginToken = (Account) session.getAttribute("user");
//		System.out.println("LoginFilter Test  =  "+loginToken);
//		if (loginToken == null) {
//			return false;
//		} else {
//			return true;
//		}
//	}

//	private boolean mustLogin() {
//		boolean login = false;
//		for (String sURL : url) {
//			if (sURL.endsWith("*")) {
//				sURL = sURL.substring(0, sURL.length() - 1);
//				if (servletPath.startsWith(sURL)) {
//					login = true;
//					break;
//				}
//			} else {
//				if (servletPath.equals(sURL)) {
//					login = true;
//					break;
//				}
//			}
//		}
//		return login;
//	}

	@Override
	public void destroy() {
	}
}