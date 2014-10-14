package controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.service.DisseminateService;

import org.apache.commons.io.IOUtils;

/**
 * Servlet implementation class AddCouponServlet
 */
@WebServlet("/controller/AddCouponServlet")
@MultipartConfig(maxFileSize = 8388608*2) //limitation 16MB
public class AddCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AddCouponServlet() {
    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String date = null;
		String text = null;
		String spotId = null;
		byte[] image = null;
		try {
			spotId = request.getParameter("CspotIdList");			
			date = request.getParameter("Cdate");
			text = request.getParameter("Ctext");
			System.out.println(spotId+":"+date+":"+text);
			
			InputStream inputStream = null;
			Part filePart = request.getPart("Cimage");
			System.out.println("Print FilePart Size= "+filePart.getSize());
			System.out.println(filePart);
			if (filePart.getSize() != 0) {  
			    // debug messages  
            System.out.println(filePart.getName());  
            System.out.println(filePart.getSize());  
            System.out.println(filePart.getContentType());  
  
			    // obtains input stream of the upload file  
			    try {
					inputStream = filePart.getInputStream();
					image = IOUtils.toByteArray(inputStream);
				} catch (Exception e) {
					e.printStackTrace();
				}
//            System.out.println(bytes);
			}else if(filePart.getSize() == 0){
				System.out.println("here");
				String path = request.getContextPath();
//				try {
//					inputStream = new URL("http://localhost:8080/TravelWeb/images/default_profile_pic.jpg").openStream();
//					System.out.println(inputStream);
//					image = IOUtils.toByteArray(inputStream);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
			}
		} catch (IllegalStateException e) {
			
			e.printStackTrace();
			
		}
		HttpSession session = request.getSession();
		String path = request.getContextPath();
		DisseminateService service = new DisseminateService();
		
		
//		java.util.Date validdate = service.findDate();
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date validdate;
		try {
			
			validdate = sdFormat.parse(date);
			System.out.println(validdate);
			
		} catch (ParseException e1) {
			validdate = service.findDate();
			e1.printStackTrace();
		}
		
		try {
			validdate = sdFormat.parse(date);
		} catch (ParseException e) {
			validdate = service.findDate();
		}
		
		
		if(service.CouponInsert(spotId, text, validdate, image)){
			System.out.println("coupon Add 成功");
			response.sendRedirect(path+"/store/Disseminate.jsp");
		}else{
			System.out.println("coupon Add 失敗");			
			response.sendRedirect(path+"/store/Disseminate.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
