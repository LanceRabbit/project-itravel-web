package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SpotDetail;
import model.dao.SpotDetailDAOHibernate;

@WebServlet("/SpotInfo.do")
public class SpotInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SpotInfoServlet() {

    }

    private void printParams(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	HttpSession session = request.getSession();
    	
    	String spotId = request.getParameter("id");
    	System.out.println("SpotId : " + spotId);
    	
    	String sessionId = request.getSession().getId();
    	System.out.println("sessionId : " + sessionId);
    	
    	// get spot detail 
    	SpotDetailDAOHibernate dao = new SpotDetailDAOHibernate();
    	List<SpotDetail> spots = dao.select(1);
    	//SpotDetail spotDetail = dao.select(spotId);
    
    	session.setAttribute("spots", spots);
    	response.sendRedirect("printSpotInfo.jsp");
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(this.getClass().toString() + " : doGet() called");
		this.printParams(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(this.getClass().toString() + " : doPost() called");
		this.printParams(request, response);
	}

}