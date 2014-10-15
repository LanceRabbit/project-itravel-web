package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BlacklistRecord;
import model.Coupons;
import model.SpotCommentRecord;
import model.service.DisseminateService;
import model.util.ImageIOUtil;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/controller/GetCouponsServlet")
public class GetCouponsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetCouponsServlet() {
    }
    protected void doGetCoupons(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	DisseminateService service = new DisseminateService();
    	
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		JSONArray jsonCoupons = new JSONArray();
		OutputStream os = response.getOutputStream();
		List<Coupons> result1= service.getWholeCoupons();
		try {
			for (Coupons c : result1) {
				JSONObject jsonCoupon = new JSONObject();
				jsonCoupon.put("Description", c.getCouponDescription());
				jsonCoupon.put("ValidDate", c.getValidDay());
				jsonCoupon.put("CouponId", c.getCouponId());
				jsonCoupon.put("SpotName", c.getSpotDetail().getSpotName());
				String imgURL = null;
				String dateDir = (new SimpleDateFormat("yyyy-MM-dd")).format(new Date());
				String imgPath = "images" + "/" + dateDir + "/coupons";
				String deployDir = getServletContext().getRealPath("/");
				String referer = request.getHeader("referer");
				String webAppURL = referer.substring(0,43);
				System.out.println("GetCouponsServlet webAppURL= "+webAppURL);
				if (c.getCouponId() != null) {
					ImageIOUtil.saveImage((deployDir + imgPath),
							c.getCouponId(), c.getCouponImg());
					imgURL = webAppURL + "/" + imgPath + "/"+c.getCouponId();
				}
				jsonCoupon.put("Image", imgURL);
				jsonCoupons.put(jsonCoupon);
			}
			System.out.println("GetCouponsServlet Data= "+jsonCoupons.toString());
			os.write(jsonCoupons.toString().getBytes("UTF-8"));
		} catch (JSONException e) {
			e.printStackTrace();
		} finally {
			if (os != null) {
				os.flush();
				os.close();
			}
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetCoupons(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetCoupons(request,response);
	}

}
