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
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/D1409005.jpg">
					<div class="carousel-caption">
						<h4>
							<a href="#">南投日月潭游湖1日船票</a>
						</h4>
						<p>
							日月潭位於南投縣魚池鄉水社村，是臺灣唯一的天然湖。
							由玉山和阿里山之間的斷裂盆地積水而成。湖面海拔760米，面積約9平方千米，平均水深30米，湖周長約35千米。日月潭四周群山環抱，重巒迭嶂，潭水碧波晶瑩，湖面遼闊，群峰倒映湖中，優美如畫。
							<a class="label label-primary" href="#" target="_blank">日月潭游湖之旅</a>
						</p>
					</div>
				</div>
				<!-- End Item -->

				<div class="item">
					<img src="images/D1409006.jpg">
					<div class="carousel-caption">
						<h4>
							<a href="#">阿里山小火車</a>
						</h4>
						<p>
							火車鳴笛聲響徹整片山谷，阿里山森林小火車，是全世界三大登山鐵路之一。在這裡，你可以飽登山鐵路、茂密森林、雲海的眼福，當置身這仙境之中，耳邊仿佛又響起鄧麗君的那首美妙的《阿里山的姑娘》<a
								class="label label-primary" href="#" target="_blank">阿里山小火車之旅</a>
						</p>
					</div>
				</div>
				<!-- End Item -->

				<div class="item">
					<img src="images/D1409010.jpg">
					<div class="carousel-caption">
						<h4>
							<a href="#">高雄愛河遊湖度假飯店</a>
						</h4>
						<p>
							愛河，古名打狗川、高雄川，是一條位在臺灣高雄市境內的小型河川，也是臺灣少數以“河”為名的河川，源於高雄市仁武區八卦寮，流經高雄市中心後於高雄港出海。
							<a class="label label-primary" href="#" target="_blank">高雄愛河遊湖渡假飯店</a>
						</p>
					</div>
				</div>
				<!-- End Item -->

				<div class="item">
					<img src="images/D1409011.jpg">
					<div class="carousel-caption">
						<h4>
							<a href="#">霧上桃源~南投清境農場</a>
						</h4>
						<p>
							坐落在半山腰，海拔1750米的清境農場空氣清新、林木蒼鬱、繁花遍野、具北歐風光，素有“霧上桃源”之稱，是劉墉老師筆下的世外桃源、也是臺灣導演魏德聖史詩巨作《賽德克巴萊》的取景地。
							<a class="label label-primary" href="#" target="_blank">
								霧上桃源~南投清境農場</a>
						</p>
					</div>
				</div>
				<!-- End Item -->

				<div class="item">
					<img src="images/D1409013.jpg">
					<div class="carousel-caption">
						<h4>
							<a href="#">三仙台-台灣最美海岸線</a>
						</h4>
						<p>
							東部海岸線是臺灣海濱風光最美的地方，經過東海和太平洋，一邊是一望無際湛藍湛藍的海水，一邊是險峻的海岸山脈，沿海公路蜿蜒崎嶇，有的沿海公路乾脆就懸空在海面上，讓人直冒冷汗。由於臺灣東面山多，很多海灘不好開發，所以自然的海濱帶風光更加引人入勝。
							太平洋近處海水呈湛藍色，遠處則為深藍，分界明顯，極目遠眺， 太平洋煙波浩淼，水天一色，偶有海輪從這裡穿過。 <a
								class="label label-primary" href="#" target="_blank">三仙台-台灣最美海岸線</a>
						</p>
					</div>
				</div>
				<!-- End Item -->

			</div>
			<!-- End Carousel Inner -->
			<ul class="list-group col-sm-4">
				<li data-target="#myCarousel" data-slide-to="0"
					class="list-group-item active"><h4>南投日月潭游湖1日船票</h4></li>
				<li data-target="#myCarousel" data-slide-to="1"
					class="list-group-item"><h4>阿里山小火車之旅</h4></li>
				<li data-target="#myCarousel" data-slide-to="2"
					class="list-group-item"><h4>高雄愛河遊湖渡假飯店</h4></li>
				<li data-target="#myCarousel" data-slide-to="3"
					class="list-group-item"><h4>霧上桃源~南投清境農場</h4></li>
				<li data-target="#myCarousel" data-slide-to="4"
					class="list-group-item"><h4>三仙台-台灣最美海岸線</h4></li>
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