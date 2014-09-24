<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reset Password</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<h3>請重新設定密碼</h3>
<form action="<c:url value="/controller/ChangeAccountServlet" />" method="post">  
   <span class="error" style="display: block">${errors.passwordError}</span>  
    <label class="title">Email:</label><input type="text" name="email" value="${email}" readonly="readonly"/><br/>  
    <label class="title">Password：</label><input type="text" name="newPassword1" id="idPsw1" required/><span id="checkPsw1"></span><br>  
    <label class="title">Password Check：</label><input type="text" name="newPassword2" id="idPsw2" required/><span id="checkPsw2"></span><br>
    <input type="submit" value="確認修改" disabled="disabled" id="idSubmit"/>  
</form>
<script>
	$("#idCheckCode").hide();
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
	function isCompleted(){
		var tx = document.getElementsByTagName("input");
		var sp = document.getElementsByTagName("span");
		for(var i =1;i<3;i++){
			if(tx[i].value==""){
				if(!document.getElementById("idSubmit").getAttribute("disabled")){
					document.getElementById("idSubmit").setAttribute("disabled","disabled");}
				return;
			}
		}
		for(var i =1;i<3;i++){
			if(sp[i].innerHTML!=""){
				if(!document.getElementById("idSubmit").getAttribute("disabled")){
					document.getElementById("idSubmit").setAttribute("disabled", "disabled");}
				return;
			}
		}
		document.getElementById("idSubmit").removeAttribute("disabled");
	}
	function chkPsw(password) {
	    
	    var re = /^(?=.*[0-9])(?=.*[A-Za-z])\S{6,}$/;
		return re.test(password);
	   
	}
</script>  
</body>
</html>