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

import model.SpotDetail;
import model.SpotImg;
import model.Trip;
import model.TripCollectRecord;
import model.TripDetail;
import model.service.MyCollectService;
import model.util.ImageIOUtil;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class MyCollectTripServlet
 */
@WebServlet("/controller/MyCollectTripServlet")
public class MyCollectTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MyCollectTripServlet() {

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		// 取得AccountId 撈出trip
		String AccountId = request.getParameter("AccountId");
		//System.out.println(AccountId);
		// String AccountId="M14090005";
		JSONArray jsonSpots = new JSONArray();
		OutputStream os = response.getOutputStream();
		MyCollectService service = new MyCollectService();
		List<TripCollectRecord> result1 = null;
		try {
			result1 = service.searchTripCollect(AccountId);
		} catch (Exception e1) {
			result1 = null;
		}
		if (result1 == null) {
			// 無紀錄

			try {
				JSONObject jsonSpot = new JSONObject();
				jsonSpot.put("state", false);
				jsonSpots.put(jsonSpot);
				os.write(jsonSpots.toString().getBytes("UTF-8"));
			} catch (JSONException e) {

				e.printStackTrace();
			} finally {
				if (os != null) {
					os.flush();
					os.close();
				}
			}

			response.setContentType("application/json;charset=UTF-8");

		} else {
			// 有紀錄
			Set<Trip> result = service.searchTripDetail(AccountId);
			Iterator<Trip> it = result.iterator();

			String webAppURL = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath();

			while (it.hasNext()) {
				Trip sp = it.next();
				// System.out.println(sp);
				JSONObject jsonSpot = new JSONObject();

				try {
					jsonSpot.put("state", true);
					jsonSpot.put("tripId", sp.getTripId());
					jsonSpot.put("startDate", sp.getStartDate());
					jsonSpot.put("totalDay", sp.getTotalDay());
					jsonSpot.put("tripName", sp.getTripName());
					Integer likeCount = null;
					if (sp.getLikeCount() == null) {
						likeCount = 0;
					} else {
						likeCount = sp.getLikeCount();
					}
					jsonSpot.put("tripLike", likeCount);

					// trip pic
					Set<TripDetail> tripDetails = sp.getTripDetails();
					Iterator<TripDetail> ittripDetail = tripDetails.iterator();
					TripDetail trip = null;

					while (ittripDetail.hasNext()) {
						trip = ittripDetail.next();

						//System.out.println("trip" + trip);
						SpotDetail spot = trip.getSpotDetail();
						//System.out.println("spotId" + spot.getSpotId());

						String imgURL = webAppURL + "/images/team1.jpg";
						String imgPath = ImageIOUtil.generateImageDirPath(
								spot.getAccountId(), spot.getSpotId());
						String deployDir = getServletContext().getRealPath("/");
						// System.out.println("thumbnail saved at : " +
						// (deployDir+imgPath));

						Set<SpotImg> imgs = spot.getSpotImgs();
						Iterator<SpotImg> itimg = imgs.iterator();
						

						while (itimg.hasNext()) {
							SpotImg image = itimg.next();
							/*
							System.out.println("MyTripSpotimage : "
									+ image.getImgId() + ";"
									+ image.getSpotImg());
							*/

							if (image.getSpotImg() != null) {
								ImageIOUtil.saveImage((deployDir + imgPath),
										image.getImgId(), image.getSpotImg());
								imgURL = webAppURL + "/" + imgPath + "/"
										+ image.getImgId();
								break;
							}
						}
						//System.out.println("image url : " + imgURL);
						jsonSpot.put("tripThumbnail", imgURL);
						break;
					}
					jsonSpots.put(jsonSpot);
				} catch (JSONException e) {

					e.printStackTrace();
				}

				
			}
			//System.out.println(jsonSpots.toString().getBytes("UTF-8"));
			os.write(jsonSpots.toString().getBytes("UTF-8"));
			response.setContentType("application/json;charset=UTF-8");
			// System.out.println(jsonSpots.toString());
			// os.write(jsonSpots.toString().getBytes());
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
