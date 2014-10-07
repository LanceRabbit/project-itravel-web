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
body {
	padding: 20px;
}
#pin{ /*用於內文   多行文字溢出用...取代*/
/*用於標題   單行文字溢出用...取代*/
	white-space: nowrap;
	width: 100%; /* IE6 需要定义宽度 */
	overflow: hidden;
	-o-text-overflow: ellipsis; /* Opera */
	text-overflow: ellipsis; /* IE, Safari (WebKit) */
}

.fixedHeight { /*用於內文   多行文字溢出用...取代*/
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 4;
	-webkit-box-orient: vertical;
	display: -webkit-box;
}
.col-xs-3{
width:220px;
height:330px;

}

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
	-webkit-transform: scale(1.2, 1.2);
    -ms-transform: scale(1.2, 1.2);
    transform: scale(1.2, 1.2);
    transition-duration: 0.3s;
    -webkit-transition-duration: 0.3s; /* Safari */
    box-shadow: 10px 10px 5px #888888;
    z-index: 1;
    }
</style>
</head>
<body>
	<jsp:include page="/fragment/Top.jsp" />
	<div class="container">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#MyCollectSpot" data-toggle="tab">收藏景點</a></li>
			<li class=""><a href="#MyCollectTrip" data-toggle="tab">收藏行程</a></li>
		</ul>		
		
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade active in" id="MyCollectSpot">
				<br>								
					<div class="col-sm-12">
						<p></p>
						<div class="row" id="listDetails">
						</div>
					</div>
					
			</div>
				
			<div class="tab-pane fade" id="MyCollectTrip">
				<br>	
					<div class="col-sm-12">
						<p></p>
						<div class="row" id="TriplistDetails">
						</div>
					</div>
			</div>
		</div>
	</div>
		<!-- Modal -->

	<div class="modal fade" id="spotInfoModal" tabindex="-1" role="dialog"
		aria-labelledby="spotInfoModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<!--  <h4 class="modal-title" id="spotInfoModalLabel">新增景點  縣市 分類資訊</h4> -->
				</div>

				<div class="modal-body">
					<ul class="nav nav-tabs" role="tablist" id="myTab">
						<li class="active"><a href="#info" role="tab"
							data-toggle="tab" id="briefInfoTab">景點資訊</a></li>
						<li><a href="#regions" role="tab" data-toggle="tab" id="regionInfoTab">附近景點</a></li>
						<li><a href="#coupons" role="tab" data-toggle="tab" id="couponInfoTab">折價券</a></li>
						<li><a href="#comments" role="tab" data-toggle="tab" id="commentInfoTab">評論</a></li>
					</ul>

					<div class="tab-content">
						<div class="tab-pane active itravel-tab" id="info">
							<div class="row">
								<div class="col-md-6 itravel-straight-block-frame">
									<div class="itravel-straight-block-1-pic" id="imagePreview_zone">

										<div id="myCarousel" class="carousel slide well"
											data-ride="carousel">
											<!-- Wrapper for slides -->
											<div class="carousel-inner">
												
												<div class="item active">
													<img src="../images/D1409001.jpg" alt="...">
												</div>
												<!-- 
												<div class="item">
													<img src="../images/team2.jpg" alt="...">
												</div>
												 -->
											</div>
											<!-- End Carousel Inner -->

										</div>
										<!-- End Carousel -->
									</div>
									<!-- <div class="itravel-block-1-pic well" id="imagePreview_zone"> -->

								</div>
								<!-- <div class="col-md-6 itravel-block-frame"> -->


								<div class="col-md-6 itravel-straight-block-frame">
									<div class="row">
										<div class="col-md-12 itravel-block-frame">
											<div class="well itravel-block-1-group">
												<form class="form-horizontal" role="form" >
													
													<div class="row">
														<label class="col-md-3">名稱:</label>
														<p id="spotNameP"></p>
													</div>

													<div class="row">
														<label class="col-md-3">負責人:</label>
														<p id="spotOwnerP"></p>
													</div>
													
													<div class="row">
														<label class="col-md-3">地址:</label>
														<p id="spotAddrP"></p>
													</div>
													
													<div class="row">
														<label class="col-md-3">電話:</label>
														<p  id="spotPhoneP"></p>
													</div>
													
													<div class="row">
														<label class="col-md-3">簡介:</label>
														<p id="spotIntroP"></p>
													</div>
														
												</form>
											</div>
										</div>
									</div>
									<!-- <div class="row"> -->

									<div class="row">
										<div class="col-md-12 itravel-block-frame">
											<div class="itravel-block-1-group" id="searchSpot-map-container"></div>
										</div>
									</div>
								</div>
							</div>
							<!-- <div class="row"> -->

						</div>
						<!-- <div class="tab-pane active" id="info"> -->

						<div class="tab-pane itravel-tab" id="region">region...</div>
						<div class="tab-pane itravel-tab" id="coupons">
							<label id="userForCouponsUse" hidden>${user}</label>
							<div class="row">
								<div id="Clist" class="col-sm-12">
								</div>
							</div>
						</div>
						<div class="tab-pane itravel-tab" id="comments">
							<div class="list-group" id="commentList">
							</div> <!-- <div class="list-group"> -->
						</div>
					</div>


				</div>
				<!-- <div class="modal-body"> -->
	
	
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
						
							/*
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
							*/
							
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
							/*
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
				*/
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
										
											jQuery('#listDetails').append("<div id='div"+count+"'class='col-xs-3'><div class='thumbnail'><img src='"+value.spotThumbnail+"' alt=''><div class='caption'><h4><a id='"+value.spotId+"' class='detail'><p id='pin'>"
																	+ value.spotName																	
																	+ "</a></p></h4>"
																	+"<div class='fixedHeight'>"
																	+ value.spotIntro
																	+"</div>"
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
							
							var selectedSpotId;
							jQuery("#listDetails").on("click", ".detail", function(){
								
								selectedSpotId = jQuery(this).attr("id");
								console.log("spot id : " + selectedSpotId);
								jQuery.ajax({
									type : "POST",
									url : '<c:url value='/controller/GetSpot' />',
									data : {
										spotId : selectedSpotId
									},
									dataType : "json"
								}).done(function(data){
									spotInfo = data;
									jQuery("#spotNameP").text(spotInfo.spotName);
									jQuery("#spotAddrP").text(spotInfo.address);
									jQuery("#spotPhoneP").text(spotInfo.phone);
									jQuery("#spotIntroP").text(spotInfo.spotIntro);
									
									jQuery(".carousel-inner:first").empty();
									jQuery.each(spotInfo.spotImgs, function(index, value) {
										console.log("image url : " + value);
										if(index == 0) {
											jQuery(".carousel-inner:first").append("<div class='item active'><img src='"
													+ value
													+"'></div>");
										} else {
											jQuery(".carousel-inner:first").append("<div class='item'><img src='"
													+ value
													+"'></div>");
										}
									});
											
									if(!((spotInfo.leader != null) && (spotInfo.leader.length > 0))) {
										jQuery("a[href='#coupons']").hide();
										jQuery('#spotOwnerP').text("負責人").parent().hide();
									} else {
										jQuery("a[href='#coupons']").show();
										jQuery("#spotOwnerP").text(spotInfo.leader).parent().show();
									}
							
									// set google map marker
									//console.log("lat : " + spotInfo.latitude);
									//console.log("lng : " + spotInfo.longitude);
									addSpotMarker(spotInfo.latitude, spotInfo.longitude);
									
									jQuery("#briefInfoTab").click();
									jQuery('#spotInfoModal').modal("show");
								});
								//jQuery('#spotInfoModalLabel')
							});
							var var_map;
							var var_location = new google.maps.LatLng(23.973299, 120.978398);
							var var_marker;
							
							initElements();
							google.maps.event.addDomListener(window, 'load', map_init);
							
							// modal google map
							jQuery('#spotInfoModal').on('shown.bs.modal', function() {
								google.maps.event.trigger(var_map, "resize");
								var_map.setCenter(var_location);
							});
							
							
							function map_init() {
								//console.log("map_init()");
								var var_mapoptions = {
									center : var_location,
									zoom : 14,
									mapTypeId : google.maps.MapTypeId.ROADMAP,
									mapTypeControl : false,
									panControl : false,
									rotateControl : false,
									streetViewControl : false,
								};
							var_map = new google.maps.Map(document
										.getElementById("searchSpot-map-container"), var_mapoptions);
							} 
							function addSpotMarker(lat, lng) {
								//console.log("addSpotMarker()");
								var_location =  new google.maps.LatLng(lat, lng); 
								
								
								var_marker = new google.maps.Marker({
									position : var_location,
									map : var_map,
									maxWidth : $("#searchSpot-map-container").width(),
									maxHeight : $("#searchSpot-map-container").height(), 
								});
								
							}
		});
	</script>
</body>
</html>