package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.service.LikeService;

/**
 * Servlet implementation class AddLikServlet
 */
@WebServlet("/controller/SpotReccordServlet")
public class SpotReccordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SpotReccordServlet() {

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
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
		String SpotId = request.getParameter("SpotId");
		SpotId = SpotId.substring(2);
		//System.out.println(AccountId + "...." + SpotId);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");

		if (State.equals("like") && LikeService.isLikeEmpty(AccountId, SpotId)) {

			LikeService.addSpotLike(AccountId, SpotId);
			// out.print("成功");

			request.getRequestDispatcher("/spot/TestSearchSpot.jsp").forward(
					request, response);
			//System.out.println("Like成功");
		}else if(State.equals("delet") && !LikeService.isLikeEmpty(AccountId, SpotId)) {

			LikeService.deletSpotLike(AccountId, SpotId);
			
			request.getRequestDispatcher("/spot/TestSearchSpot.jsp").forward(
					request, response);
			//System.out.println("delet成功");
		}else if(State.equals("deletCollect") && !LikeService.isCollectEmpty(AccountId, SpotId) ){
			LikeService.deletSpotCollect(AccountId, SpotId);
			
		}else if(State.equals("Collect") && LikeService.isCollectEmpty(AccountId, SpotId)){
			LikeService.addSpotCollect(AccountId, SpotId);
			
		}else {
			
			request.getRequestDispatcher("/spot/TestSearchSpot.jsp").forward(
					request, response);
			//System.out.println("-----------");
		}
		//

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
