package controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SpotImg;
import model.dao.SpotImgDAOHibernate;

@WebServlet("/controller/TripDetailImageServlet")
public class TripDetailImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doMethod(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		int spotOrder = Integer.parseInt(request.getParameter("index"));
		// AccountService service = new AccountService();
		// Account account = service.selectById(id);
		OutputStream out = null;
		SpotImgDAOHibernate imgdao = new SpotImgDAOHibernate();
		SpotImg img = imgdao.selectOneBySpotId(id, spotOrder);
		if (img != null) {

			byte[] image = img.getSpotImg();
			if (image == null || image.length == 0) {
				// return;
				response.setContentType("image/jpg");

				String pathToWeb = getServletContext().getRealPath(
						File.separator);
				System.out.println(pathToWeb);
				File f = new File(pathToWeb + "images/team1.jpg");
				BufferedImage bi = ImageIO.read(f);
				out = response.getOutputStream();
				ImageIO.write(bi, "jpg", out);
			} else {

				out = response.getOutputStream();

				out.write(image); // 直接把byte[]用OutputStream寫出
			}
		} else {
			response.setContentType("image/jpg");

			String pathToWeb = getServletContext().getRealPath(File.separator);
			System.out.println(pathToWeb);
			File f = new File(pathToWeb + "images/team1.jpg");
			response.setContentLength((int)f.length());
			BufferedImage bi = ImageIO.read(f);
			out = response.getOutputStream();
			ImageIO.write(bi, "jpg", out);

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
