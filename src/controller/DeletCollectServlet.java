package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.service.MyCollectService;

import org.json.JSONArray;

/**
 * Servlet implementation class DeletCollectServlet
 */
@WebServlet("/controller/DeletCollectServlet")
public class DeletCollectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeletCollectServlet() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		State : 1,  // 1表示傳入的是spot資料
		AccountId : "${user.accountId}",
		SpotId:id },					
		*/
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		// 取得AccountId 撈出spot
		String AccountId = request.getParameter("AccountId");
		String State = request.getParameter("State");
		String SpotId = request.getParameter("SpotId");
		System.out.println(AccountId+";"+State+";"+SpotId);
		
		PrintWriter out = response.getWriter();
		//OutputStream os = response.getOutputStream();
		MyCollectService service = new MyCollectService();
		
		if(State.equals("1")){ //刪除景點
			service.deletSpotCollect(AccountId, SpotId);
			out.print(true);
		}else{ //刪除行程
			
			
		}
		out.close();
		response.setContentType("application/json;charset=UTF-8");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
