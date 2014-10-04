package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.service.DeleteSpotService;

@WebServlet("/control/DeleteSpot")
public class DeleteSpotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private void process(HttpServletRequest request, HttpServletResponse response){
		System.out.println("delete spot servlet.....");
		
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html");
			
			String spotId = request.getParameter("SpotId");
			System.out.println("spotId : " + spotId);

			DeleteSpotService service = new DeleteSpotService();
			if(service.deleteSpotById(spotId) == 0) {
				System.out.println("redirect to : " + request.getContextPath()+"/spot/MySpot.jsp");
				response.sendRedirect(request.getContextPath()+"/spot/MySpot.jsp");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
}
