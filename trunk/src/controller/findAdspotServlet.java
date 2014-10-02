package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Ad;
import model.SpotDetail;
import model.service.ADService;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/controller/findAdspotServlet")
public class findAdspotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public findAdspotServlet() {

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		// 取得accountID
		String AccountId = request.getParameter("AccountId");

		JSONArray jsonSpots = new JSONArray();

		OutputStream os = response.getOutputStream();

		ADService service = new ADService();
		Set<SpotDetail> result = service.findAdSpotId(AccountId);
		java.util.Date date = service.findDate();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
		
       
		if (result != null) {

			try {
				for (SpotDetail o : result) {
					JSONObject jsonSpot = new JSONObject();
					jsonSpot.put("spotId", o.getSpotId());
					jsonSpot.put("spotName", o.getSpotName());					
					jsonSpot.put("ValidDate",sdFormat.format(date) );
					jsonSpots.put(jsonSpot);
				}

			} catch (JSONException e) {
				e.printStackTrace();
			}
		} else {

			try {
				JSONObject jsonSpot = new JSONObject();
				jsonSpot.put("spotId", "0");
				jsonSpot.put("spotName", "無景點");
				jsonSpot.put("ValidDate",date );
				jsonSpots.put(jsonSpot);
			} catch (JSONException e) {

				e.printStackTrace();
			}
		}

		System.out.println(jsonSpots.toString());
		// os.write(jsonSpots.toString().getBytes());
		os.write(jsonSpots.toString().getBytes("UTF-8"));
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
