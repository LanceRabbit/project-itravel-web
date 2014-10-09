<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Collect</title>
<style type="text/css">

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
/*移動到上方放大*/
.thumbnail {
    margin: 10px 10px 10px 10px;
    -webkit-transform: scale(1, 1);
    -ms-transform: scale(1, 1);
    transform: scale(1, 1);
    transition-duration: 0.3s;
    -webkit-transition-duration: 0.3s; /* Safari */
    }

.thumbnail:hover {
	cursor: pointer;
	-webkit-transform: scale(1.1, 1.1);
    -ms-transform: scale(1.1, 1.1);
    transform: scale(1.1, 1.1);
    transition-duration: 0.3s;
    -webkit-transition-duration: 0.3s; /* Safari */
    box-shadow: 10px 10px 5px #888888;
    z-index: 1;
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
	<jsp:include page="/fragment/Top.jsp"/>
	<!-- Page Content -->
	<div class="container">		
			<h4 style='text-align:center'>我收藏的景點</h4>
			<div class="row" id="listDetails">

			</div>
		
	</div>
	
		<div class="container">		
			<h4 style='text-align:center'>我收藏的行程</h4>
			<div class="row" id="TriplistDetails">

			</div>
		
	</div>
	
	
	
	<jsp:include page="/fragment/bottom.jsp" />
	<script>
	function delet(id){
		//alert(id);
		jQuery.ajax({
					url : '<c:url value='/controller/DeletCollectServlet' />',
					type : "GET",
					contentType : "application/json; charset=utf-8",
					async : false,
					dataType : "json",	
					data : {State : 1,  // 1表示傳入的是spot資料
							AccountId : "${user.accountId}",
							SpotId:id },								
					success : function(data) {
							if(data){
								//jQuery('#listDetails').empty();
								console.log("刪除成功");
								location.reload();							
								
							}else{
								console.log("Error Collect delet");
							}		
					}
		
		});
		
		
		
	}
	
	function deletTrip(id){		
		jQuery.ajax({
					url : '<c:url value='/controller/DeletCollectServlet' />',
					type : "GET",
					contentType : "application/json; charset=utf-8",
					async : false,
					dataType : "json",	
					data : {State : 2,  // 1表示傳入的是spot資料
							AccountId : "${user.accountId}",
							TripId:id },								
					success : function(data) {
							if(data){
								jQuery('#TriplistDetails').empty();
								console.log("刪除成功");
								location.reload();
								
							}else{
								console.log("Error Collect delet");
							}		
					}		
		});
		
		
		
	}
	
	
	</script>
	<script type="text/javascript">
		jQuery(document).ready(	function() {
											
							var count = 0;
							jQuery.ajax({
								url : '<c:url value='/controller/MyCollectServlet' />',
								type : "GET",
								contentType : "application/json; charset=utf-8",
								async : false,
								dataType : "json",	
								data : {AccountId : "${user.accountId}"	},								
								success : function(data) {									
									if(data){
										jQuery.each(data,function(index,value) {				
										
											jQuery('#listDetails').append("<div class='col-xs-4'><div class='jm-item second'><div class='jm-item-wrapper'><div class='thumbnail'><div class='jm-item-image'><img class='img-portfolio img-responsive' src='"
													+value.spotThumbnail 
													+" ' style='width:330px; height:220px;'><p class='pull-right'>個人按讚</p><p id='p"+value.spotId+"' class='pull-right'> "+value.spotLike+"</p><div  class='jm-item-description'>"
													+value.spotIntro							
													+ "</div></div>"
													+ "<a href='#'><div class='jm-item-title' id='" + value.spotId + "'>"
													+ value.spotName
													+"</div></a></div><div class='ratings'><p class='pull-right'><a class='btn btn-danger btn-sm' id='"+value.spotId+"' href='javascript: void(0);' onclick='delet(this.id)'><i class='fa fa-trash-o fa-lg '>刪除</i></a></p><p>"+value.spotLike+"個人按讚</p></div></div>");
																						
										});
									}else{											
											jQuery('#listDetails').append("<div class='col-xs-3'><div class='thumbnail'><img src='http://placehold.it/300x300' alt=''><div class='caption'><h4><a>無收藏景點</a></h4>無收藏景點資訊</div><div class='ratings'><p class='pull-right'></p></div></div></div>");	
										
									}
								}
							});

							
							/*行程*/
							var i = 0;
							jQuery.ajax({
								url : '<c:url value='/controller/MyCollectTripServlet' />',
								type : "GET",
								contentType : "application/json; charset=utf-8",
								async : false,
								dataType : "json",	
								data : {AccountId : "${user.accountId}"	},								
								success : function(data) {	
									console.log(i);
									if(data){
										jQuery.each(data,function(index,value) {				
										
											jQuery('#TriplistDetails').append("<div id='div"+i+"'class='col-xs-3'><div class='thumbnail'><img src='"+value.tripThumbnail+"' alt=''><div class='caption'><h4><a href='#'>"
																	+ value.tripName
																	+ "</a></h4><p>行程天數:"
																	+ value.tripDay
																	+ "</p></div><div class='ratings'><p class='pull-right'><a class='btn btn-danger btn-sm' id='"+value.tripId+"' href='javascript: void(0);' onclick='deletTrip(this.id)'><i class='fa fa-trash-o fa-lg '>刪除</i></a></p><p>"+value.tripLike+"個人按讚</p></div></div></div>");
											i++;
											
										});
									}else{											
											jQuery('#TriplistDetails').append("<div class='col-xs-3'><div class='thumbnail'><img src='http://placehold.it/300x300' alt=''><div class='caption'><h4><a>無收藏行程</a></h4>無收藏行程資訊</div><div class='ratings'><p class='pull-right'></p></div></div></div>");	
											
									
									}
								}
							});
					
						});
	</script>
	
</body>
</html>