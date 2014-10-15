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

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import model.Ad;
import model.SpotDetail;
import model.SpotDetailDAO;
import model.SpotImg;
import model.dao.SpotDetailDAOHibernate;
import model.util.ImageIOUtil;

/**
 * Servlet implementation class SearchSpotServlet
 */
@WebServlet("/controller/SearchSpotTestServlet")
public class SearchSpotTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchSpotTestServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//顯示所有景點
		String sessionId = request.getSession().getId();
		//System.out.println("sessionId : " + sessionId);
		HttpSession session = request.getSession();

		
		SpotDetailDAO dao = new SpotDetailDAOHibernate();
		List<SpotDetail> result = dao.selectByPageNo(1);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		JSONArray jsonSpots = new JSONArray();
		
		OutputStream os = response.getOutputStream();
		
		try {
			for (SpotDetail o : result) {
				JSONObject jsonSpot = new JSONObject();	
				String imgId="team1.jpg";
				jsonSpot.put("spotID", o.getSpotId());
				jsonSpot.put("spotName", o.getSpotName());
				jsonSpot.put("spotIntro", o.getSpotIntro());
				Set<SpotImg> imgs = o.getSpotImgs();
				Iterator<SpotImg> it = imgs.iterator();
				while(it.hasNext()){
					SpotImg image = it.next();
					//System.out.println("image : " + image.getImgId() + ";" + image.getSpotImg());
					
					if(image.getSpotImg() != null) {
						ImageIOUtil.saveImage(image.getImgId(), image.getSpotImg());
						imgId = image.getImgId();						
						break;
					}
				}
								
//				ImageIOUtil.saveImage(imgId + ".jpg", o.getSpotImgs());
				jsonSpot.put("spotThumbnailURL", "../images/" + imgId);
				jsonSpots.put(jsonSpot);

			}
				
			
			//System.out.println(jsonSpots.toString());
			// os.write(jsonSpots.toString().getBytes());
			os.write(jsonSpots.toString().getBytes("UTF-8"));
		}catch (JSONException e) {
				// TODO Auto-generated catch block
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
