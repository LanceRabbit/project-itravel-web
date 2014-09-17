<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
padding: 20px;
}
</style>
</head>
<body>
    <!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp" />
	<!-- Page Content -->
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-xs-9">
				<div class="row carousel-holder">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img class="slide-image" src="images/slide1.jpg" alt="">
								<!-- 輪播圖片上方可顯示資訊 -->
								<div class="carousel-caption">
									<h4>First Thumbnail label</h4>
									<p>Cras justo odio, dapibus ac facilisis in, egestas eget
										quam. Donec id elit non mi porta gravida at eget metus. Nullam
										id dolor id nibh ultricies vehicula ut id elit.</p>
								</div>

								<!-- 輪播圖片上方可顯示資訊 -->
							</div>
							<div class="item">
								<img class="slide-image" src="images/slide2.jpg" alt="">
							</div>
							<div class="item">
								<img class="slide-image" src="images/slide3.jpg" alt="">
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
				</div>
			</div>
			<div class="col-xs-3">
				<table class="table table-hover table-bordered">
					<tr class="success">
						<td>花蓮吃吃喝喝一日遊</td>
					</tr>
					<tr class="error">
						<td>台東那努彎飯店</td>
					</tr>
					<tr class="warning">
						<td>碧砂漁港海鮮餐廳</td>
					</tr>
					<tr class="success">
						<td>日月潭下午茶</td>
					</tr>
					<tr class="error">
						<td>清境農場趕羚羊</td>
					</tr>
					<tr class="warning">
						<td>野柳女王頭海鮮餐廳</td>
					</tr>

				</table>
			</div>

		</div>

	</div>
	<!-- /.container -->
	<p>
	<h4>最受歡迎景點</h4>
	
	</p>

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

</body>
</html>