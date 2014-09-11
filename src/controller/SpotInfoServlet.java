package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SpotDetail;
import model.SpotImg;
import model.dao.SpotDetailDAOHibernate;
import model.util.ImageIOUtil;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/SpotInfo.do")
public class SpotInfoServlet extends HttpServlet {
	public final static String DIR_PATH = "C:/Travel/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/TravelWeb/images/";
	private static final long serialVersionUID = 1L;
       
    public SpotInfoServlet() {

    }

    private void printParams(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	HttpSession session = request.getSession();
    	
//    	String spotId = request.getParameter("id");
//    	System.out.println("SpotId : " + spotId);
    	
    	String sessionId = request.getSession().getId();
    	System.out.println("sessionId : " + sessionId);
    	
    	// get spot detail 
    	SpotDetailDAOHibernate dao = new SpotDetailDAOHibernate();
    	List<SpotDetail> spots = dao.select(1);
    	//SpotDetail spotDetail = dao.select(spotId);
    
    	OutputStream os = response.getOutputStream();
//        PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
    	JSONArray jsonSpots = new JSONArray();
    	
    	try {
			for(SpotDetail spot : spots) {
				 JSONObject jsonSpot = new JSONObject();
				 jsonSpot.put("spotId", spot.getSpotId());
//				 jsonSpot.put("spotName", "中文");
				 jsonSpot.put("spotName", spot.getSpotName());
				 
				 Iterator<SpotImg> it = spot.getSpotImgs().iterator();
				 if((it != null) && it.hasNext()) {
					 SpotImg img = it.next();
					 String imgId = img.getImgId();
					 String path = spot.getSpotId();
					 ImageIOUtil.saveImage(path, imgId, img.getSpotImg());
					 jsonSpot.put("spotThumbnailURL", DIR_PATH+path+"/"+imgId);
				 }

				 jsonSpots.put(jsonSpot);       		
			}
			
			System.out.println(jsonSpots.toString());
//			os.write(jsonSpots.toString().getBytes());
			os.write(jsonSpots.toString().getBytes("UTF-8"));
//    		writer.write(jsonSpots.toString());
		} catch (JSONException e) {
			e.printStackTrace();
		}
    	finally {
//    		if(writer != null) {
//    			writer.flush();
//    			writer.close();
//    		}
    		
    		if(os != null) {
				os.flush();
				os.close();
    		}
    	}
    	
    	//session.setAttribute("spots", spots);
    	//response.sendRedirect("printSpotInfo.jsp");
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
