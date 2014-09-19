<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>

<body>
	<h3>註冊</h3>
	<form enctype="multipart/form-data" method="POST" action="<c:url value="/controller/SignupServlet" />" id="signUp.controller">
		<label class="title">Email:</label><input type="text" name="email" id="idEmail" required> 
		<span id="checkEmail"></span> <br> 
		<label class="title">密碼:</label><input type="text" name="password" id="idPsw1" required>
		<span id="checkPsw1"></span><br>
		<label>(不可空白，不包含中文，至少6個字且必須包含英文字母、數字)</label><br>
		<label class="title">密碼確認:</label><input type="text" name="passwordck" id="idPsw2" required>
		<span id="checkPsw2"></span><br>
		<label class="title">暱稱:</label><input type="text" name="nickname" id="idNick" required>
		<span id="checkNick"></span><br>
		<label class="title">照片:</label><input Type="file" class="fieldWidth" name="image"><br> 
		<input type="reset" name="cancel" id="cancel" value="重填" /><input type="submit" value="註冊" disabled="disabled" id="idSubmit">
		<br />
	</form>
<script>
	(function($){
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
				$("#checkNick").html("請輸入暱稱");
			}
			isCompleted();
		});
	})(jQuery);
	
	function isCompleted(){
		var tx = document.getElementsByTagName("input");
		var sp = document.getElementsByTagName("span");
		for(var i =0;i<4;i++){
			if(tx[i].value==""){
				console.log(tx[i].value);
				if(!document.getElementById("idSubmit").getAttribute("disabled")){
					document.getElementById("idSubmit").setAttribute("disabled","disabled");}
				return;
			}
		}
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