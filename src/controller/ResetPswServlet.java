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
    	String email = request.getParameter("email");
    	Account user = service.selectByEmail(email);
    	boolean available = false;
    	String path = request.getContextPath();
    	if(user!=null){
    		available = GenerateLinkUtil.verifyCheckcodeForgotPassword(user, request);
    		if(available){
    			HttpSession session = request.getSession();
    			session.setAttribute("email", email);
        		response.sendRedirect(path+"/account/resetPsw.jsp");
        	}else if(!available){
        		request.setAttribute("errorTimeout","連結已過期，請重新申請忘記密碼");
        		request.getRequestDispatcher("/account/forgotPsw.jsp").forward(request, response);
        		//response.sendRedirect(path+"/account/error.jsp");
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
