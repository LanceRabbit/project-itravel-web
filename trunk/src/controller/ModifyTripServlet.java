package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
import model.SpotDetail;
import model.Trip;
import model.TripDetail;
import model.dao.AccountDAOHibernate;
import model.dao.TripDAOHibernate;
import model.service.AddTripService;
import model.service.TripDetailService;
import model.util.ImageIOUtil;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

/**
 * Servlet implementation class TripServlet
 */
@WebServlet("/controller/ModifyTripServlet")
public class ModifyTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TripDetailService service = null;

	public ModifyTripServlet() {

	}
	private void modifyTrip(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		//System.out.println("create Trip  testing~!!!! Lance");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out =  response.getWriter();;
		String addTrip = request.getParameter("tripInfo");
		if (addTrip!=null && addTrip.trim().length()!=0) {
			//System.out.println(addTrip);
			Gson gson = new Gson();
			Type listType = new TypeToken<Map>() {}.getType();
			
			Map<?, ?> tempList = gson.fromJson(addTrip, listType);
			//System.out.println("TETETETETETETETETE=" + tempList);
	
			String accountId = (String) tempList.get("userId");
			//System.out.println("userId=" + accountId);
			
			String tripId = (String) tempList.get("tripId");
			//System.out.println("tripId=" + tripId);
			
			String tripName = (String) tempList.get("tripName");
			//System.out.println("tripName=" + tripName);
			String startDay = (String) tempList.get("startDay");
			//System.out.println("startDay=" + startDay);
			//System.out.println("totalDay=" + tempList.get("totalDay"));
			double totalDay = (Double) tempList.get("totalDay");
			//int totalDay = Integer.parseInt(tempList.get("totalDay"));
			//System.out.println("totalDay=" + totalDay);
	
			AddTripService service = new AddTripService();
			Account account = new Account();
			Trip trip = new Trip();
			TripDetail tripDetail = null;
			SpotDetail spotDetail = null;
	
			account.setAccountId(accountId);
	
			trip.setAccount(account);
			trip.setTripId(tripId);
			trip.setTripName(tripName);
			trip.setTotalDay((int) totalDay);
			//trip.setLikeCount(0);
			trip.setStartDate(service.convertDate(startDay));
			//trip.setTempTripId("NewTrip");
			trip = service.updateTrip(trip);
			//System.out.println(trip);
			
			service.deleteTripDetail(tripId);
			List<?> list = (List<?>) tempList.get("spot");
	
			//System.out.println("+list+list+=" + list);
			//System.out.println("+list+Size+=" + list.size());
			int dayOrder = 1;
			int spotOrder = 1;
	
			for (Object obj : list) {
				spotOrder = 1;
				List<?> tttt = (List) obj;
				Iterator<?> iterator = tttt.iterator();
				while (iterator.hasNext()) {
	
					Map<?, ?> map = (Map<?, ?>) iterator.next();
					//System.out.println("iterator==" + map);
					spotDetail = new SpotDetail();
					spotDetail.setSpotId((String) map.get("spotId"));
					tripDetail = new TripDetail();
					tripDetail.setTrip(trip);
					tripDetail.setSpotDetail(spotDetail);
					tripDetail.setSpotOrder(spotOrder);
					tripDetail.setTripDayOrder(dayOrder);
					tripDetail.setStayTime(Double.parseDouble((String) map
							.get("stayTime")));
					tripDetail.setTempTripDetailId("TripDetail");
					service.addTripDetail(tripDetail);
					//System.out.println("tripDetail=" + tripDetail);
	
					spotOrder++;
	
				}
				//System.out.println("dayOrder==" + dayOrder);
				dayOrder++;
			}
			out.print(true);
		} else {
			out.print(false);
		}
		//response.setCharacterEncoding("UTF-8");
		//response.sendRedirect(request.getContextPath()+"/trip/MyTrip.jsp");
	}
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("MODIFY!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		this.modifyTrip(request, response);
//		String sessionId = request.getSession().getId();
//		String tripId = request.getParameter("tripId").trim();
//		System.out.println("TRIPIDDDDDDDDD=" +tripId );
//		//String tripDate = request.getParameter("dateStart");
//		//int totalDay = Integer.parseInt(request.getParameter("totalDay"));
//		request.setAttribute("tripId", tripId);
//		//request.setAttribute("dateStart", tripDate);
//		//request.setAttribute("totalDay", totalDay);
//		
//		request.getRequestDispatcher(
//				"/trip/modifyTripDetail.jsp").forward(request, response);
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
