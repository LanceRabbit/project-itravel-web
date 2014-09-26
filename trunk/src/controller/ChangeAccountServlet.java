package controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.Account;
import model.service.AccountService;

import org.apache.commons.io.IOUtils;

/**
 * Servlet implementation class ChangeAccountServlet
 */
@WebServlet("/controller/ChangeAccountServlet")
@MultipartConfig(maxFileSize = 8388608)  //limitation 8MB
public class ChangeAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ChangeAccountServlet() {
        super();
    }
    protected void doChange(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	
    	AccountService service = new AccountService();
    	String email = ((Account) session.getAttribute("user")).getEmail();
    	Account account = null;
    	String oldPassword = null;
		String newPassword = null;
		String nickname = null;
		byte[] image = null;
		InputStream inputStream = null;
		try {
			oldPassword = request.getParameter("oldPassword");
			//若有舊密碼(忘記密碼以外的情況)，先驗證是否能登入，若登入失敗則導回修改帳號資訊頁面
			if(oldPassword!=null){
				account = service.login(email, oldPassword);
				if(account==null){
					request.setAttribute("errorOldPsw", "密碼錯誤");
					request.getRequestDispatcher(
							"/account/changeAccount.jsp").forward(request, response);
					return;
				}
			}
			newPassword = request.getParameter("newPassword1");
			if(newPassword!=null){
				if(newPassword.equals(oldPassword)){
					request.setAttribute("errorNewPsw", "密碼必須和舊密碼不同");
					request.getRequestDispatcher(
							"/account/changeAccount.jsp").forward(request, response);
					return;
				}
			}
			nickname = request.getParameter("nickname");
			Part filePart = request.getPart("image");
			System.out.println("ServletFileSize="+filePart.getSize());
			if(filePart.getSize() != 0){
				 try {
						inputStream = filePart.getInputStream();
						image = IOUtils.toByteArray(inputStream);
					} catch (Exception e) {
						e.printStackTrace();
					}
			}
		} catch (IllegalStateException e) {
			request.setAttribute("errorChangeImageCA", "檔案過大");
			request.getRequestDispatcher(
					"/account/changeAccount.jsp").forward(request, response);
			return;
		}finally{
			if(inputStream!=null){
				inputStream.close();
			}
		}
		//呼叫Model
		boolean updated = service.changeAccount(email, newPassword, nickname, image);
		
		// 根據Model執行結果呼叫View
		if(updated){
			session.setAttribute("user", service.selectByEmail(email));
			request.setAttribute("result", updated);
			request.getRequestDispatcher(
					"/account/changeAccount.jsp").forward(request, response);
			
		}else if(oldPassword==null && newPassword!=null){
			request.setAttribute("errorChangePsw", "密碼重設發生錯誤，請重新操作，或與客服聯絡");
			request.getRequestDispatcher(
					"/account/resetPsw.jsp").forward(request, response);
		}else{
		
			//request.setAttribute("errorChangeAccount", "修改帳號資料發生錯誤，請重新操作，或與客服聯絡");
			request.setAttribute("result", updated);
			request.getRequestDispatcher(
					"/account/changeAccount.jsp").forward(request, response);
		}
		
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doChange(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doChange(request,response);
	}

}
