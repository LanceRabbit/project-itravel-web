package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Ad;
import model.SpotDetail;
import model.SpotImg;
import model.service.DisseminateService;
import model.util.ImageIOUtil;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/controller/FindAdspotServlet")
public class FindAdspotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FindAdspotServlet() {

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
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
		 String webAppURL = request.getScheme() 
					+ "://"
					+ request.getServerName()
					+ ":"
					+ request.getServerPort()
					+ request.getContextPath();
       
		if (!result.isEmpty()) {
			try {
				for (SpotDetail o : result) {
					String spotId =o.getSpotId();
					JSONObject jsonSpot = new JSONObject();
					jsonSpot.put("spotId", spotId);
					jsonSpot.put("spotName", o.getSpotName());					
					jsonSpot.put("ValidDate",sdFormat.format(date) );					
					String imgURL = null;
					
					/**要改   一個spotid會有多張ADImg***/
					
					String imgPath = ImageIOUtil.generateImageDirPath(o.getAccountId(),o.getSpotId());
					String deployDir = getServletContext().getRealPath("/");					
					//System.out.println("thumbnail saved at : " + (deployDir+imgPath));
						

					List<Ad> resultAd=service.findAds(spotId);
					Iterator<Ad> itimg =resultAd.listIterator();
					
					imgURL = webAppURL + "/images/team1.jpg";
					while (itimg.hasNext()) {
						Ad image = itimg.next();
						System.out.println("MyADimage : " + image.getAdId() + ";"+ image.getAdImg());
						
						if (image.getAdId() != null) {
							ImageIOUtil.saveImage((deployDir+imgPath),image.getAdId(),image.getAdImg());
							imgURL = webAppURL + "/" + imgPath + "/" + image.getAdId();
							
						}
						
					}									
					
					System.out.println("image url : " + imgURL);
					jsonSpot.put("spotThumbnail", imgURL);
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
				String imgURL = webAppURL + "/images/team1.jpg";
				jsonSpot.put("spotThumbnail", imgURL);
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
