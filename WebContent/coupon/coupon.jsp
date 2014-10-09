<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='http://fonts.googleapis.com/css?family=Ubuntu:300,400,700,400italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="../css/styleCouponHover.css" />
<style>
.container {
	font-family: Microsoft JhengHei;
}
.btPrintCoupon{
	font-family: Microsoft JhengHei;
	position:absolute;
	right:30px;
	bottom:30px;
}
.notPrintArea{
	display:none;
}
.expand:hover{
	text-decoration: none;
}
</style>
<title>Coupon</title>
</head>
<body>
	<jsp:include page="/fragment/Top.jsp" />
	<div id="main">
		<div id="effect-6" class="effects clearfix">
			<div class="img">
                <img src="<c:url value='/images/Taiwan_happy.png'/>" alt="">
                <div class="overlay">
                    <a href="#" class="expand">+</a>
                    <a class="close-overlay hidden">x</a>
                </div>
            </div>
		</div>
		</div>
		<div class="row" >
			<div id="CouponList" >
				<ul class="thumbnails" style="list-style: none;" >
					<li class="col-xs-4 clearfix" style="float:left; margin-left:-15px">
						<div class="thumbnail effects clearfix" id="effect-6">
							<div class="img" style='margin:0px; width:320px ;height:200px;'>
							<img src="<c:url value='/images/Taiwan_happy.png'/>" 
								class="pull-left span2 clearfix" style='margin-right: 10px; width:320px ;height:200px;'>
							<div class="overlay">
                    			<a href="#" class="expand">+</a>
               				</div>
               			</div>
							<!-- <div class="caption" class="pull-left" style="margin-top:20px">
								<h3>
									<p>AdName</p>
								</h3>
								<small><b class="text-danger">截止日期: </b>2014-10-15</small>
							</div> 
							<input type="button" class="pull-right btPrintCoupon" name="printCoupon" value="列印"/>-->
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div id="CouponModals">
		</div>
	<label id="userForCouponsUse" hidden>${user}</label>
	<jsp:include page="/fragment/bottom.jsp" />
	<script src="${pageContext.request.contextPath}/js/jquery.printElement.min.js"></script>
	<script src="../js/modernizr.js"></script>
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
							jQuery("#CouponModals").append("<div id='"+value.CouponId+"Modal' class='modal fade' style='margin-top:100px'><ul name='couponList' class='thumbnails' style='list-style:none;'><li class='col-sm-6 clearfix'  style='float:left; margin-left:-15px'><div class='thumbnail clearfix'><img src='"+value.Image+"' style='width:320px; height:200px;margin-right:10px;' class='pull-left span2 clearfix'><div class='caption' class='pull-left'><h3><p>"+value.Description+"</p></h3><small><b class='text-danger'>截止日期: </b>"+value.ValidDate+"</small></div><input type='button' class='pull-right btPrintCoupon' name='printCoupon' value='列印'/></div></li></ul></div>");
							jQuery("#CouponList").append("<ul name='couponList' class='thumbnails' style='list-style:none;'><li class='col-xs-4 clearfix '  style='float:left; margin-left:-15px'><div class='thumbnail effects clearfix' id='effect-6'><div class='img' style='margin:0px; width:320px ;height:200px;'><img src='"+value.Image+"' style='width:320px; height:200px;margin-right:10px;' class='pull-left span2 clearfix'><div class='overlay'><a href='#' class='expand hoverCouponImg' id='"+value.CouponId+"'>+</a></div></div></div></li></ul>");
						}else{
							
						}
					}else{
						console.log("沒有Coupon唷!");
					}
					 
				});
			}
			
		});
		
		jQuery('[name="printCoupon"]').on('click',function(){
			$(this).parents('ul').attr('id','printArea');
			$(this).attr('hidden','hidden');
			$('ul').toggleClass('notPrintArea');
			$("#printArea").toggleClass('notPrintArea');
			window.print();
			$("#printArea").toggleClass('notPrintArea');
			$("#printArea").removeAttr("id");
			$('ul').toggleClass('notPrintArea');
			$(this).removeAttr('hidden');
		});
		jQuery('.hoverCouponImg').on('click',function(){
			var cId = $(this).attr('id');
			$("#"+cId+"Modal").modal('show');
		});
		
	});
	jQuery(document).ready(function(){
        if (Modernizr.touch) {
            // show the close overlay button
            jQuery(".close-overlay").removeClass("hidden");
            // handle the adding of hover class when clicked
            jQuery(".img").click(function(e){
                if (!jQuery(this).hasClass("hover")) {
                	jQuery(this).addClass("hover");
                }
            });
            // handle the closing of the overlay
            jQuery(".close-overlay").click(function(e){
                e.preventDefault();
                e.stopPropagation();
                if (jQuery(this).closest(".img").hasClass("hover")) {
                	jQuery(this).closest(".img").removeClass("hover");
                }
            });
        } else {
            // handle the mouseenter functionality
            jQuery('.img').mouseenter(function(){
            	 console.log("mouseenter");
            	 jQuery(this).addClass("hover");
               
            })
            // handle the mouseleave functionality
            .mouseleave(function(){
            	jQuery(this).removeClass("hover");
            });
        }
    });

	</script>

</body>
</html>