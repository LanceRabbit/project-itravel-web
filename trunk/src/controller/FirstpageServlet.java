package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import model.Ad;
import model.SpotImg;
import model.service.FirstpageService;
import model.util.ImageIOUtil;

/**
 * Servlet implementation class FirstpageServlet
 */
@WebServlet("/FirstpageServlet")
public class FirstpageServlet extends HttpServlet {
	public final static String DIR_PATH = "C:/Travel/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/iTravelWeb/images/";
	private static final long serialVersionUID = 1L;

	public FirstpageServlet() {

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String sessionId = request.getSession().getId();
		System.out.println("sessionId : " + sessionId);
		FirstpageService service = new FirstpageService();
		List<Ad> result = service.findAD();
		//System.out.println(result);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		JSONArray jsonSpots = new JSONArray();

		//request.setAttribute("Ad", result);

		try {
			for (Ad o : result) {
				JSONObject jsonSpot = new JSONObject();
				jsonSpot.put("spotName", o.getSpotDetail().getSpotName());
				jsonSpot.put("spotIntro", o.getSpotDetail().getSpotIntro());

				String imgId = o.getAdId();
				ImageIOUtil.saveImage(imgId + ".jpg", o.getAdImg());
				jsonSpot.put("spotThumbnailURL", "images/" + imgId + ".jpg");
				jsonSpots.put(jsonSpot);
				
			}
			System.out.println(jsonSpots.toString());
			// String AdimgId = o.getAdId();
			// System.out.println(AdimgId); // 圖檔名稱怎麼解決!?
			// InputStream is = new FileInputStream(DIR_PATH + AdimgId +
			// ".jpg");
			// OutputStream os = response.getOutputStream();
			// byte[] b = new byte[1024];
			// int len;
			// while ((len = is.read(b)) != -1) {
			// os.write(b, 0, len);
			// }
			// os.flush();
			// is.close();
			// os.close();

		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("first.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}
}
