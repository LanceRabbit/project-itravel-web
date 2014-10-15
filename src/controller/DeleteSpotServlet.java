package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA_2_3.portable.OutputStream;

import model.service.DeleteSpotService;

@WebServlet("/control/DeleteSpot")
public class DeleteSpotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private void process(HttpServletRequest request, HttpServletResponse response){
		//System.out.println("delete spot servlet.....");
		PrintWriter out = null;
		
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html");
			out = response.getWriter();
			
			String spotId = request.getParameter("SpotId");
			//System.out.println("spotId : " + spotId);

			
			DeleteSpotService service = new DeleteSpotService();
			if(service.deleteSpotById(spotId) == 0) 
				out.print("true");
			else 
				out.print("false");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(out != null) {
				out.flush();
				out.close();
			}
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
}
