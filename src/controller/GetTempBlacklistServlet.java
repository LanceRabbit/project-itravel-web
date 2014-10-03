package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Account;
import model.BlacklistRecord;
import model.SpotCommentRecord;
import model.service.AdminService;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/controller/GetTempBlacklistServlet")
public class GetTempBlacklistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetTempBlacklistServlet() {
        super();
    }
    protected void doGetTemp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	AdminService service = new AdminService();
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		JSONArray jsonSpots = new JSONArray();
		List<Account> result1= service.getTempBlacklist();
//		System.out.println("GetTempBlacklistServlet List<Account> Count= "+result1.size());
//		System.out.println("GetTempBlacklistServlet List<Account>= "+result1);
		OutputStream os = response.getOutputStream();
	
		try {
			for (Account acc : result1) {
				JSONObject jsonBlack = new JSONObject();
				String accountLevel = service.getAccountLevelById(acc.getAccountId());
				jsonBlack.put("AccountId", acc.getAccountId());
				jsonBlack.put("AccountLevel",accountLevel );
				jsonBlack.put("Deadline", acc.getLastLogonDt());
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
		doGetTemp(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetTemp(request,response);
	}

}
