package controller;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SpotImg;
import model.service.GetSpotImageService;


@WebServlet("/controller/GetSpotImage")
public class GetSpotImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private void process(HttpServletRequest request, HttpServletResponse response) {
		
		String imgId = request.getParameter("imgId");
		GetSpotImageService service = new GetSpotImageService();
		SpotImg spotImg = service.getSpotImageById(imgId);

		OutputStream os = null;
		byte[] data = spotImg.getSpotImg();
		try {
			os = response.getOutputStream();
			os.write(data); 
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			if(os != null) {
				try {
					os.flush();
					os.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
}

