package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Ad;
import model.Coupons;
import model.SpotDetail;
import model.service.DisseminateService;
import model.util.ImageIOUtil;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class FindCouponSpotServlet
 */
@WebServlet("/controller/FindCouponSpotServlet")
public class FindCouponSpotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FindCouponSpotServlet() {

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		// 取得accountID
		String AccountId = request.getParameter("AccountId");
		String Find = request.getParameter("Find");

		JSONArray jsonSpots = new JSONArray();

		OutputStream os = response.getOutputStream();

		DisseminateService service = new DisseminateService();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");

		List<Coupons> coupons = service.findCouponsByAccountId(AccountId);
		// java.util.Date date = service.findDate();
		String webAppURL = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ request.getContextPath();

		if (Find.equals("0")) {// 找現有的資料
			if (coupons != null) {
				for (Coupons o : coupons) {

					try {
						JSONObject jsonSpot = new JSONObject();
						jsonSpot.put("CouponId", o.getCouponId());
						jsonSpot.put("spotName", o.getSpotDetail()
								.getSpotName());
						jsonSpot.put("Description", o.getCouponDescription());
						jsonSpot.put("ValidDate",
								sdFormat.format(o.getValidDay()));// 轉換date
						String imgURL = null;

						String imgPath = ImageIOUtil.generateImageDirPath(o
								.getSpotDetail().getAccountId(), o
								.getSpotDetail().getSpotId());
						String deployDir = getServletContext().getRealPath("/");
						// System.out.println("thumbnail saved at : " +
						// (deployDir+imgPath));

						if (o.getCouponId() != null) {
							ImageIOUtil.saveImage((deployDir + imgPath),
									o.getCouponId(), o.getCouponImg());
							imgURL = webAppURL + "/" + imgPath + "/"
									+ o.getCouponId();

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
					jsonSpot.put("CouponId", "false");
					jsonSpot.put("spotName", "無景點");
					jsonSpot.put("ValidDate",
							sdFormat.format(new java.util.Date()));
					jsonSpot.put("Description", "無資料");
					String imgURL = webAppURL + "/images/team1.jpg";
					jsonSpot.put("spotThumbnail", imgURL);
					jsonSpots.put(jsonSpot);
				} catch (JSONException e) {

					e.printStackTrace();
				}
			}
		} else if (Find.equals("1")) { // 找所有資料

			Iterator<SpotDetail> spots = service.findSpotId(AccountId)
					.iterator();
			while (spots.hasNext()) {
				SpotDetail spot = spots.next();
				try {
					JSONObject jsonSpot = new JSONObject();
					jsonSpot.put("CouponId", spot.getSpotId());
					jsonSpot.put("spotName", spot.getSpotName());
					jsonSpots.put(jsonSpot);
				} catch (JSONException e) {

					e.printStackTrace();
				}

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
