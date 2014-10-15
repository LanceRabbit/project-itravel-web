package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Trip;
import model.TripDAO;
import model.dao.TripDAOHibernate;



@WebServlet("/control/DeleteTripServelt")
public class DeleteTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private void process(HttpServletRequest request, HttpServletResponse response){
		//System.out.println("delete spot servlet.....");
		PrintWriter out = null;
		TripDAO tripDao = null;
		int result = 0 ;
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html");
			out = response.getWriter();
			
			String tripId = request.getParameter("TripId");
			//System.out.println("tripId" + tripId);

			tripDao	= new TripDAOHibernate();
			Trip trip = tripDao.select(tripId);
			if(trip!=null) {
				result = tripDao.delete(trip);
				if (result==0)
					out.print("true");
				else 
					out.print("false");
			} else {
				out.print("false");
			}
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
