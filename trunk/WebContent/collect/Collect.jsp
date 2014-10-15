<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<!--  <link rel="stylesheet" href="<c:url value="/css/container.css" />" />  -->	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Collect</title>
<style type="text/css">

.jm-item-title{ /*用於單行文字溢出用...取代*/
	white-space: nowrap;
	max-width: 160px; /* IE6 需要定义宽度 */
	overflow: hidden;
	-o-text-overflow: ellipsis; /* Opera */
	text-overflow: ellipsis; /* IE, Safari (WebKit) */*/
}

.fixedHeight { /*用於內文   多行文字溢出用...取代*/
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 4;
	-webkit-box-orient: vertical;
	display: -webkit-box;
}

#tripmodals .modal-body {
} 
#tripmodals .modal-title {
	text-align: center;
}
.scrollable {
    height: auto;
    max-height: 400px;
    overflow-x: hidden;
}
/* 浮動效果
.col-xs-4 {
    margin: 10px 10px 10px 10px;
    -webkit-transform: scale(1, 1);
    -ms-transform: scale(1, 1);
    transform: scale(1, 1);
    transition-duration: 0.3s;
    -webkit-transition-duration: 0.3s; 
    }

.col-xs-4:hover {
	cursor: pointer;
	-webkit-transform: scale(1.1, 1.1);
    -ms-transform: scale(1.1, 1.1);
    transform: scale(1.1, 1.1);
    transition-duration: 0.3s;
    -webkit-transition-duration: 0.3s;
    box-shadow: 10px 10px 5px #888888;
    z-index: 1;
    }
    
  */
/*basic*/
.jm-item {
	padding: 10px;
	display: inline-block;
	text-align: left;
}

