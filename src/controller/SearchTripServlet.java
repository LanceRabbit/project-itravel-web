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
@WebServlet("/controller/SearchTripServlet")
public class SearchTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TripDetailService service = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchTripServlet() {

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String sessionId = request.getSession().getId();
		int days =  Integer.parseInt(request.getParameter("day"));
		
		TripDAOHibernate dao = new TripDAOHibernate();
		OutputStream os = null;
		try {
			
			List<Trip> trips = dao.selectByDay(days);
			if (trips == null) {
				return;
			}
			os = response.getOutputStream();

			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json;charset=UTF-8");
			JSONArray jsonTrip = new JSONArray();

			for (Trip trip : trips) {
					JSONObject jsonDetail = new JSONObject();
					jsonDetail.put("tripId", trip.getTripId());
					jsonDetail.put("tripName", trip.getTripName());
					jsonDetail.put("totalDay", trip.getTotalDay());
					jsonDetail.put("startDate", trip.getStartDate());
					jsonTrip.put(jsonDetail);
			}
			os.write(jsonTrip.toString().getBytes("UTF-8"));
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			if (os != null) {
				os.flush();
				os.close();
			}
		}
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
