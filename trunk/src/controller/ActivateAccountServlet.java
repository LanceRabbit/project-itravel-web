package controller;

import java.io.IOException;

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
    	String accountId = request.getParameter("accountId");
    	Account user = service.selectById(accountId);
    	//若從request來的Checkcode跟從accountId產生的相同，則啟用帳戶
    	if(user!=null){
    		if(GenerateLinkUtil.verifyCheckcode(user, request)){
        		user = service.activateAccount(accountId);
        	}
    	}
    	
    	//根據結果導向view。若成功啟用則導向首頁，否則導向錯誤頁面
    	if(user!=null){
    		HttpSession session = request.getSession();
			session.setAttribute("user", user);
			String path = request.getContextPath();
    		response.sendRedirect(path+"/first.jsp");
			
    	}else{
    		String path = request.getContextPath();
    		response.sendRedirect(path+"/account/error.jsp");
    		
    	}
    	
    }
	
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doActivate(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doActivate(request,response);
	}

}
