<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style type="text/css">
body {
	background-color: #529abb;
	
}

#topImg{
width:700px;
height:305px;
overflow:hidden;
}
#list{

height:80px;
}
/*用於內文   多行文字溢出用...取代
p { 
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 4;
	-webkit-box-orient: vertical;
	display: -webkit-box;
}*/

h4 { /*用於標題   單行文字溢出用...取代*/	
	white-space: nowrap;
	width: 100%; /* IE6 需要定义宽度 */
	overflow: hidden;
	-o-text-overflow: ellipsis; /* Opera */
	text-overflow: ellipsis; /* IE, Safari (WebKit) */
}

#FirstCarousel .carousel-caption {
	left: 0;
	right: 0;
	bottom: 0;
	text-align: left;
	padding: 10px;
	background: rgba(0, 0, 0, 0.6);
	text-shadow: none;
}

#FirstCarousel .list-group {
	position: absolute;
	top: 0;
	right: 0;
}

#FirstCarousel .list-group-item {
	border-radius: 0px;
	cursor: pointer;
}

#FirstCarousel .list-group .active {
	background-color: #FF6B0E;
}

@media ( min-width : 992px) {
	#FirstCarousel {
		padding-right: 33.3333%;
	}
	#FirstCarousel .carousel-controls {
		display: none;
	}
}

@media ( max-width : 991px) {
	.carousel-caption p,#FirstCarousel .list-group {
		display: none;
	}
}

/*basic*/
.jm-item {
	padding: 10px;
	display: inline-block;
	text-align: left;
}

.jm-item-wrapper {
	position: relative;
	padding: 7px;
	background: #e0e8b6;
}

.jm-item-image {
	position: relative;
	overflow: hidden;
}

.jm-item-image img {
	display: block;
}

.jm-item second{
width:320px;
height:200px;
}
.jm-item-title {
	position: absolute;
	left: -10px;
	bottom: 17px;
	background: #FF6B0E;
	line-height: 1.5em;
	font-weight: normal;
	padding: 7px 9px 6px;
	text-transform: uppercase;
	font-family:'Microsoft JhengHei',"微軟正黑體",sans-serif;
	color: #FFFFFF;
	font-size: 1.4em;
}

.jm-item-overlay {
	background: #000;
	opacity: 0;
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	-webkit-transition: opacity 0.5s ease-in 0s;
	-moz-transition: opacity 0.5s ease-in 0s;
	-o-transition: opacity 0.5s ease-in 0s;
	transition: opacity 0.5s ease-in 0s;
}

.jm-item-wrapper:hover .jm-item-overlay {
	opacity: 0.3;
}

.jm-item-button {
	
	height: 50px;
	width: 50px;
	text-align: center;
	position: absolute;
	left: 50%;
	margin-left: -25px;
}

.jm-item-button a {
	
	border-radius: 50%;
	-webkit-border-radius: 50%;
	background: #FF6B0E;
	text-transform: uppercase;
	font-family:'Microsoft JhengHei',"微軟正黑體",sans-serif;
	color: #FFFFFF;
	font-size: 1.2em;
	line-height: 50px;
	-webkit-transition: all 0.2s ease-in 0s;
	-moz-transition: all 0.2s ease-in 0s;
	-o-transition: all 0.2s ease-in 0s;
	transition: all 0.2s ease-in 0s;
	text-decoration: none !important;
	display: block;
}

.jm-item-button a:hover {
	background: #3b3b3b;
}
/**/
.second .jm-item-wrapper .jm-item-title {
	-webkit-transition: all 0.2s ease-in 0s;
	-moz-transition: all 0.2s ease-in 0s;
	-o-transition: all 0.2s ease-in 0s;
	transition: all 0.2s ease-in 0s;
}

.second .jm-item-wrapper:hover .jm-item-title {
	/*visibility:hidden;*/
	
	left: -10%;
}

.second .jm-item-description {
	font-family:'Microsoft JhengHei',"微軟正黑體",sans-serif;
	position: absolute;
	width: 100%;
	height: 100%;
	padding: 10px;
	font-size:20px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	background: rgba(0, 0, 0, 0.4);
	color: #fff;
	top: 100%;
	-webkit-transition: all 0.5s ease-in 0s;
	-moz-transition: all 0.5s ease-in 0s;
	-o-transition: all 0.5s ease-in 0s;
	transition: all 0.5s ease-in 0s;
}

.second .jm-item-wrapper:hover .jm-item-description {
	top: 0;
}



</style>

