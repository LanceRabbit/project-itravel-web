<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>修改帳號資訊</title>
<style type="text/css">
body{
	padding:20px;
	
}
.spanPositionCA{
	font-family:Microsoft JhengHei;
	font-weight: bold;
	position:absolute;
	margin-top:8px;
	margin-left:10px;
	width:150px;
	color:red;	
	
}
.panel-title,.form-group,.modal-body,.btn-primary,.btn-info,.modal-footer{
	font-family:Microsoft JhengHei;
	font-weight: bold;
}
.modal-title{
	font-family:Microsoft JhengHei;
	font-size:15px
}
#resultModalError,#resultModalOK{
	margin-top:100px;
	font-size:16px
}
#idImgLimitation,#btOK2,#btOK1{
	font-family:Microsoft JhengHei;
	font-size:14px
}


</style>
</head>
<body>
<jsp:include page="/fragment/Top.jsp"/>
<div class="container">
<div class="col-md-6 col-md-offset-3">
<div class="panel-group" id="accordion">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" >
          	修改密碼
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse">
      <div class="panel-body">
      	 <div class="row">
        <form enctype="multipart/form-data" role="form" action="<c:url value="/controller/ChangeAccountServlet"/>" method="post">
            <div class="col-md-12">
                <div class="form-group">
                    <label>目前的密碼</label>
                    <div class="input-group" >
                        <input type="password" class="form-control" name="oldPassword" id="idPswCA"  required>
                       	<span id="checkPswCA" class="spanPositionCA" name="pswErrorCA">${errorOldPsw}</span>
                    </div>
                     
                </div>
                <div class="form-group">
                    <label>新密碼</label>
                    <div class="input-group">
                        <input type="password" class="form-control" name="newPassword1" id="idPswCA1" required>
                    	<span id="checkPswCA1" class="spanPositionCA" name="pswErrorCA">${errorNewPsw}</span>
                    </div>
                </div>
                <div class="form-group">
                    <label>重新輸入新密碼</label>
                    <div class="input-group">
                        <input type="password" class="form-control" name="newPassword2" id="idPswCA2" required>
                    	<span id="checkPswCA2" class="spanPositionCA" name="pswErrorCA"></span>
                    </div>
                </div>
                <div hidden>
                <input type="file" name="image"/></div>
                <input type="submit" name="submit" id="idSubmitCA" value="Submit" class="btn btn-info pull-right" disabled="disabled"><br/><br/>
            </div>
        </form>
    </div>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
          	修改用戶名
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse">
      <div class="panel-body">
      	<div class="row">
        <form enctype="multipart/form-data" role="form" action="<c:url value="/controller/ChangeAccountServlet"/>" method="post">
            <div class="col-md-12">
                <div class="form-group">
                    <label>輸入用戶名</label>
                    <div class="input-group" >
                        <input type="text" class="form-control" name="nickname" id="idNicknameCA"  required>
                    </div>
                     
                </div>
                <div hidden>
                <input type="file" name="image"/></div>
                <input type="submit" name="submit" id="idSubmit" value="Submit" class="btn btn-info pull-right"><br/><br/>
            </div>
        </form>
    </div>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
          	修改顯示圖片
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse">
      <div class="panel-body">
      	<div class="row">
        <form enctype="multipart/form-data" action="<c:url value="/controller/ChangeAccountServlet"/>" method="post">
            <div class="col-md-12">
                <div class="form-group">
                    <label id="idImgLimitation">檔案大小限制 8MB</label><br/>
                    <div class="input-group" >
                        <input type="file"  name="image" id="idImageCA"  required />
                       	<span id="checkImageCA" class="spanPositionCA" name="imageErrorCA" style="color:red">${errorChangeImageCA}</span>
                    </div>
                     
                </div>
                <input type="submit" name="submit" id="idSubmitCAImg" value="Submit" class="btn btn-info pull-right"><br/><br/>
            </div>
        </form>
    </div>
      </div>
    </div>
  </div>
</div>
</div>
</div>
<label id="result" hidden>${result}</label>
<div id="resultModalOK" class="modal fade">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">修改結果</h4>
      </div>
      <!-- dialog body -->
      <div class="modal-body" style="color:green"><i class="glyphicon glyphicon-ok" ></i>
        	修改成功!
      </div>
      <!-- dialog buttons -->
      <div class="modal-footer"><button type="button" class="btn btn-primary" id="btUpdateOK1">確定</button></div>
    </div>
  </div>
