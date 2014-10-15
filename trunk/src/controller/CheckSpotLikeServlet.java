package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.service.LikeService;

/**
 * Servlet implementation class CheckSpotLikeServlet
 */
@WebServlet("/controller/CheckSpotLikeServlet")
public class CheckSpotLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public CheckSpotLikeServlet() {
       
    	
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();
		session.setAttribute("errorMsgs_login", "");
		
		
		String AccountId = null;
		PrintWriter out = response.getWriter();

		Account user = (Account) session.getAttribute("user");
		if (user != null) {
			AccountId = (String) user.getAccountId();
		} else {
			
			out.print("NoAccount");
			return;
		}
		String SpotId = request.getParameter("SpotId");
		//System.out.println(AccountId + ",,,,," + SpotId);
		//System.out.println("from CheckSpotLikeServlet");
		
		if(LikeService.checkSpotLike(AccountId, SpotId)){
			out.print("Like");
		}else {
			out.print("NoLike");
		}
		
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	this.doGet(request, response);
	}

}
