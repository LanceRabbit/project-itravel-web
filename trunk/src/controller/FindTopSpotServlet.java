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

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import model.SpotDetail;
import model.SpotImg;
import model.service.FirstpageService;
import model.service.SearchSpotService;
import model.util.ImageIOUtil;

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
		//System.out.println("sessionId : " + sessionId);
		FirstpageService service = new FirstpageService();
		// find 最受歡迎的景點
		List<SpotDetail> resultSpot = service.findTopSpot();
		//System.out.println(resultSpot);

		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		JSONArray jsonSpotsLike = new JSONArray();
		OutputStream os = response.getOutputStream();
		// request.setAttribute("TopSpot", resultSpot);
		
		String webAppURL = request.getScheme() 
				+ "://"
				+ request.getServerName()
				+ ":"
				+ request.getServerPort()
				+ request.getContextPath();
		
		try {
			for (SpotDetail o : resultSpot) {
				JSONObject jsonSpot = new JSONObject();
				jsonSpot.put("spotId", o.getSpotId());
				jsonSpot.put("spotLikeName", o.getSpotName());
				jsonSpot.put("spotLikeIntro", o.getSpotIntro());
								
				SpotImg thumbnail = (new SearchSpotService()).getSpotThumbnail(o);
				String imgURL = null;
				if(thumbnail != null) {
					String imgPath = ImageIOUtil.generateImageDirPath(o.getAccountId(), o.getSpotId());
					String deployDir = getServletContext().getRealPath("/");					
					
					
					byte[] content = thumbnail.getSpotImg();
					if(( content != null) && (content.length > 0)) {
						ImageIOUtil.saveImage((deployDir+imgPath), thumbnail.getImgId()+".jpg", thumbnail.getSpotImg());
						imgURL = webAppURL + "/" + imgPath + "/" + thumbnail.getImgId()+".jpg";
						
						//System.out.println("1. thumbnail saved at : " + (deployDir+imgPath));
					} else {
						imgURL = webAppURL + "/images/team1.jpg";
					}
				}
				else 
					imgURL = webAppURL + "/images/team1.jpg";
				
				jsonSpot.put("spotThumbnailURL", imgURL);
				jsonSpotsLike.put(jsonSpot);
			}
			//System.out.println("******" + jsonSpotsLike.toString());
			// os.write(jsonSpots.toString().getBytes());
			os.write(jsonSpotsLike.toString().getBytes("UTF-8"));
		} catch (JSONException e) {

			e.printStackTrace();
		} finally {

			if (os != null) {
				os.flush();
				os.close();
			}
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
