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

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import model.SpotCommentRecord;
import model.SpotDetail;
import model.dao.SpotCommentRecordDAOHibernate;

/**
 * Servlet implementation class SpotCommServlet
 */
@WebServlet("/controller/SpotCommServlet")
public class SpotCommServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SpotCommServlet() {

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		// String spotId = request.getParameter("id");
		// System.out.println("SpotId : " + spotId);

		String sessionId = request.getSession().getId();
		System.out.println("sessionId : " + sessionId);
		// 取得此景點的spotId
		//
		//

		SpotCommentRecordDAOHibernate dao = new SpotCommentRecordDAOHibernate();
		// 以景點編號找底下的評論

		List<SpotCommentRecord> comm = (List<SpotCommentRecord>) dao
				.selectBySpot("RES14090002");
		OutputStream os = response.getOutputStream();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		JSONArray jsonSpotComms = new JSONArray();
		
		//System.out.println(comm);
		
		
		try {
			for (SpotCommentRecord spotcomm : comm) {
				JSONObject jsonSpotComm = new JSONObject();
				jsonSpotComm.put("userId", spotcomm.getAccountId());
				jsonSpotComm.put("spotId", spotcomm.getSpotId());
				jsonSpotComm.put("comId", spotcomm.getCommentId());
				jsonSpotComm.put("txt", spotcomm.getComment());
//				 String userId = spotcomm.getAccountId();
//				 String spotId = spotcomm.getSpotId();
//				 String comId = spotcomm.getCommentId();
//				 String txt = spotcomm.getComment();
//				 System.out.println(userId+":"+ spotId +":"+comId+":"+txt);
				jsonSpotComms.put(jsonSpotComm);

			}
			System.out.println(jsonSpotComms.toString());
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		 
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
