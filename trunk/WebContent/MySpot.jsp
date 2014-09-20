<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<title>我的景點</title>
<style type="text/css">
#social:hover {
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-o-transform: scale(1.1);
}

#social {
	-webkit-transform: scale(0.8);
	/* Browser Variations: */
	-moz-transform: scale(0.8);
	-o-transform: scale(0.8);
	-webkit-transition-duration: 0.5s;
	-moz-transition-duration: 0.5s;
	-o-transition-duration: 0.5s;
}
/* 
    Only Needed in Multi-Coloured Variation 
                                               */
.social-fb:hover {
	color: #3B5998;
}

.social-tw:hover {
	color: #4099FF;
}

.social-gp:hover {
	color: #d34836;
}

.social-em:hover {
	color: #f39c12;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- 如果從Google下載失敗，我們就從自己的Server上下載jQuery.js檔 -->
<script>
	!window.jQuery
			&& document
					.write("<script src='js/jquery-1.11.1.min.js'><\/script>")
</script>

</head>

<body>
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp" />
	<!-- Page Content -->
	<h3>按鈕系列</h3>







	<div class="container">
		<h4>我的景點</h4>
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
						<a href=""><i id="social" class="fa fa-heart fa-3x"></i></a> <a
							href=""><i id="social" class="fa fa-thumbs-up fa-3x "></i></a> <a
							href=""><i id="social" class="fa fa-plus fa-3x"></i></a> 
					</div>
				</div>
			</div>


			<script src="js/bootstrap.min.js"></script>
		</div>
	</div>
	
	<script type="text/javascript">
	
	</script>
</body>
</html>