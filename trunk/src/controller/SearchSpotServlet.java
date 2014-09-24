package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SpotDetail;
import model.service.SearchSpotService;

@WebServlet("/controller/SearchSpot")
public class SearchSpotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private void process(HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("process called");
		
		PrintWriter writer = null;
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html");
			
			String spotName = request.getParameter("spotName").trim();
			String city = request.getParameter("city").trim();
			String category = request.getParameter("category").trim();
			String subcategory = request.getParameter("subcategory").trim();
			
			int pageNo = 0;
			if(request.getParameter("pageNo") != null)
				pageNo = Integer.parseInt(request.getParameter("pageNo").trim());
//			System.out.println("spotName : " + spotName);
//			System.out.println("city : " + city);
//			System.out.println("category : " + category);
//			System.out.println("subcategory : " + subcategory);
//			System.out.println("pageNo : " + pageNo);
			
			List<SpotDetail> spots =  (new SearchSpotService()).searchSpotByConditions(
					spotName, city, category, subcategory, pageNo);
			
			if(spots != null) {
				for (SpotDetail o : spots) {
					System.out.println(o.toString());
				}
			}
			else {
				System.out.println("null list....");
			}
			
			writer = response.getWriter();
			writer.write("success");
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(writer != null) {
				writer.flush();
				writer.close();
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
