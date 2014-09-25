package controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SpotImg;
import model.TripDetail;
import model.dao.SpotImgDAOHibernate;
import model.dao.TripDetailDAOHibrenate;

@WebServlet("/controller/TripImageServlet")
public class TripImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doMethod(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");

		System.out.println(id);
		OutputStream out = null;
		TripDetailDAOHibrenate tripdetail = new TripDetailDAOHibrenate();
		TripDetail detail = tripdetail.selectOneByTripId(id, 1);
		if (detail != null) {
			SpotImgDAOHibernate imgdao = new SpotImgDAOHibernate();
			System.out.println(detail.getSpotDetail().getSpotId());
			SpotImg img = imgdao.selectOneBySpotId(detail.getSpotDetail()
					.getSpotId(), 1);
			if (img != null) {

				byte[] image = img.getSpotImg();
				if (image == null || image.length == 0) {
					// return;
					response.setContentType("image/jpg");

					String pathToWeb = getServletContext().getRealPath(
							File.separator);
					System.out.println(pathToWeb);
					File file = new File(pathToWeb + "images/team1.jpg");

					response.setContentLength((int) file.length());

					FileInputStream in = new FileInputStream(file);
					out = response.getOutputStream();

					// Copy the contents of the file to the output stream
					byte[] buf = new byte[1024];
					int count = 0;
					while ((count = in.read(buf)) >= 0) {
						out.write(buf, 0, count);
					}

					out.close();
					in.close();

				} else {

					out = response.getOutputStream();

					out.write(image); // 直接把byte[]用OutputStream寫出
					out.close();
				}
			} else {
				response.setContentType("image/jpg");

				String pathToWeb = getServletContext().getRealPath(
						File.separator);
				System.out.println(pathToWeb);
				File file = new File(pathToWeb + "images/team1.jpg");

				response.setContentLength((int) file.length());

				FileInputStream in = new FileInputStream(file);
				out = response.getOutputStream();

				// Copy the contents of the file to the output stream
				byte[] buf = new byte[1024];
				int count = 0;
				while ((count = in.read(buf)) >= 0) {
					out.write(buf, 0, count);
				}

				out.close();
				in.close();

			}

		} else {
			response.setContentType("image/jpg");

			String pathToWeb = getServletContext().getRealPath(File.separator);
			System.out.println(pathToWeb);
			File file = new File(pathToWeb + "images/team1.jpg");

			response.setContentLength((int) file.length());

			FileInputStream in = new FileInputStream(file);
			out = response.getOutputStream();

			// Copy the contents of the file to the output stream
			byte[] buf = new byte[1024];
			int count = 0;
			while ((count = in.read(buf)) >= 0) {
				out.write(buf, 0, count);
			}

			out.close();
			in.close();
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
