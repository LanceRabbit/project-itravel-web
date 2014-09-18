<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>

<style type="text/css">
body {
	padding: 20px;
}

#myCarousel .carousel-caption {
	left: 0;
	right: 0;
	bottom: 0;
	text-align: left;
	padding: 10px;
	background: rgba(0, 0, 0, 0.6);
	text-shadow: none;
}

#myCarousel .list-group {
	position: absolute;
	top: 0;
	right: 0;
}

#myCarousel .list-group-item {
	border-radius: 0px;
	cursor: pointer;
}

#myCarousel .list-group .active {
	background-color: #eee;
}

@media ( min-width : 992px) {
	#myCarousel {
		padding-right: 33.3333%;
	}
	#myCarousel .carousel-controls {
		display: none;
	}
}

@media ( max-width : 991px) {
	.carousel-caption p,#myCarousel .list-group {
		display: none;
	}
}
</style>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp" />
	<!-- Page Content -->

	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" id="itemtag">

			</div>
			<!-- End Carousel Inner -->
			<ul class="list-group col-sm-4" id="list">
				
			</ul>
			

		<h4>最受歡迎景點</h4>

		<div class="row">

			<div class="col-xs-3">
				<div class="thumbnail">
					<img src="http://placehold.it/300x300" alt="">
					<div class="caption">
						<h4>
							<a href="#">資策會203教室</a>
						</h4>
						地址: 台北市大安區大安站斜對面
					</div>
					<div class="ratings">
						<p class="pull-right">15 reviews</p>
						<span class="glyphicon glyphicon-heart"></span> <span
							class="glyphicon glyphicon-thumbs-up"></span> <span
							class="glyphicon glyphicon-plus"></span>


					</div>
				</div>
			</div>

			<div class="col-xs-3">
				<div class="thumbnail">
					<img src="http://placehold.it/300x300" alt="">
					<div class="caption">
						<h4>
							<a href="#">資策會203教室</a>
						</h4>
						地址: 台北市大安區大安站斜對面
					</div>
					<div class="ratings">
						<p class="pull-right">12 reviews</p>
						<span class="glyphicon glyphicon-heart"></span> <span
							class="glyphicon glyphicon-thumbs-up"></span> <span
							class="glyphicon glyphicon-plus"></span>
					</div>
				</div>
			</div>

			<div class="col-xs-3">
				<div class="thumbnail">
					<img src="http://placehold.it/300x300" alt="">
					<div class="caption">
						<h4>
							<a href="#">資策會203教室</a>
						</h4>
						地址: 台北市大安區大安站斜對面
					</div>
					<div class="ratings">
						<p class="pull-right">31 reviews</p>
						<span class="glyphicon glyphicon-heart"></span> <span
							class="glyphicon glyphicon-thumbs-up"></span> <span
							class="glyphicon glyphicon-plus"></span>
					</div>
				</div>
			</div>

			<div class="col-xs-3">
				<div class="thumbnail">
					<img src="http://placehold.it/300x300" alt="">
					<div class="caption">
						<h4>
							<a href="#">資策會203教室</a>
						</h4>
						地址: 台北市大安區大安站斜對面
					</div>
					<div class="ratings">
						<p class="pull-right">6 reviews</p>
						<span class="glyphicon glyphicon-heart"></span> <span
							class="glyphicon glyphicon-thumbs-up"></span> <span
							class="glyphicon glyphicon-plus"></span>
					</div>
				</div>
			</div>

			<div class="col-xs-3">
				<div class="thumbnail">
					<img src="http://placehold.it/300x300" alt="">
					<div class="caption">
						<h4>
							<a href="#">資策會203教室</a>
						</h4>
						地址: 台北市大安區大安站斜對面
					</div>
					<div class="ratings">
						<p class="pull-right">18 reviews</p>
						<span class="glyphicon glyphicon-heart "></span> <span
							class="glyphicon glyphicon-thumbs-up"></span> <span
							class="glyphicon glyphicon-plus"></span>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {

			var picactive=true; 
			$.ajax({
				 url:"FirstpageServlet",
				 type:"post",
				 contentType: "application/json; charset=utf-8",
				 dataType:"json", //xml,text
				 success:function(data){
					 console.log("get data from server....");
					 //console.log(String(data));
					 $.each(data,function(index,value){						
						 if(value.spotThumbnailURL) {
							 console.log(value.spotThumbnailURL);
							if(picactive){
							 $('#itemtag').append("<div class='item active' ><img src='" + value.spotThumbnailURL+"'/><div class='carousel-caption'><h4><a href='#'>"+value.spotName+"</a></h4><p>"+value.spotIntro+"<br><br><a class='label label-primary' href='#' target='_blank'>"+value.spotName+"</a></p></div></div>");
							}else{
								$('#itemtag').append("<div class='item ' ><img src='" + value.spotThumbnailURL+"'/><div class='carousel-caption'><h4><a href='#'>"+value.spotName+"</a></h4><p>"+value.spotIntro+"<br><br><a class='label label-primary' href='#' target='_blank'>"+value.spotName+"</a></p></div></div>");	
							}
							picactive=false;
						}
						 else 
							 $('#itemtag').append("<div class='content_box'><h2>"+value.spotName+"</h2></div>");
					 });				 
					
				 }
			 });
			var listactive=true; 
			var i = 0; //滑動到第幾個數
			$.ajax({
				 url:"FirstpageServlet",
				 type:"post",
				 contentType: "application/json; charset=utf-8",
				 dataType:"json", //xml,text
				 success:function(data){					
					 $.each(data,function(index,value){						
						 if(listactive){
						 $('#list').append("<li data-target='#myCarousel' data-slide-to='"+i+"'class='list-group-item active'><h4>"+value.spotName+"</h4></li>");
						 }else{
							 $('#list').append("<li data-target='#myCarousel' data-slide-to='"+i+"'class='list-group-item '><h4>"+value.spotName+"</h4></li>");
						 }
						 listactive=false;
						 i++;
					 });				 
					
				 }
			 });
			
			var clickEvent = false;
			$('#myCarousel').carousel({
				interval : 4000
			}).on('click', '.list-group li', function() {
				clickEvent = true;
				$('.list-group li').removeClass('active');
				$(this).addClass('active');
			}).on('slid.bs.carousel', function(e) {
				if (!clickEvent) {
					var count = $('.list-group').children().length - 1;
					var current = $('.list-group li.active');
					current.removeClass('active').next().addClass('active');
					var id = parseInt(current.data('slide-to'));
					if (count == id) {
						$('.list-group li').first().addClass('active');
					}
				}
				clickEvent = false;
			});
		})

		$(window).load(function() {
			var boxheight = $('#myCarousel .carousel-inner').innerHeight();
			var itemlength = $('#myCarousel .item').length;
			var triggerheight = Math.round(boxheight / itemlength + 1);
			$('#myCarousel .list-group-item').outerHeight(triggerheight);
		});
	</script>


</body>
</html>