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
 * Servlet implementation class TripRecordServlet
 */
@WebServlet("/controller/TripRecordServlet")
public class TripRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public TripRecordServlet() {
       
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

			out.print("false");
			return;
		}
		String State = request.getParameter("State");
		String TripId = request.getParameter("TripId");
		TripId = TripId.substring(2);
		System.out.println(AccountId + "...." + TripId);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");

		if (State.equals("like") && LikeService.isTripLikeEmpty(AccountId, TripId)) {

			LikeService.addTripLike(AccountId, TripId);
			// out.print("成功");

			request.getRequestDispatcher("/trip/searchTrip.jsp").forward(
					request, response);
			System.out.println("Like成功");
		}else if(State.equals("delet") && !LikeService.isTripLikeEmpty(AccountId, TripId)) {

			LikeService.deletTripLike(AccountId, TripId);
			
			request.getRequestDispatcher("/trip/searchTrip.jsp").forward(
					request, response);
			System.out.println("delet成功");
		}else if(State.equals("deletCollect") && !LikeService.isTripCollectEmpty(AccountId, TripId)){
			LikeService.deletTripCollect(AccountId, TripId);
			
		}else if(State.equals("Collect") && LikeService.isTripCollectEmpty(AccountId, TripId)){
			LikeService.addTripCollect(AccountId, TripId);
			
		}else {
			
			request.getRequestDispatcher("/trip/searchTrip.jsp").forward(
					request, response);
			System.out.println("-----------");
		}
		//
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
