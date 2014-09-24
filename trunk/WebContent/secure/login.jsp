<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="../css/main.css" />

<title>Login</title>
</head>
<body>

<h3>Login</h3>
<h5>${errorMsgs.alreadyActivate}</h5>
<form action="<c:url value="/controller/LoginServlet" />" method="post">
<table>
	<tr>
		<td>Email : </td>
		<td><input type="text" name="email" value="${param.email}"></td>
		<td><span class="error">${errorMsgs.username}</span></td>
	</tr>
	<tr>
		<td>PWD : </td>
		<td><input type="text" name="password" value="${param.password}"></td>
		<td><span class="error">${errorMsgs.password}</span></td>
	</tr>
	<tr>
		<td >　</td>
		<td align="right"><input onclick="location.href='<c:url value="/secure/signUp.jsp" />';" type="button" value="註冊"><input onclick="location.href='<c:url value="/account/forgotPsw.jsp" />';" type="button" value="忘記密碼"><input type="submit" value="登入"></td>
	</tr>
</table>
</form>
</body>
</html>