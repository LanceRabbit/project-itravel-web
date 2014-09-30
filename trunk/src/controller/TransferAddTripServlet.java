package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.AccountDAO;
import model.Ad;
import model.Trip;
import model.TripDetail;
import model.dao.AccountDAOHibernate;
import model.dao.TripDAOHibernate;
import model.service.TripDetailService;
import model.util.ImageIOUtil;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class TripServlet
 */
@WebServlet("/controller/TransferAddTripServlet")
public class TransferAddTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TripDetailService service = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TransferAddTripServlet() {

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String sessionId = request.getSession().getId();
		String tripName = request.getParameter("tripName").trim();
		String tripDate = request.getParameter("dateStart");
		int totalDay = Integer.parseInt(request.getParameter("totalDay"));
		request.setAttribute("tripName", tripName);
		request.setAttribute("dateStart", tripDate);
		request.setAttribute("totalDay", totalDay);
		
		request.getRequestDispatcher(
				"/trip/addTripDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
