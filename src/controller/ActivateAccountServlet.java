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
import model.util.GenerateLinkUtil;

@WebServlet("/controller/ActivateAccountServlet")
public class ActivateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ActivateAccountServlet() {
        super();
    }
    protected void doActivate(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
    
    	AccountService service = new AccountService();
    	String email = request.getParameter("email");
    	Account user = service.selectByEmail(email);
    	//若從request來的Checkcode跟從accountId產生的相同，則啟用帳戶
    	boolean unActivate = false;
    	if(user!=null){
    		//確認帳號是否仍未啟用
    		unActivate = GenerateLinkUtil.verifyCheckcode(user, request);
    		if(unActivate){
        		user = service.activateAccount(user.getAccountId());
        	}
    	}
    	//根據結果導向view。若成功啟用則導向首頁，否則導向錯誤頁面
    	String path = request.getContextPath();
    	if(user!=null && unActivate){
    		HttpSession session = request.getSession();
			session.setAttribute("user", user);
    		response.sendRedirect(path+"/first.jsp");
			
    	}else if(user!=null && !unActivate){
    		Map<String, String> errors = new HashMap<String, String>();
    		request.setAttribute("errorMsgs", errors);
    		errors.put("alreadyActivate", "此帳號已啟用，請登入後使用");
    		if (errors != null && !errors.isEmpty()) {
    			request.getRequestDispatcher("/secure/login.jsp").forward(
    					request, response);
    		}
    	}else{
    		
    		request.setAttribute("errorActivate", "帳號啟用發生錯誤，請聯絡客服人員");
    		request.getRequestDispatcher("/account/error.jsp").forward(request, response);
    		//response.sendRedirect(path+"/account/error.jsp");
    		
    	}
    	
    }
	
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doActivate(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doActivate(request,response);
	}

}
