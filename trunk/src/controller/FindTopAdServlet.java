package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import model.Ad;
import model.SpotDetail;
import model.SpotImg;
import model.service.FirstpageService;
import model.util.ImageIOUtil;

/**
 * Servlet implementation class FirstpageServlet
 */
@WebServlet("/controller/FindTopAdServlet")
public class FindTopAdServlet extends HttpServlet {
	//public final static String DIR_PATH = "C:/Travel/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/TravelWeb/images/";
	private static final long serialVersionUID = 1L;

	public FindTopAdServlet() {

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String sessionId = request.getSession().getId();
		//System.out.println("sessionId : " + sessionId);
		FirstpageService service = new FirstpageService();
		
		//find 廣告檔資料
		List<Ad> result = service.findAD();
		// System.out.println(result);
		
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		JSONArray jsonSpots = new JSONArray();
		
		OutputStream os = response.getOutputStream();
	
		String webAppURL = request.getScheme() 
				+ "://"
				+ request.getServerName()
				+ ":"
				+ request.getServerPort()
				+ request.getContextPath();
		
		try {
			for (Ad o : result) {
				JSONObject jsonSpot = new JSONObject();
				jsonSpot.put("spotName", o.getSpotDetail().getSpotName());
				jsonSpot.put("spotIntro", o.getSpotDetail().getSpotIntro());
				String adId = o.getAdId();
				
				String imgPath = ImageIOUtil.generateImageDirPath(o.getSpotDetail().getAccountId(), o.getSpotDetail().getSpotId());
				String deployDir = getServletContext().getRealPath("/");
				//System.out.println("ad saved at : " + (deployDir+imgPath));
				
				ImageIOUtil.saveImage((deployDir+imgPath), adId+".jpg", o.getAdImg());
				String imgURL = webAppURL + "/" + imgPath + "/" + adId+".jpg";
				
				jsonSpot.put("spotThumbnailURL", imgURL);
				jsonSpots.put(jsonSpot);

			}	
			
			//System.out.println(jsonSpots.toString());
			// os.write(jsonSpots.toString().getBytes());
			os.write(jsonSpots.toString().getBytes("UTF-8"));
			//os.write(jsonSpotsLike.toString().getBytes("UTF-8"));
			// String AdimgId = o.getAdId();
			// System.out.println(AdimgId); // 圖檔名稱怎麼解決!?
			// InputStream is = new FileInputStream(DIR_PATH + AdimgId +
			// ".jpg");
			// OutputStream os = response.getOutputStream();
			// byte[] b = new byte[1024];
			// int len;
			// while ((len = is.read(b)) != -1) {
			// os.write(b, 0, len);
			// }
			// os.flush();
			// is.close();
			// os.close();

		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			if (os != null) {
				os.flush();
				os.close();
			}
		}
//		 request.getRequestDispatcher("testfirst.jsp")
//		 .forward(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}
}
