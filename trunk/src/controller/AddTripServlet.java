package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Account;
import model.SpotDetail;
import model.Trip;
import model.TripDetail;
import model.service.AddTripService;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@WebServlet("/controller/AddTripServlet")
public class AddTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private void createTrip(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		System.out.println("create Trip  testing~!!!! Lance");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out =  response.getWriter();;
		String addTrip = request.getParameter("tripInfo");
		if (addTrip!=null && addTrip.trim().length()!=0) {
			System.out.println(addTrip);
			Gson gson = new Gson();
			Type listType = new TypeToken<Map>() {}.getType();
			
			Map<?, ?> tempList = gson.fromJson(addTrip, listType);
			System.out.println("TETETETETETETETETE=" + tempList);
	
			String accountId = (String) tempList.get("userId");
			System.out.println("userId=" + accountId);
	
			String tripName = (String) tempList.get("tripName");
			System.out.println("tripName=" + tripName);
			String startDay = (String) tempList.get("startDay");
			System.out.println("tripName=" + startDay);
	
			int totalDay = Integer.parseInt((String) tempList.get("totalDay"));
			System.out.println("totalDay=" + totalDay);
	
			AddTripService service = new AddTripService();
			Account account = new Account();
			Trip trip = new Trip();
			TripDetail tripDetail = null;
			SpotDetail spotDetail = null;
	
			account.setAccountId(accountId);
	
			trip.setAccount(account);
			trip.setTripName(tripName);
			trip.setTotalDay(totalDay);
			trip.setLikeCount(0);
			trip.setStartDate(service.convertDate(startDay));
			trip.setTempTripId("NewTrip");
			trip = service.creatTrip(trip);
	
			System.out.println(trip);
	
			List<?> list = (List<?>) tempList.get("spot");
	
			System.out.println("+list+list+=" + list);
			System.out.println("+list+Size+=" + list.size());
			int dayOrder = 1;
			int spotOrder = 1;
	
			for (Object obj : list) {
				spotOrder = 1;
				List<?> tttt = (List) obj;
				Iterator<?> iterator = tttt.iterator();
				while (iterator.hasNext()) {
	
					Map<?, ?> map = (Map<?, ?>) iterator.next();
					System.out.println("iterator==" + map);
					spotDetail = new SpotDetail();
					spotDetail.setSpotId((String) map.get("spotId"));
					tripDetail = new TripDetail();
					tripDetail.setTrip(trip);
					tripDetail.setSpotDetail(spotDetail);
					tripDetail.setSpotOrder(spotOrder);
					tripDetail.setTripDayOrder(dayOrder);
					tripDetail.setStayTime(Double.parseDouble((String) map
							.get("stayTime")));
					tripDetail.setTempTripDetailId("EMP");
					service.addTripDetail(tripDetail);
					System.out.println("tripDetail=" + tripDetail);
	
					spotOrder++;
	
				}
				System.out.println("dayOrder==" + dayOrder);
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
		System.out.println(this.getClass().toString() + " : doGet() called");
		this.createTrip(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println(this.getClass().toString() + " : doPost() called");
		this.createTrip(request, response);
	}

}
