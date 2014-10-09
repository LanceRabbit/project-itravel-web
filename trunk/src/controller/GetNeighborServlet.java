package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import model.SpotDetail;
import model.SpotImg;
import model.SpotInfo;
import model.service.SearchSpotService;
import model.util.ImageIOUtil;

@WebServlet("/controller/GetNeighbor")
public class GetNeighborServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("GetNeighborServlet processing....");
		
		OutputStream os = null;
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
	
		String webAppURL = request.getScheme() 
				+ "://"
				+ request.getServerName()
				+ ":"
				+ request.getServerPort()
				+ request.getContextPath();
		
		String deployDir = getServletContext().getRealPath("/");
		
		String spotId = request.getParameter("spotId").trim();
		SearchSpotService service = new SearchSpotService();
		List<SpotDetail> neighbors = service.getNeighborhood(spotId);
		
		JSONArray jsonSpots = new JSONArray();
		for(SpotDetail neighbor : neighbors) {
			SpotInfo spotInfo = service.getSpotIfoById(neighbor.getSpotId(), null, webAppURL, deployDir);
//			System.out.println("spot name : " + spotInfo.getSpotName());
//			System.out.println("spot image : " + spotInfo.getSpotImgs().get(0));
//			System.out.println("spot latitude : " + spotInfo.getLatitude());
//			System.out.println("spot longitude : " + spotInfo.getLongitude());
			JSONObject jsonSpot = new JSONObject();
			
			try {
				jsonSpot.put("spotName", spotInfo.getSpotName());
				jsonSpot.put("spotThumbnail", spotInfo.getSpotImgs().get(0));
				jsonSpot.put("latitude", spotInfo.getLatitude());
				jsonSpot.put("longitude", spotInfo.getLongitude());
			} catch (JSONException e) {
				e.printStackTrace();
			}
			
			jsonSpots.put(jsonSpot);
		}
		
		os = response.getOutputStream();
		os.write(jsonSpots.toString().getBytes("UTF-8"));
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
}
