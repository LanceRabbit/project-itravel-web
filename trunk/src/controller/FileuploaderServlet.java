package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONArray;
import org.json.JSONObject;



//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.FileUploadException;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
//import org.json.JSONArray;
//import org.json.JSONObject;

/**
 * Servlet implementation class Filehandler
 */
@WebServlet(name = "filehandler", urlPatterns = { "/Fileuploader.do" })
public class FileuploaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileuploaderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() called");
		
//		Enumeration<String> params = request.getParameterNames();
//		
//		if(params.hasMoreElements() == true) {
//			
//			if(params != null) {
//				String param = null;
//				while(((param = params.nextElement()) != null)){
//					System.out.println("param : " + param);
//				}
//			}
//		}
		
		String files = request.getParameter("getfile");
		System.out.println("files : " + files);
		
		 if (!ServletFileUpload.isMultipartContent(request)) {
	            throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
	        }

	        ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
	        PrintWriter writer = response.getWriter();
	        response.setContentType("application/json");
	        JSONArray json = new JSONArray();
	        try {
	            List<FileItem> items = uploadHandler.parseRequest(request);
	            for (FileItem item : items) {
	                if (!item.isFormField()) {
	                	System.out.println("file path : " + request.getServletContext().getRealPath("/")+"images/");
	                        File file = new File(request.getServletContext().getRealPath("/")+"images/", item.getName());
	                        item.write(file);
	                        JSONObject jsono = new JSONObject();
	                        jsono.put("name", item.getName());
	                        jsono.put("size", item.getSize());
	                        jsono.put("url", "UploadServlet?getfile=" + item.getName());
	                        jsono.put("thumbnail_url", "UploadServlet?getthumb=" + item.getName());
	                        jsono.put("delete_url", "UploadServlet?delfile=" + item.getName());
	                        jsono.put("delete_type", "GET");
	                        json.put(jsono);
	                        System.out.println(json.toString());
	                }
	            }
	        } catch (FileUploadException e) {
	                throw new RuntimeException(e);
	        } catch (Exception e) {
	                throw new RuntimeException(e);
	        } finally {
	            writer.write(json.toString());
	            writer.close();
	        }

		
	}
}
