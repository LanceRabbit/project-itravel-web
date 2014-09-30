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
<link rel="stylesheet" href="<c:url value="/css/dropzone.css" />" />
<link rel="stylesheet" href="<c:url value="/css/container.css" />" />
<link rel="stylesheet" href="<c:url value="/css/spot-modalview.css" />" />

<style>
.error,.btn{
	font-family:'Microsoft JhengHei',"微軟正黑體",sans-serif;
}
#idTop{
	padding:20px 0px 0px 0px;
}
.modal-signup{
	width: 400px;
}
.signuptd{
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
.top-form-control{
	font-family:'Microsoft JhengHei',"微軟正黑體",sans-serif;
	width: 175px;
	border:1px solid #848484;
	border-radius:3px;
}
.top-modal-body,.adela-modal-title{
	font-family:'Microsoft JhengHei',"微軟正黑體",sans-serif;
	margin-left:10px;
}
#spotInfoForm {
	height: auto;
    max-height: 225px;
    overflow-x: hidden;
    overflow-y:auto
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
							<li><a href="<c:url value="/MyCollect.jsp"/>"><i class="glyphicon glyphicon-heart"></i>
									我的收藏</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <i class=" glyphicon glyphicon-pencil"></i></a>
						<ul class="dropdown-menu">
							<li><a href="#" data-toggle="modal"
										data-target="#addSpotModal"> 景點</a></li>
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
				<div class="top-modal-body">
					<form action="<c:url value="/controller/TransferAddTripServlet"/>;"
						method="POST">
						<table>
							<tr>
								<td style="font-weight: bold; width: 100px">行程名稱：</td>
								<td><input type="text" name="tripName" class="top-form-control"
									required></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">起始日期：</td>
								<td><input id="date_timepicker_start" type="text" name="dateStart"
									class="top-form-control" required></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">結束日期：</td>
								<td><input id="date_timepicker_end" type="text" name="date=-end"
									class="top-form-control" required></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><input id="totalDay" name="totalDay" type="text" hidden></td>
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
							<h4 class="adela-modal-title" style="font-weight: bold;">登入</h4>
						</div>
						<div class="top-modal-body">

							<form action="<c:url value="/controller/LoginServlet"/>;" method="POST" >
								<table>
									<tr><td>&nbsp;</td><td><span class="error" style="color:red" name="loginError">${errorMsgs.login}</span></td></tr>
									<tr>
										<td style="font-weight: bold;width:50px">Email </td>
										<td><input type="text" name="email" class="top-form-control needClaer"
											value="${param.email}"  required></td>
									</tr>
									<tr><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">密碼</td>
										<td><input type="password" name="password" class="top-form-control needClaer" required></td>
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
							<h4 class="adela-modal-title" style="font-weight: bold;">會員註冊</h4>
						</div>
						<div class="top-modal-body">

							<form action="<c:url value="/controller/SignupServlet"/>;" method="POST" enctype="multipart/form-data" name="formSignupMem">
								<table >
									<tr><td>&nbsp;</td><td><span id="checkImageMember"  name="imageError" style="color:red">${errorImageMember}</span></td></tr>
									
									<tr>
										<td style="font-weight: bold;width:70px">Email </td>
										<td><input type="text" name="email" class="top-form-control signuptd needClaer"
											value="${param.email}" id="idEmail"  required ></td>
										<td><span id="checkEmail" class="spanPosition" name="spanCheck"></span></td>
									</tr>
									<tr class="emptyTr"><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">密碼</td>
										<td><input type="password" name="password" class="top-form-control signuptd needClaer"  maxlength="12" id="idPsw1" required></td>
										<td><span id="checkPsw1" class="spanPosition" name="spanCheck"></span></td>
									</tr>
									<tr><td>&nbsp;</td><td colspan="2">(不可空白，不包含中文，限制6-12個字且必須包含英文字母、數字)</td></tr>
									<tr>
										<td style="font-weight: bold;">密碼確認</td>
										<td><input type="password" name="passwordck" class="top-form-control signuptd needClaer"  maxlength="12" id="idPsw2" required></td>
										<td><span id="checkPsw2" class="spanPosition" name="spanCheck"></span></td>
									</tr>
									<tr class="emptyTr"><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">用戶名</td>
										<td><input type="text" name="nickname" class="top-form-control signuptd needClaer" id="idNick" required></td>
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
							<h4 class="adela-modal-title" style="font-weight: bold;">店家註冊</h4>
						</div>
						<div class="top-modal-body">

							<form action="<c:url value="/controller/SignupServlet"/>;" method="POST" enctype="multipart/form-data" name="formSignupOwn">
								<table >
									<tr><td>&nbsp;</td><td><span id="checkImageOwner"  name="imageError" style="color:red">${errorImageOwner}</span></td></tr>
									<tr>
										<td style="font-weight: bold;width:70px">Email </td>
										<td><input type="text" name="email" class="top-form-control signuptd needClaer"
											value="${param.email}" id="idEmailO"  required ></td>
										<td><span id="checkEmailO" class="spanPosition" name="spanCheckO"></span></td>
									</tr>
									<tr class="emptyTr"><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">密碼</td>
										<td><input type="password" name="password" class="top-form-control signuptd needClaer" id="idPswO1" maxlength="12" required></td>
										<td><span id="checkPswO1" class="spanPosition" name="spanCheckO"></span></td>
									</tr>
									<tr><td>&nbsp;</td><td colspan="2">(不可空白，不包含中文，限制6-12個字且必須包含英文字母、數字)</td></tr>
									<tr>
										<td style="font-weight: bold;">密碼確認</td>
										<td><input type="password" name="passwordck" class="top-form-control signuptd needClaer" maxlength="12" id="idPswO2" required></td>
										<td><span id="checkPswO2" class="spanPosition" name="spanCheckO"></span></td>
									</tr>
									<tr class="emptyTr"><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">用戶名</td>
										<td><input type="text" name="nickname" class="top-form-control signuptd needClaer" id="idNickO" required></td>
										<td><span id="checkNickO" class="spanPosition" name="spanCheckO"></span></td>
									</tr>
									<tr class="emptyTr"><td>&nbsp;</td></tr>
									<tr>
										<td style="font-weight: bold;">負責人</td>
										<td><input type="text" name="owner" class="top-form-control signuptd needClaer" id="idOwnerO" required></td>
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
        <h4 class="adela-modal-title" style="font-weight: bold;">選擇註冊身分</h4>
      </div>
      <!-- dialog body -->
      <div class="top-modal-body" style="margin-left:45px"></i>
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
        <h4 class="adela-modal-title" id="myModalLabel" style="height:30px;padding-top:5px;font-weight: bold;">忘記密碼</h4>
      </div>
      <!-- dialog body -->
     <form action="<c:url value="/controller/ForgotPswServlet" />" method="post"> 
     <table>
     	<tr><td>&nbsp;</td></tr>
     	<tr><td colspan="3" ><span id="resultForgotPsw" >${sendMailMsgForgotPsw}${errorTimeout}</span></td></tr>
		<tr>
			<td style="font-weight: bold;width:40px; padding:15px;">Email </td>
			<td><input type="text" name="email" class="top-form-control needClaer" required></td>
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
        <h4 class="adela-modal-title" id="myModalLabel" style="height:30px;padding-top:5px"><i class="fa fa-exclamation-circle fa-lg"></i></h4>
      </div>
      <!-- dialog body -->
      <div class="top-modal-body" style="color:red;font-size:14px"></i>
        	帳號尚未啟用，請至註冊信箱收信啟用。
      </div>
      <!-- dialog buttons -->
      <div class="modal-footer"><button type="button" class="btn btn-primary" id="btOK3">確定</button></div>
    </div>
  </div>
</div>
<label id="resultBlacklistLogin" hidden>${accountLocked}</label>
<div id="atBlackListAnnouncement" class="modal fade" style="margin-top:100px">
  <div class="modal-dialog modal-jumpout">
    <div class="modal-content">
    	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="adela-modal-title" id="myModalLabel" style="height:30px;padding-top:5px"><i class="fa fa-exclamation-circle fa-lg"></i></h4>
      </div>
      <!-- dialog body -->
      <div class="top-modal-body" style="color:red;font-size:14px"></i>
        <table>
        	<tr><td>&nbsp;</td></tr>
        	<tr><td>${accountLocked}</td></tr>
        	<tr><td>&nbsp;</td></tr>
      	</table>
      </div>
      <!-- dialog buttons -->
      <div class="modal-footer"><button type="button" class="btn btn-primary" id="btOK4">確定</button></div>
    </div>
  </div>
</div>		
	
<label id="resultSignup" hidden>${signupOK}</label>
<div id="signupOK" class="modal fade">
  <div class="modal-dialog modal-jumpout">
    <div class="modal-content">
    	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="adela-modal-title" id="myModalLabel" style="font-weight: bold;">註冊結果</h4>
      </div>
      <!-- dialog body -->
      <div class="top-modal-body" style="color:green"><i class="glyphicon glyphicon-ok" ></i>
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
        <h4 class="adela-modal-title" id="myModalLabel" style="font-weight: bold;"><i class="fa "></i>註冊結果</h4>
      </div>
      <!-- dialog body -->
      <div class="top-modal-body" style="color:red"><i class="fa fa-exclamation-circle fa-lg"></i>
        	發生錯誤，請重新操作。
      </div>
      <!-- dialog buttons -->
      <div class="modal-footer"><button type="button" class="btn btn-primary" id="btOK2">確定</button></div>
    </div>
  </div>
</div>


	<!-- Modal for spot -->

	<div class="modal fade" id="addSpotModal" tabindex="-1" role="dialog"
		aria-labelledby="addSpotModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="addSpotModalLabel">新增景點</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-6 itravel-block-frame">

							<div class="itravel-block-1-pic well imagePreview_zone" id="imagePreview_zone_1">
								<span
									class="glyphicon glyphicon-picture itravel-block-1-pic-content fileinput-button"
									id="fileinputBtn"></span>
							</div>
							<div id="previews_zone_1">
								<div id="template_1"></div>
								<!-- <div id="template_1"> -->
							</div>
							<!-- <div id="previews_zone_1"> -->

						</div>
						<!-- <div class="col-md-6 itravel-block">  -->
						
						<div class="col-md-6 itravel-block-frame hidden-element" id="itravel-block-thumbnails">
							<div class="row">
								<div class="col-md-offset-1 col-md-5 itravel-block-1-thumbnail well">
									<div id="imagePreview_zone_2" class='imagePreview_zone'>
									</div>
								</div>
								<div class="col-md-5 col-md-offset-0.5 itravel-block-1-thumbnail well">
									<div id="imagePreview_zone_3" class='imagePreview_zone'>
									</div>
								</div>

							</div>
							<!-- <div class="row"> -->
							<div class="row">
								<div class="col-md-offset-1 col-md-5 itravel-block-1-thumbnail well">
									<div id="imagePreview_zone_4" class='imagePreview_zone'>
									</div>
								</div>
								<div class="col-md-5 col-md-offset-0.5 itravel-block-1-thumbnail well">
									<div id="imagePreview_zone_5" class='imagePreview_zone'>
									</div>
									<div id="imagePreview_zone_6" class='imagePreview_zone hidden'>
									</div>
								</div>
							</div>
							<!-- <div class="row"> -->
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 itravel-block-frame">
							<div class="well well-md itravel-block-1-group">
								<form class="form-horizontal" method="post" id="spotInfoForm" action='<c:url value="/controller/AddSpot" />'>
									<fieldset>
										<legend class="text-center header"><h4>景點資訊</h4></legend>



										<!-- 名稱 -->
										<!-- 分店負責人 -->
										<!-- 地址 -->
										<!-- 電話 -->
										<!-- 簡介 -->
										<!-- 經緯度 -->
										<div class="form-group">
											<div class="row">
												<div class="col-md-5 col-md-offset-1">

													<div class="input-group" id="cityGroup" data-toggle="popover" data-placement="top" data-content="請選擇縣市">
														<input id="city" name="city" type="text" placeholder="縣市"
															class="form-control" disabled>
														<div class="input-group-btn" id="cityIdMenu">
															<button type="button"
																class="btn btn-default dropdown-toggle"
																data-toggle="dropdown">
																選擇 <span class="caret"></span>
															</button>
															<ul class="dropdown-menu dropdown-menu-right spot-scrollable" role="menu">
															</ul>
														</div>
														<!-- /btn-group -->
													</div>
													<!-- /input-group -->
												</div>
											</div>
											<!-- <div class="row"> -->
										</div>
										<!-- <div class="form-group"> -->
										
										<!-- 大小分類 -->
										<div class="form-group">
											<div class="row">
												<div class="col-md-5 col-md-offset-1">
													<div class="input-group" id="categoryGroup" data-toggle="popover" data-toggle="popover" data-placement="top" data-content="請選擇分類">
														<input id="category" name="category" type="text"
															placeholder="分類" class="form-control" disabled>
														<div class="input-group-btn" id="categoryIdMenu">
															<button type="button"
																class="btn btn-default dropdown-toggle"
																data-toggle="dropdown">
																選擇 <span class="caret"></span>
															</button>
															<ul class="dropdown-menu dropdown-menu-right spot-scrollable-small" role="menu">
															</ul>
														</div>
														<!-- /btn-group -->
													</div>
													<!-- /input-group -->
												</div>

												<div class="col-md-5 col-md-offset-0">
													<div class="input-group" id="subcategoryGroup" data-toggle="popover" data-placement="top" data-content="請選擇子分類">
														<input id="subcategory" name="subcategory" type="text"
															placeholder="子分類" class="form-control" disabled>
														<div class="input-group-btn" id="subcategoryIdMenu">
															<button type="button"
																class="btn btn-default dropdown-toggle"
																data-toggle="dropdown">
																選擇 <span class="caret"></span>
															</button>
															<ul class="dropdown-menu dropdown-menu-right spot-scrollable-small" role="menu">
															</ul>
														</div>
														<!-- /btn-group -->
													</div>
													<!-- /input-group -->
												</div>
											</div>
										</div>
										
										<div class="form-group">
											<div class="row">
												<div class="col-md-5 col-md-offset-1">
													<input id="spotName" name="spotName" type="text"
														placeholder="景點名稱" class="form-control" 
														data-toggle="popover" data-placement="top" data-content="請輸入名稱">
												</div>

												<div class="col-md-5 col-md-offset-0">
													<input id="spotOwner" name="spotOwner" type="text"
														placeholder="分店負責人" class="form-control">
												</div>
											</div>
										</div>
										
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-offset-1">
													<input id="spotAddress" name="address" type="text"
														placeholder="地址" class="form-control">
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-offset-1">
													<input id="phone" name="phone" type="text" placeholder="電話"
														class="form-control">
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-offset-1">
													<textarea class="form-control" id="intro" name="intro"
														placeholder="簡介" rows="7"></textarea>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-offset-1">
													<div class="input-group" id="hiddens">
													</div>
												</div>
											</div>
										</div>

									</fieldset>
								</form>
							</div>
						</div>
						<div class="col-md-6 itravel-block-frame hidden-element" id="itravel-block-map">
							<div class="itravel-block-1-group" id="map-container"></div>
						</div>
					</div>
				</div>
				<!-- <div class="modal-body"> -->

				<div class="modal-footer">
					<button id="resetBtn" type="button" class="btn btn-default" data-dismiss="modal">放棄</button>
					<button id="saveBtn" type="button" class="btn btn-primary">儲存</button>
				</div>
			</div>
			<!-- <div class="modal-content"> -->
		</div>
	</div>
		
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/js/dropzone.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&language=zh-TW"></script>

<script>
	
	// account related
	jQuery("#idForgotPsw").click(function() {
		jQuery('#topmodals').modal('hide');
		jQuery('#modalForgotPsw').modal('show');
	});

	jQuery("#btOK1").click(function() {
		jQuery("#signupOK").modal('hide');
	});
	jQuery("#btOK2").click(function() {
		jQuery("#signupError").modal('hide');
	});
	jQuery("#btOK3").click(function() {
		jQuery("#unactivated").modal('hide');
	});
	jQuery("#btOK4").click(function() {
		jQuery("#atBlackListAnnouncement").modal('hide');
	});
	jQuery("#idClickSignup").click(function() {
		jQuery('#topmodals').modal('hide');
		jQuery('#signupTypeSelect').modal('show');
	});
	jQuery("#backtoLogin").click(function() {
		jQuery('#signupTypeSelect').modal('hide');
		jQuery('#topmodals').modal('show');
	});
	jQuery("#backtoLoginfromForgotPsw").click(function() {
		jQuery('#modalForgotPsw').modal('hide');
		jQuery('#topmodals').modal('show');
	});
	jQuery("#chekCharactar").click(function() {
		var choose = jQuery('[name="signupRadio"]:checked').val();
		if (choose == 'asMember') {
			jQuery('#signupTypeSelect').modal('hide');
			jQuery('#signupmodalsMember').modal('show');
		} else if (choose == 'asOwner') {
			jQuery('#signupTypeSelect').modal('hide');
			jQuery('#signupmodalsOwner').modal('show');
		}
	});

	jQuery("#backtoSelectCha1").click(function() {
		jQuery('#signupmodalsMember').modal('hide');
		jQuery('#signupTypeSelect').modal('show');
	});
	jQuery("#backtoSelectCha2").click(function() {
		jQuery('[name="spanCheckO"]').each(function() {
			jQuery(this).text("");
		});
		jQuery('[name="formSignupOwn"] input').each(function() {
			jQuery(this).val("");
		});
		jQuery('#signupmodalsOwner').modal('hide');
		jQuery('#signupTypeSelect').modal('show');
	});
	jQuery("#idEmail").focusout(function() {
		var email = jQuery("#idEmail").val();
		if (isValidEmailAddress(email)) {
			jQuery.post('<c:url value="/controller/CheckEmailServlet" />', {
				"email" : email
			}, function(data) {
				if (data == 'true') {
					jQuery("#checkEmail").html("");
				} else {
					jQuery("#checkEmail").html("Email已註冊過");
				}
			}).done(function() {
				isCompleted();
			});
		} else {
			jQuery("#checkEmail").html("Email格式錯誤");
			isCompleted();
		}
	});
	jQuery("#idPsw1").keyup(function() {
		var password1 = jQuery("#idPsw1").val();
		if (chkPsw(password1)) {
			jQuery("#checkPsw1").html("");
			var password2 = jQuery("#idPsw2").val();
			if (password2 != "") {
				if (password1 == password2) {
					jQuery("#checkPsw2").html("");
				} else {
					jQuery("#checkPsw2").html("請輸入相同密碼");
				}
			}
		} else {
			jQuery("#checkPsw1").html("格式錯誤");
		}
		isCompleted();
	});
	jQuery("#idPsw2").keyup(function() {
		var password1 = jQuery("#idPsw1").val();
		var password2 = jQuery("#idPsw2").val();
		if (password1 == password2) {
			jQuery("#checkPsw2").html("");
		} else {
			jQuery("#checkPsw2").html("請輸入相同密碼");
		}
		isCompleted();
	});
	jQuery("#idNick").focusout(function() {
		var nickName = jQuery("#idNick").val();
		if (nickName != "") {
			jQuery("#checkNick").html("");
		} else {
			jQuery("#checkNick").html("請輸入用戶名");
		}
		isCompleted();
	});
	jQuery("#idEmailO").focusout(function() {
		var email = jQuery("#idEmailO").val();
		if (isValidEmailAddress(email)) {
			jQuery.post('<c:url value="/controller/CheckEmailServlet" />', {
				"email" : email
			}, function(data) {
				if (data == 'true') {
					jQuery("#checkEmailO").html("");
				} else {
					jQuery("#checkEmailO").html("Email已註冊過");
				}
			}).done(function() {
				isCompletedO();
			});
		} else {
			jQuery("#checkEmailO").html("Email格式錯誤");
			isCompletedO();
		}
	});
	jQuery("#idPswO1").keyup(function() {
		var password1 = jQuery("#idPswO1").val();
		if (chkPsw(password1)) {
			jQuery("#checkPswO1").html("");
			var password2 = jQuery("#idPswO2").val();
			if (password2 != "") {
				if (password1 == password2) {
					jQuery("#checkPswO2").html("");
				} else {
					jQuery("#checkPswO2").html("請輸入相同密碼");
				}
			}
		} else {
			jQuery("#checkPswO1").html("格式錯誤");
		}
		isCompletedO();
	});
	jQuery("#idPswO2").keyup(function() {
		var password1 = jQuery("#idPswO1").val();
		var password2 = jQuery("#idPswO2").val();
		if (password1 == password2) {
			jQuery("#checkPswO2").html("");
		} else {
			jQuery("#checkPswO2").html("請輸入相同密碼");
		}
		isCompletedO();
	});
	jQuery("#idNickO").focusout(function() {
		var nickName = jQuery("#idNickO").val();
		if (nickName != "") {
			jQuery("#checkNickO").html("");
		} else {
			jQuery("#checkNickO").html("請輸入用戶名");
		}
		isCompletedO();
	});
	jQuery("#idOwnerO").focusout(function() {
		var owner = jQuery("#idOwner").val();
		if (owner != "") {
			jQuery("#checkOwnerO").html("");
		} else {
			jQuery("#checkOwnerO").html("請輸入負責人");
		}
		isCompletedO();
	});
	jQuery('#idImage').bind('change', function() {
		if (this.files[0].size > 8388608) {
			jQuery("#checkImage").html("檔案過大");
		} else {
			jQuery("#checkImage").html("");
		}
		isImageOK();
	});
	jQuery('#idImageO').bind('change', function() {
		if (this.files[0].size > 8388608) {
			jQuery("#checkImageO").html("檔案過大");
		} else {
			jQuery("#checkImageO").html("");
		}
		isImageOK();
	});

	function isImageOK() {
		var imgSpanM = document.getElementById("checkImage");
		var imgSpanO = document.getElementById("checkImageO");
		if (imgSpanM.innerHTML != "") {
			if (!document.getElementById("idSubmit").getAttribute("disabled")) {
				document.getElementById("idSubmit").setAttribute("disabled",
						"disabled");
			}
			return;
		} else {
			document.getElementById("idSubmit").removeAttribute("disabled");
		}
		if (imgSpanO.innerHTML != "") {
			if (!document.getElementById("idSubmitO").getAttribute("disabled")) {
				document.getElementById("idSubmitO").setAttribute("disabled",
						"disabled");
			}
			return;
		} else {
			document.getElementById("idSubmitO").removeAttribute("disabled");
		}
	}
	function isCompleted() {
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
		for (var i = 0; i < 4; i++) {
			if (sp[i].innerHTML != "") {
				console.log(sp[i].innerHTML);
				if (!document.getElementById("idSubmit").getAttribute(
						"disabled")) {
					document.getElementById("idSubmit").setAttribute(
							"disabled", "disabled");
				}
				return;
			}
		}
		document.getElementById("idSubmit").removeAttribute("disabled");
	}
	function isCompletedO() {
		var sp = document.getElementsByName("spanCheckO");
		for (var i = 0; i < 5; i++) {
			if (sp[i].innerHTML != "") {
				console.log(sp[i].innerHTML);
				if (!document.getElementById("idSubmitO").getAttribute(
						"disabled")) {
					document.getElementById("idSubmitO").setAttribute(
							"disabled", "disabled");
				}
				return;
			}
		}
		document.getElementById("idSubmitO").removeAttribute("disabled");
	}
	function removeSendMailMsgForgotPswAttr() {
		<c:remove var="sendMailMsgForgotPsw" scope="session" />;
		<c:remove var="errorTimeout" scope="session" />;
	}
	function removeAccountLockedAttr() {
		<c:remove var="accountLocked" scope="session" />;
	}

	function removeSignupOKAttr() {
		<c:remove var="signupOK" scope="session" />;
	}
	function removeActivatedAttr() {
		<c:remove var="activated" scope="session" />;
	}
	function isValidEmailAddress(emailAddress) {
		var pattern = new RegExp(
				/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
		return pattern.test(emailAddress);
	}
	function chkPsw(password) {

		var re = /^(?=.*[0-9])(?=.*[A-Za-z])\S{6,}$/;
		return re.test(password);

	}

	// trip related
		 jQuery('#date_timepicker_start').datetimepicker({
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
	 
	 jQuery('#date_timepicker_end').datetimepicker({
		  format:'Y/m/d',
		  startDate:0,
        
		  closeOnDateSelect:true,
		  onShow:function( ct ){
			  console.log(jQuery('#date_timepicker_start').val());
			  console.log(jQuery('#date_timepicker_start').val().length);
			  this.setOptions({
				    minDate:(jQuery('#date_timepicker_start').val().length!=0)?jQuery('#date_timepicker_start').val():0
			  })
		  },
		  timepicker:false
	 });
	 
	 jQuery("#date_timepicker_end").change(function(){
			var date1 = new Date(jQuery('#date_timepicker_start').val());
			var date2 = new Date(jQuery('#date_timepicker_end').val());

			jQuery("#totalDay").val(Date.daysBetween(date1, date2));
			console.log(Date.daysBetween(date1, date2));
	 });

	 Date.daysBetween = function(date1, date2) {
		//Get 1 day in milliseconds
		var one_day = 1000 * 60 * 60 * 24;

		// Convert both dates to milliseconds
		var date1_ms = date1.getTime();
		var date2_ms = date2.getTime();

		// Calculate the difference in milliseconds
		var difference_ms = date2_ms - date1_ms;

		// Convert back to days and return
		return Math.round(difference_ms / one_day) + 1;
	 }
	
	// spot related 
	var myDropzone;
	var zone_index = 1;
	var spot_location = new google.maps.LatLng(23.973299, 120.978398);
	var spot_map;
	var spot_marker;
	
	var categories = [{"type":"美食", "subtype":["餐廳", "小吃", "美食街", "甜品", "其他"]}, 
	                  {"type":"購物", "subtype":["百貨公司", "大賣場", "個性商店", "路邊攤", "其他"]}, 
	                  {"type":"住宿", "subtype":["飯店", "旅舍", "民宿", "營地", "其他"]},
	                  {"type":"景點", "subtype":["風景區", "國家公園", "古蹟", "遊樂園", "其他"]},
	                  {"type":"活動", "subtype":["藝文展覽", "親子活動", "競賽活動", "其他"]}];
	
	// config buttons
	function popoverHandler(elem) {
		
		jQuery(elem).popover('enable');	
		jQuery(elem).popover('show');
		//jQuery('body').scrollTo('');
		jQuery(elem).on('click', function(){
			jQuery(elem).popover('disable');
			jQuery(elem).off('click');
		});
	}
	
	function resetPage() {
		// reset the image zones
		zone_index = 1;
		jQuery('.imagePreview_zone img').remove();
		jQuery("#fileinputBtn").detach().appendTo("#imagePreview_zone_1");
		jQuery('.deleteImg').remove();
		
		// reset the form
		jQuery('input').val('');
		jQuery('#intro').val('');
		jQuery('#subcategoryGroup').hide();
		jQuery("#itravel-block-map").hide();
	}
	
	// drop zone
	function initDropzone() {
		// Get the template HTML and remove it from the doument
		var previewNode = document.querySelector("#template_1");
		previewNode.id = "";
		var previewTemplate = previewNode.parentNode.innerHTML;
		previewNode.parentNode.removeChild(previewNode);

		myDropzone = new Dropzone("#previews_zone_1", { // Make the whole body a dropzone
		  //url: "http://www.torrentplease.com/dropzone.php", // Set the url
		  url: "controller/Fileuploader",
		  thumbnailWidth: 5000,
		  thumbnailHeight: 5000,
		  //maxFilesize: 2, //MB
		  parallelUploads: 5,
		  
		  previewTemplate: previewTemplate,
		  autoQueue: true, // Make sure the files aren't queued until manually added
		  previewsContainer: "#previews_zone_1", // Define the container to display the previews
		  clickable: ".fileinput-button" // Define the element that should be used as click trigger to select files.
		});
	}
	
	function initElements() {
		// populate city ids
		var cities = ["基隆", "台北", "桃園", "新竹", "苗栗", "dummy", "彰化", "台中", "南投", "雲林", "嘉義", "dummy", "台南", "高雄", "屏東", "dummy", "宜蘭", "花蓮", "台東", "dummy", "綠島", "蘭嶼", "澎湖", "金門", "馬祖"];
		jQuery.each(cities, function(index, value){
			//console.log(value);
			if(value == 'dummy')
				jQuery("#cityIdMenu ul:first").append("<li class='divider'></li>");
			else
				jQuery("#cityIdMenu ul:first").append("<li><a href='#'>"+value+"</a></li>");
		});
		
		// populate category
		jQuery.each(categories, function(index, value){
			var type = value.type;
			jQuery("#categoryIdMenu ul:first").append("<li><a href='#'>"+type+"</a></li>");
		});
	}
	
	function map_init() {
		var spot_mapoptions = {
			center : spot_location,
			zoom : 14,
			mapTypeId : google.maps.MapTypeId.ROADMAP,
			mapTypeControl : false,
			panControl : false,
			rotateControl : false,
			streetViewControl : false,
		};
		spot_map = new google.maps.Map(document
				.getElementById("map-container"), spot_mapoptions);
		
		var spot_infowindow = new google.maps.InfoWindow();

		spot_marker = new google.maps.Marker({
					
					position : spot_location,
					map : spot_map,
					title : "台灣",
					maxWidth : jQuery("#map-container").width(),
					maxHeight : jQuery("#map-container").height(), 
					draggable:true,
				    animation: google.maps.Animation.DROP
		});

		//增加標記點的click事件
		google.maps.event.addListener(spot_marker, 'click', function() {
			console.log("spot marker clicked");
			//spot_infowindow.open(spot_map, spot_marker);
			
			LatLng = spot_marker.getPosition();
			spot_location = LatLng;
			geocoder.geocode({'latLng': LatLng}, function(results, status) {
		   		if (status == google.maps.GeocoderStatus.OK) {
			        if (results[1]) {
			        	address = results[1].formatted_address;
			        	spot_marker.setTitle(address);	//重新設定標記點的title
			        	jQuery('#spotAddress').val(address);
			        	jQuery('#spotAddress').focus();
			        }
			    }else 
			      	console.log("Geocoder failed due to: " + status);
		   });
		});
		
		//增加標記點的mouseup事件
		google.maps.event.addListener(spot_marker, 'mouseup', function() {
			console.log("spot marker mouseup");
			
			LatLng = spot_marker.getPosition();
			geocoder.geocode({'latLng': LatLng}, function(results, status) {
		   		if (status == google.maps.GeocoderStatus.OK) {
			        if (results[1]) {
			        	address = results[1].formatted_address;
			        	spot_marker.setTitle(address);	//重新設定標記點的title
			        	//jQuery('#spotAddress').val(address);
			        	//jQuery('#spotAddress').focus();
			        }
			    }else 
			      	console.log("Geocoder failed due to: " + status);
		   });
		});
	} 
	
	function spotGetAddressMarkerByName(address){	 
		//重新定位地圖位置與標記點位置
		 //address = jQuery("#spotName").val();
		 geocoder = new google.maps.Geocoder();
		 geocoder.geocode({'address':address},function (results,status) {
				if(status==google.maps.GeocoderStatus.OK) 
				{
				   //console.log(results[0].geometry.location);
				   LatLng = results[0].geometry.location;
				   spot_location = LatLng;
				   
				   spot_map.setCenter(LatLng);		//將地圖中心定位到查詢結果
				   spot_marker.setPosition(LatLng);	//將標記點定位到查詢結果
				   
				   // Reverse geocoding to get the address
				   var rev_address = "";
				   geocoder.geocode({'latLng': LatLng}, function(results, status) {
				   		if (status == google.maps.GeocoderStatus.OK) {
					        if (results[1]) {
					        	rev_address = results[1].formatted_address;
					        	spot_marker.setTitle(rev_address);	//重新設定標記點的title
					        	jQuery('#spotAddress').val(rev_address);
					        }
					    }else 
					      	console.log("Geocoder failed due to: " + status);
				   });
				   
				   jQuery('#spotAddress').focus();
				} // end of if(status==google.maps.GeocoderStatus.OK) 
			 }// end of function
		 ); // end of  geocoder.geocode({'address':address},function (results,status) 
	  }
	
	function spotGetAddressMarkerByAddr(address){	 
		 //重新定位地圖位置與標記點位置
		 //address = jQuery("#spotName").val();
		 geocoder = new google.maps.Geocoder();
		 geocoder.geocode({'address':address},function (results,status) {
				if(status==google.maps.GeocoderStatus.OK) 
				{
				   //console.log(results[0].geometry.location);
				   LatLng = results[0].geometry.location;
				   spot_location = LatLng;
				   
				   spot_map.setCenter(LatLng);		//將地圖中心定位到查詢結果
				   spot_marker.setPosition(LatLng);	//將標記點定位到查詢結果
				   
				   spot_marker.setTitle(address);	//重新設定標記點的title
				} // end of if(status==google.maps.GeocoderStatus.OK) 
			 }// end of function
		 ); // end of  geocoder.geocode({'address':address},function (results,status) 
	  }	
	 
	// execute when DOM is ready
	jQuery(document).ready(function() {
		if (jQuery('[name="loginError"]').text() != "") {
			jQuery('#topmodals').modal('show');
		}
		if (jQuery('[name="spanForgotPsw"]').text() != "") {
			jQuery('#modalForgotPsw').modal('show');
		}
		if (jQuery('#resultForgotPsw').text() != "") {
			jQuery("#modalForgotPsw").modal('show');
			removeSendMailMsgForgotPswAttr();
			console.log('ResultForgotPsw= '
					+ jQuery('#resultForgotPsw').text());
		}
		if (jQuery('#resultSignup').text() == 'true') {
			jQuery("#signupOK").modal('show');
			removeSignupOKAttr();
		} else if (jQuery('#resultSignup').text() == 'false') {
			jQuery("#signupError").modal('show');
			removeSignupOKAttr();
		}
		if (jQuery('#activated').text() == 'false') {
			jQuery("#unactivated").modal('show');
			removeActivatedAttr();
		}
		if (jQuery('#resultBlacklistLogin').text() != "") {
			jQuery("#atBlackListAnnouncement").modal('show');
			removeAccountLockedAttr();
		}
		if (jQuery('#checkImageMember').text() != "") {
			jQuery("#signupmodalsMember").modal('show');
		}
		if (jQuery('#checkImageOwner').text() != "") {
			jQuery("#signupmodalsOwner").modal('show');
		}
	
		// modal for trip
		jQuery('.modal').on('hidden.bs.modal', function() {
			jQuery('[name="spanCheck"]').each(function() {
				jQuery(this).text("");
			});
			jQuery('[name="spanCheckO"]').each(function() {
				jQuery(this).text("");
			});
			jQuery('[name="spanForgotPsw"]').each(function() {
				jQuery(this).text("");
			});
			jQuery('.modal .needClaer').each(function() {
				jQuery(this).val("");
			});
	
		});
	
		jQuery('#modalForgotPsw').on('hidden.bs.modal', function() {
			jQuery('.modal .needClaer').each(function() {
				jQuery(this).val("");
			});
		});
	
		jQuery('#addTripModal').on('hidden.bs.modal', function() {
			jQuery("form .top-form-control").val("");
		});
		
		// spot related
		initDropzone();
		initElements();
		google.maps.event.addDomListener(window, 'load', map_init);
		
		
		// modal google map
		$('#addSpotModal').on('shown.bs.modal', function() {
			google.maps.event.trigger(spot_map, "resize");
			spot_map.setCenter(spot_location);
		});
		
		// config drop zone
		myDropzone.on("addedfile", function(file) {
			  
			  $("#fileinputBtn").hide();
			  //console.log("addedfile...");
			  //console.log(file);
			  
			});

		myDropzone.on("thumbnail", function(file, dataUrl){
			//console.log("thumbnail...");
			var height, width, className;
			
			if(zone_index != 1) {
				//height = '95px';
				//width = '150px';
				className = 'itravel-block-1-thumbnail-content';
			} else {
				//height = '190px';
				//width = '300px';
				className = 'itravel-block-1-pic-content';
				
				$("#itravel-block-thumbnails").show();
			}
			
			var oImg=document.createElement("img");
		  	oImg.setAttribute('src', dataUrl);
		  	oImg.setAttribute('alt', file.name);
		  	//oImg.setAttribute('height', height);
		  	//oImg.setAttribute('width', width);
		  	oImg.setAttribute("class", className);
		  	oImg.setAttribute("style", "max-width:100%; max-height:95%;margin:auto;display:block;");
		  	
		  	document.getElementById("imagePreview_zone_" + zone_index).appendChild(oImg);
		  	var imgPZ = "#imagePreview_zone_" + zone_index;
		  	$(imgPZ).append("<span class='glyphicon glyphicon-trash deleteImg '</span>");
		  	
		  	// move and then show
		  	zone_index++; //console.log("zone index : " + zone_index);
		  	$("#fileinputBtn").show().detach().appendTo("#imagePreview_zone_" + zone_index);
		  
		});

		myDropzone.on("queuecomplete", function(progress) {
			  console.log("finished uploading");
		});
		
		/*
		myDropzone.on("done", function(file){
			console.log("donw.....");
		});
		
		myDropzone.on("maxFilesize", function(file){
			console.log("maxFilesize.....");
		});
		
		myDropzone.on("maxfilesexceeded", function(file){
			console.log("maxfilesexceeded.....");
		});
		*/
			
		// config category
		$('#cityIdMenu').on('show.bs.dropdown', function () {
			$("#cityIdMenu .dropdown-menu").show();
		}).on("hide.bs.dropdown", function(){
			$("#cityIdMenu .dropdown-menu").hide();
		});
		
		$("#cityIdMenu .dropdown-menu li").click(function(){
			//console.log($(this).text());
			$("#city").val($(this).text());
			$("#cityIdMenu .dropdown-menu").hide();
		}) 
		
		$('#categoryIdMenu').on('show.bs.dropdown', function () {
			$("#categoryIdMenu .dropdown-menu").show();
		}).on("hide.bs.dropdown", function(){
			$("#categoryIdMenu .dropdown-menu").hide();
		});
		
		$("#categoryIdMenu .dropdown-menu li").click(function(){
			//console.log($(this).index());
			$("#category").val($(this).text());
			$("#categoryIdMenu .dropdown-menu").hide();
			
			// populate subcategory
			var subcategories = categories[$(this).index()].subtype;
			//console.log(subcategories);
			$("#subcategory").attr("placeholder", "子分類");
			$("#subcategory").val("");
			$("#subcategoryIdMenu ul:first").empty();
			$.each(subcategories, function(index, value){
				$("#subcategoryIdMenu ul:first").append("<li><a href='#'>"+value+"</a></li>");
			});
			
			if (!$('#subcategoryGroup').is(':visible'))
				$("#subcategoryGroup").show();
		})
		
		// config subcategory
		$("#subcategoryGroup").hide();
		$('#subcategoryIdMenu').on('show.bs.dropdown', function () {
			$("#subcategoryIdMenu .dropdown-menu").show();
		}).on("hide.bs.dropdown", function(){
			$("#subcategoryIdMenu .dropdown-menu").hide();
		});
		
		$("#subcategoryIdMenu .dropdown-menu").on("click", "li",function(){
			//console.log($(this).text());
			$("#subcategory").val($(this).text());
			$("#subcategoryIdMenu .spot-scrollable").hide();
		})
		
		// config image deletion
		$('.imagePreview_zone').on('click', '.deleteImg', function(){
			//console.log('deleting image.....' + $(this));
			var zone = $(this).closest('.imagePreview_zone');
			zone.find('img:first').remove();
			
			// reset icons and the zone_index
			$(this).remove();
			var curIndex = zone.attr('id').substr(zone.attr('id').lastIndexOf('_')+1);
			
			// create all the ids to be processed
			var zoneIds = [];
			for(var i = curIndex; i <= 6; i++)
				zoneIds.push("#imagePreview_zone_" + i);
		
			var reachEmptyZone = false;
				
			$(zoneIds).each(function(index){
				if((index != 0) && !reachEmptyZone) {
					var curZoneId = zoneIds[index];
					var prevZoneId = zoneIds[index-1]; 
					
					var curZoneIndex = curZoneId.substr(curZoneId.lastIndexOf('_')+1);
					console.log("curZoneIndex : " + curZoneIndex);
					if(curZoneIndex == 6) {
						$("#fileinputBtn").show();
						zone_index = 5;
					}
					
					//if(!$(curZoneId).is(':empty')) {
					if($(curZoneId).html().trim().length > 0) {
						
						//console.log("children : " + $(curZoneId).html());
						//console.log("children with length : " + $(curZoneId).html().length);
						$(curZoneId).children().detach().appendTo($(prevZoneId));
						
						
					}
					else {
							//console.log("index : " + index);
							//console.log("current zone : " + zoneIds[index]);	
							var emptyZoneId = zoneIds[index].substr(zoneIds[index].lastIndexOf('_')+1);
							
							zone_index = emptyZoneId - 2; // 1 for the original next preview zone; 1 for the deletion
							reachEmptyZone = true;
					}	
				} 
			});

		});
		
		$("#saveBtn").click(function(){
			//console.log("saveBtn pressed.....");
			
			// check the fields
			if($("#spotName").val().length == 0)
				popoverHandler("#spotName", "#spotName");
			else if($("#city").val().length == 0)
				popoverHandler("#cityGroup");
			else if($("#category").val().length == 0)
				popoverHandler("#categoryGroup");
			else if($("#subcategory").val().length == 0)
				popoverHandler("#subcategoryGroup");
			else { 
				// add hidden fields for images into form
				var name;
				var value;
				var content;
				$(".imagePreview_zone").each(function(index){
					
					name = $(this).attr('id');
					value = $(this).find('img:first').attr('alt'); //console.log("value : " + value);
					
					content = "<input type='hidden' name='"+name+"' value=' "+value+"'>";
					//console.log("content : "+content);
					$("#hiddens").append(content);
				});
				
				
				// add hidden fields for input field filled by drop down menu
				content = "<input type='hidden' name='dupCity' value=' "+$("#city").val()+"'>";
				$("#hiddens").append(content);
				
				content = "<input type='hidden' name='dupCategory' value=' "+$("#category").val()+"'>";
				$("#hiddens").append(content);
				
				content = "<input type='hidden' name='dupSubcategory' value=' "+$("#subcategory").val()+"'>";
				$("#hiddens").append(content);
				
				// add hidden fields for longitude and latitude
				var lng = spot_location.lng();
				var lat = spot_location.lat();
				
				//console.log("lng : " + lng);
				//console.log("lat : " + lat);
				
				content = "<input type='hidden' name='lng' value=' "+lng+"'>";
				$("#hiddens").append(content);
				content = "<input type='hidden' name='lat' value=' "+lat+"'>";
				$("#hiddens").append(content);
				
				// ready to submit
				$("#spotInfoForm").submit();
				resetPage();
			}
		});
		
		$("#resetBtn").click(function(){
			//console.log("reset......");
			resetPage();
		});
		
		
		$("#spotName").change(function(){
			//console.log("spot name : changing....");
			
			if(!$("#itravel-block-map").is(':visible')) {
				$("#itravel-block-map").show();
			}
			
			google.maps.event.trigger(spot_map, "resize");
			spot_map.setCenter(spot_location);
			
			var addr = "台灣";
			var city = $("#city").val();
			if(city.length > 0)
				addr = addr + city + $(this).val();
			else 
				addr = addr + $(this).val();
			
			spotGetAddressMarkerByName(addr);
		});
		
		$("#spotAddress").change(function(){
			console.log("spot address : changing....");
			spotGetAddressMarkerByAddr($(this).val());
		});
		
	}); // end of jQuery(document).ready(function(){	
</script>
</body>
</html>