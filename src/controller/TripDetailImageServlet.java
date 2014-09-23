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
import model.SpotImg;
import model.TripDetail;
import model.dao.SpotImgDAOHibernate;
import model.dao.TripDAOHibernate;
import model.dao.TripDetailDAOHibrenate;
import model.service.AccountService;


@WebServlet("/controller/TripDetailImageServlet")
public class TripDetailImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doMethod(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		int spotOrder =  Integer.parseInt(request.getParameter("index"));
//		AccountService service = new AccountService();
//		Account account = service.selectById(id);
		
		SpotImgDAOHibernate imgdao = new SpotImgDAOHibernate();
		SpotImg img = imgdao.selectOneBySpotId(id, spotOrder);
		if (img != null) {
			OutputStream out = null;
			byte[] image = img.getSpotImg();
			out = response.getOutputStream();

			out.write(image); // 直接把byte[]用OutputStream寫出
		}
		return;
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
