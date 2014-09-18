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

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" />
</head>
<body>
	<!--  BODY PAGE CONTENT -->
	
	<!-- first section - Home -->
	<div id="home" class="home">
		<div class="text-vcenter">
			<h1>i ♥ Travel</h1>
			<h3>Preparing my trip!</h3>
			<a href="first.jsp" class="btn btn-default btn-lg">Start</a>
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
					<h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Donec in sem cras amet.</h2>
					<p class="lead">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit. Sed interdum metus et ligula venenatis, at
						rhoncus nisi molestie. Pellentesque porttitor elit suscipit massa
						laoreet metus.</p>
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
							<h2 class="panel-title">Additional information</h2>
						</div>
						<div class="panel-body lead">資策會 ipsum dolor sit amet,
							consectetur adipiscing elit. Sed hendrerit adipiscing blandit.
							Aliquam placerat, velit a fermentum fermentum, mi felis vehicula
							justo, a dapibus quam augue non massa. Duis euismod, augue et
							tempus consequat, lorem mauris porttitor quam, consequat
							ultricies mauris mi a metus. Phasellus congue, leo sed ultricies
							tristique, nunc libero tempor ligula, at varius mi nibh in nisi.
							Aliquam erat volutpat. Maecenas rhoncus, neque facilisis rhoncus
							tempus, elit ligula varius dui, quis amet.</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h2 class="panel-title">Additional information</h2>
						</div>
						<div class="panel-body lead">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Sed hendrerit adipiscing blandit.
							Aliquam placerat, velit a fermentum fermentum, mi felis vehicula
							justo, a dapibus quam augue non massa. Duis euismod, augue et
							tempus consequat, lorem mauris porttitor quam, consequat
							ultricies mauris mi a metus. Phasellus congue, leo sed ultricies
							tristique, nunc libero tempor ligula, at varius mi nibh in nisi.
							Aliquam erat volutpat. Maecenas rhoncus, neque facilisis rhoncus
							tempus, elit ligula varius dui, quis amet.</div>
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