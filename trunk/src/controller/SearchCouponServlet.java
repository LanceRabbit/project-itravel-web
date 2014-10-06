package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
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
import model.Coupons;
import model.service.DisseminateService;
import model.util.ImageIOUtil;

/**
 * Servlet implementation class SearchCouponServlet
 */
@WebServlet("/controller/SearchCouponServlet")
public class SearchCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchCouponServlet() {

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");

		String spotId = request.getParameter("SpotId");
		DisseminateService service = new DisseminateService();
		List<Coupons> result = service.findCouponsBySpotId(spotId);

		JSONArray jsonSpots = new JSONArray();
		OutputStream os = response.getOutputStream();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
		
		String webAppURL = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ request.getContextPath();
		if (!result.isEmpty()) {
			try {
				for (Coupons o : result) {
					JSONObject jsonSpot = new JSONObject();
					jsonSpot.put("State", true);
					jsonSpot.put("CouponId",o.getCouponId());
					jsonSpot.put("Description", o.getCouponDescription());
					jsonSpot.put("ValidDate", sdFormat.format(o.getValidDay()));
					String imgURL = null;

					String imgPath = ImageIOUtil.generateImageDirPath(o
							.getSpotDetail().getAccountId(), o
							.getSpotDetail().getSpotId());
					String deployDir = getServletContext().getRealPath("/");
					ImageIOUtil.saveImage((deployDir + imgPath),
							o.getCouponId(), o.getCouponImg());
					imgURL = webAppURL + "/" + imgPath + "/"
							+ o.getCouponId();
					System.out.println("image url : " + imgURL);					
					jsonSpot.put("couponThumbnailURL", imgURL);
					jsonSpots.put(jsonSpot);

				}
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}else{
			JSONObject jsonSpot = new JSONObject();
			try {
				jsonSpot.put("State", false);
			} catch (JSONException e) {				
				e.printStackTrace();
			}
			jsonSpots.put(jsonSpot);
			
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
