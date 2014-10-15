package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Account;
import model.SpotDetail;
import model.SpotDetailDAO;
import model.SpotImg;
import model.SpotImgDAO;
import model.dao.SpotDetailDAOHibernate;
import model.dao.SpotImgDAOHibernate;
import model.util.ConstantsUtil;
import model.util.ImageIOUtil;

@WebServlet("/controller/AlterSpot")
public class AlterSpotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws IOException{
		//System.out.println("updating spot info.....");
		
		request.setCharacterEncoding("UTF-8");
    	
		String spotId = request.getParameter("spotId").trim(); //System.out.println("spotId : " + spotId);
    	String spotName = request.getParameter("alterSpotName").trim(); //System.out.println("spotName : " + spotName);
    	String city = request.getParameter("dupCity").trim(); //System.out.println("city : " + city);
    	//System.out.println("cityMap : " + ConstantsUtil.getCityMap().get(city));
    	Integer cityId = ConstantsUtil.getCityMap().get(city); //System.out.println("cityId : " + cityId);
    	String category = request.getParameter("dupCategory").trim(); //System.out.println("category : " + category);
    	Integer categoryId = ConstantsUtil.getCategoryMap().get(category); //System.out.println("categoryId : " + categoryId);
    	String subcategory = request.getParameter("dupSubcategory").trim(); //System.out.println("subcategory : " + subcategory); 	
    	String subcategoryId = ConstantsUtil.getSubcategoryMap().get(subcategory); //System.out.println("subcategoryId : " + subcategoryId);
    	String address = request.getParameter("alterSpotAddress").trim(); //System.out.println("address : " + address);
    	String phone = request.getParameter("alterSpotPhone").trim(); //System.out.println("phone : " + phone);
    	String intro = request.getParameter("alterSpotIntro").trim(); //System.out.println("intro : " + intro);
    	String img1 = request.getParameter("alterSpotImagePreview_zone_1").trim(); //System.out.println("img1 : " + img1);
    	String img2 = request.getParameter("alterSpotImagePreview_zone_2").trim(); //System.out.println("img2 : " + img2);
    	String img3 = request.getParameter("alterSpotImagePreview_zone_3").trim(); //System.out.println("img3 : " + img3);
    	String img4 = request.getParameter("alterSpotImagePreview_zone_4").trim(); //System.out.println("img4 : " + img4);
    	String img5 = request.getParameter("alterSpotImagePreview_zone_5").trim(); //System.out.println("img5 : " + img5);
    	List<String> imgs = new ArrayList<String>();
    	imgs.add(img1);
    	imgs.add(img2);
    	imgs.add(img3);
    	imgs.add(img4);
    	imgs.add(img5);
    	
    	String lng = request.getParameter("lng").trim(); //System.out.println("lng : " + lng);
    	String lat = request.getParameter("lat").trim(); //System.out.println("lat : " + lat);
    	
		Double longitude = Double.parseDouble(lng);
		Double latitude = Double.parseDouble(lat);
		
		String accountId = null;
		String spotOwner = null;
    	Account user = (Account)request.getSession().getAttribute("user");
    	if(user!= null) {
    		accountId = user.getAccountId();
    		if(user.getAccountLevel() == 2) 
    			spotOwner = request.getParameter("alterSpotOwner").trim(); //System.out.println("spotOwner : " + spotOwner);
    	}

    	// temporarily
    	if(accountId == null)
    		accountId = "M14090001";
    	
    	SpotDetail spot = new SpotDetail(accountId, null, spotOwner, spotName, 
    			cityId, address, phone,
    			longitude, latitude, intro, 0,
    			categoryId, subcategoryId, "NEW", null, null, null, null, null,
    			null,null, null);
    	spot.setSpotId(spotId);
    	spot.setTempSpotId(spotId);
    	
    	SpotDetailDAO spotDeailDAO = new SpotDetailDAOHibernate();
    	spot = spotDeailDAO.update(spot);
    	
    	SpotImgDAO spotImgDAO =  new SpotImgDAOHibernate();
    	spotImgDAO.deleteBySpotId(spotId);
    	
    	String imgPath = request.getServletContext().getRealPath("/") + "images/" + accountId + "/temp/";
    	
    	int order = 1;
    	for(int i = 1; i <=5; i++) {
    		String path = imgPath;
    		String imgName = imgs.get(i-1);
    		if((imgName == null) || (imgName.equalsIgnoreCase("undefined")))
    			break;
    		
    		String name = imgName;
    		if(name.startsWith("http")) {
    			String[] dirs = name.split("/");
    			name = dirs[dirs.length - 1]; //System.out.println("image name : " + name);
    			if(name.equals("team1.jpg"))
    				continue;
    			
    			/*
    			String dateDir = (new SimpleDateFormat("yyyy-MM-dd")).format(new Date());
    			path = request.getServletContext().getRealPath("/") + "images/" + dateDir + "/" + accountId + "/" + spotId + "/";
    			System.out.println("old image path : " + path);
    			*/
    			path = request.getServletContext().getRealPath("/") + "images" +  "/" + accountId + "/" + spotId + "/";
    		}
    		
    		if((name == null) || (path == null))
    			break;
    		
    		SpotImg spotImg = new SpotImg(spot.getSpotId(), spot, ImageIOUtil.getImageByFilename(path, name),
        			order, "NEW", null);
    		order++;
        	spotImgDAO.insert(spotImg);
    	}
    	
    	response.setCharacterEncoding("UTF-8");
    	response.sendRedirect(request.getContextPath()+"/spot/MySpot.jsp");
    	
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
}
