<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Top Fragment</title>

<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
<style>
.error,.modal-body,.modal-title,.form-control,.btn{
	font-family:'Microsoft JhengHei',"微軟正黑體",sans-serif;
}
#idTop{
	padding:20px 0px 0px 0px;
}
</style>
</head>
<body>
	<div id="idTop" class="container">
	<div class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-responsive-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>						
			
			<a class="navbar-brand" href="<c:url value="/index.jsp"/>">iTravel</a>
		</div>
		<div class="navbar-collapse collapse navbar-responsive-collapse">
			<ul class="nav navbar-nav">			
				<li><a href="<c:url value="/first.jsp"/>">News</a></li>
				<li><a href="<c:url value="/spot/searchSpot.jsp"/>">找景點</a></li>
				<li><a href="#">找行程</a></li>
				<li><a href="#">coupon</a></li>

			</ul>
			

				<c:if test="${empty user }">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#topmodals" data-toggle="modal">
								<i class="glyphicon glyphicon-user"></i>登入
						</a></li>
				</c:if>
			
			<c:if test="${! empty user }">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><c:if test="${! empty user.image }">
								<img width="30" height="30"
									src="<c:url value='/controller/GetImageServlet?id=${user.accountId}'/>" />
							</c:if> <c:if test="${ empty user.image }">
								<i class="glyphicon glyphicon-user"></i>
							</c:if> ${user.nickname}<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value="/spot/MySpot.jsp"/>"><i
									class="glyphicon glyphicon-map-marker"></i> 我的景點</a></li>
							<li><a href="<c:url value="/trip/MyTrip.jsp"/>"><i class="glyphicon glyphicon-flag"></i>
									我的行程</a></li>
							<li><a href="#"><i class="glyphicon glyphicon-heart"></i>
									我的收藏</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <i class=" glyphicon glyphicon-pencil"></i></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value="/spot/addSpot.jsp"/>"> 景點</a></li>
							<li><a href="#"> 行程</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <i class=" glyphicon glyphicon-cog"></i></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value="/account/changeAccount.jsp"/>"> 帳號</a></li>
							<li><a href="#"> 登出</a></li>
						</ul></li>
				</ul>
			</c:if>

			<div id="topmodals" class="modal fade" style="margin-top:100px">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" style="font-weight: bold;">登入</h4>
						</div>
						<div class="modal-body">

							<form action="<c:url value="/controller/LoginServlet"/>;" method="POST" >
								<table>
									<tr><td>&nbsp;</td><td><span class="error" style="color:red" name="loginError">${errorMsgs.login}${errorMsgs_login}</span></td></tr>
									<tr>
										<td style="font-weight: bold;width:50px">Email </td>
										<td><input type="text" name="email" class="form-control"
											value="${param.email}" required></td>
									</tr>
									<tr><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">密碼</td>
										<td><input type="password" name="password" class="form-control" required></td>
									</tr>
									<tr><td>&nbsp;</td><td><a href="<c:url value='/account/forgotPsw.jsp' />" >忘記密碼?</a></td></tr>
								</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								onclick="location.href='<c:url value="/secure/signup.jsp" />';"
								data-dismiss="modal">註冊</button>
							<input type="submit" class="btn btn-info" value="登入"/>
						</div>
						</form>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
		</div>
	</div>
	</div>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			if($('[name="loginError"]').text()!=""){
				$('#topmodals').modal('show');
			}
		});
	
	</script>
</body>
</html>