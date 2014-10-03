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
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");

		List<Ad> ads = service.findAdsByAccountId(AccountId);
		java.util.Date date = service.findDate();
		String webAppURL = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ request.getContextPath();
		if (ads != null) {
			for (Ad o : ads) {
				
				try {
					JSONObject jsonSpot = new JSONObject();
					jsonSpot.put("spotId", o.getSpotDetail().getSpotId());
					jsonSpot.put("spotName", o.getSpotDetail().getSpotName());
					jsonSpot.put("ValidDate", sdFormat.format(date));
					String imgURL = null;

					String imgPath = ImageIOUtil.generateImageDirPath(o
							.getSpotDetail().getAccountId(), o.getSpotDetail()
							.getSpotId());
					String deployDir = getServletContext().getRealPath("/");
					// System.out.println("thumbnail saved at : " +
					// (deployDir+imgPath));

					if (o.getAdId() != null) {
						ImageIOUtil.saveImage((deployDir + imgPath), o.getAdId(),
								o.getAdImg());
						imgURL = webAppURL + "/" + imgPath + "/" + o.getAdId();

					}
					System.out.println("image url : " + imgURL);
					jsonSpot.put("spotThumbnail", imgURL);
					jsonSpots.put(jsonSpot);
				} catch (JSONException e) {
					e.printStackTrace();					
				}
			}

		} else {

			try {
				JSONObject jsonSpot = new JSONObject();
				jsonSpot.put("spotId", "false");
				jsonSpot.put("spotName", "無景點");
				jsonSpot.put("ValidDate", sdFormat.format(date));
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
