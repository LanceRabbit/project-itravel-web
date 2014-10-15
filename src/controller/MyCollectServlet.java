package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.AccountDAO;
import model.SpotCollectRecord;
import model.SpotCollectRecordDAO;
import model.SpotDetail;
import model.SpotDetailDAO;
import model.SpotImg;
import model.dao.AccountDAOHibernate;
import model.dao.SpotCollectRecordDAOHibernate;
import model.dao.SpotDetailDAOHibernate;
import model.service.MyCollectService;
import model.util.ImageIOUtil;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class MyCollectServlet
 */
@WebServlet("/controller/MyCollectServlet")
public class MyCollectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MyCollectServlet() {

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		// 取得AccountId 撈出spot
		String AccountId = request.getParameter("AccountId");
		//System.out.println(AccountId);
		JSONArray jsonSpots = new JSONArray();
		OutputStream os = response.getOutputStream();
		MyCollectService service = new MyCollectService();
		List<SpotCollectRecord> result1=null;
		try {
			result1 = service.searchSpotCollect(AccountId);
		} catch (Exception e1) {
			result1 =null;			
		}		
		if (result1==null) {
			// 無紀錄			
			
			try {
				JSONObject jsonSpot = new JSONObject();
				jsonSpot.put("state", false);
				jsonSpots.put(jsonSpot);
				os.write(jsonSpots.toString().getBytes("UTF-8"));
			} catch (JSONException e) {
				
				e.printStackTrace();
			}finally {
				if (os != null) {
					os.flush();
					os.close();
				}
			}		
			
			
			response.setContentType("application/json;charset=UTF-8");
			
		} else {
			// 有紀錄
			Set<SpotDetail> result=service.searchDetail(AccountId);
		    Iterator<SpotDetail> it = result.iterator();	

		    String webAppURL = request.getScheme() 
					+ "://"
					+ request.getServerName()
					+ ":"
					+ request.getServerPort()
					+ request.getContextPath();
		    
				while(it.hasNext()){
					SpotDetail sp = it.next();
					//System.out.println(sp);
						JSONObject jsonSpot;
						try {
							jsonSpot = new JSONObject();						
							jsonSpot.put("state", true);					
							jsonSpot.put("spotName", sp.getSpotName());
							jsonSpot.put("spotIntro", sp.getSpotIntro());
							jsonSpot.put("spotId", sp.getSpotId());
							Integer likeCount = null;
							if(sp.getLikeCount()==null){
								likeCount=0;
							}else{
								likeCount=sp.getLikeCount();
							}
							jsonSpot.put("spotLike", likeCount);	
							
							String imgURL = null;
						
							String imgPath = ImageIOUtil.generateImageDirPath(sp.getAccountId(),sp.getSpotId());
							String deployDir = getServletContext().getRealPath("/");					
							//System.out.println("thumbnail saved at : " + (deployDir+imgPath));
								
							Set<SpotImg> imgs = sp.getSpotImgs();
							Iterator<SpotImg> itimg = imgs.iterator();
							imgURL = webAppURL + "/images/team1.jpg";
							while (itimg.hasNext()) {
								SpotImg image = itimg.next();
								//System.out.println("MySpotimage : " + image.getImgId() + ";"+ image.getSpotImg());

								if (image.getSpotImg() != null) {
									ImageIOUtil.saveImage((deployDir+imgPath),image.getImgId(),image.getSpotImg());
									imgURL = webAppURL + "/" + imgPath + "/" + image.getImgId();
									break;
								}
							}									
							//System.out.println("image url : " + imgURL);
							jsonSpot.put("spotThumbnail", imgURL);
							
							jsonSpots.put(jsonSpot);
						} catch (JSONException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

						
					}
				//System.out.println(jsonSpots.toString().getBytes("UTF-8"));
					os.write(jsonSpots.toString().getBytes("UTF-8"));

			
			
			response.setContentType("application/json;charset=UTF-8");

			// System.out.println(jsonSpots.toString());
//			 os.write(jsonSpots.toString().getBytes());

		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
