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
</style>
<title>Coupon</title>
</head>
<body>
	<jsp:include page="/fragment/Top.jsp" />
	<div class="container">
		<div class="row">
			<div id="Adlist" class="col-md-12">
				<ul class="thumbnails" style="list-style: none;">
					<li class="col-sm-8 clearfix">
						<div class="thumbnail clearfix">
							<img src="<c:url value='/images/Taiwan_happy.png'/>"
								class="pull-left span2 clearfix" style='margin-right: 10px; width:320px ;height:200px;'>
							<div class="caption" class="pull-left" style="margin-top:20px">
								<h3>
									<p>AdName</p>
								</h3>
								<small><b class="text-danger">截止日期: </b>2014-10-15</small>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<label id="userForCouponsUse" hidden>${user}</label>
	<jsp:include page="/fragment/bottom.jsp" />
	<script type="text/javascript">
	jQuery(document).ready(function() {
		//進來直接抓所有Coupons
		jQuery.ajax({
			url : '<c:url value='/controller/GetCouponsServlet'/>',
			type : "GET",
			contentType : "application/json; charset=utf-8",
			async : false,
			dataType : "json",	
			success : function(data) {		
				 jQuery.each(data,function(index,value) {
					console.log(value.Description);
					if(data.length!=0){
						if($("#userForCouponsUse").text()!=""){
							
							jQuery("#Adlist").append("<ul id='AdUllist' class='thumbnails' style='list-style:none;'><li class='col-sm-8 clearfix'><div class='thumbnail clearfix'><img src='"+value.Image+"' style='width:320px; height:200px;margin-right:10px;' class='pull-left span2 clearfix'><div class='caption' class='pull-left'><h3><p>"+value.Description+"</p></h3><small><b class='text-danger'>截止日期: </b>"+value.ValidDate+"</small></div></div></li></ul>");
						}else{
							jQuery("#Adlist").append("<ul id='AdUllist' class='thumbnails' style='list-style:none;'><li class='col-sm-8 clearfix'><div class='thumbnail clearfix'><img src='<c:url value='/images/Coupons_Empty.jpg'/>' style='width:320px; height:200px;margin-right:10px;' class='pull-left span2 clearfix'><div class='caption' class='pull-left'><h3><p>"+value.Description+"</p></h3><small><b class='text-danger'>截止日期: </b>"+value.ValidDate+"</small></div></div></li></ul>");
						}
					}else{
						console.log("沒有Coupon唷!");
					}
					 
				});
			}
			
		});
	});
	</script>

</body>
</html>