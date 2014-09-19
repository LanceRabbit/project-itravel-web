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
import model.service.AccountService;


@WebServlet("/controller/GetImageServlet")
public class GetImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doMethod(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		AccountService service = new AccountService();
		Account account = service.selectById(id);

		OutputStream out = null;
		byte[] image = account.getImage();
		out = response.getOutputStream();
		out.write(image); //直接把byte[]用OutputStream寫出
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doMethod(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doMethod(request, response);
	}

}
