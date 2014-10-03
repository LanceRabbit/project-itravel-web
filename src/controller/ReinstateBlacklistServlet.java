package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Account;
import model.service.AdminService;

@WebServlet("/controller/ReinstateBlacklistServlet")
public class ReinstateBlacklistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReinstateBlacklistServlet() {
        super();
    }
    protected void doReinstate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminService service = new AdminService();
    	String accountId = request.getParameter("accountId");
    	Account result = service.removeBlacklist(accountId);
    	PrintWriter out = response.getWriter();
    	if(result!=null){
    		out.print(true);
    		return;
    	}else{
    		out.print(false);
    		return;
    	}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doReinstate(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doReinstate(request,response);
	}

}
