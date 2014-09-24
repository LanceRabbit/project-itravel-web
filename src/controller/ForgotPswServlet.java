package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.service.AccountService;
import model.util.EmailUtil;

@WebServlet("/controller/ForgotPswServlet")
public class ForgotPswServlet extends HttpServlet {

	// public ForgotPswServlet() {
	// super();
	// }
	private AccountService service = null;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 接收資料
		String email = request.getParameter("email");

		// 驗證資料
		service = new AccountService();
		Account account = service.selectByEmail(email);
		if (account==null) {
			request.setAttribute("errorEmail","Email 錯誤");
			request.getRequestDispatcher("/account/forgotPsw.jsp").forward(
					request, response);
			return;
		}

		// 呼叫Model
		
		EmailUtil.sendResetPasswordEmail(account);

		// 根據Model執行結果呼叫View
		request.setAttribute("sendMailMsg", "您的申請已提交成功，請查看您的"+account.getEmail()+"信箱。");
		request.getRequestDispatcher("/account/forgotPsw.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
