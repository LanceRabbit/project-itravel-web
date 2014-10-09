<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*basic*/
.jm-item {
	padding: 10px;
	display: inline-block;
	text-align: left;
}

.jm-item-wrapper {
	position: relative;
	padding: 7px;
	background: #E8D7B6; 
}

.jm-item-image {
	position: relative;
	overflow: hidden;
}

.jm-item-image img {
	display: block;
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
	font-family: 'Oswald', sans-serif;
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
	font-family: 'Oswald', sans-serif;
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
	position: absolute;
	width: 100%;
	height: 100%;
	padding: 10px;
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
	<div class="container">

		<div class="row" id="rowSpot">			
			<div class="jm-item second">
			<div class='col-xs-4'>
				<div class="jm-item-wrapper">
					<div class='thumbnail'>
						<div class="jm-item-image">
							<img src='images/team1.jpg' style="width: 100%; height: 100%;">
							<div class="jm-item-description">
								台北市長的動物園
								<div class="jm-item-button">
									<a href="#">View</a>
								</div>
							</div>
						</div>
						
						<a></a><div class="jm-item-title">台北市立動物園</div></a>
						
					</div>
				</div>
			 </div>
			</div>		

		</div>
	</div>

	<jsp:include page="fragment/bottom.jsp"></jsp:include>
<!--  
	<div class="jm-item second">
		<div class="jm-item-wrapper">
			<div class="jm-item-image">
				<img src="images/team3.jpg" alt="Pizza Ristorante" />
				<div class="jm-item-description">
					Lorem ipsum dolor sit amet. 1. Lorem 2. Ipsum 3. Dolor
					<div class="jm-item-button">
						<a href="#">View</a>
					</div>
				</div>
			</div>
			<div class="jm-item-title">Pizza Ristorante</div>
		</div>
	</div>
-->
</body>
</html>