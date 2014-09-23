package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.service.AddLikeService;

/**
 * Servlet implementation class AddLikServlet
 */
@WebServlet("/controller/AddLikeServlet")
public class AddLikServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public AddLikServlet() {
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String AccountId = request.getParameter("AccountId");
		String SpotId = request.getParameter("SpotId");		
		System.out.println(AccountId+","+SpotId);
		if(AddLikeService.addSpotLike(AccountId, SpotId)){
			System.out.println("Like成功");
		}else{
			System.out.println("Like失敗");
		}
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
