<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*CSS styles of the main containers*/
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

/*CSS styles of the image and its container*/
.jm-item-image {
	position: relative;
    overflow: hidden;
}
.jm-item-image img {
	display: block;
}
/*CSS styles of the title container*/
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
/*CSS styles of the span element:*/

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
/*CSS styles of the „View” button:*/
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


.first .jm-item-button {
	-webkit-transition: all 0.5s ease-in 0.5s;
	-moz-transition: all 0.5s ease-in 0.5s;
	-o-transition: all 0.5s ease-in 0.5s;
	transition: all 0.5s ease-in 0.5s;
	top: -50px;	
}
.first .jm-item-wrapper:hover .jm-item-button {
	top: 20%;	
}

</style>


</head>
<body>
<div class="jm-item first">
	<div class="jm-item-wrapper">
		<div class="jm-item-image">
			<img src="images/team1.jpg" alt="Pizza Ristorante" />
			<span class="jm-item-overlay"> </span>
			<div class="jm-item-button"><a href="#">View</a></div>
		</div>
		<div class="jm-item-title">Pizza Ristorante</div>
	</div>
</div>
</body>
</html>