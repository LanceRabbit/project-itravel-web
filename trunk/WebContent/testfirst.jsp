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
			<div class="carousel-inner" id="cardiv">
				<div class="item active">
					<img src="images/D1409005.jpg">
					<div class="carousel-caption">
						<h4>
							<a href="#"></a>
						</h4>
						<p>
							<a class="label label-primary" href="#" target="_blank"></a>
						</p>
					</div>
				</div>		
			</div>
			<!-- End Carousel Inner -->
			<ul class="list-group col-sm-4">
				<li data-target="#myCarousel" class="list-group-item active"><h4>南投日月潭游湖1日船票</h4></li>				
			</ul>

			<!-- Controls -->
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
	

	<div class="aaa"></div>
	<div class="aaa"></div>
	<div class="aaa"></div>



	<script type="text/javascript">
		$(document).ready(function() {
			
			
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