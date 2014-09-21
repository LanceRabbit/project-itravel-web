<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reset Password</title>
</head>
<body>
<h3>請重新設定密碼</h3>
<form action="<c:url value="/controller/ResetPswServlet" />" method="post">  
    <span class="error" style="display: block;">${errors.passwordError}</span>  
    Email：<input type="text" name="email" value="${email}" readonly="readonly"/><br/>  
    Password：<input type="password" name="newPassword" /><span class="error">${errors.newPassword }</span><br/>  
    Password Check：<input type="password" name="newPassword2"/><span class="error">${errors.newPassword2 }</span><br/>  
    <input type="submit" value="確認修改" />  
</form>  
</body>
</html>