</div>
<div id="resultModalError" class="modal fade">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel"><i class="fa "></i>修改結果</h4>
      </div>
      <!-- dialog body -->
      <div class="modal-body" style="color:red"><i class="fa fa-exclamation-circle fa-lg"></i>
        	發生錯誤，請重新操作。
      </div>
      <!-- dialog buttons -->
      <div class="modal-footer"><button type="button" class="btn btn-primary" id="btUpdateOK2">確定</button></div>
    </div>
  </div>
</div>


<jsp:include page="/fragment/bottom.jsp"/>
<script>
	$(document).ready(function(){
		if($('[name="pswErrorCA"]').text()!=""){
			if(!$('#collapseOne').hasClass('in')){
				$('#collapseOne').addClass('in');
			}
		}else if($('[name="pswErrorCA"]').text()==""){
			if($('#collapseOne').hasClass('in')){
				$('#collapseOne').removeClass('in');
			}
		}
		if($('#checkImageCA').text()!=""){
			if(!$('#collapseThree').hasClass('in')){
				$('#collapseThree').addClass('in');
			}
		}else if($('#checkImageCA').text()==""){
			if($('#collapseThree').hasClass('in')){
				$('#collapseThree').removeClass('in');
			}
		}
		
		if($('#result').text()=='true'){
			$("#resultModalOK").modal('show');
		}else if($('#result').text()=='false'){
			$("#resultModalError").modal('show');
		}
	});
	$("#btUpdateOK1").click(function(){
		$("#resultModalOK").modal('hide');
	});
	$("#btUpdateOK2").click(function(){
		$("#resultModalError").modal('hide');
	});
	/* $("#resultModal").on("show", function() {    // wire up the OK button to dismiss the modal when shown
        $("#myModal a.btn").on("click", function(e) {
            $("#myModal").modal('hide');     // dismiss the dialog
        });
    }); */
	$("#idPswCA").focus(function() {
		$("#checkPswCA").html("");
		isCompletedCA();
	});
	$("#idPswCA1").focus(function() {
		$("#checkPswCA1").html("");
		/* $('[name="resultOK"]').hide();
		$('[name="resultError"]').hide(); */
	}).keyup(function() {
		var password1 = $("#idPswCA1").val();
		if(password1!=""){
			if(chkPsw(password1)){
				$("#checkPswCA1").html("");
				var password2 = $("#idPsw2").val();
				if(password2!=""){
					if(password1==password2){
						$("#checkPswCA2").html("");
					}else{
						$("#checkPswCA2").html("請輸入相同密碼");
					}
				}
			}else{
				$("#checkPswCA1").html("格式錯誤");
			}
		}
		
		isCompletedCA();
	});
	$("#idPswCA2").focus(function() {
		$("#checkPswCA2").html("");
		/* $('[name="resultOK"]').hide();
		$('[name="resultError"]').hide(); */
	}).keyup(function() {
		var password1 = $("#idPswCA1").val();
		var password2 = $("#idPswCA2").val();
		if(password1==password2){
			$("#checkPswCA2").html("");
		}else{
			$("#checkPswCA2").html("請輸入相同密碼");
		}
		isCompletedCA();
	});
	$('#idImageCA').bind('change', function() {
		 if(this.files[0].size>8388608){
			 $("#checkImageCA").html("檔案過大");
		 }else{
			 $("#checkImageCA").html("");
		 }
		isImageOKCA();
	});
	function isImageOKCA(){
		var imgSpan = document.getElementById("checkImageCA");
		if(imgSpan.innerHTML!=""){
			if(!document.getElementById("idSubmitCAImg").getAttribute("disabled")){
				document.getElementById("idSubmitCAImg").setAttribute("disabled", "disabled");}
			return;
		}
		document.getElementById("idSubmitCAImg").removeAttribute("disabled");
	}
	function isCompletedCA(){
		var sp = document.getElementsByName("pswErrorCA");
		for(var i =0;i<3;i++){
			console.log(sp[i]);
			if(sp[i].innerHTML!=""){
				console.log(sp[i].innerHTML);
				if(!document.getElementById("idSubmitCA").getAttribute("disabled")){
					document.getElementById("idSubmitCA").setAttribute("disabled", "disabled");}
				return;
			}
		}
		document.getElementById("idSubmitCA").removeAttribute("disabled");
	}
	
	function chkPsw(password) {
		    
		    var re = /^(?=.*[0-9])(?=.*[A-Za-z])\S{6,}$/;
			return re.test(password);
		   
	}
	

</script>



</body>
</html>