</head>
<body>
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp" /> 
	<!-- Page Content -->
	
   
	 <div class="container" >
		
				<div id="FirstCarousel" class="carousel slide" data-ride="carousel">
			
				
					<!-- Wrapper for slides -->
					<div class="carousel-inner" id="itemtag"></div>
					<!-- End Carousel Inner -->
					<ul class="list-group col-sm-4" id="list">
		
					</ul>
					<div class="carousel-controls">
						<a class="left carousel-control" href="#FirstCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span>
						</a> <a class="right carousel-control" href="#FirstCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
				
			
		</div>
   
		<!-- End Carousel -->

		

		<div class="row" id="rowSpot"></div>

	 </div>
	<jsp:include page="fragment/bottom.jsp"></jsp:include>
	<script type="text/javascript">
		jQuery(document).ready(
						function() {
							var picactive = true;

							jQuery.ajax({
										url : '<c:url value='/controller/FindTopAdServlet' />',
										type : "post",
										contentType : "application/json; charset=utf-8",
										dataType : "json", //xml,text
										success : function(data) {
											console.log("get data from server....");
											//console.log(String(data));
											jQuery.each(
															data,
															function(index,
																	value) {
																if (value.spotThumbnailURL) {
																	console
																			.log(value.spotThumbnailURL);
																	if (picactive) {
																		jQuery(
																				'#itemtag')
																				.append(			               																			
																						"<div class='item active' ><div id='topImg'><img src='" + value.spotThumbnailURL+" ' style='width:100%;height:100%'/><div class='carousel-caption'><h4><a href='#'>"
																								+ value.spotName
																								+ "</a></h4><p>"
																								+ value.spotIntro
																								+ "<br><br></p></div></div></div>");
																	} else {
																		jQuery(
																				'#itemtag')
																				.append(
																						"<div class='item ' ><div id='topImg'><img src='" + value.spotThumbnailURL+" ' style='width:100%;height:100%'/><div class='carousel-caption'><h4><a href='#'>"
																								+ value.spotName
																								+ "</a></h4><p>"
																								+ value.spotIntro
																								+ "<br><br></p></div></div></div>");
																		//buttom <a class='label label-primary' href='#' target='_blank'>"+ value.spotName+"</a>
																	}
																	picactive = false;
																}
															});

										}

									});

							var listactive = true;
							var i = 0; //滑動到第幾個數

							
							jQuery.ajax({
										url:'<c:url value='/controller/FindTopAdServlet' />',
										type : "post",
										contentType : "application/json; charset=utf-8",
										dataType : "json", //xml,text
										success : function(data) {
											jQuery
													.each(
															data,
															function(index,
																	value) {
																if (listactive) {
																	jQuery(
																			'#list')
																			.append(
																					"<li data-target='#FirstCarousel' data-slide-to='"+i+"'class='list-group-item active'><h4>"
																							+ value.spotName
																							+ "</h4></li>");
																} else {
																	jQuery(
																			'#list')
																			.append(
																					"<li data-target='#FirstCarousel' data-slide-to='"+i+"'class='list-group-item '><h4>"
																							+ value.spotName
																							+ "</h4></li>");
																}
																listactive = false;
																i++;
															});
										}
									});

							var clickEvent = false;

							jQuery('#FirstCarousel')
									.carousel({
										interval : 4000
									})
									.on(
											'click',
											'.list-group li',
											function() {
												clickEvent = true;
												jQuery('.list-group li')
														.removeClass('active');
												jQuery(this).addClass('active');
											})
									.on(
											'slid.bs.carousel',
											function(e) {
												if (!clickEvent) {
													var count = jQuery(
															'.list-group')
															.children().length - 1;
													var current = jQuery('.list-group li.active');
													current.removeClass(
															'active').next()
															.addClass('active');
													var id = parseInt(current
															.data('slide-to'));
													if (count == id) {
														jQuery('.list-group li')
																.first()
																.addClass(
																		'active');
													}
												}
												clickEvent = false;
											});

							
							jQuery.ajax({
										url:'<c:url value='/controller/FindTopSpotServlet' />',
										type : "post",
										contentType : "application/json; charset=utf-8",
										dataType : "json", //xml,text
										success : function(data) {
											jQuery
													.each(
															data,
															function(index,
																	value) {
																if (value.spotThumbnailURL) {
																	console
																			.log(value.spotLikeName
																					+ ":"
																					+ value.spotThumbnailURL);
																	jQuery(
																			'#rowSpot')
																			.append(
																					"<div class='col-xs-4'><div class='jm-item second'><div class='jm-item-wrapper'><div class='thumbnail' ><div class='jm-item-image'><img class='img-portfolio img-responsive' src='<c:url value='/"
																					+ value.spotThumbnailURL
																					+" '/>' style='width:330px; height:220px;' ><div class='jm-item-description'>"
																					+ value.spotLikeIntro
																					+ "</div></div>"
																					+ "<a href='#'><div class='jm-item-title' id='" + value.spotId + "'>"
																					+value.spotLikeName
																					+"</div></a></div></div></div>");
																}
															});
										}

									});

						});

		// spot info modal view 
		jQuery("#rowSpot").on("click", ".jm-item-title", function(){
		
			selectedSpotId = jQuery(this).attr("id");
			//console.log("spot id : " + selectedSpotId);
			jQuery.ajax({
				type : "POST",
				url : '<c:url value='/controller/GetSpot' />',
				data : {
					spotId : selectedSpotId
				},
				dataType : "json"
			}).done(function(data){
				displaySpotInfo(data);
			});
			//jQuery('#spotInfoModalLabel')
		});
		
		jQuery(window).load(
				function() {
					var boxheight = jQuery('#FirstCarousel .carousel-inner')
							.innerHeight();
					var itemlength = jQuery('#FirstCarousel .item').length;
					var triggerheight = Math.round(boxheight / itemlength + 1);
					jQuery('#FirstCarousel .list-group-item').outerHeight(
							triggerheight);
				});
	</script>


</body>
</html>