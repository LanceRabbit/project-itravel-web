package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;
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

import model.Account;
import model.AccountDAO;
import model.SpotDetail;
import model.SpotLikeRecord;
import model.SpotLikeRecordId;
import model.dao.AccountDAOHibernate;
import model.service.AddLikeService;

/**
 * Servlet implementation class MySpotServlet
 */
@WebServlet("/controller/MySpotServlet")
public class MySpotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MySpotServlet() {

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		//取得AccountId 撈出spot
		String AccountId = request.getParameter("AccountId");
		System.out.println(AccountId);
		AccountDAO dao = new AccountDAOHibernate();
		Account acc = new Account();
		acc = dao.selectById(AccountId);
		Set<SpotDetail> spotDetails = acc.getSpotDetails();
//		Iterator<SpotDetail> spotDetail = spotDetails.iterator();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		JSONArray jsonSpots = new JSONArray();
		OutputStream os = response.getOutputStream();
		
		try {
			for(SpotDetail o:spotDetails){
				JSONObject jsonSpot = new JSONObject();
				jsonSpot.put("spotName", o.getSpotName());
				jsonSpot.put("spotIntro", o.getSpotIntro());
				jsonSpot.put("spotID", o.getSpotId());
				
				//spot pic
				/*
				jsonSpot.put("LEADER", o.getLeader());
				jsonSpot.put("CITY_ID", o.getCityId());
				jsonSpot.put("ADDRESS", o.getAddress());
				jsonSpot.put("PHONE", o.getPhone());
				jsonSpot.put("LONGITUDE", o.getLongitude());
				jsonSpot.put("LATITUDE", o.getLatitude());
				jsonSpot.put("CATEGORY_ID", o.getCategoryId());
				jsonSpot.put("SUBCATEGORY_ID", o.getSubcategoryId());
			 	*/
				
				
				jsonSpots.put(jsonSpot);
			}
			//System.out.println(jsonSpots.toString());
			// os.write(jsonSpots.toString().getBytes());
			os.write(jsonSpots.toString().getBytes("UTF-8"));
		} catch (JSONException e) {
		
			e.printStackTrace();
		}finally{
			
			if (os != null) {
				os.flush();
				os.close();
			}
		}
		
		
//		
//		int count = 0;
//		while(spotDetail.hasNext()) {
//			count++; 
//			SpotDetail spots = (SpotDetail)spotDetail.next();
//			System.out.println("GET spot FROM ACCOUNT: "+spots);
//			
//		}
//		request.setAttribute("spots",spotDetails);		
//		request.getRequestDispatcher("MySpot.jsp").forward(request, response);
		
/*按Like部分*/
/*
// click Like
		String icontype = request.getParameter("icon");
		String icontype2 = (String) request.getAttribute("icon");
		System.out.println(icontype);
		System.out.println(icontype2);

		// 前端取得AccountId("M14090004")SpotId("RES14090002");

		// String SpotId = "RES14090002";
		// String AccountId = "M14090004";

		String SpotId = request.getParameter("SpotId");
		String AccountId = request.getParameter("AccountId");
		// SpotLikeRecord spot = new SpotLikeRecord(new
		// SpotLikeRecordId(AccountId,SpotId));
		System.out.println(SpotId + ";" + AccountId);
		// if (AddLikeService.addSpotLike(spot)) {
		// System.out.println("insert成功");
		// } else {
		// System.out.println("重複索引");
		// }
*/
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
