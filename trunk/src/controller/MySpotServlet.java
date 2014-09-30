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
import model.SpotImg;
import model.SpotLikeRecord;
import model.SpotLikeRecordId;
import model.dao.AccountDAOHibernate;
import model.service.LikeService;
import model.util.ImageIOUtil;

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
		 String webAppURL = request.getScheme() 
					+ "://"
					+ request.getServerName()
					+ ":"
					+ request.getServerPort()
					+ request.getContextPath();
		try {
			for(SpotDetail o:spotDetails){
				JSONObject jsonSpot = new JSONObject();
				jsonSpot.put("spotName", o.getSpotName());
				jsonSpot.put("spotIntro", o.getSpotIntro());
				jsonSpot.put("spotID", o.getSpotId());
				
				
				String imgURL = null;
				
				String imgPath = ImageIOUtil.generateImageDirPath(o.getAccountId(),o.getSpotId());
				String deployDir = getServletContext().getRealPath("/");					
				//System.out.println("thumbnail saved at : " + (deployDir+imgPath));
					
				Set<SpotImg> imgs = o.getSpotImgs();
				Iterator<SpotImg> itimg = imgs.iterator();
				imgURL = webAppURL + "/images/team1.jpg";
				while (itimg.hasNext()) {
					SpotImg image = itimg.next();
					System.out.println("MySpotimage : " + image.getImgId() + ";"+ image.getSpotImg());
					
					if (image.getSpotImg() != null) {
						ImageIOUtil.saveImage((deployDir+imgPath),image.getImgId(),image.getSpotImg());
						imgURL = webAppURL + "/" + imgPath + "/" + image.getImgId();
						break;
					}
				}									
				System.out.println("image url : " + imgURL);
				jsonSpot.put("spotThumbnail", imgURL);
				
				
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
