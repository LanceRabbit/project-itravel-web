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
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;

/**
 * Servlet implementation class GetAdImgSevlet
 */
@WebServlet("/controller/GetAdImgSevlet")
@MultipartConfig(maxFileSize = 8388608*2) //limitation 8MB
public class GetAdImgSevlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
   
    public GetAdImgSevlet() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String name = null;
		String date = null;
		String text = null;
	
		byte[] image = null;
		try {
			name = request.getParameter("ADname");
			date = request.getParameter("ADdate");
			text = request.getParameter("ADtext");
			System.out.println(name+":"+date+":"+":"+text);
			
//			InputStream inputStream = null;
//			Part filePart = request.getPart("image");
//			//System.out.println("Print FilePart Size= "+filePart.getSize());
//			//System.out.println(filePart);
//			if (filePart.getSize() != 0) {  
//			    // debug messages  
////            System.out.println(filePart.getName());  
////            System.out.println(filePart.getSize());  
////            System.out.println(filePart.getContentType());  
//  
//			    // obtains input stream of the upload file  
//			    try {
//					inputStream = filePart.getInputStream();
//					image = IOUtils.toByteArray(inputStream);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
////            System.out.println(bytes);
//			}else if(filePart.getSize() == 0){
//				//System.out.println("here");
//				String path = request.getContextPath();
//				try {
//					inputStream = new URL("http://localhost:8080/TravelWeb/images/default_profile_pic.jpg").openStream();
//					System.out.println(inputStream);
//					image = IOUtils.toByteArray(inputStream);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
		} catch (IllegalStateException e) {
			
			e.printStackTrace();
			
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
