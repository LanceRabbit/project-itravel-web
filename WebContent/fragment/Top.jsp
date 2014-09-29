<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Top Fragment</title>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/css/jquery.datetimepicker.css"/>" rel="stylesheet">

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
.spanPositionForgotPsw{
	margin-left:5px;
	color:red;
}
#resultForgotPsw{
	font-family:Microsoft JhengHei;
	font-size:16px;
	color:red;
	margin-left:15px;
}
.modal-jumpout{
	width:350px;
}
#signupError,#signupOK{
	margin-top:100px;
	font-size:16px;
}
.modal-forgotPsw{
	width:350px;
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
				<li><a href="<c:url value="/trip/searchTrip.jsp"/>">找行程</a></li>
				<li><a href="#">coupon</a></li>

			</ul>
			

				<c:if test="${empty user }">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#topmodals" data-toggle="modal">
								<i class="glyphicon glyphicon-user"></i>登入
						</a></li>
				</c:if>
			
			<c:if test="${! empty user }">
			<c:if test="${user.accountLevel==1}">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><c:if test="${! empty user.image }">
								<img width="25" height="25"
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
							<li><a href="#" data-toggle="modal"
										data-target="#addTripModal"> 行程</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <i class=" glyphicon glyphicon-cog"></i></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value="/account/changeAccount.jsp"/>"> 帳號</a></li>
							<li><a href="<c:url value='/controller/LogoutServlet' />"> 登出</a></li>
						</ul></li>
				</ul>
				</c:if>
				
				<div class="modal fade" id="addTripModal" tabindex="-1" role="dialog"
		aria-labelledby="addTripModal" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="myModalLabel">新增行程</h3>
				</div>
				<div class="modal-body">
					<form action="<c:url value="/trip/addTripDetail.jsp"/>;"
						method="POST">
						<table>
							<tr>
								<td style="font-weight: bold; width: 100px">行程名稱：</td>
								<td><input type="text" name="email" class="form-control"
									required></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">起始日期：</td>
								<td><input id="date_timepicker_start" type="text"
									class="form-control" required></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">結束日期：</td>
								<td><input id="date_timepicker_end" type="text"
									class="form-control" required></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td></td>
							</tr>
						</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" 
						data-dismiss="modal">取消</button>
					<input type="submit" class="btn btn-info" value="繼續" />
				</div>
				</form>
			</div>
		</div>
	</div>

				
			</c:if>
				<c:if test="${! empty user }">
				<c:if test="${user.accountLevel==2}">
					<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><c:if test="${! empty user.image }">
								<img width="25" height="25"
									src="<c:url value='/controller/GetImageServlet?id=${user.accountId}'/>" />
							</c:if> <c:if test="${ empty user.image }">
								<i class="glyphicon glyphicon-user"></i>
							</c:if> ${user.nickname}<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value="/spot/MySpot.jsp"/>"><i
									class="glyphicon glyphicon-map-marker"></i> 我的景點</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <i class=" glyphicon glyphicon-pencil"></i></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value="/spot/addSpot.jsp"/>"> 景點</a></li>
							<li><a href="#">宣傳</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <i class=" glyphicon glyphicon-cog"></i></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value="/account/changeAccount.jsp"/>"> 帳號</a></li>
							<li><a href="<c:url value='/controller/LogoutServlet' />"> 登出</a></li>
						</ul></li>
				</ul>
				</c:if>
				</c:if>
				<c:if test="${! empty user }">
				<c:if test="${user.accountLevel==9}">
					<ul class="nav navbar-nav navbar-right">
					<li><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><c:if test="${! empty user.image }">
								<img width="25" height="25"
									src="<c:url value='/controller/GetImageServlet?id=${user.accountId}'/>" />
							</c:if> <c:if test="${ empty user.image }">
								<i class="glyphicon glyphicon-user"></i>
							</c:if> ${user.nickname}<b class="caret"></b></a>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <i class="fa fa-bars">管理</i></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value="/admin/blackList.jsp"/>"><i class="fa fa-users" style="margin-right:5px"></i>黑名單</a></li>
							<li><a href="#"><i class="glyphicon glyphicon-list-alt" style="margin-right:5px"></i>統計報表</a></li>
						</ul></li>

					<li><a href="<c:url value='/controller/LogoutServlet' />" >
					<i class=" glyphicon glyphicon-cog">登出</i></a>
					</li>
				</ul>
				</c:if>
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
										<td><input type="text" name="email" class="form-control needClaer"
											value="${param.email}"  required></td>
									</tr>
									<tr><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">密碼</td>
										<td><input type="password" name="password" class="form-control needClaer" required></td>
									</tr>
									<tr><td>&nbsp;</td><td><a STYLE="cursor:pointer;" id="idForgotPsw">忘記密碼?</a></td></tr>
								</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" id="idClickSignup"
								data-dismiss="modal">註冊</button>
							<input type="submit" class="btn btn-info" value="登入"></input>
						</div>
						</form>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			
			
			<div id="signupmodalsMember" class="modal fade" style="margin-top:100px">
				<div class="modal-dialog modal-signup">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" style="font-weight: bold;">會員註冊</h4>
						</div>
						<div class="modal-body">

							<form action="<c:url value="/controller/SignupServlet"/>;" method="POST" enctype="multipart/form-data" name="formSignupMem">
								<table >
									<tr><td>&nbsp;</td><td><span id="checkImageMember"  name="imageError" style="color:red">${errorImageMember}</span></td></tr>
									
									<tr>
										<td style="font-weight: bold;width:70px">Email </td>
										<td><input type="text" name="email" class="form-control signuptd needClaer"
											value="${param.email}" id="idEmail"  required ></td>
										<td><span id="checkEmail" class="spanPosition" name="spanCheck"></span></td>
									</tr>
									<tr class="emptyTr"><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">密碼</td>
										<td><input type="password" name="password" class="form-control signuptd needClaer"  maxlength="12" id="idPsw1" required></td>
										<td><span id="checkPsw1" class="spanPosition" name="spanCheck"></span></td>
									</tr>
									<tr><td>&nbsp;</td><td colspan="2">(不可空白，不包含中文，限制6-12個字且必須包含英文字母、數字)</td></tr>
									<tr>
										<td style="font-weight: bold;">密碼確認</td>
										<td><input type="password" name="passwordck" class="form-control signuptd needClaer"  maxlength="12" id="idPsw2" required></td>
										<td><span id="checkPsw2" class="spanPosition" name="spanCheck"></span></td>
									</tr>
									<tr class="emptyTr"><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">用戶名</td>
										<td><input type="text" name="nickname" class="form-control signuptd needClaer" id="idNick" required></td>
										<td><span id="checkNick" class="spanPosition" name="spanCheck"></span></td>
									</tr>
									<tr class="emptyTr"><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">顯示圖片</td>
										<td><input type="file" name="image"  id="idImage" style="width:175px"></td>
										<td><span id="checkImage" class="spanPosition needClaer" name="spanCheck"></span></td>
									</tr>
									<tr><td>&nbsp;</td><td id="idImgLimitation">檔案大小限制 8MB</td></tr>
									
								</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" id="backtoSelectCha1">返回</button>
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
		<div id="signupmodalsOwner" class="modal fade" style="margin-top:100px">
				<div class="modal-dialog modal-signup">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" style="font-weight: bold;">店家註冊</h4>
						</div>
						<div class="modal-body">

							<form action="<c:url value="/controller/SignupServlet"/>;" method="POST" enctype="multipart/form-data" name="formSignupOwn">
								<table >
									<tr><td>&nbsp;</td><td><span id="checkImageOwner"  name="imageError" style="color:red">${errorImageOwner}</span></td></tr>
									<tr>
										<td style="font-weight: bold;width:70px">Email </td>
										<td><input type="text" name="email" class="form-control signuptd needClaer"
											value="${param.email}" id="idEmailO"  required ></td>
										<td><span id="checkEmailO" class="spanPosition" name="spanCheckO"></span></td>
									</tr>
									<tr class="emptyTr"><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">密碼</td>
										<td><input type="password" name="password" class="form-control signuptd needClaer" id="idPswO1" maxlength="12" required></td>
										<td><span id="checkPswO1" class="spanPosition" name="spanCheckO"></span></td>
									</tr>
									<tr><td>&nbsp;</td><td colspan="2">(不可空白，不包含中文，限制6-12個字且必須包含英文字母、數字)</td></tr>
									<tr>
										<td style="font-weight: bold;">密碼確認</td>
										<td><input type="password" name="passwordck" class="form-control signuptd needClaer" maxlength="12" id="idPswO2" required></td>
										<td><span id="checkPswO2" class="spanPosition" name="spanCheckO"></span></td>
									</tr>
									<tr class="emptyTr"><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">用戶名</td>
										<td><input type="text" name="nickname" class="form-control signuptd needClaer" id="idNickO" required></td>
										<td><span id="checkNickO" class="spanPosition" name="spanCheckO"></span></td>
									</tr>
									<tr class="emptyTr"><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">負責人</td>
										<td><input type="text" name="owner" class="form-control signuptd needClaer" id="idOwnerO" required></td>
										<td><span id="checkOwnerO" class="spanPosition" name="spanCheckO"></span></td>
									</tr>
									<tr class="emptyTr"><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">顯示圖片</td>
										<td><input type="file" name="image"  id="idImageO" style="width:175px"></td>
										<td><span id="checkImageO" class="spanPosition needClaer" name="spanCheckO"></span></td>
									</tr>
									<tr><td>&nbsp;</td><td id="idImgLimitation">檔案大小限制 8MB</td></tr>
									
								</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" id="backtoSelectCha2">返回</button>
							<input type="reset" class="btn btn-default" name="cancel" id="cancel" value="重填" />
							<input type="submit" class="btn btn-info" value="註冊" id="idSubmitO"/>
						</div>
						</form>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
	</div>
	</div>
	

	
<div id="signupTypeSelect" class="modal fade" style="margin-top:100px">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" style="font-weight: bold;">選擇註冊身分</h4>
      </div>
      <!-- dialog body -->
      <div class="modal-body" style="margin-left:20px"></i>
        	<label class="radio">
  			<input type="radio" name="signupRadio" id="signupAsMember" value="asMember" checked>
  			註冊為會員
			</label>
			<label class="radio">
 			<input type="radio" name="signupRadio" id="signupAsOwner" value="asOwner">
			註冊為店家
			</label>	
      </div>
      <!-- dialog buttons -->
      <div class="modal-footer">
      <button type="button" class="btn btn-default" id="backtoLogin">返回</button>
      <button type="button" class="btn btn-primary" id="chekCharactar">確定</button></div>
    </div>
  </div>
</div>	



<div id="modalForgotPsw" class="modal fade " style="margin-top:100px">
  <div class="modal-dialog modal-forgotPsw">
    <div class="modal-content">
    	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel" style="height:30px;padding-top:5px;font-weight: bold;">忘記密碼</h4>
      </div>
      <!-- dialog body -->
     <form action="<c:url value="/controller/ForgotPswServlet" />" method="post"> 
     <table>
     	<tr><td>&nbsp;</td></tr>
     	<tr><td colspan="3" ><span id="resultForgotPsw" >${sendMailMsgForgotPsw}</span></td></tr>
		<tr>
			<td style="font-weight: bold;width:40px; padding:15px;">Email </td>
			<td><input type="text" name="email" class="form-control needClaer" required></td>
			<td><span class="error spanPositionForgotPsw" name="spanForgotPsw" >${errorEmail}</span></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
	</table>  
      <!-- dialog buttons -->
      <div class="modal-footer">
      <button type="button" class="btn btn-default" id="backtoLoginfromForgotPsw">返回</button>
      <input type="submit" class="btn btn-info" id="btOKForgotPsw" value="提交"></div>
    </form>
    </div>
  </div>
</div>



<label id="activated" hidden>${activated}</label>
<div id="unactivated" class="modal fade" style="margin-top:100px">
  <div class="modal-dialog modal-jumpout">
    <div class="modal-content">
    	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel" style="height:30px;padding-top:5px"><i class="fa fa-exclamation-circle fa-lg"></i></h4>
      </div>
      <!-- dialog body -->
      <div class="modal-body" style="color:red;font-size:14px"></i>
        	帳號尚未啟用，請至註冊信箱收信啟用。
      </div>
      <!-- dialog buttons -->
      <div class="modal-footer"><button type="button" class="btn btn-primary" id="btOK3">確定</button></div>
    </div>
  </div>
</div>	
	
<label id="resultSignup" hidden>${signupOK}</label>
<div id="signupOK" class="modal fade">
  <div class="modal-dialog modal-jumpout">
    <div class="modal-content">
    	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel" style="font-weight: bold;">註冊結果</h4>
      </div>
      <!-- dialog body -->
      <div class="modal-body" style="color:green"><i class="glyphicon glyphicon-ok" ></i>
        	註冊成功，請至註冊信箱收信啟用帳號!
      </div>
      <!-- dialog buttons -->
      <div class="modal-footer"><button type="button" class="btn btn-primary" id="btOK1">確定</button></div>
    </div>
  </div>
</div>
<div id="signupError" class="modal fade">
  <div class="modal-dialog modal-jumpout">
    <div class="modal-content">
    	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel" style="font-weight: bold;"><i class="fa "></i>註冊結果</h4>
      </div>
      <!-- dialog body -->
      <div class="modal-body" style="color:red"><i class="fa fa-exclamation-circle fa-lg"></i>
        	發生錯誤，請重新操作。
      </div>
      <!-- dialog buttons -->
      <div class="modal-footer"><button type="button" class="btn btn-primary" id="btOK2">確定</button></div>
    </div>
  </div>
</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.datetimepicker.js"></script>
	<script>
	
	 $('#date_timepicker_start').datetimepicker({
		  format:'Y/m/d',
		  startDate:0,
         minDate:0,
		  closeOnDateSelect:true,
		  onShow:function( ct ){
		   this.setOptions({
		    maxDate:jQuery('#date_timepicker_end').val()?jQuery('#date_timepicker_end').val():false
		   })
		  },
		  timepicker:false
	 });
	 
	 
	 $('#date_timepicker_end').datetimepicker({
		  format:'Y/m/d',
		  startDate:0,
        
		  closeOnDateSelect:true,
		  onShow:function( ct ){
			  console.log($('#date_timepicker_start').val());
			  console.log($('#date_timepicker_start').val().length);
			  this.setOptions({
				    minDate:(jQuery('#date_timepicker_start').val().length!=0)?jQuery('#date_timepicker_start').val():0
			  })
		  },
		  timepicker:false
	 });
		
	
$('#addTripModal').on('hidden.bs.modal', function (e) {
	console.log($('#date_timepicker_start').val());
	console.log($('#date_timepicker_end').val());
	var date1 = new Date($('#date_timepicker_start').val());
	var date2 = new Date($('#date_timepicker_end').val());


	console.log( 'Days since ' 
	           + date1 + ': ' 
	           + Date.daysBetween(date1, date2));	
	
	$("form .form-control").val("");
	})

	Date.daysBetween = function( date1, date2 ) {
	  //Get 1 day in milliseconds
	  var one_day=1000*60*60*24;

	  // Convert both dates to milliseconds
	  var date1_ms = date1.getTime();
	  var date2_ms = date2.getTime();

	  // Calculate the difference in milliseconds
	  var difference_ms = date2_ms - date1_ms;
	    
	  // Convert back to days and return
	  return Math.round(difference_ms/one_day)+1; 
	}
	
	
		$(document).ready(function(){
			if($('[name="loginError"]').text()!=""){
				$('#topmodals').modal('show');
			}
			if($('[name="spanForgotPsw"]').text()!=""){
				$('#modalForgotPsw').modal('show');
			}
			if($('#resultForgotPsw').text()!=""){
				$("#modalForgotPsw").modal('show');
				removeSendMailMsgForgotPswAttr();
				console.log('ResultForgotPsw= '+$('#resultForgotPsw').text());
			}
			if($('#resultSignup').text()=='true'){
				$("#signupOK").modal('show');
				removeSignupOKAttr();
			}else if($('#resultSignup').text()=='false'){
				$("#signupError").modal('show');
				removeSignupOKAttr();
			}
			if($('#activated').text()=='false'){
				$("#unactivated").modal('show');
				removeActivatedAttr();
			}
			
			if($('#checkImageMember').text()!=""){
				$("#signupmodalsMember").modal('show');
			}
			if($('#checkImageOwner').text()!=""){
				$("#signupmodalsOwner").modal('show');
			}
		});
		$("#idForgotPsw").click(function(){
			$('#topmodals').modal('hide');
			$('#modalForgotPsw').modal('show');
		});
		
		
		$("#btOK1").click(function(){
			$("#signupOK").modal('hide');
		});
		$("#btOK2").click(function(){
			$("#signupError").modal('hide');
		});
		$("#btOK3").click(function(){
			$("#unactivated").modal('hide');
		});
		$("#idClickSignup").click(function(){
			$('#topmodals').modal('hide');
			$('#signupTypeSelect').modal('show');
		});
		$("#backtoLogin").click(function(){
			$('#signupTypeSelect').modal('hide');
			$('#topmodals').modal('show');
		});
		$("#backtoLoginfromForgotPsw").click(function(){
			$('#modalForgotPsw').modal('hide');
			$('#topmodals').modal('show');
		});
		$("#chekCharactar").click(function(){
			var choose = $('[name="signupRadio"]:checked').val();
			if(choose=='asMember'){
				$('#signupTypeSelect').modal('hide');
				$('#signupmodalsMember').modal('show');
			}else if(choose=='asOwner'){
				$('#signupTypeSelect').modal('hide');
				$('#signupmodalsOwner').modal('show');
			}
		});
		  $(function () { $('.modal').on('hidden.bs.modal', function () {
			    $('[name="spanCheck"]').each(function(){
					$(this).text("");
				});
			    $('[name="spanCheckO"]').each(function(){
					$(this).text("");
				});
			    $('[name="spanForgotPsw"]').each(function(){
					$(this).text("");
				});
				$('.modal .needClaer').each(function(){
					$(this).val("");
				});  
				
		 		});
		 		/* $('#modalForgotPsw').on('hidden.bs.modal', function () {
		 			$('.modal .needClaer').each(function(){
						$(this).val("");
					});  
				
		 		}); */
		  
		   }); 
	
		
		$("#backtoSelectCha1").click(function(){
			$('#signupmodalsMember').modal('hide');
			$('#signupTypeSelect').modal('show');
		});
		$("#backtoSelectCha2").click(function(){
			$('[name="spanCheckO"]').each(function(){
				$(this).text("");
			});
			$('[name="formSignupOwn"] input').each(function(){
				$(this).val("");
			});
			$('#signupmodalsOwner').modal('hide');
			$('#signupTypeSelect').modal('show');
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
		$("#idPsw1").keyup(function() {
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
		$("#idPsw2").keyup(function() {
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
		$("#idEmailO").focusout(function() {
			  var email = $("#idEmailO").val();
			  if(isValidEmailAddress(email)) {
				  $.post('<c:url value="/controller/CheckEmailServlet" />',{"email":email},function(data){
					  if(data=='true'){
			    			$("#checkEmailO").html("");
			    		}else{
			    			$("#checkEmailO").html("Email已註冊過");
			    		}
		    		 }).done(function(){
		    			 isCompletedO();
		    		 }); 	  
				} else {
					$("#checkEmailO").html("Email格式錯誤");
					isCompletedO();
				}
		  });
		$("#idPswO1").keyup(function() {
			var password1 = $("#idPswO1").val();
			if(chkPsw(password1)){
				$("#checkPswO1").html("");
				var password2 = $("#idPswO2").val();
				if(password2!=""){
					if(password1==password2){
						$("#checkPswO2").html("");
					}else{
						$("#checkPswO2").html("請輸入相同密碼");
					}
				}
			}else{
				$("#checkPswO1").html("格式錯誤");
			}
			isCompletedO();
		});
		$("#idPswO2").keyup(function() {
			var password1 = $("#idPswO1").val();
			var password2 = $("#idPswO2").val();
			if(password1==password2){
				$("#checkPswO2").html("");
			}else{
				$("#checkPswO2").html("請輸入相同密碼");
			}
			isCompletedO();
		});
		$("#idNickO").focusout(function() {
			var nickName = $("#idNickO").val();
			if(nickName!=""){
				$("#checkNickO").html("");
			}else{
				$("#checkNickO").html("請輸入用戶名");
			}
			isCompletedO();
		});
		$("#idOwnerO").focusout(function() {
			var owner = $("#idOwner").val();
			if(owner!=""){
				$("#checkOwnerO").html("");
			}else{
				$("#checkOwnerO").html("請輸入負責人");
			}
			isCompletedO();
		});
		$('#idImage').bind('change', function() {
			 if(this.files[0].size>8388608){
				 $("#checkImage").html("檔案過大");
			 }else{
				 $("#checkImage").html("");
			 }
			isImageOK();
		});
		$('#idImageO').bind('change', function() {
			 if(this.files[0].size>8388608){
				 $("#checkImageO").html("檔案過大");
			 }else{
				 $("#checkImageO").html("");
			 }
			isImageOK();
		});
	function isImageOK(){
		var imgSpanM = document.getElementById("checkImage");
		var imgSpanO = document.getElementById("checkImageO");
		if(imgSpanM.innerHTML!=""){
			if(!document.getElementById("idSubmit").getAttribute("disabled")){
				document.getElementById("idSubmit").setAttribute("disabled", "disabled");}
			return;
		}else{
			document.getElementById("idSubmit").removeAttribute("disabled");
		}
		if(imgSpanO.innerHTML!=""){
			if(!document.getElementById("idSubmitO").getAttribute("disabled")){
				document.getElementById("idSubmitO").setAttribute("disabled", "disabled");}
			return;
		}else{
			document.getElementById("idSubmitO").removeAttribute("disabled");
		}
	}
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
	function isCompletedO(){
		var sp = document.getElementsByName("spanCheckO");
		for(var i =0;i<5;i++){
			if(sp[i].innerHTML!=""){
				console.log(sp[i].innerHTML);
				if(!document.getElementById("idSubmitO").getAttribute("disabled")){
					document.getElementById("idSubmitO").setAttribute("disabled", "disabled");}
				return;
			}
		}
		document.getElementById("idSubmitO").removeAttribute("disabled");
	}
	function removeSendMailMsgForgotPswAttr(){
		<c:remove var="sendMailMsgForgotPsw" scope="session" />;
	}
	function removeSignupOKAttr(){
		<c:remove var="signupOK" scope="session" />;
	}
	function removeActivatedAttr(){
		<c:remove var="activated" scope="session" />;
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