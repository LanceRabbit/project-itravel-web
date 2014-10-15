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

import model.Account;
import model.util.ImageIOUtil;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "filehandler", urlPatterns = { "/controller/Fileuploader" })
public class FileuploaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private void process(HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("process called");		
		
		String accountId = null;
    	Account user = (Account)request.getSession().getAttribute("user");
    	if(user!= null)
    		accountId = user.getAccountId();
    		
    	// temporarily
    	if(accountId == null)
    		accountId = "M14090001";    	
		
		if (!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalArgumentException(
					"Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}

		ServletFileUpload uploadHandler = new ServletFileUpload(
				new DiskFileItemFactory());
		// PrintWriter writer = response.getWriter();
		response.setContentType("application/json");
		JSONArray json = new JSONArray();
		try {
			List<FileItem> items = uploadHandler.parseRequest(request);
			for (FileItem item : items) {
				if (!item.isFormField()) {
					/*
					System.out.println("file path : "
							+ request.getServletContext().getRealPath("/")
							+ "images/" + accountId + "/");
							*/
					
					String imgPath = request.getServletContext().getRealPath("/") + "images/" + accountId + "/temp/";
					//System.out.println("imgPath : " + imgPath);
					//System.out.println("fileName : " + item.getName());
					//System.out.println("bytes : " + item.get());
					ImageIOUtil.saveImage(imgPath, item.getName(), item.get());
					JSONObject jsono = new JSONObject();
					jsono.put("name", item.getName());
					jsono.put("size", item.getSize());
					jsono.put("url", "UploadServlet?getfile=" + item.getName());
					jsono.put("thumbnail_url",
							"UploadServlet?getthumb=" + item.getName());
					jsono.put("delete_url",
							"UploadServlet?delfile=" + item.getName());
					jsono.put("delete_type", "GET");
					json.put(jsono);
					//System.out.println(json.toString());
				}
			}
		} catch (FileUploadException e) {
			throw new RuntimeException(e);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			// writer.write(json.toString());
			// writer.close();
		}
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("doGet() called");
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("doPost() called");
		process(request, response);		
	}
}
