package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Ad;
import model.SpotImg;
import model.Trip;
import model.TripDetail;
import model.dao.TripDAOHibernate;
import model.dao.TripDetailDAOHibrenate;
import model.service.TripDetailService;
import model.util.ImageIOUtil;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class TripServlet
 */
@WebServlet("/controller/TripDetailServlet")
public class TripDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TripDetailService service = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TripDetailServlet() {
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sessionId = request.getSession().getId();
		
		String tripId = request.getParameter("TripId");
		System.out.println("tripId="+tripId);
		int days = Integer.parseInt(request.getParameter("totalDay"));
		OutputStream os = null;
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		JSONArray jsonTrips = new JSONArray();
		
		Trip trip = null;
		List<TripDetail> detail = null;
		TripDAOHibernate tripDao = new TripDAOHibernate();
		TripDetailDAOHibrenate tripdetail = new TripDetailDAOHibrenate();
	
		try {
			trip = tripDao.select(tripId);
			if(trip==null){
				return;
			}
			detail = tripdetail.selectByTripId(trip.getTripId(), days);
			if (detail == null) {
				return;
			}
			os = response.getOutputStream();
			for (TripDetail details : detail) {
				JSONObject jsonDetail = new JSONObject();
				jsonDetail.put("spotId", details.getSpotDetail().getSpotId());
				jsonDetail.put("spotName", details.getSpotDetail()
						.getSpotName());
				jsonDetail.put("spotAddress", details.getSpotDetail()
						.getAddress());
				jsonDetail.put("Lat", details.getSpotDetail().getLatitude());
				jsonDetail.put("Lng", details.getSpotDetail().getLongitude());
				jsonDetail.put("stayTime", details.getStayTime());
				jsonTrips.put(jsonDetail);
			}
			os.write(jsonTrips.toString().getBytes("UTF-8"));
		} catch (JSONException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally{
			
			if(os != null) {
				os.flush();
				os.close();
    		}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
