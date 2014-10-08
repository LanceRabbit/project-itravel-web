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
	padding: 20px;
	background-color: #529abb;
}

p { /*用於內文   多行文字溢出用...取代*/
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 4;
	-webkit-box-orient: vertical;
	display: -webkit-box;
}

h4 { /*用於標題   單行文字溢出用...取代*/
	white-space: nowrap;
	width: 100%; /* IE6 需要定义宽度 */
	overflow: hidden;
	-o-text-overflow: ellipsis; /* Opera */
	text-overflow: ellipsis; /* IE, Safari (WebKit) */
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
<link rel="stylesheet" href="css/mosaic.css" type="text/css"
	media="screen" />

<style type="text/css">

/*Demo Styles*/
body {
	background: #e9e8e4 url('img/bg-grid.png');;
}

#content {
	width: 845px;
	margin: 20px auto;
	padding: 10px 30px;
}

.clearfix {
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
}

.details {
	margin: 15px 20px;
}
/*
h4 {
	font: 300 16px 'Helvetica Neue', Helvetica, Arial, sans-serif;
	line-height: 160%;
	letter-spacing: 0.15em;
	color: #fff;
	text-shadow: 1px 1px 0 rgb(0, 0, 0);
}

p {
	font: 300 12px 'Lucida Grande', Tahoma, Verdana, sans-serif;
	color: #aaa;
	text-shadow: 1px 1px 0 rgb(0, 0, 0);
}
*/
a {
	text-decoration: none;
}
</style>
</head>
<body>
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp" />
	<!-- Page Content -->




	<!-- End Carousel -->


	<div class="container">

		<div class="row" id="rowSpot">
			<h4>原本</h4>
			<div class='col-xs-3'>
				<div class='thumbnail'>
					<img src='images/team1.jpg' style="width:100%; height:100%;">
					<h4>
						<a href='#'>台北市立動物園</a>
					</h4>
					<p>台北市長的動物園</p>
				</div>
			</div>

			<h4>改</h4>

		</div>


	</div>
	<div id="content">

		<!--Circle-->
		<div class="mosaic-block circle">
			<a href="" class="mosaic-overlay">&nbsp;</a>
			<div class="mosaic-backdrop">
				<img src='images/team1.jpg'>
			</div>
		</div>

		<!--Fade-->
		<div class="mosaic-block fade">
			<a href="" target="_blank" class="mosaic-overlay">
				<div class="details">
					<h4>台北市立動物園</h4>
					<p>台北市立動物園是台灣台北市的一座公立動物園，隸屬於台北市政府教育局。1915年創立於圓山地區，故舊稱「圓山動物園」，與兒童樂園相鄰。1986年，因圓山原址無法擴建，而遷至文山區木柵地區。</p>
				</div>
			</a>
			<div class="mosaic-backdrop">
				<img src="images/team1.jpg" style="width:100%; height:100%;" />
			</div>
		</div>

		<!--Bar-->
		<div class="mosaic-block bar">
			<a href="" target="_blank" class="mosaic-overlay">
				<div class="details">
					<h4>台北市立動物園</h4>
					<p>台北市立動物園是台灣台北市的一座公立動物園，隸屬於台北市政府教育局。1915年創立於圓山地區，故舊稱「圓山動物園」，與兒童樂園相鄰。1986年，因圓山原址無法擴建，而遷至文山區木柵地區。</p>
				</div>
			</a>
			<div class="mosaic-backdrop">
				<img src="images/team1.jpg" />
			</div>
		</div>

		<!--Bar 2-->
		<div class="mosaic-block bar2">
			<a href="" target="_blank" class="mosaic-overlay">
				<div class="details">
					<h4>台北市立動物園</h4>
					<p>台北市立動物園是台灣台北市的一座公立動物園，隸屬於台北市政府教育局。1915年創立於圓山地區，故舊稱「圓山動物園」，與兒童樂園相鄰。1986年，因圓山原址無法擴建，而遷至文山區木柵地區。</p>
				</div>
			</a>
			<div class="mosaic-backdrop">
				<img src="images/team1.jpg" />
			</div>
		</div>

		<!--Bar 3-->
		<div class="mosaic-block bar3">
			<a href="http://www.desktopped.com/featured/2010/09/multi-display-setup-with-four-systems-and-a-whole-lot-of-screen-space/"
				target="_blank" class="mosaic-overlay">
				<div class="details">
					<h4>台北市立動物園</h4>
					<p>台北市立動物園是台灣台北市的一座公立動物園，隸屬於台北市政府教育局。1915年創立於圓山地區，故舊稱「圓山動物園」，與兒童樂園相鄰。1986年，因圓山原址無法擴建，而遷至文山區木柵地區。</p>
				</div>
			</a> <a
				href="http://www.nonsensesociety.com/2010/12/i-am-not-human-portraits/"
				target="_blank" class="mosaic-backdrop"><img src="images/team1.jpg" /></a>
		</div>



		<!--Cover 2-->
		<div class="mosaic-block cover2">
			<a href="" target="_blank"
				class="mosaic-overlay"><img src="images/team1.jpg" /></a>
			<a href="" target="_blank"
				class="mosaic-backdrop">
				<div class="details">
					<h4>台北市立動物園</h4>
					<p>台北市立動物園是台灣台北市的一座公立動物園，隸屬於台北市政府教育局。1915年創立於圓山地區，故舊稱「圓山動物園」，與兒童樂園相鄰。1986年，因圓山原址無法擴建，而遷至文山區木柵地區。</p>
				</div>
			</a>
		</div>



		<div class="clearfix"></div>
	</div>
	<jsp:include page="fragment/bottom.jsp"></jsp:include>

	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>
	<script type="text/javascript" src="js/mosaic.1.0.1.js"></script>
	<script type="text/javascript">
		jQuery(function($) {

			$('.circle').mosaic({
				opacity : 0.8
			//Opacity for overlay (0-1)
			});

			$('.fade').mosaic();

			$('.bar').mosaic({
				animation : 'slide' //fade or slide
			});

			$('.bar2').mosaic({
				animation : 'slide' //fade or slide
			});

			$('.bar3').mosaic({
				animation : 'slide', //fade or slide
				anchor_y : 'top' //Vertical anchor position
			});

			$('.cover2').mosaic({
				animation : 'slide', //fade or slide
				anchor_y : 'top', //Vertical anchor position
				hover_y : '80px' //Vertical position on hover
			});

		});
	</script>

</body>
</html>