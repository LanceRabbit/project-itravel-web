package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.service.DisseminateService;

import org.json.JSONArray;

@WebServlet("/controller/DeletDissminateServlet")
public class DeletDissminateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeletDissminateServlet() {

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		// 取得accountID
		String State = request.getParameter("State"); // State :"Ad  "Coupon"
		String id = request.getParameter("Did");

		JSONArray jsonSpots = new JSONArray();
		DisseminateService service = new DisseminateService();

		PrintWriter out = response.getWriter();

		if (State.equals("Ad")) {
			if (service.AdDelet(id)) {
				out.print(true);
			} else {
				out.print(false);
			}

		} else if (State.equals("Coupon")) {
			if (service.CouponDelet(id)) {
				out.print(true);
			} else {
				out.print(false);
			}
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
