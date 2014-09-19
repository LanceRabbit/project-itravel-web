<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>使用者${user.nickname}註冊成功</h3>
		<table>
			<tr>
				<td>Email :</td>
				<td>${user.email}</td>
			</tr>
			<tr>
				<td>Image :</td>
				<td><img width="80" height="80" src="<c:url value='/controller/GetImageServlet?id=${user.accountId}'/>" /></td>
			</tr>
		</table>
</body>
</html>