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
.col-xs-3{
width:220px;
height:330px;


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

img { 
wudth:200px;
height:200px;
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
								jQuery('#listDetails').empty();
								
								var count = 0;
								jQuery.ajax({
									url : '<c:url value='/controller/MyCollectServlet' />',
									type : "GET",
									contentType : "application/json; charset=utf-8",
									async : false,
									dataType : "json",	
									data : {AccountId : "${user.accountId}"	},								
									success : function(data2) {									
										if(data2){
											jQuery.each(data2,function(index,value) {				
											
												jQuery('#listDetails').append("<div id='div"+count+"'class='col-xs-3'><div class='thumbnail'><img src='"+value.spotThumbnail+"' alt=''><div class='caption'><h4><a href='#'>"
																		+ value.spotName
																		+ "</a></h4><p>"
																		+ value.spotIntro
																		+ "</p></div><div class='ratings'><p class='pull-right'><a class='btn btn-danger btn-sm' id='"+value.spotId+"' href='javascript: void(0);' onclick='delet(this.id)'><i class='fa fa-trash-o fa-lg '>刪除</i></a></p><p>"+value.spotLike+"個人按讚</p></div></div></div>");
												count++;
												
											});
										}else{											
												jQuery('#listDetails').append("<div class='col-xs-3'><div class='thumbnail'><img src='http://placehold.it/300x300' alt=''><div class='caption'><h4><a>無收藏景點</a></h4>無收藏景點資訊</div><div class='ratings'><p class='pull-right'></p></div></div></div>");	
												
										
										}
									}
								});
								
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
										
											jQuery('#listDetails').append("<div id='div"+count+"'class='col-xs-3'><div class='thumbnail'><img src='"+value.spotThumbnail+"' alt=''><div class='caption'><h4><a href='#'>"
																	+ value.spotName
																	+ "</a></h4>"
																	+ value.spotIntro
																	+ "</div><div class='ratings'><p class='pull-right'><a class='btn btn-danger btn-sm' id='"+value.spotId+"' href='javascript: void(0);' onclick='delet(this.id)'><i class='fa fa-trash-o fa-lg '>刪除</i></a></p><p>"+value.spotLike+"個人按讚</p></div></div></div>");
											count++;
											
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