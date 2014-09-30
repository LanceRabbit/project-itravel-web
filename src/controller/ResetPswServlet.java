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

@WebServlet("/controller/ResetPswServlet")
public class ResetPswServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ResetPswServlet() {
        super();
    }
    protected void doReset(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
    	AccountService service = new AccountService();
    	HttpSession session = request.getSession();
    	String email = request.getParameter("email");
    	Account user = service.selectByEmail(email);
    	user = service.resetAccountLevel(user.getAccountId());
    	boolean available = false;
    	String path = request.getContextPath();
    	if(user!=null){
    		available = GenerateLinkUtil.verifyCheckcodeForgotPassword(user, request);
    		if(available){
    			if(user.getAccountLevel()==1 || user.getAccountLevel()==2){
    				session.setAttribute("errorTimeout", "連結已失效，請重新申請。");
    				response.sendRedirect(path+"/first.jsp");
    				return;
    			}else if(user.getAccountLevel()==3||user.getAccountLevel()==5){
    				session.setAttribute("activated", "false");
    				response.sendRedirect(path+"/first.jsp");
    				return;
    			}else if(user.getAccountLevel()==4){
    				
    			}else{
    				session.setAttribute("email", email);
        			request.getRequestDispatcher("/account/resetPsw.jsp").forward(request, response);
        			//response.sendRedirect(path+"/account/resetPsw.jsp");
        			return;
    			}
    			
    			
        	}else if(!available){
        		session.setAttribute("errorTimeout","連結已過期，請重新申請忘記密碼");
        		response.sendRedirect(path+"/first.jsp");
        		//response.sendRedirect(path+"/account/error.jsp");
        		return;
        	}
    	}else{
    		request.setAttribute("errorResetPsw", "密碼重設發生錯誤，請聯絡客服人員");
    		request.getRequestDispatcher("/account/error.jsp").forward(request, response);
    		//response.sendRedirect(path+"/account/error.jsp");
    	}
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doReset(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doReset(request,response);
	}

}
