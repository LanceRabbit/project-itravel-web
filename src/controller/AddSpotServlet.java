package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SpotDetail;
import model.SpotDetailDAO;
import model.SpotImg;
import model.SpotImgDAO;
import model.dao.SpotDetailDAOHibernate;
import model.dao.SpotImgDAOHibernate;
import model.util.ConstantsUtil;
import model.util.ImageIOUtil;

@WebServlet("/controller/AddSpot")
public class AddSpotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private void printParams(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	
    	request.setCharacterEncoding("UTF-8");
    	System.out.println("printParams......");
    	String spotName = request.getParameter("spotName").trim(); System.out.println("spotName : " + spotName);
    	String spotOwner = request.getParameter("spotOwner").trim(); System.out.println("spotOwner : " + spotOwner);
    	String city = request.getParameter("dupCity").trim(); System.out.println("city : " + city);
    	System.out.println("cityMap : " + ConstantsUtil.getCityMap().get(city));
    	Integer cityId = ConstantsUtil.getCityMap().get(city); System.out.println("cityId : " + cityId);
    	String category = request.getParameter("dupCategory").trim(); System.out.println("category : " + category);
    	Integer categoryId = ConstantsUtil.getCategoryMap().get(category); System.out.println("categoryId : " + categoryId);
    	String subcategory = request.getParameter("dupSubcategory").trim(); System.out.println("subcategory : " + subcategory); 	
    	String subcategoryId = ConstantsUtil.getSubcategoryMap().get(subcategory); System.out.println("subcategoryId : " + subcategoryId);
    	String address = request.getParameter("address").trim(); System.out.println("address : " + address);
    	String phone = request.getParameter("phone").trim(); System.out.println("phone : " + phone);
    	String intro = request.getParameter("intro").trim(); System.out.println("intro : " + intro);
    	String img1 = request.getParameter("imagePreview_zone_1").trim(); System.out.println("img1 : " + img1);
    	String img2 = request.getParameter("imagePreview_zone_2").trim(); System.out.println("img2 : " + img2);
    	String img3 = request.getParameter("imagePreview_zone_3").trim(); System.out.println("img3 : " + img3);
    	String img4 = request.getParameter("imagePreview_zone_4").trim(); System.out.println("img4 : " + img4);
    	String img5 = request.getParameter("imagePreview_zone_5").trim(); System.out.println("img5 : " + img5);
    	List<String> imgs = new ArrayList<String>();
    	imgs.add(img1);
    	imgs.add(img2);
    	imgs.add(img3);
    	imgs.add(img4);
    	imgs.add(img5);
    	
		Double longitude = 0.0;
		Double latitude = 0.0;
		
		String accountId = "M14090001";
    	SpotDetail spot = new SpotDetail("M14090001", null, spotOwner, spotName, 
    			cityId, address, phone,
    			longitude, latitude, intro, 0,
    			categoryId, subcategoryId, "NEW", null, null, null, null,
    			null,null, null);
    	
    	SpotDetailDAO spotDeailDAO = new SpotDetailDAOHibernate();
    	spotDeailDAO.insert(spot);
    	
    	SpotImgDAO spotImgDAO =  new SpotImgDAOHibernate();
    	String imgPath = request.getServletContext().getRealPath("/") + "images/" + accountId + "/temp/";
    	
    	for(int i = 1; i <=5; i++) {
    		String imgName = imgs.get(i-1);
    		if((imgName == null) || (imgName.equalsIgnoreCase("undefined")))
    			break;
    				
    		SpotImg spotImg = new SpotImg(spot.getSpotId(), spot, ImageIOUtil.getImageByFilename(imgPath, imgName),
        			i, "NEW", null);
        	spotImgDAO.insert(spotImg);
    	}
    	
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
