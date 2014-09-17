<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-responsive-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">iTravel</a>
		</div>
		<div class="navbar-collapse collapse navbar-responsive-collapse">
			<ul class="nav navbar-nav">
				<li><a href="#">找景點</a></li>
				<li><a href="#">找行程</a></li>
				<li><a href="#">coupon</a></li>

			</ul>
			<c:if test="${empty user }">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#mapmodals" data-toggle="modal">
							<i class="glyphicon glyphicon-user"></i>登入
					</a></li>
			</c:if>
			<c:if test="${! empty user }">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i>
							小花 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#"><i
									class="glyphicon glyphicon-map-marker"></i> 我的景點</a></li>
							<li><a href="#"><i class="glyphicon glyphicon-flag"></i>
									我的行程</a></li>
							<li><a href="#"><i class="glyphicon glyphicon-heart"></i>
									我的收藏</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <i class=" glyphicon glyphicon-pencil"></i></a>
						<ul class="dropdown-menu">
							<li><a href="#"> 景點</a></li>
							<li><a href="#"> 行程</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <i class=" glyphicon glyphicon-cog"></i></a>
						<ul class="dropdown-menu">
							<li><a href="#"> 帳號</a></li>
							<li><a href="#"> 登出</a></li>
						</ul></li>
				</ul>
			</c:if>

			<div id="mapmodals" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">登入</h4>
						</div>
						<div class="modal-body">
							<p>One fine body&hellip;</p>
						</div>
						<div class="modal-footer">							
							<button type="button" class="btn btn-default"
								data-dismiss="modal">註冊</button></a>
							<button type="button" class="btn btn-primary">忘記密碼</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->



			</div>


		</div>

	</div>




	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>