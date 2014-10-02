package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model.Account;
import model.SpotInfo;
import model.service.CommentService;
import model.service.SearchSpotService;

/**
 * Servlet implementation class GetSpotServlet
 */
@WebServlet("/controller/GetSpot")
public class GetSpotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private void process(HttpServletRequest request, HttpServletResponse response) {
		
		OutputStream os = null;
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			
			String webAppURL = request.getScheme() 
					+ "://"
					+ request.getServerName()
					+ ":"
					+ request.getServerPort()
					+ request.getContextPath();
			
			String deployDir = getServletContext().getRealPath("/");
			
			String spotId = request.getParameter("spotId");
			System.out.println("spot id : " + spotId);
			
			Account user = (Account)request.getSession().getAttribute("user");
			String viewer = null;
			if(user != null)
				viewer = user.getAccountId();
			
			SearchSpotService service = new SearchSpotService();
			SpotInfo spotInfo = service.getSpotIfoById(spotId, viewer, webAppURL, deployDir);
			
			// reset commenter's nickname by the account id
			CommentService cmtService = new CommentService();
			cmtService.setCommenterNickname(spotInfo.getSpotComments());
			
			JSONObject jsonSpotInfo = new JSONObject(spotInfo);
			
			os = response.getOutputStream();
			os.write(jsonSpotInfo.toString().getBytes("UTF-8"));
			
			System.out.println("spot info : " + jsonSpotInfo.toString());
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(os != null) {
				try {
					os.flush();
					os.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("doPost called");
		process(request, response);
	}

}
