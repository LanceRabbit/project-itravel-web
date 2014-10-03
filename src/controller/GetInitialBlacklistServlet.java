package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BlacklistRecord;
import model.SpotCommentRecord;
import model.service.AdminService;
import model.util.ImageIOUtil;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/controller/GetInitialBlacklistServlet")
public class GetInitialBlacklistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetInitialBlacklistServlet() {
        super();
    }
    protected void doGetInitialBlacklist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	AdminService service = new AdminService();
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		JSONArray jsonSpots = new JSONArray();
		List<BlacklistRecord> result1= service.getInitialBlacklist(0);
		OutputStream os = response.getOutputStream();
	
		try {
			for (BlacklistRecord b : result1) {
				SpotCommentRecord result2 = service.getSpotCommentRecorByCommentId(b.getId().getCommentId());
				String accountLevel = service.getAccountLevelById(b.getId().getReportedId());
				System.out.println("GetInitialBlacklistServlet Account Level = "+accountLevel);
				JSONObject jsonBlack = new JSONObject();
				jsonBlack.put("Reporter", b.getId().getReporterId());
				jsonBlack.put("Reported", b.getId().getReportedId());
				jsonBlack.put("AccountLevel",accountLevel );
				jsonBlack.put("SpotId", result2.getSpotId());
				jsonBlack.put("ReportDate", b.getReportDt());
				jsonBlack.put("CommentId", result2.getCommentId());
				jsonBlack.put("Comment", result2.getComment());
				jsonBlack.put("Reason", b.getReason());
				jsonSpots.put(jsonBlack);
			}
			System.out.println("InitialBlacklist Test= "+jsonSpots.toString());
			os.write(jsonSpots.toString().getBytes("UTF-8"));
		} catch (JSONException e) {
			e.printStackTrace();
		} finally {
			if (os != null) {
				os.flush();
				os.close();
			}
		}
    	
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetInitialBlacklist(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetInitialBlacklist(request, response);
	}

}
