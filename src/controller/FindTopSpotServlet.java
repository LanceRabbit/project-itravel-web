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
import model.service.FirstpageService;

/**
 * Servlet implementation class FindTopSpotServlet
 */
@WebServlet("/controller/FindTopSpotServlet")
public class FindTopSpotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FindTopSpotServlet() {

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String sessionId = request.getSession().getId();
		System.out.println("sessionId : " + sessionId);
		FirstpageService service = new FirstpageService();
		// find 最受歡迎的景點
		List<SpotDetail> resultSpot = service.findTopSpot();
		System.out.println(resultSpot);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		JSONArray jsonSpotsLike = new JSONArray();
		OutputStream os = response.getOutputStream();
//		request.setAttribute("TopSpot", resultSpot);		
		try {
			for(SpotDetail o:resultSpot){
				JSONObject jsonSpot = new JSONObject();
				jsonSpot.put("spotLikeName", o.getSpotName());
				jsonSpot.put("spotLikeIntro", o.getSpotIntro());
				//spot pic
				jsonSpotsLike.put(jsonSpot);
			}
			System.out.println(jsonSpotsLike.toString());
			// os.write(jsonSpots.toString().getBytes());
			os.write(jsonSpotsLike.toString().getBytes("UTF-8"));
		} catch (JSONException e) {
		
			e.printStackTrace();
		}finally{
			
			if (os != null) {
				os.flush();
				os.close();
			}
		}
		
//		request.getRequestDispatcher("first.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
