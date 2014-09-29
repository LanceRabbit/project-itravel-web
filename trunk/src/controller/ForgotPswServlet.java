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
		HttpSession session = request.getSession();
		// 驗證資料
		service = new AccountService();
		Account account = service.selectByEmail(email);
		if (account==null) {
			request.setAttribute("errorEmail","Email 錯誤");
			request.getRequestDispatcher("/first.jsp").forward(
					request, response);
			return;
		}else if(account.getAccountLevel()==3||account.getAccountLevel()==5){
			session.setAttribute("activated", "false");
			response.sendRedirect(request.getContextPath()+"/first.jsp");
			return;
		}
		service.setAccountLevelAsForgot(account.getAccountId());
		// 呼叫Model
		
		EmailUtil.sendResetPasswordEmail(account);

		// 根據Model執行結果呼叫View
		session.setAttribute("sendMailMsgForgotPsw", "您的申請已提交成功，請至信箱查看。");
		response.sendRedirect(request.getContextPath()+"/first.jsp");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
