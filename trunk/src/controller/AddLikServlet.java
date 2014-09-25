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
import model.service.AddLikeService;

/**
 * Servlet implementation class AddLikServlet
 */
@WebServlet("/controller/AddLikeServlet")
public class AddLikServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddLikServlet() {

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		// String AccountId = request.getParameter("AccountId");
		// System.out.println(user);
		String AccountId = null;
		Map<String, String> errors = new HashMap<String, String>();
		try {
			Account user = (Account) session.getAttribute("user");
			AccountId = (String) user.getAccountId();
		} catch (Exception e) {
			request.setAttribute("errorMsgs", errors);
			errors.put("login", "請登入後使用。");
			String referer = request.getHeader("referer");
			String fromAndTo = referer.substring(referer.lastIndexOf("/"));
			request.getRequestDispatcher(fromAndTo).forward(request, response);
			e.printStackTrace();
		}
		String SpotId = request.getParameter("SpotId");
		System.out.println(AccountId + "," + SpotId);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");

		if (AddLikeService.isEmpty(AccountId, SpotId)) {

			AddLikeService.addSpotLike(AccountId, SpotId);
			request.setAttribute("likeMsg", "新增成功");

			String path = request.getContextPath();
			// response.sendRedirect(path+"/spot/testSearchSpot.jsp");
			request.getRequestDispatcher("/spot/TestSearchSpot.jsp").forward(
					request, response);
			System.out.println("Like成功");
		} else {
			request.setAttribute("likeMsg", "已新增過");
			request.getRequestDispatcher("/spot/TestSearchSpot.jsp").forward(
					request, response);
			System.out.println("Like失敗");
		}
		//

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
