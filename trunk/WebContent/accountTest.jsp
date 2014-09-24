<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Test</title>
</head>
<body>
	<h3>Welcome ${user.email}</h3>
	<h3><a href="<c:url value="/secure/signup.jsp" />">SignUp</a></h3>
	<h3><a href="<c:url value="/secure/login.jsp" />">Login</a></h3>
	<h3><a href="<c:url value="/account/changeAccount.jsp" />">ChangeAccount</a></h3>
	<h3><a href="<c:url value="/account/forgotPsw.jsp" />">ForgotPassword</a></h3>
	<h3><a href="<c:url value="/account/resetPsw.jsp" />">ResetPassword(forgetting password only)</a></h3>
</body>
</html>