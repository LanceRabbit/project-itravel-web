<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--  
<link href="<c:url value="/css/kendo.common.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/css/kendo.default.min.css"/>"
	rel="stylesheet" />
<link href="<c:url value="/css/kendo.dataviz.min.css"/>"
	rel="stylesheet" />
<link href="<c:url value="/css/kendo.dataviz.default.min.css"/>"
	rel="stylesheet" />
-->
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
				<p>廣告</p>
				<div class="container">
					<div class="container">
						<button id="btnSpotAd" class="btn btn-primary btn-lg" data-toggle="modal"
							data-target="#ADModal">
							<span class="glyphicon glyphicon-plus"></span>
						</button>
					</div>


				</div>

			</div>
			<div class="tab-pane fade" id="Mycoupon">
				<p>coupon</p>
				<div class="container">
					<div class="container">
						<button class="btn btn-primary btn-lg" data-toggle="modal"
							data-target="#CouponModal">
							<span class="glyphicon glyphicon-plus"></span>
						</button>
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
							action="<c:url value="/controller/GetAdImgSevlet"/>;"
							method="POST" enctype="multipart/form-data" name="formAd">
							<div class="col-sm-8">
								<div class="form-group">
									<label for="ADname">顯示名稱 </label> 
									<input type="text" class="form-control" id="ADname" name="ADname"
										placeholder="輸入名稱">
								</div>
								<div class="form-group">
									<label for="ADdate">選擇宣傳的景點 </label> 
									<select id="spotIdList"class="form-control">
									
									</select>
								</div>
								<div class="form-group">
									<label for="ADdate">截止日期 </label> <input type="text"
										class="form-control" id="ADdate" name="ADdate" readonly>
								</div>
								<div class="form-group">
									<label for="ADtextarea">說明文字</label>
									<textarea id="ADtext" name="ADtext" class="form-control"
										rows="3"></textarea>
								</div>
								<div class="form-group">
									<label for="ADInputFile">上傳檔案</label> <input type="file"
										id="ADInputFile" name="image">
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
						<div class="col-sm-12">
							<div id="example">
								<div>
									<div class="demo-section k-header">
										<input name="files" id="files" type="file" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="modal-body"> -->

				<div class="modal-footer">
					<button id="resetADBtn" type="button" class="btn btn-default"
						data-dismiss="modal">放棄</button>
					<button id="save123ADBtn" type="submit" class="btn btn-primary">完成</button>
				</div>
			</div>
		</div>
	</div>




	<script>
		jQuery(document).ready(function() {
			/*
			jQuery("#files").kendoUpload({
				async : {
					saveUrl : "<c:url value='/controller/Fileuploader'/>",
					removeUrl : "remove",
					autoUpload : true
				}
			});
			*/
	
			jQuery("#saveADBtn").click(function() {
				$("#ADform").submit();

			});

			
			jQuery("#btnSpotAd").click(function(){
				//console.log("btnSpotAd");
				jQuery.ajax({
					url : '<c:url value='/controller/findAdspotServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",
					async : false,
					dataType : "json",	
					data : {AccountId : "${user.accountId}"	},								
					success : function(data) {
						jQuery.each(data,function(index,value) {
							jQuery("#spotIdList").empty();
							jQuery("#spotIdList").append("<option id="+value.spotId+">"+value.spotName+"</option>");
							jQuery("#ADdate").val(value.ValidDate);
						
						});
					}
					
				});
				
				
				
				
			});
			
			
			
			
			
		});
	</script>
	<jsp:include page="/fragment/bottom.jsp" />
<!--  
	<script src="../js/angular.min.js"></script>
	<script src="../js/kendo.all.min.js"></script>
-->

</body>
</html>