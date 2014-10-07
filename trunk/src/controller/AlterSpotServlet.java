package controller;

import java.io.IOException;
import java.util.ArrayList;
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
	
	private void process(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("updating spot info.....");
		
		/*
		request.setCharacterEncoding("UTF-8");
    	System.out.println("printParams......");
    	String spotName = request.getParameter("spotName").trim(); System.out.println("spotName : " + spotName);
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
    	
    	String lng = request.getParameter("lng").trim(); System.out.println("lng : " + lng);
    	String lat = request.getParameter("lat").trim(); System.out.println("lat : " + lat);
    	
		Double longitude = Double.parseDouble(lng);
		Double latitude = Double.parseDouble(lat);
		
		String accountId = null;
		String spotOwner = null;
    	Account user = (Account)request.getSession().getAttribute("user");
    	if(user!= null) {
    		accountId = user.getAccountId();
    		if(user.getAccountLevel() == 2) 
    			spotOwner = request.getParameter("spotOwner").trim(); System.out.println("spotOwner : " + spotOwner);
    	}

    	// temporarily
    	if(accountId == null)
    		accountId = "M14090001";
    		
    	SpotDetail spot = new SpotDetail(accountId, null, spotOwner, spotName, 
    			cityId, address, phone,
    			longitude, latitude, intro, 0,
    			categoryId, subcategoryId, "NEW", null, null, null, null, null,
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
    	
    	response.setCharacterEncoding("UTF-8");
    	response.sendRedirect(request.getContextPath()+"/spot/MySpot.jsp");
    	*/
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
}
