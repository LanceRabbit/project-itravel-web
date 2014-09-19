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

import model.Ad;
import model.TripDetail;
import model.service.TripDetailService;
import model.util.ImageIOUtil;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class TripServlet
 */
@WebServlet("/TripServlet")
public class TripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TripDetailService service = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TripServlet() {
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sessionId = request.getSession().getId();
		System.out.println("sessionId : " + sessionId);
//		String tripId = request.getParameter("id");
		
		service = new TripDetailService();

		Set<TripDetail> tripDetails = service.findTripDetails("T14090004");
		
		OutputStream os = response.getOutputStream();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		JSONArray jsonTrip = new JSONArray();
		
		try {
			for (TripDetail detail : tripDetails) {
				JSONObject jsonDetail = new JSONObject();
				
				jsonDetail.put("spotName", detail.getSpotDetail().getSpotName());
				jsonDetail.put("dayOrder", detail.getTripDayOrder());
				jsonDetail.put("spotOrder", detail.getSpotOrder());
				jsonDetail.put("description", detail.getTripDescription());
				jsonDetail.put("stayTime", detail.getStayTime());
				
//			ImageIOUtil.saveImage(imgId + ".jpg", o.getAdImg());
//			jsonSpot.put("spotThumbnailURL", "images/" + imgId + ".jpg");
				jsonTrip.put(jsonDetail);
			}
			os.write(jsonTrip.toString().getBytes("UTF-8"));
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
