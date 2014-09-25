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
 * Servlet implementation class DeletAddLikeServlet
 */
@WebServlet("/controller/DeletLikeServlet")
public class DeletLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeletLikeServlet() {
     
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String AccountId = request.getParameter("AccountId");
		String SpotId = request.getParameter("SpotId");		
		System.out.println(AccountId+","+SpotId);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		
		
		if(!AddLikeService.isEmpty(AccountId, SpotId)){
			
			AddLikeService.deletSpotLike(AccountId, SpotId);
			request.setAttribute("likeMsg", "新增成功");
			
//			String path = request.getContextPath();			
//			response.sendRedirect(path+"/spot/testSearchSpot.jsp");
			request.getRequestDispatcher(
					"/spot/TestSearchSpot.jsp").forward(request, response);
			System.out.println("delet成功");
		}else{
			request.setAttribute("likeMsg", "已新增過");
			request.getRequestDispatcher(
					"/spot/TestSearchSpot.jsp").forward(request, response);
			System.out.println("delet失敗");
		}
//		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
