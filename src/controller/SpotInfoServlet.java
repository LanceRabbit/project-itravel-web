package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.util.ConstantsUtil;

@WebServlet("/SpotInfo.do")
public class SpotInfoServlet extends HttpServlet {
	public final static String DIR_PATH = "C:/Travel/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/TravelWeb/images/";
	private static final long serialVersionUID = 1L;
       
    private void printParams(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	
    	request.setCharacterEncoding("UTF-8");
    	System.out.println("printParams......");
    	String spotName = request.getParameter("spotName"); System.out.println("spotName : " + spotName);
    	String spotOwner = request.getParameter("spotOwner"); System.out.println("spotOwner : " + spotOwner);
    	String city = request.getParameter("dupCity"); System.out.println("city : " + city);
    	Integer cityId = ConstantsUtil.getCityMap().get("city"); System.out.println("cityId : " + cityId);
    	
    	String category = request.getParameter("dupCategory"); System.out.println("category : " + category);
    	String subcategory = request.getParameter("dupSubcategory"); System.out.println("subcategory : " + subcategory); 	
    	String address = request.getParameter("address"); System.out.println("address : " + address);
    	String phone = request.getParameter("phone"); System.out.println("phone : " + phone);
    	String intro = request.getParameter("intro"); System.out.println("intro : " + intro);
    	String img1 = request.getParameter("imagePreview_zone_1"); System.out.println("img1 : " + img1);
    	String img2 = request.getParameter("imagePreview_zone_2"); System.out.println("img2 : " + img2);
    	String img3 = request.getParameter("imagePreview_zone_3"); System.out.println("img3 : " + img3);
    	String img4 = request.getParameter("imagePreview_zone_4"); System.out.println("img4 : " + img4);
    	String img5 = request.getParameter("imagePreview_zone_5"); System.out.println("img5 : " + img5);
    	
//    	SpotDetail spot = new SpotDetail("M14090001", account, spotName, cityId, categoryId, subcategoryId, tempSpotId)
    	
//    	HttpSession session = request.getSession();
//    	
////    	String spotId = request.getParameter("id");
////    	System.out.println("SpotId : " + spotId);
//    	
//    	String sessionId = request.getSession().getId();
//    	System.out.println("sessionId : " + sessionId);
//    	
//    	// get spot detail 
//    	SpotDetailDAOHibernate dao = new SpotDetailDAOHibernate();
//    	List<SpotDetail> spots = dao.select(1);
//    	//SpotDetail spotDetail = dao.select(spotId);
//    
//    	OutputStream os = response.getOutputStream();
////        PrintWriter writer = response.getWriter();
//        response.setCharacterEncoding("UTF-8");
//        response.setContentType("application/json;charset=UTF-8");
//    	JSONArray jsonSpots = new JSONArray();
//    	
//    	try {
//			for(SpotDetail spot : spots) {
//				 JSONObject jsonSpot = new JSONObject();
//				 jsonSpot.put("spotId", spot.getSpotId());
////				 jsonSpot.put("spotName", "中文");
//				 jsonSpot.put("spotName", spot.getSpotName());
//				 
//				 Iterator<SpotImg> it = spot.getSpotImgs().iterator();
//				 if((it != null) && it.hasNext()) {
//					 SpotImg img = it.next();
//					 String imgId = img.getImgId();
//					 String path = spot.getSpotId();
//					 ImageIOUtil.saveImage(path, imgId+".jpg", img.getSpotImg());
//					 jsonSpot.put("spotThumbnailURL", "images/"+path+"/"+imgId+".jpg");
//				 }
//
//				 jsonSpots.put(jsonSpot);       		
//			}
//			
//			System.out.println(jsonSpots.toString());
////			os.write(jsonSpots.toString().getBytes());
//			os.write(jsonSpots.toString().getBytes("UTF-8"));
////    		writer.write(jsonSpots.toString());
//		} catch (JSONException e) {
//			e.printStackTrace();
//		}
//    	finally {
////    		if(writer != null) {
////    			writer.flush();
////    			writer.close();
////    		}
//    		
//    		if(os != null) {
//				os.flush();
//				os.close();
//    		}
//    	}
//    	
//    	//session.setAttribute("spots", spots);
//    	//response.sendRedirect("printSpotInfo.jsp");
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(this.getClass().toString() + " : doGet() called");
		this.printParams(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(this.getClass().toString() + " : doPost() called");
		this.printParams(request, response);
	}

}
