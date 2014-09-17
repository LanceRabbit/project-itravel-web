package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SpotDetail;
import model.Trip;
import model.TripDetail;
import model.dao.SpotDetailDAOHibernate;
import model.dao.TripDAOHibernate;

import org.json.JSONArray;

/**
 * Servlet implementation class TripServlet
 */
@WebServlet("/TripServlet")
public class TripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TripServlet() {
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		

		String sessionId = request.getSession().getId();
		System.out.println("sessionId : " + sessionId);

		
		TripDAOHibernate dao = new TripDAOHibernate();
		List<Trip> spots = dao.selectAll();
		

		OutputStream os = response.getOutputStream();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		JSONArray jsonSpots = new JSONArray();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
