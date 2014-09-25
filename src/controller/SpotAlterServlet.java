package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.AccountDAO;
import model.SpotDetail;
import model.SpotDetailDAO;
import model.dao.AccountDAOHibernate;
import model.dao.SpotDetailDAOHibernate;
import model.service.AlterService;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class SpotAlterServlet
 */
@WebServlet("/controller/SpotAlterServlet")
public class SpotAlterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SpotAlterServlet() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		//取得AccountId spotId
		String AccountId = request.getParameter("AccountId");
		String SpotId = request.getParameter("SpotId");		
		System.out.println(AccountId+","+SpotId);
		
		AlterService service = new AlterService();
		
		
//		Iterator<SpotDetail> spotDetail = spotDetails.iterator();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		JSONArray jsonSpots = new JSONArray();
		OutputStream os = response.getOutputStream();
		
//		try {
//			for(SpotDetail o:spotDetails){
//				JSONObject jsonSpot = new JSONObject();
//				jsonSpot.put("spotName", o.getSpotName());
//				jsonSpot.put("spotIntro", o.getSpotIntro());
//				jsonSpot.put("spotID", o.getSpotId());
//				//spot pic
//				jsonSpots.put(jsonSpot);
//			}
//			System.out.println(jsonSpots.toString());
//			// os.write(jsonSpots.toString().getBytes());
//			os.write(jsonSpots.toString().getBytes("UTF-8"));
//		} catch (JSONException e) {
//		
//			e.printStackTrace();
//		}finally{
//			
//			if (os != null) {
//				os.flush();
//				os.close();
//			}
//		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