.jm-item-wrapper {
	position: relative;
	padding: 7px;
	background: #FFF2BD;
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
	font-size:14px;
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

	
	
	<!-- Modal -->
		<div class="modal modal-wide fade" id="tripmodals">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="tripTitle" class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">1234</h4>
					</div>
					<div class="modal-body tripbody" >
						<div class="container-fluid">
							<div class="row-fluid" style=" border-collapse:collapse;">
								<div class="col-sm-5"  >
									<ul class="nav nav-tabs" id="mytab" style=" margin: 0px;">
									<li class="active"><a data-toggle="tab" href="#page1">Home</a></li>
									</ul>

									<div class="tab-content scrollable" id="tabContent" >
									<div class="tab-pane active" id="page1" autofocus="">1234</div>
									</div>
								</div>
								<div class="col-sm-7"  >
									<div id="my-trip-map-container" ></div>
								</div>

							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="close" data-dismiss="modal">Close</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
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
																	+"</div></a><div style='text-align:right;'><a class='btn btn-danger btn-sm' id='"+value.spotId+"' href='javascript: void(0);' onclick='delet(this.id)'><i class='fa fa-trash-o fa-lg '>刪除</i></a></div></div></div></div>");
																
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
											jQuery('#TriplistDetails').append("<div name='test' id='"+value.tripId+"' class='col-xs-4'><div class='jm-item second'><div class='jm-item-wrapper'>"
													+"<div class='thumbnail'>"
													+"<div class='jm-item-image temp'><a href='#tripmodals' data-toggle='modal' data-target='#tripmodals'>"
													+"<img class='img-portfolio img-responsive' src='<c:url value='/controller/TripImageServlet?id="
													+value.tripId+"'/>' style='width:330px; height:220px;'></a></div>"
													+"<div class='jm-item-title'>"
													+value.tripName+"</div><div ><h5 style='text-align:right;'>行程天數:"
													+value.totalDay+"</h5><h5 style='text-align:right;'>遊玩日期:"+value.startDate+"</h5></div>"
													+"</div><div style='text-align:right;'>"
																			
													+"<a class='btn btn-danger btn-sm' id='"+value.tripId+"' href='javascript: void(0);' onclick='deletTrip(this.id)'><i class='fa fa-trash-o fa-lg '>刪除</i></a></div>"
													+"<span id='tripId' hidden>"+value.tripId+"</span>"+
													"<span id='tripName' hidden>"+value.tripName+"</span>"+
													"<span id='startDate' hidden>"+value.startDate+"</span>"+
													"<span id='totalDay' hidden>"+value.totalDay+"</span>"+
													"</div></div>");
											i++;
											
										});
									}else{											
											jQuery('#TriplistDetails').append("<div class='col-xs-3'><div class='thumbnail'><img src='http://placehold.it/300x300' alt=''><div class='caption'><h4><a>無收藏行程</a></h4>無收藏行程資訊</div><div class='ratings'><p class='pull-right'></p></div></div></div>");	
											
									
									}
								}
							});
							
							 $("#TriplistDetails").on("click",".jm-item-image", function(e) {
								 e.stopPropagation();
								 my_trip_map_init();
								var tripId = $("#"+($(this).parent().parent().parent().parent().attr("id"))+" span:first").text();
								var totalDay =$("#"+($(this).parent().parent().parent().parent().attr("id"))+" span:last").text();
								var tripName = $("#"+($(this).parent().parent().parent().parent().attr("id"))+" span:eq(1)").text();
								
								console.log("AAAAA="+$(this).parent().parent().parent().parent().attr("id"));
								
								// when .modal-wide opened, set content-body height based on browser height; 
								// 200 is appx height of modal padding, modal title and button bar
							/* 	var height = $(window).height() - 200;
								$(this).find(".modal-body").css("max-height",
										height); */
								
								//According to trip day to dynamic create Tabs. 
								$("#mytab , #tabContent ").empty();
								$("#tripTitle").html('<h4 class="modal-title">'
										+tripName+
										'</h4>');
								//based on Trip Day to create Trip Details
								for(var dayNum=1,max=totalDay; dayNum<=max; dayNum++) { 
									console.log(tripId);
									console.log(totalDay);
									console.log(tripName);
									$('#mytab').append(
											$('<li><a href="#day' 
													+ dayNum 
													+ '">' 
													+'Day' 
													+ dayNum 
													+'</a></li>'));
									
									$.ajax({
										
										 url:"<c:url value='/controller/TripDetailServlet' />",
										 type:"post",
										 data:{"TripId":tripId,"totalDay":dayNum},
										 dataType:"json", //xml,text
										 async: false,
										 success:function(data){
											 //console.log("get data from server....");
											 console.log(data);
											 //console.log(data.length);
											 count = 1 ;

											 (data.length==0)?$('#tabContent').append('<div class="tab-pane" id="day' 
													 + dayNum +'"><div class="row" "></div></div>'):
											 $.each(data,function(index,value){
												(count==1) ?	
													$('#tabContent').append(
														$('<div class="tab-pane" id="day' + dayNum +'">'
															+'<div class="row" style="border-bottom: 1px solid;">'
																		+'<div class="col-xs-6 ">'
																			+'<div class="tabimg"><img src="<c:url value="/controller/TripDetailImageServlet?id='
																			+value.spotId+'&index=1"/>"  alt="'+value.spotName+'"'
																			+'title="'+value.spotName+'"/></div>'
																		+'</div><div class="clearfix visible-xs-block"></div>'
																		+'<div class="col-xs-6 " >'
																			+'<div class="title"><label>'+value.spotName+'</label></div>'
													        				//+'<div class="title"><label>'+value.spotAddress+'</label></div>'
													       			 		+'<div class="title"><label>停留時間:'+value.stayTime+'分</label></div>'
												        				+'</div>'
													       	+'</div>'
													      +'</div>')
													)
													:
													$('#day'+dayNum).append(
														$('<div class="row" style="border-bottom: 1px solid;">' 
																+'<div class="col-xs-6 "  >'
																+'<div class="tabimg"><img src="<c:url value="/controller/TripDetailImageServlet?id='
																+value.spotId+'&index=1"/>"    alt="'+value.spotName+'"'
																+'title="'+value.spotName+'"/>'
																+'</div></div><div class="clearfix visible-xs-block"></div>'
																+'<div class="col-xs-6 " >'
																+'<div class="title"><label>'+value.spotName+'</label></div>'
														        //+'<div class="title"><label>'+value.spotAddress+'</label></div>'
														        +'<div class="title"><label>停留時間:'+value.stayTime+'分</label></div>'
														        +'</div></div>'
														    	+'</div><')
													) ;
														
													
														var_my_trip_location = new google.maps.LatLng(value.Lat,value.Lng)
														var_my_trip_marker = new google.maps.Marker({
																		position : var_my_trip_location,
																		map : var_my_trip_map,
																		title : value.spotName,
																		maxWidth : 200,
																		maxHeight : 200
																	});
														google.maps.event.addListener(var_my_trip_marker, 'click', function() {
															console.log("spot marker clicked");
															//spot_infowindow.open(alterspot_map, alterspot_marker);
															
															LatLng = var_my_trip_marker.getPosition();
															var_my_trip_location = LatLng;
															geocoder.geocode({'latLng': LatLng}, function(results, status) {
														   		if (status == google.maps.GeocoderStatus.OK) {
															        if (results[1]) {
															        	address = results[1].formatted_address;
															        	var_my_trip_marker.setTitle(address);	//重新設定標記點的title
															        	//jQuery('#alterSpotAddress').val(address);
															        	//jQuery('#alterSpotAddress').focus();
															        }
															    }else 
															      	console.log("Geocoder failed due to: " + status);
														   	});
														});
									
														
												    count++;
													$('#day' + dayNum).tab('show');	 
											 });//.each	
										 }
									 });//ajax

								}//for loop
								
								$('#mytab a:first').tab('show');
								
							}); //on click
							var var_my_trip_map;
							var var_my_trip_location = new google.maps.LatLng(23.973299, 120.978398);
							var var_my_trip_marker;

							google.maps.event.addDomListener(window, 'load', my_trip_map_init);

							//start of modal google map
							$('#tripmodals').on('shown.bs.modal', function() {
								google.maps.event.trigger(var_my_trip_map, "resize");
								var_my_trip_map.setCenter(var_my_trip_location);
								$('.scrollable').scrollTop(0);
							});

							function my_trip_map_init() {
						
								var var_my_trip_mapoptions = {
									center : var_my_trip_location,
									zoom : 8,
									mapTypeId : google.maps.MapTypeId.ROADMAP,
									mapTypeControl : false,
									panControl : false,
									rotateControl : false,
									streetViewControl : false,
								};
								var_my_trip_map = new google.maps.Map(document
										.getElementById("my-trip-map-container"), var_my_trip_mapoptions);
							}
							
							jQuery("#listDetails").on("click", ".jm-item-title", function(){
								
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
									displaySpotInfo(data);
								});
								//jQuery('#spotInfoModalLabel')
							});
		});
	</script>
</body>
</html>