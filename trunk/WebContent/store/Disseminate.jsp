<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
.container {
	font-family: Microsoft JhengHei;
}

.nav-tabs {
	font-weight: bold;
}

.table-hover {
	
}

/*fileupload*/
</style>
<title>Store disseminate</title>
</head>
<body>
	<jsp:include page="/fragment/Top.jsp" />

	<div class="container">

		<ul class="nav nav-tabs">
			<li class="active"><a href="#Myadvert" data-toggle="tab">廣告</a></li>
			<li class=""><a href="#Mycoupon" data-toggle="tab">coupon</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade active in" id="Myadvert">
				<br>
				<div class="container">
					<div class="col-sm-4">
						<button id="btnSpotAd" class="btn btn-primary btn-lg"
							data-toggle="modal" data-target="#ADModal">
							<span class="glyphicon glyphicon-plus"></span>
						</button>
					</div>
					<div class="col-sm-8">
						<p>新增廣告</p>
					</div>
					<div class="col-sm-12">
						<hr>
					</div>
					<div class="row">
						<div id="Adlist" class="col-sm-12">
							<!--  
    					<ul class="thumbnails" style="list-style:none;">
					 		<li class="col-sm-8 clearfix">
                  			<div class="thumbnail clearfix">
                    			 <div id="divpic" style="width:320px; height:200px;">  
                    			<img src="http://placehold.it/320x200"  class="pull-left span2 clearfix" style='margin-right:10px'>
                    		</div>
                    			<button id="btnDetel" class="btn btn-danger icon  pull-right">刪除</button>
                    			<div class="caption" class="pull-left">                      				
                     			 	<h3>      
                      				<p>AdName</p>
                      				</h3>
                      			<small><b class="text-danger">截止日期: </b>2014-10-15</small>                      			
                    			</div>                    			
                  				</div>                  				
               				 </li>               				 
						</ul>
						-->

						</div>
					</div>


				</div>


			</div>
			<div class="tab-pane fade" id="Mycoupon">
				<br>
				<div class="container">
					<div class="col-sm-4">
						<button id="btnSpotC" class="btn btn-primary btn-lg"
							data-toggle="modal" data-target="#CouponModal">
							<span class="glyphicon glyphicon-plus"></span>
						</button>
					</div>

					<div class="col-sm-8">
						<p>新增coupon</p>
					</div>
					<div class="col-sm-12">
						<hr>
					</div>
				</div>
			</div>


		</div>




	</div>

	<!-- upload ADModal -->
	<div class="modal fade" id="ADModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myADModalLabel">上傳廣告</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<form id="ADform"
							action="<c:url value="/controller/AddAdSevlet"/>;" method="POST"
							enctype="multipart/form-data" name="formAd">
							<div class="col-sm-8">
								<div class="form-group">
									<label for="ADdate">選擇宣傳的景點 </label> <select id="spotIdList"
										name="spotIdList" class="form-control">
									</select>
								</div>
								<div class="form-group">
									<label for="ADdate">截止日期系統訂為七天後 </label> <input type="text"
										class="form-control" id="ADdate" name="ADdate" readonly>
								</div>
								<div class="form-group">
									<label for="ADInputFile">選擇檔案</label> <input type="file"
										id="ADInputFile" name="image">
									<lable id="Adfilenull"></lable>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- <div class="modal-body"> -->

				<div class="modal-footer">
					<button id="resetBtn" type="button" class="btn btn-default"
						data-dismiss="modal">放棄</button>
					<button id="saveADBtn" type="submit" class="btn btn-primary">完成</button>
				</div>
			</div>
		</div>
	</div>

	<!-- upload CouponModal -->
	<div class="modal fade" id="CouponModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myCouponModalLabel">上傳Coupon</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<form id="Cform"
							action="<c:url value="/controller/AddCouponServlet"/>;"
							method="POST" enctype="multipart/form-data" name="formC">
							<div class="col-sm-8">
								<div class="form-group">
									<label for="Cdate">選擇使用Coupon的景點 </label> <select
										id="CspotIdList" name="CspotIdList" class="form-control">

									</select>
								</div>
								<div class="form-group">
									<label for="Cdate">截止日期 </label> <input type="date"
										class="form-control" id="Cdate" name="Cdate">
										<lable id="Cdatenull"></lable>
								</div>
								<div class="form-group">
									<label for="Ctextarea">說明文字</label>
									<textarea id="Ctext" name="Ctext" class="form-control" rows="3"></textarea>
									<lable id="Ctextnull"></lable>
								</div>
								<div class="form-group">
									<label for="CInputFile">選擇檔案</label> <input type="file"
										id="CInputFile" name="Cimage">
										<lable id="Cfilenull"></lable>
								</div>
							</div>
						</form>




					</div>
				</div>
				<!-- <div class="modal-body"> -->

				<div class="modal-footer">
					<button id="resetCBtn" type="button" class="btn btn-default"
						data-dismiss="modal">放棄</button>
					<button id="saveCBtn" type="submit" class="btn btn-primary">完成</button>
				</div>
			</div>
		</div>
	</div>




	<script>
		jQuery(document).ready(function() {

			//頁面一進來就先找已有的AD
			
			jQuery.ajax({
					url : '<c:url value='/controller/FindAdspotServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",
					async : false,
					dataType : "json",	
					data : {AccountId : "${user.accountId}"	},								
					success : function(data) {						
						jQuery.each(data,function(index,value) {
							console.log(value.spotName);
							if(value.spotId!="false"){
								jQuery("#Adlist").append("<ul id='Adlist' class='thumbnails' style='list-style:none;'><li class='col-sm-8 clearfix'><div class='thumbnail clearfix'><img src='"+value.spotThumbnail+"' style='width:60%; height:60%;'class='pull-left span2 clearfix' style='margin-right:10px'><button id='AdbtnDetel' name='"+value.spotId+"'class='btn btn-danger icon  pull-right'>刪除</button><div class='caption' class='pull-left'><h3><p>"+value.spotName+"</p></h3><small><b class='text-danger'>截止日期: </b>"+value.ValidDate+"</small></div></div></li></ul>");
															
							}else{
								alert("沒東西");
							}
							
						});
					}
					
				});
			
			
			
	
			jQuery("#saveADBtn").click(function() {
				
							var AdfileInput =jQuery("#ADInputFile").val();								
							if(AdfileInput==""){
								jQuery("#Adfilenull").empty();
								jQuery("#Adfilenull").append("<div class='alert alert-danger' role='alert'>請選擇檔案!</div>");								
					        
							}else{
								$("#ADform").submit();
							}
					   
			});
			jQuery("#saveCBtn").click(function(){
				var CfileInput =jQuery("#CInputFile").val();	
				var Cdate =jQuery("#Cdate").val();				
				var Ctext =jQuery("#Ctext").val();
				
				if(CfileInput==""){//檔案為空
					jQuery("#Cfilenull").empty();
					jQuery("#Cfilenull").append("<div class='alert alert-danger' role='alert'>請選擇檔案!</div>");						
		        
				}else if(Cdate!="" && Ctext!="" && CfileInput!=""){
					$("#Cform").submit();
				}
				
				
				
				
			});
			/*
			jQuery("#CInputFile").focusout(function(){
				var CfileInput =jQuery("#CInputFile").val();	
				jQuery("#Cfilenull").empty();
				if(CfileInput==""){//檔案為空
					
					jQuery("#Cfilenull").append("<div class='alert alert-danger' role='alert'>請選擇檔案!</div>");						
		        
				}else{
					jQuery("#Cfilenull").empty();
				}
				
			});*/
			jQuery("#Cdate").focusout(function(){
				var Cdate =jQuery("#Cdate").val();				
				jQuery("#Cdatenull").empty();
				if(Cdate==""){ //日期錯誤 和 為空
					
					jQuery("#Cdatenull").append("<div class='alert alert-danger' role='alert'>請填入正確日期!</div>");	
				}else{
					jQuery("#Cdatenull").empty();
				}
				
			});
			jQuery("#Ctext").focusout(function(){
				var Ctext =jQuery("#Ctext").val();
				
				if(Ctext==""){ //說明為空
					
					jQuery("#Ctextnull").append("<div class='alert alert-danger' role='alert'>請輸入說明文字!</div>");	
				}else{
					jQuery("#Ctextnull").empty();
				}
			});
			
			jQuery("#btnSpotAd").click(function(){
				//console.log("btnSpotAd");
				jQuery.ajax({
					url : '<c:url value='/controller/FindAdspotServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",
					async : false,
					dataType : "json",	
					data : {AccountId : "${user.accountId}"	},								
					success : function(data) {
						jQuery("#spotIdList").empty();
						jQuery("#Adfilenull").empty();
						jQuery.each(data,function(index,value) {						
							if(value.spotId!="false"){								
								//jQuery("#spotIdList[name='spotIdList']").removeAttr("disabled");
								jQuery("#spotIdList").append("<option id='"+value.spotId+"'  value='"+value.spotId+"'>"+value.spotName+"</option>");
								jQuery("#ADdate").val(value.ValidDate);	
								//var AdfileInput = ADform["ADInputFile"].val();
								
							}else{
								jQuery("#spotIdList").empty();
								jQuery("#ADdate").val(value.ValidDate);								
								jQuery("#saveADBtn").hide();
							}
							
						});
					}
					
				});
				
			});
			
			jQuery("#btnSpotC").click(function(){
				//console.log("btnSpotAd");
				jQuery.ajax({
					url : '<c:url value='/controller/FindCouponServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",
					async : false,
					dataType : "json",	
					data : {AccountId : "${user.accountId}"	},								
					success : function(data) {
						jQuery("#Cfilenull").empty();
						jQuery("#CspotIdList").empty();
						jQuery.each(data,function(index,value) {							
							if(value.spotId!="false"){								
								//jQuery("#spotIdList[name='spotIdList']").removeAttr("disabled");
								jQuery("#CspotIdList").append("<option id='"+value.spotId+"'  value='"+value.spotId+"'>"+value.spotName+"</option>");
								jQuery("#Cdate").val(value.ValidDate);
							}else{
								jQuery("#CspotIdList").empty();
								jQuery("#Cdate").val(value.ValidDate);								
								jQuery("#saveCBtn").hide();
							}
							
						});
					}
					
				});
			
			
			});
			jQuery("#AdbtnDetel").click(function(){
				
				console.log($(this).id);
				
				
				
			});
			
			
			
			
			
			
		});
		
	</script>
	<jsp:include page="/fragment/bottom.jsp" />


</body>
</html>