package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.service.AdminService;

@WebServlet("/controller/ManageBlacklistServlet")
public class ManageBlacklistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ManageBlacklistServlet() {
        super();
    }
    protected void doManage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	AdminService service = new AdminService();
    	String reporterId = request.getParameter("reporter");
    	String reportedId = request.getParameter("reported");
    	String commentId = request.getParameter("commentId");
    	int punishment =  Integer.parseInt(request.getParameter("punish"));
//    	System.out.println("ManageBlacklistServlet GET= "+reporterId+";"+reportedId+";"+commentId+";"+punishment);
    	Date current = new Date();
    	Calendar calendar = Calendar.getInstance();
    	calendar.setTime(current);
    	String deadline = null;
    	PrintWriter out = response.getWriter();
    	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    	if(punishment==0){//不處分
    		service.updateBlacklistRecordStatus(reporterId , reportedId, commentId);
    		out.print("true");
    		return;
    	}else if(punishment==1){//停權一週
    		calendar.add(Calendar.DAY_OF_YEAR, 7);
    	    deadline = dateFormat.format(calendar.getTime());
    	}else if(punishment==2){//停權兩週
    		calendar.add(Calendar.DAY_OF_YEAR, 14);
    		deadline = dateFormat.format(calendar.getTime());
    	}else if(punishment==4){//停權四週
    		calendar.add(Calendar.MONTH, 1);
    		deadline = dateFormat.format(calendar.getTime());
    	}else if(punishment==9){
    		calendar.add(Calendar.YEAR, 100);
    		deadline = dateFormat.format(calendar.getTime());
    	}
    	boolean result = service.addBlacklist(reportedId, deadline, commentId, reporterId);
    	out.print(result);
		return;
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doManage(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doManage(request,response);
	}

}
