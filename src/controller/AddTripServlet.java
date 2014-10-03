package controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import model.Account;
import model.SpotDetail;
import model.SpotDetailDAO;
import model.SpotImg;
import model.SpotImgDAO;
import model.TripTemp;
import model.dao.SpotDetailDAOHibernate;
import model.dao.SpotImgDAOHibernate;
import model.util.ConstantsUtil;
import model.util.ImageIOUtil;

@WebServlet("/controller/AddTripServlet")
public class AddTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private void createTrip(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	System.out.println("create Trip  testing~!!!! Lance");
    	request.setCharacterEncoding("UTF-8");
//    	System.out.println("printParams......");
    	String addTrip =   request.getParameter("tripInfo");
    	System.out.println(addTrip);
    	Gson gson = new Gson();
		Type listType = new TypeToken<Map>() {}.getType();
		Map tempList = gson.fromJson(addTrip, listType);
    	System.out.println("TETETETETETETETETE="+tempList);
    	System.out.println("++++="+tempList.get("TripName"));
    	//TripTemp temp = test.fromJson(addTrip, TripTemp.class);
//    	temp.getTripName();
//    	System.out.println(temp.getTripName());
    	// JSONObject jObj    = new JSONObject();
        // JSONObject newObj = jObj.getJSONObject(request.getParameter("mydata"));
        // Enumeration eNames = newObj.keys(); //gets all the keys
   	
    	response.setCharacterEncoding("UTF-8");
    	response.sendRedirect(request.getContextPath()+"/trip/MyTrip.jsp");

    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(this.getClass().toString() + " : doGet() called");
		this.createTrip(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(this.getClass().toString() + " : doPost() called");
		this.createTrip(request, response);
	}

}
