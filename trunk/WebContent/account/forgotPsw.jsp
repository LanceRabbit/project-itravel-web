<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘記密碼</title>
</head>
<body>
<h3>忘記密碼</h3>
<form action="<c:url value="/controller/ForgotPswServlet" />" method="get">  
    <span style="color: red">${sendMailMsg}</span>
    <table>
	<tr>
		<td>Email : </td>
		<td><input type="text" name="email"></td>
		<td><span class="error">${errorMsgs.email}</span></td>
	</tr>
	<tr>
		<td >　</td>
		<td align="right"><input type="submit" value="提交"></td>
	</tr>
</table>  
</form>  
</body>
</html>