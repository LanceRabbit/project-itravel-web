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

import model.SpotDetail;
import model.service.DisseminateService;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class FinCouponServlet
 */
@WebServlet("/controller/FindCouponServlet")
public class FindCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public FindCouponServlet() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		// 取得accountID
		String AccountId = request.getParameter("AccountId");

		JSONArray jsonSpots = new JSONArray();

		OutputStream os = response.getOutputStream();

		DisseminateService service = new DisseminateService();
		Set<SpotDetail> result = service.findSpotId(AccountId);
		java.util.Date date = service.findDate();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
		
       
		if (!result.isEmpty()) {

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
				jsonSpot.put("spotId", "false");
				jsonSpot.put("spotName", "無景點");
				jsonSpot.put("ValidDate",sdFormat.format(date) );
				jsonSpots.put(jsonSpot);
			} catch (JSONException e) {

				e.printStackTrace();
			}
		}

		System.out.println(jsonSpots.toString());
		// os.write(jsonSpots.toString().getBytes());
		os.write(jsonSpots.toString().getBytes("UTF-8"));
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
