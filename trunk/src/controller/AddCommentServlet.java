package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.service.CommentService;

@WebServlet("/controller/AddComment")
public class AddCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private void process(HttpServletRequest request, HttpServletResponse response) {
		
		PrintWriter writer = null;
		try {
			request.setCharacterEncoding("UTF-8");
			String commenterId = request.getParameter("commenterId"); //System.out.println("commenter id : " + commenterId);
			String spotId = request.getParameter("spotId"); //System.out.println("spot id : " + spotId);
			String comment = request.getParameter("comment"); //System.out.println("comment : " + comment);
			
			CommentService service = new CommentService();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text");
			writer = response.getWriter();
			
			if(service.createComment(commenterId, spotId, comment) == 0)
				writer.print("true");
			else
				writer.print("false");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(writer != null) {
				writer.flush();
				writer.close();
			}
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
}
