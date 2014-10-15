<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>itravel index</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- attach CSS styles -->
<style type="text/css">
#test{
font-family: 微軟正黑體;
font-weight: bold;
}

</style>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" />
</head>
<body>
	<!--  BODY PAGE CONTENT -->
	
	<!-- first section - Home -->
	<div id="home" class="home">
		<div class="text-vcenter">
			<h1>i ♥ Travel</h1>
			<h3>Planning & Sharing Your Trip</h3>
			<a href="first.jsp" class="btn btn-default btn-lg">Let's go!</a>
		</div>
	</div>
	<!-- /first section -->

	<!-- second section - About -->
	<div id="about" class="pad-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<img src="images/Taiwan_happy.png" alt="" />
				</div>
				<div class="col-sm-6 text-center">
					<h2>旅行是忙碌生活中的小小幸福</h2>
					<br>
					<p class="lead"> 忙碌的生活中，最期待假期的到來，騎著腳踏車在鄉間小路上漫遊，在清境的午後欣賞沿途優美的景致，讓微風輕輕吹過髮梢，忘掉一切煩惱，恣意的享受著大自然的懷抱。
					<br>					             
					<br>    提起行李循著旅程中沿路的幸福足跡，發現旅行是簡單又容易的小確幸，一起分享你我的足跡。  
                                    
				</div>
			</div>
		</div>
	</div>
	<!-- /second section -->
	<!-- third section - Services -->
	<div id="services" class="pad-section">
		<div class="container">
			<h2 class="text-center">Our Team</h2>
			<hr />
			<div class="row text-center">
				<div class="col-sm-3 col-xs-6">
					<img alt="" src="images/team1.jpg" class="img-circle">
					
					<h4>Angela</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Donec in sem cras amet. Donec in sem cras amet.</p>
				</div>
				<div class="col-sm-3 col-xs-6">
					<img alt="" src="images/team2.jpg" class="img-circle">
					<h4>Adela</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Donec in sem cras amet. Donec in sem cras amet.</p>
				</div>
				<div class="col-sm-3 col-xs-6">
					<img alt="" src="images/team3.jpg" class="img-circle">
					<h4>Lolita</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Donec in sem cras amet. Donec in sem cras amet.</p>
				</div>
				<div class="col-sm-3 col-xs-6">
					<img alt="" src="images/team4.jpg" class="img-circle">
					<h4>CH Lin</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Donec in sem cras amet. Donec in sem cras amet.</p>
				</div>
			</div>
		</div>
	</div>
	<!-- /third section -->


	<!-- fourth section - Information -->
	<div id="information" class="pad-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2 class="panel-title">旅行最重要的意義，在於分享。</h2><h2 class="panel-title" style="text-align:right" >by Janet</h2>
						</div>
						<div id="test" class="panel-body lead">我覺得自己的旅行，像是在寫一封又一封的信，寄往遠方的信，寄回家裡的信，不管身在何處，我都有好多話想告訴他們，所以旅途中，我從來都不是一個人！
					<br>
					<br>
					永遠沒有不可能，永遠不會沒時間，這個世界一直都在眼前，只要去嘗試、去碰觸、去體會，每分每秒都將充滿各種樂趣與生命力！
					</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="panel panel-default">
					<img alt="" src="images/janet.jpg">
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /fourth section -->
	<!-- fifth section -->
	<div id="services" class="pad-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center">
					<h3>Contact us</h3>					
					<div class="row">
	  			<div class="col-md-offset-1 col-md-10">

				<form class="form-horizontal" role="form">
				  <div class="form-group">
					<div class="col-md-offset-2 col-md-8">
					  <input type="text" class="form-control" id="inputName" placeholder="Name">
					</div>
				  </div>
				  <div class="form-group">
					<div class="col-md-offset-2 col-md-8">
					  <input type="email" class="form-control" id="inputEmail" placeholder="Email">
					</div>
				  </div>
				  <div class="form-group">
					<div class="col-md-offset-2 col-md-8">
					  <input type="text" class="form-control" id="inputSubject" placeholder="Subject">
					</div>
				  </div>
				  <div class="form-group">
					<div class="col-md-offset-2 col-md-8">
					  <textarea name="message" class="form-control" rows="3" placeholder="Message"></textarea>
					</div>
				  </div>
				  <div class="form-group">
					<div class="col-md-offset-2 col-md-8">
					 <button type="button" class="btn btn-theme btn-lg btn-block">Send message</button>
					</div>
				  </div>
				</form>
	
	  			</div>
			
				
	  		</div>
	
				</div>
			</div>
		</div>
	</div>
	<!-- /fifth section -->	
	

	<!-- google map -->
	<div id="google_map">
		
	</div>
	
	
	<!-- /google map -->

	<!-- footer -->
	<footer>
		<hr />
		<div class="container">
			<p class="text-right">Copyright &copy; iTravel 2014</p>
		</div>
	</footer>
	<!-- /footer -->

	<!-- attach JavaScripts -->

	<script src="js/jquery-1.11.1.min.js"></script>

	<script src="js/bootstrap.min.js"></script>

	<script src="//maps.google.com/maps/api/js?sensor=true"></script>

	<script src="js/main.js"></script>

</body>
</html>