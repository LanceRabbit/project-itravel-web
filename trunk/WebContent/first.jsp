<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- 如果從Google下載失敗，我們就從自己的Server上下載jQuery.js檔 -->
<script>
	!window.jQuery
			&& document
					.write("<script src='js/jquery-1.11.1.min.js'><\/script>")
</script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
body {
	padding: 20px;
	background-color: #529abb;
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

</head>
<body>
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp" />
	<!-- Page Content -->

	<div class="container" style="background-color: #529abb">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" id="itemtag"></div>
			<!-- End Carousel Inner -->
			<ul class="list-group col-sm-4" id="list">

			</ul>
			<div class="carousel-controls">
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>

		</div>

		<!-- End Carousel -->

		<h4>最受歡迎景點</h4>

		<div class="row" id="rowSpot">

		</div>
	</div>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var picactive = true;
							$
									.ajax({
										url : "FindTopAdServlet",
										type : "post",
										contentType : "application/json; charset=utf-8",
										dataType : "json", //xml,text
										success : function(data) {
											console
													.log("get data from server....");
											//console.log(String(data));
											$
													.each(
															data,
															function(index,
																	value) {
																if (value.spotThumbnailURL) {
																	console
																			.log(value.spotThumbnailURL);
																	if (picactive) {
																		$(
																				'#itemtag')
																				.append(
																						"<div class='item active' ><img src='" + value.spotThumbnailURL+"'/><div class='carousel-caption'><h4><a href='#'>"
																								+ value.spotName
																								+ "</a></h4><p>"
																								+ value.spotIntro
																								+ "<br><br><a class='label label-primary' href='#' target='_blank'>"
																								+ value.spotName
																								+ "</a></p></div></div>");
																	} else {
																		$(
																				'#itemtag')
																				.append(
																						"<div class='item ' ><img src='" + value.spotThumbnailURL+"'/><div class='carousel-caption'><h4><a href='#'>"
																								+ value.spotName
																								+ "</a></h4><p>"
																								+ value.spotIntro
																								+ "<br><br><a class='label label-primary' href='#' target='_blank'>"
																								+ value.spotName
																								+ "</a></p></div></div>");
																	}
																	picactive = false;
																} else {
																	if (picactive) {
																		$(
																				'#itemtag')
																				.append(
																						"<div class='item active' ><img src='images/D1409001.jpg'/><div class='carousel-caption'><h4><a href='#'>"
																								+ value.spotName
																								+ "</a></h4><p>"
																								+ value.spotIntro
																								+ "<br><br><a class='label label-primary' href='#' target='_blank'>"
																								+ value.spotName
																								+ "</a></p></div></div>");
																	} else {
																		$(
																				'#itemtag')
																				.append(
																						"<div class='item ' ><img src='images/D1409001.jpg'/><div class='carousel-caption'><h4><a href='#'>"
																								+ value.spotName
																								+ "</a></h4><p>"
																								+ value.spotIntro
																								+ "<br><br><a class='label label-primary' href='#' target='_blank'>"
																								+ value.spotName
																								+ "</a></p></div></div>");
																	}
																}
															});

										}

									});

							var listactive = true;
							var i = 0; //滑動到第幾個數
							$
									.ajax({
										url : "FindTopAdServlet",
										type : "post",
										contentType : "application/json; charset=utf-8",
										dataType : "json", //xml,text
										success : function(data) {
											$
													.each(
															data,
															function(index,
																	value) {
																if (listactive) {
																	$('#list')
																			.append(
																					"<li data-target='#myCarousel' data-slide-to='"+i+"'class='list-group-item active'><h4>"
																							+ value.spotName
																							+ "</h4></li>");
																} else {
																	$('#list')
																			.append(
																					"<li data-target='#myCarousel' data-slide-to='"+i+"'class='list-group-item '><h4>"
																							+ value.spotName
																							+ "</h4></li>");
																}
																listactive = false;
																i++;
															});
										}
									});

							var clickEvent = false;

							$('#myCarousel')
									.carousel({
										interval : 4000
									})
									.on(
											'click',
											'.list-group li',
											function() {
												clickEvent = true;
												$('.list-group li')
														.removeClass('active');
												$(this).addClass('active');
											})
									.on(
											'slid.bs.carousel',
											function(e) {
												if (!clickEvent) {
													var count = $('.list-group')
															.children().length - 1;
													var current = $('.list-group li.active');
													current.removeClass(
															'active').next()
															.addClass('active');
													var id = parseInt(current
															.data('slide-to'));
													if (count == id) {
														$('.list-group li')
																.first()
																.addClass(
																		'active');
													}
												}
												clickEvent = false;
											});

							$.ajax({
								url : "FindTopSpotServlet",
								type : "post",
								contentType : "application/json; charset=utf-8",
								dataType : "json", //xml,text
								success : function(data) {			
											$.each(data,function(index,value){							
												$('#rowSpot').append("<div class='col-xs-3'><div class='thumbnail'><img src='images/D1409001.jpg' alt=''><h4><a href='#'>"+value.spotLikeName+"</a></h4>"+value.spotLikeIntro+"</div></div></div>");
											});
								}
									
							  });	
						
						});

		$(window).load(function() {
			var boxheight = $('#myCarousel .carousel-inner').innerHeight();
			var itemlength = $('#myCarousel .item').length;
			var triggerheight = Math.round(boxheight / itemlength + 1);
			$('#myCarousel .list-group-item').outerHeight(triggerheight);
		});
	</script>


</body>
</html>