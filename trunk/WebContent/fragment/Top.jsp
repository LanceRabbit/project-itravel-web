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
.modal-signup{
	width: 400px;
}
.signuptd,.form-control{
	width: 175px;
}
#idImgLimitation{
	font-family:Microsoft JhengHei;
	font-size:14px
}
.emptyTr{
	line-height: 5px;
}
.spanPosition{
	position:absolute;
	margin-left:-115px;
	margin-top:-8px;
	color:red;
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
							<li><a href="<c:url value='/controller/LogoutServlet' />"> 登出</a></li>
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
									<tr><td>&nbsp;</td><td><span class="error" style="color:red" name="loginError">${errorMsgs.login}</span></td></tr>
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
							<button type="button" class="btn btn-default" id="idClickSignup"
								data-dismiss="modal">註冊</button>
							<input type="submit" class="btn btn-info" value="登入"/>
						</div>
						</form>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			
			
			<div id="signupmodals" class="modal fade" style="margin-top:100px">
				<div class="modal-dialog modal-signup">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" style="font-weight: bold;">註冊</h4>
						</div>
						<div class="modal-body">

							<form action="<c:url value="/controller/SignupServlet"/>;" method="POST" enctype="multipart/form-data">
								<table >
									<tr><td>&nbsp;</td><td><span class="error" style="color:red" name="loginError">${errorMsgs.login}</span></td></tr>
									<tr>
										<td style="font-weight: bold;width:70px">Email </td>
										<td><input type="text" name="email" class="form-control signuptd"
											value="${param.email}" id="idEmail"  required ></td>
										<td><span id="checkEmail" class="spanPosition" name="spanCheck"></span></td>
									</tr>
									<tr class="emptyTr"><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">密碼</td>
										<td><input type="password" name="password" class="form-control signuptd" id="idPsw1" required></td>
										<td><span id="checkPsw1" class="spanPosition" name="spanCheck"></span></td>
									</tr>
									<tr><td>&nbsp;</td><td colspan="2">(不可空白，不包含中文，至少6個字且必須包含英文字母、數字)</td></tr>
									<tr>
										<td style="font-weight: bold;">密碼確認</td>
										<td><input type="password" name="passwordck" class="form-control signuptd" id="idPsw2" required></td>
										<td><span id="checkPsw2" class="spanPosition" name="spanCheck"></span></td>
									</tr>
									<tr class="emptyTr"><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">用戶名</td>
										<td><input type="text" name="nickname" class="form-control signuptd" id="idNick" required></td>
										<td><span id="checkNick" class="spanPosition" name="spanCheck"></span></td>
									</tr>
									<tr class="emptyTr"><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">顯示圖片</td>
										<td><input type="file" name="image"  id="idImage" ></td>
										<td><span id="checkNick"></span></td>
									</tr>
									<tr><td>&nbsp;</td><td id="idImgLimitation">檔案大小限制 8MB</td></tr>
									
								</table>
						</div>
						<div class="modal-footer">
							<input type="reset" class="btn btn-default" name="cancel" id="cancel" value="重填" />
							<input type="submit" class="btn btn-info" value="註冊" id="idSubmit"/>
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
		$("#idClickSignup").click(function(){
			$('#topmodals').modal('hide');
			$('#signupmodals').modal('show');
		});
		$("#idEmail").focusout(function() {
			  var email = $("#idEmail").val();
			  if(isValidEmailAddress(email)) {
				  $.post('<c:url value="/controller/CheckEmailServlet" />',{"email":email},function(data){
					  if(data=='true'){
			    			$("#checkEmail").html("");
			    		}else{
			    			$("#checkEmail").html("Email已註冊過");
			    		}
		    		 }).done(function(){
		    			 isCompleted();
		    		 }); 	  
				} else {
					$("#checkEmail").html("Email格式錯誤");
					isCompleted();
				}
		  });
		$("#idPsw1").focusout(function() {
			var password1 = $("#idPsw1").val();
			if(chkPsw(password1)){
				$("#checkPsw1").html("");
				var password2 = $("#idPsw2").val();
				if(password2!=""){
					if(password1==password2){
						$("#checkPsw2").html("");
					}else{
						$("#checkPsw2").html("請輸入相同密碼");
					}
				}
			}else{
				$("#checkPsw1").html("格式錯誤");
			}
			isCompleted();
		});
		$("#idPsw2").focusout(function() {
			var password1 = $("#idPsw1").val();
			var password2 = $("#idPsw2").val();
			if(password1==password2){
				$("#checkPsw2").html("");
			}else{
				$("#checkPsw2").html("請輸入相同密碼");
			}
			isCompleted();
		});
		$("#idNick").focusout(function() {
			var nickName = $("#idNick").val();
			if(nickName!=""){
				$("#checkNick").html("");
			}else{
				$("#checkNick").html("請輸入用戶名");
			}
			isCompleted();
		});
	
	function isCompleted(){
		//var tx = document.getElementsByTagName("input");
		var sp = document.getElementsByName("spanCheck");
	/* 	for(var i =0;i<4;i++){
			if(tx[i].value==""){
				console.log(tx[i].value);
				if(!document.getElementById("idSubmit").getAttribute("disabled")){
					document.getElementById("idSubmit").setAttribute("disabled","disabled");}
				return;
			}
		} */
		for(var i =0;i<4;i++){
			if(sp[i].innerHTML!=""){
				console.log(sp[i].innerHTML);
				if(!document.getElementById("idSubmit").getAttribute("disabled")){
					document.getElementById("idSubmit").setAttribute("disabled", "disabled");}
				return;
			}
		}
		document.getElementById("idSubmit").removeAttribute("disabled");
	}
	function isValidEmailAddress(emailAddress) {
		var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
		return pattern.test(emailAddress);
		}
	function chkPsw(password) {
	    
	    var re = /^(?=.*[0-9])(?=.*[A-Za-z])\S{6,}$/;
		return re.test(password);
	   
	}
	</script>
</body>
</html>