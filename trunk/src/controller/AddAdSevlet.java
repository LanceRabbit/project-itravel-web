package controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

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
 * Servlet implementation class GetAdImgSevlet
 */
@WebServlet("/controller/AddAdSevlet")
@MultipartConfig(maxFileSize = 8388608*2) //limitation 16MB
public class AddAdSevlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
   
    public AddAdSevlet() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String name = null;
		String date = null;
		String text = null;
		String spotId = null;
		byte[] image = null;
		try {
			spotId = request.getParameter("spotIdList");
			//name = request.getParameter("ADname");//廣告名稱
			date = request.getParameter("ADdate");//
			//text = request.getParameter("ADtext");
			//System.out.println(spotId+":"+date);
			
			InputStream inputStream = null;
			Part filePart = request.getPart("image");
			//System.out.println("Print FilePart Size= "+filePart.getSize());
			//System.out.println(filePart);
			if (filePart.getSize() != 0) {  
			    // debug messages  
            //System.out.println(filePart.getName());  
            //System.out.println(filePart.getSize());  
            //System.out.println(filePart.getContentType());  
  
			    // obtains input stream of the upload file  
			    try {
					inputStream = filePart.getInputStream();
					image = IOUtils.toByteArray(inputStream);
				} catch (Exception e) {
					e.printStackTrace();
				}
//            System.out.println(bytes);
			}else if(filePart.getSize() == 0){
				//System.out.println("here");
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
		
		if(service.AdInsert(spotId, image)){
			//System.out.println("成功");
			response.sendRedirect(path+"/store/Disseminate.jsp");
		}else{
			//System.out.println("失敗");			
			response.sendRedirect(path+"/store/Disseminate.jsp");
		}
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
