package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SpotDetail;
import model.SpotImg;
import model.service.SearchSpotService;
import model.util.ImageIOUtil;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/controller/SearchSpot")
public class SearchSpotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private void process(HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("process called");
		
//		PrintWriter writer = null;
		OutputStream os = null;
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			
			String spotName = request.getParameter("spotName").trim();
			String city = request.getParameter("city").trim();
			String category = request.getParameter("category").trim();
			String subcategory = request.getParameter("subcategory").trim();
			
			int pageNo = 2;
			if(request.getParameter("pageNo") != null)
				pageNo = Integer.parseInt(request.getParameter("pageNo").trim());
//			System.out.println("spotName : " + spotName);
//			System.out.println("city : " + city);
//			System.out.println("category : " + category);
//			System.out.println("subcategory : " + subcategory);
//			System.out.println("pageNo : " + pageNo);
			
			SearchSpotService service = new SearchSpotService();
			List<SpotDetail> spots =  service.searchSpotByConditions(
					spotName, city, category, subcategory, pageNo);
			
//			if(spots != null) {
//				for (SpotDetail o : spots) {
//					System.out.println(o.toString());
//				}
//			}
//			else {
//				System.out.println("null list....");
//			}
			
			String webAppURL = request.getScheme() 
					+ "://"
					+ request.getServerName()
					+ ":"
					+ request.getServerPort()
					+ request.getContextPath();
			
			JSONArray jsonSpots = new JSONArray();
			for(SpotDetail spot : spots) {
				JSONObject jsonSpot = new JSONObject();

				jsonSpot.put("spotId", spot.getSpotId());
				jsonSpot.put("spotName", spot.getSpotName());
				jsonSpot.put("spotIntro", spot.getSpotIntro());
				jsonSpot.put("spotLike", spot.getLikeCount());
				
				SpotImg thumbnail = service.getSpotThumbnail(spot);
				String imgURL = null;
				if(thumbnail != null) {
					String imgPath = ImageIOUtil.generateImageDirPath(spot.getAccountId(), spot.getSpotId());
					String deployDir = getServletContext().getRealPath("/");					
					//System.out.println("thumbnail saved at : " + (deployDir+imgPath));
					
					byte[] content = thumbnail.getSpotImg();
					if(( content != null) && (content.length > 0)) {
						ImageIOUtil.saveImage((deployDir+imgPath), thumbnail.getImgId(), thumbnail.getSpotImg());
						imgURL = webAppURL + "/" + imgPath + "/" + thumbnail.getImgId();
					} else {
						imgURL = webAppURL + "/images/team1.jpg";
					}
				}
				else 
					imgURL = webAppURL + "/images/team1.jpg";
				
				//System.out.println("image url : " + imgURL);
				jsonSpot.put("spotThumbnail", imgURL);
				//System.out.println("json : " + jsonSpot.toString());
				jsonSpots.put(jsonSpot);
			}
			
			os = response.getOutputStream();
			os.write(jsonSpots.toString().getBytes("UTF-8"));
		    
//			writer = response.getWriter();
//			writer.write(out.toString());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			e.printStackTrace();
		}  finally {
//			if(writer != null) {
//				writer.flush();
//				writer.close();
//			}
			
			if(os != null) {
				try {
					os.flush();
					os.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() called");
		process(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("doPost() called");
		process(request, response);	
	}

}
