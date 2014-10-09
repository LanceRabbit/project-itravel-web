<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Spots</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.css" />" />
<link rel="stylesheet" href="<c:url value="/css/bootstrap-theme.css" />" />
<link rel="stylesheet" href="<c:url value="/css/container.css" />" />
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/css/spot-modalview.css" />" />

<style type="text/css">
body {
	padding: 20px;
}
.fixedHeight { /*用於內文   多行文字溢出用...取代*/
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
/*
.col-xs-3{
width:220px;
height:330px;

}
*/
.queryItemScrollable {
    height: auto;
    max-height: 150px;
    overflow-x: hidden;
    overflow-y:auto
}

.itravel-tab {
	display: inline-block;
	padding: 5px;
	
	margin:auto;
	width : 100%;
	height : 575px;
}

#spotIntroP {
	height: auto;
    max-height: 200px;
    overflow-x: hidden;
    overflow-y:auto
}

#commentList {
	height: auto;
    max-height: 550px;
    overflow-x: hidden;
    overflow-y:auto
}
/*
#myCarousel .carousel-caption {
	left: 0;
	right: 0;
	bottom: 0;
	text-align: left;
	padding: 10px;
	background: rgba(0, 0, 0, 0.6);
	text-shadow: none;
}

#myCarousel .list-group {
	position: absolute;
	top: 0;
	right: 0;
}

#myCarousel .list-group-item {
	border-radius: 0px;
	cursor: pointer;
}

#myCarousel .list-group .active {
	background-color: #eee;
}

@media ( min-width : 992px) {
	#myCarousel {
		padding-right: 33.3333%;
	}
	#myCarousel .carousel-controls {
		display: none;
	}
}

@media ( max-width : 991px) {
	.carousel-caption p,#myCarousel .list-group {
		display: none;
	}
}
*/

.itravel-straight-block-frame{
	display: inline-block;
	/*border: 1px dotted #4F4F4F;*/
	padding: 5px;
	
	margin:auto;
	overflow:hidden;
}

.itravel-straight-block-1-pic{
	display: inline-block;
	/*border: 1px dotted #4F4F4F;*/
	padding:3px;
	
	margin:auto;
	width:100%;
	height:535px;
	
	/*
	background-image: url(images/thumbnail_128.png);
	background-repeat: no-repeat;
	opacity: 0.5;
	background-size: 100%;
	*/
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
	<jsp:include page="/fragment/Top.jsp" />
	<!-- Page Content -->

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

						<div class="tab-pane itravel-tab" id="regions">
							<div id="map_neighborhood" style="width:100%; height:100%;"></div>
						</div>
						
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
				
				<div class="modal-footer" id="spotInfoModelFooter" hidden>
					<button id="commentResetBtn" type="button" class="btn btn-default">放棄</button>
					<button id="commentSaveBtn" type="button" class="btn btn-primary">儲存</button>
					<button id="commentCreationBtn" type="button" class="btn btn-primary" >新增評論</button>
				</div>
				
			</div> <!-- <div class="modal-content"> -->	
				
		</div> <!-- <div class="modal-dialog modal-lg"> -->
	</div> <!-- Modal -->	
	<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="well well-md">
				<form class="form-horizontal" method="post" id="infoForm">
					<fieldset>
						<div class="form-group">
							<div class="row">

								<div class="col-md-3">
									<div class="input-group" id="queryCityGroup" data-toggle="popover"
										data-placement="top" data-content="請選擇縣市">
										<input id="queryCity" name="city" type="text" placeholder="全部縣市"
											class="form-control" disabled>
										<div class="input-group-btn" id="queryCityIdMenu">
											<button type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown">
												選擇 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu dropdown-menu-right queryItemScrollable"
												role="menu">
											</ul>
										</div>
										<!-- /btn-group -->
									</div>
									<!-- /input-group -->
								</div>

								<div class="col-md-3">
									<div class="input-group" id="queryCategoryGroup"
										data-toggle="popover" data-toggle="popover"
										data-placement="top" data-content="請選擇分類">
										<input id="queryCategory" name="category" type="text"
											placeholder="全部分類" class="form-control" disabled>
										<div class="input-group-btn" id="queryCategoryIdMenu">
											<button type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown">
												選擇 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu dropdown-menu-right queryItemScrollable"
												role="menu">
											</ul>
										</div>
										<!-- /btn-group -->
									</div>
									<!-- /input-group -->
								</div>

								<div class="col-md-3">
									<div class="input-group" id="subqueryCategoryGroup"
										data-toggle="popover" data-placement="top"
										data-content="請選擇子分類">
										<input id="subqueryCategory" name="subcategory" type="text"
											placeholder="全部子分類" class="form-control" disabled>
										<div class="input-group-btn" id="subqueryCategoryIdMenu">
											<button type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown">
												選擇 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu dropdown-menu-right queryItemScrollable"
												role="menu">
											</ul>
										</div>
										<!-- /btn-group -->
									</div>
									<!-- /input-group -->
								</div>

								<div class="col-md-3">
									<input id="querySpotName" name="spotName" type="text"
										placeholder="景點名稱" class="form-control" data-toggle="popover"
										data-placement="top" data-content="請輸入名稱">
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	
	
	<div class="row" id="listDetails">
	</div>
	
	<div class="row" style="margin-top: 40px;text-align: center;" id="pages">
    </div>
 </div>
<jsp:include page="/fragment/bottom.jsp" />
<!--  <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script> -->
<script src="${pageContext.request.contextPath}/js/jquery.twbsPagination.js"></script>
<script type="text/javascript">
		function like(id) {
			//傳入的id是SpotId				
			console.log(document.getElementById(id));
			//收回讚
			if(jQuery("#"+id).attr("class")=="fa fa-heart fa-2x"){
				//換heart-o圖
				jQuery("#"+id).attr('title','按讚');
				jQuery("#"+id).removeAttr("class");
				jQuery("#"+id).addClass("fa fa-heart-o fa-2x").css("color","#ff443e");		
				
				var spotidNo = id.substring(2);	
				var No = "p"+spotidNo;
				var N =jQuery("#"+No).text();
				var count = parseInt(N)-parseInt("1");
				jQuery("#"+No).text(count);			
				
				jQuery.ajax({
					url : '<c:url value='/controller/SpotReccordServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",				
					dataType : "text",	
					data : {State:"delet",
						SpotId:id},						
					success : function(data) {						
						if(data=='false'){							
							$('[name="loginError"]').text("請登入後使用。");
							$('#topmodals').modal('show');
						}						
														
					}				
				});				
			}else{ //按讚
				//換heart圖				
				jQuery.ajax({
					url : '<c:url value='/controller/SpotReccordServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",
					dataType : "text",	
					data : {State:"like",
							SpotId:id},						
					success : function(data) {						
						if(data=='false'){							
							$('[name="loginError"]').text("請登入後使用。");
							$('#topmodals').modal('show');
							
						}else{							
							jQuery("#"+id).attr('title','收回讚');
							jQuery("#"+id).removeAttr("class");
							jQuery("#"+id).addClass("fa fa-heart fa-2x").css("color","#ff443e");
							var spotidNo = id.substring(2);	
							var No = "p"+spotidNo;
							var N =jQuery("#"+No).text();
							var count = parseInt(N)+parseInt("1");
							jQuery("#"+No).text(count);			
						}
															
					}				
				});				
				
			}
			

		}

		function collect(id) {
			console.log(id);
		//fa-minus
			if(jQuery("#"+id).attr("class")=="fa fa-minus fa-2x"){
				jQuery("#"+id).attr('title','收藏');
				jQuery("#"+id).removeAttr("class");
				jQuery("#"+id).addClass("fa fa-plus fa-2x");				
				jQuery.ajax({
					url : '<c:url value='/controller/SpotReccordServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",				
					dataType : "text",	
					data : {State:"deletCollect",
						SpotId:id},						
					success : function(data) {						
						if(data=='false'){							
							$('[name="loginError"]').text("請登入後使用。");
							$('#topmodals').modal('show');
						}						
														
					}				
				});	
			}else{
				
				jQuery.ajax({
					url : '<c:url value='/controller/SpotReccordServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",				
					dataType : "text",	
					data : {State:"Collect",
						SpotId:id},						
					success : function(data) {						
						if(data=='false'){							
							$('[name="loginError"]').text("請登入後使用。");
							$('#topmodals').modal('show');
						}else{
							jQuery("#"+id).attr('title','取消收藏');
							jQuery("#"+id).removeAttr("class");
							jQuery("#"+id).addClass("fa fa-minus fa-2x");
						}						
														
					}				
				});	
				
			}			
		}		
		function btnPrint(id){
			console.log(id);
			
		}
</script>

<script>

(function(jQuey){
	var var_map;
	var var_location = new google.maps.LatLng(23.973299, 120.978398);
	var var_marker;
	
	// neighborhood related
	var neighborhood_infowindow = new google.maps.InfoWindow();  
	var neighborhood_map;
	var neighborMarkers = [];
	var neighbors = [];
	
	var categories = [{"type":"全部分類", "subtype":["全部子分類"]},
	                  {"type":"美食", "subtype":["全部子分類", "餐廳", "小吃", "美食街", "甜品", "其他"]}, 
	                  {"type":"購物", "subtype":["全部子分類", "百貨公司", "大賣場", "個性商店", "路邊攤", "其他"]}, 
	                  {"type":"住宿", "subtype":["全部子分類", "飯店", "旅舍", "民宿", "營地", "其他"]},
	                  {"type":"景點", "subtype":["全部子分類", "風景區", "國家公園", "古蹟", "遊樂園", "其他"]},
	                  {"type":"活動", "subtype":["全部子分類", "藝文展覽", "親子活動", "競賽活動", "其他"]}];
	
	initElements();
	google.maps.event.addDomListener(window, 'load', map_init);
	
	// modal google map
	jQuery('#spotInfoModal').on('shown.bs.modal', function() {
		google.maps.event.trigger(var_map, "resize");
		var_map.setCenter(var_location);
	});
	
	// config category
	jQuey('#queryCityIdMenu').on('show.bs.dropdown', function () {
		jQuey("#queryCityIdMenu .dropdown-menu").show();
	}).on("hide.bs.dropdown", function(){
		jQuey("#queryCityIdMenu .dropdown-menu").hide();
	});
	
	jQuey("#queryCityIdMenu .dropdown-menu li").click(function(){
		//console.log(jQuey(this).text());
		jQuey("#queryCity").val(jQuey(this).text());
		jQuey("#queryCityIdMenu .dropdown-menu").hide();
		
		activeQuery(0, true);
	}); 
	
	jQuey('#queryCategoryIdMenu').on('show.bs.dropdown', function () {
		jQuey("#queryCategoryIdMenu .dropdown-menu").show();
	}).on("hide.bs.dropdown", function(){
		jQuey("#queryCategoryIdMenu .dropdown-menu").hide();
	});
	
	jQuey("#queryCategoryIdMenu .dropdown-menu li").click(function(){
		//console.log(jQuey(this).index());
		jQuey("#queryCategory").val(jQuey(this).text());
		jQuey("#queryCategoryIdMenu .dropdown-menu").hide();
		
		// populate subcategory
		var subcategories = categories[jQuey(this).index()].subtype;
		//console.log(subcategories);
		jQuey("#subqueryCategory").attr("placeholder", "全部子分類");
		jQuey("#subqueryCategory").val("");
		jQuey("#subqueryCategoryIdMenu ul:first").empty();
		jQuey.each(subcategories, function(index, value){
			jQuey("#subqueryCategoryIdMenu ul:first").append("<li><a href='#'>"+value+"</a></li>");
		});
		
		if (!jQuey('#subqueryCategoryGroup').is(':visible'))
			jQuey("#subqueryCategoryGroup").show();
		
		activeQuery(0, true);
	});
	
	// config subcategory
	jQuey("#subqueryCategoryGroup").hide();
	jQuey('#subqueryCategoryIdMenu').on('show.bs.dropdown', function () {
		jQuey("#subqueryCategoryIdMenu .dropdown-menu").show();
	}).on("hide.bs.dropdown", function(){
		jQuey("#subqueryCategoryIdMenu .dropdown-menu").hide();
	});
	
	jQuey("#subqueryCategoryIdMenu .dropdown-menu").on("click", "li",function(){
		//console.log(jQuey(this).text());
		jQuey("#subqueryCategory").val(jQuey(this).text());
		jQuey("#subqueryCategoryIdMenu .queryItemScrollable").hide();
		
		activeQuery(0, true);
	});
	
	// to trigger modal view
	var selectedSpotId;
	var spotInfo;
	
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
				//console.log("image url : " + value);
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
	
	
	// input field : spot name
	jQuey('#querySpotName').on("change", function() {
		
		activeQuery(0, true);
	}); 
	
	// load data from server
	activeQuery(0, true);
	
	// tabs of spot info modal :
	// comment-related buttons
	jQuery("#commentCreationBtn").on("click", function(){
		
		jQuery("#commentCreationBtn").hide();
		jQuery("#commentSaveBtn").show();
		jQuery("#commentResetBtn").show();
		
		jQuery("#commentList").append("<div id='newComment'><a href='#' class='list-group-item list-group-item-info'><div class='panel panel-default'>"+
				
				"<div class='panel-body'><textarea class='form-control' name='newComment'></textarea></div>"+
				"</div></a></div>");
		
		jQuery("#newComment textarea").focus();
		
		// reset resetResetBtn
		jQuery("#commentList .resetReportBtn").click();
	});
	
	
	
	jQuery("#commentSaveBtn").on("click", function(){
		
		if(jQuery("#newComment textarea").val().length <= 0) {
			console.log("you must enter something....");
			return;
		}
			
		jQuery("#commentCreationBtn").show();
		jQuery("#commentSaveBtn").hide();
		jQuery("#commentResetBtn").hide();
		
		// refresh this tab	
		jQuery.ajax({
			type : "POST",
			url : '<c:url value='/controller/AddComment' />',
			data : {
				commenterId:"${user.accountId}",
				spotId : selectedSpotId,
				comment : jQuery("#newComment textarea").val()
			},
			dataType : "text"
		}).done(function(data){
			console.log("data : " + data);
			if(data == "true") {
				jQuery.ajax({
					type : "POST",
					url : '<c:url value='/controller/GetSpot' />',
					data : {
						spotId : selectedSpotId
					},
					dataType : "json"
				}).done(function(data){
					spotInfo = data;
					jQuery("#commentInfoTab").click();					
				});
			}
		});
	});
	
	jQuery("#commentResetBtn").on("click", function(){
		
		jQuery("#commentCreationBtn").show();
		jQuery("#commentSaveBtn").hide();
		jQuery("#commentResetBtn").hide();
		
		jQuery("#newComment").remove();
		
	});

	// switch between tabs
	jQuery("#briefInfoTab, #regionInfoTab, #couponInfoTab").on("click", function(){
		jQuery("#spotInfoModelFooter").hide();
	});
	
	// neighborhood tab
	jQuery("#regionInfoTab").on("click", function(){
		
		var center = new google.maps.LatLng(spotInfo.latitude, spotInfo.longitude); 
	    var mapOptions = {
	      zoom: 15,
	      center: center,
	      mapTypeId: google.maps.MapTypeId.ROADMAP
	    };
		
	    neighborhood_map = new google.maps.Map(document.getElementById("map_neighborhood"), mapOptions);
	    
	    google.maps.event.trigger(spot_map, "resize");
		spot_map.setCenter(spot_location);
		
		google.maps.event.addListenerOnce(neighborhood_map, 'idle', function() {
			   google.maps.event.trigger(neighborhood_map, 'resize');
			   neighborhood_map.setCenter(center);

			    // get neighbors
			    jQuery.ajax({
			    	type : "POST",
					url : '<c:url value='/controller/GetNeighbor' />',
					data : {
						spotId:spotInfo.spotId,
					},
					dataType : "json",
			    }).done(function(data){
			    	neighbors = data;
			    	
			    	jQuery.each(data, function(index, value){
			    		
			    		neighbors[index] = value;
			    		
			    		//設定各查詢位址的標記marker
			    		neighborMarkers[index] = new google.maps.Marker({		  
			    			position: new google.maps.LatLng(value.latitude, value.longitude),
			    			map: neighborhood_map
			    		});	
			    		
			    		//設定 各標記點marker的click事件		
			    		google.maps.event.addListener(neighborMarkers[index], 'click', function() {
			    			showInfo(neighborhood_map, neighborMarkers[index], neighbors[index]);			
			    		});
			    	});
			    });
			    
		}); 
	});
	
	//coupon tab click
	jQuery("#couponInfoTab").on("click",function(){
		var couponSpotId = selectedSpotId;
		jQuery.ajax({
			url : '<c:url value='/controller/SearchCouponServlet'/>',
			type : "GET",
			contentType : "application/json; charset=utf-8",				
			dataType : "json",	
			data : {SpotId:couponSpotId},						
			success : function(data) {			
				jQuery.each(data,function(index,value) {
					jQuery("#Clist").empty();
					
						if(value.State){
							if($("#userForCouponsUse").text()!=""){
								jQuery("#Clist").append("<ul id='CUllist' class='thumbnails' style='list-style:none;'><li class='col-sm-12 clearfix'><div class='thumbnail clearfix'><img src='"+value.couponThumbnailURL+"' style='width:320px; height:200px; margin-right:10px;' class='pull-left span2 clearfix' style='margin-right:10px'><button id='"+value.CouponId+"' onclick='btnPrint(this.id)' class='btn btn-danger icon  pull-right'>列印</button><div class='caption' class='pull-left'><h3><p>"+value.Description+"</p></h3><small><b class='text-danger'>截止日期: </b>"+value.ValidDate+"</small></div></div></li></ul>");
							}else{
								jQuery("#Clist").append("<ul id='CUllist' class='thumbnails' style='list-style:none;'><li class='col-sm-12 clearfix'><div class='thumbnail clearfix'><img src='<c:url value='/images/Coupons_Empty.jpg'/>' style='width:320px; height:200px; margin-right:10px;' class='pull-left span2 clearfix' style='margin-right:10px'><button id='"+value.CouponId+"' onclick='btnPrint(this.id)' class='btn btn-danger icon  pull-right'>列印</button><div class='caption' class='pull-left'><h3><p>"+value.Description+"</p></h3><small><b class='text-danger'>截止日期: </b>"+value.ValidDate+"</small></div></div></li></ul>");	
							}
						}else{
							jQuery("#Clist").append("<h3 class='text-danger'>店家暫無張貼coupon!</h3>");	
						}
				});						
			}				
		});	
		
	});
	
	jQuery("#commentInfoTab").on("click", function(){
		//console.log("selectedSpotId : " + selectedSpotId + "'s tab of comments pressed");		
		//console.log(spotInfo.spotComments); 
		
		var comments = spotInfo.spotComments;
		$("#commentList").empty();
		
		if(comments.length == 0) {
			//console.log("no comments")
			jQuery("#commentList").append("<div><a href='#' class='list-group-item'><div class='panel panel-default'><div class='panel-heading'>尚無任何評論</div></div></a></div>");
		}
		else {
			jQuery.each(comments, function(index, value){
				var comment = value;
				var commentText = comment.comment;
				var commentTextClass = "style='color:blue'";
				var addReportBtnClass = "addReportBtn";
				
				if(comment.comment.trim().length <= 0) {
					
					commentText = "此評論已被檢舉!!";
					commentTextClass = "style='color:red'";
					addReportBtnClass = "hidden";
				} else if (comment.commenterId == "${user.accountId}") {
					addReportBtnClass = "hidden";
				}
					
				//console.log("index : " + index); start from 0
				jQuery("#commentList").append(
						"<div><a href='#' class='list-group-item list-group-item-info'>"+
							"<div class='panel panel-primary'>"+
								"<div class='panel-heading'>"+
									"<label>" + comment.commenterNickname + "</label><label class='pull-right'> " +comment.creationDate +"</label>"+
								"</div>"+

								"<div class='panel-body'>"+
									"<p " + commentTextClass + " >"+ commentText + "</p>" +
								"</div>"+	
								"<label class='commenterId' hidden>" + comment.commenterId + "</label>" + 
								"<label class='commentId' hidden>" + comment.commentId + "</label>" + 
							"</div>"+
							
							<c:if test='${! empty user}'>
								"<button type='button' class='btn btn-default " + addReportBtnClass + " '>檢舉</button>"+
								"<button type='button' class='btn btn-default resetReportBtn'>取消</button>"+
								"<button type='button' class='btn btn-primary saveReportBtn'>確認</button>" + 
							</c:if>
						"</a></div>");
			});
		}	
		
		<c:if test='${! empty user }'>
			//console.log("you've logged in");
			jQuery("#spotInfoModelFooter").show();
			jQuery("#commentCreationBtn").show();
			jQuery("#commentSaveBtn").hide();
			jQuery("#commentResetBtn").hide();
			
			// report related buttons
			jQuery(".addReportBtn").show();
			jQuery(".resetReportBtn").hide();
			jQuery(".saveReportBtn").hide();
		</c:if>
	});
	
	// report-related buttons
	jQuery("#commentList").on('click', '.addReportBtn', function(){
		jQuery(this).siblings(".panel").after("<textarea class='form-control newReport' name='newReport'></textarea>");
		var resetBtnThisItem = jQuery(this).siblings('.resetReportBtn');
		jQuery("#commentList .resetReportBtn").not(resetBtnThisItem).click();
		
		// reset buttons in this list item
		jQuery(this).hide();
		jQuery(this).siblings(".resetReportBtn").show();
		jQuery(this).siblings(".newReport").focus();
		
		// click commentResetBtn
		jQuery("#commentResetBtn").click();
		jQuery(this).siblings(".saveReportBtn").show();
	});
		
	jQuery("#commentList").on('click', '.resetReportBtn', function(){
		jQuery(this).siblings('.newReport').remove();
		
		// reset buttons
		jQuery(this).siblings(".addReportBtn").show();
		jQuery(this).hide();
		jQuery(this).siblings(".saveReportBtn").hide();
	});
	
	jQuery("#commentList").on('click', '.saveReportBtn', function(){
		var commenterId = jQuery(this).siblings(".panel-primary").children("label:first").text(); //console.log("commenterId : " + commenterId);
		var commentId = jQuery(this).siblings(".panel-primary").children("label:last").text(); //console.log("commentId : " + commentId);
		var report = jQuery(".newReport").val(); //console.log("report : " + comment);
			
		jQuery.ajax({
			type : "POST",
			url : '<c:url value='/controller/ReportBlacklist' />',
			data : {
				reporterId:"${user.accountId}",
				reportedId:commenterId,
				commentId:commentId,
				report:report
			},
			dataType : "text"
		}).done(function(data){
			console.log("data : " + data);
			if(data == "true") {
				jQuery.ajax({
					type : "POST",
					url : '<c:url value='/controller/GetSpot' />',
					data : {
						spotId : selectedSpotId
					},
					dataType : "json"
				}).done(function(data){
					spotInfo = data;
					jQuery("#commentInfoTab").click();					
				});
			}
		});
	});
	
	function initElements() {
		// populate city ids
		var cities = [ "全部縣市", "基隆", "台北", "桃園", "新竹", "苗栗", "dummy", "彰化", "台中", "南投",
				"雲林", "嘉義", "dummy", "台南", "高雄", "屏東", "dummy", "綠島", "蘭嶼",
				"澎湖", "金門", "馬祖" ];
		jQuey.each(cities, function(index, value) {
			//console.log(value);
			if (value == 'dummy')
				jQuey("#queryCityIdMenu ul:first").append("<li class='divider'></li>");
			else
				jQuey("#queryCityIdMenu ul:first").append(
						"<li><a href='#'>" + value + "</a></li>");
		});

		// populate category
		jQuey.each(categories, function(index, value) {
			var type = value.type;
			jQuey("#queryCategoryIdMenu ul:first").append(
					"<li><a href='#'>" + type + "</a></li>");
		});
	}

	/*
	var curPath = window.location.pathname;
	var rootPath = window.location.protocol+"//"+window.location.host+
					":"+window.location.port+"/"
	*/					
	function activeQuery(pageNo, redrawIndex) {
		//console.log("activeQuery : page : " + pageNo);
		//console.log("activeQuery : redrawIndex : " + redrawIndex);	
		
		var spotName = jQuey('#querySpotName').val();
		//console.log("querySpotName : " + spotName);
		var city = jQuey("#queryCity").val();
		//console.log("city : " + city);
		var category = jQuey('#queryCategory').val();
		//console.log("queryCategory : " + category);
		var subcategory = jQuey('#subqueryCategory').val();
		//console.log("subqueryCategory : " + subCategory);
        
		var totalPageCount = 0;
		jQuey.ajax({
			type : "POST",
			url : '<c:url value='/controller/SearchSpotPaging' />',
			data : {
				spotName : spotName,
				city : city,
				category : category,
				subcategory : subcategory,
				pageNo:pageNo
			}
		}).done(function(data) {
			//console.log("detail from server....." + data);
			jQuery('#listDetails').empty();	
			
			jQuey.each(data, function(index, value){
				//console.log("Hello" + index + ":" + value);		
				if(index == 0) {
					totalPageCount = value.totalPageCount;
					return;
				}
				
				var owner=value.Leader;
				if(owner==""){						
					jQuery('#listDetails').append(
							"<div class='col-xs-4'><div class='jm-item second'><div class='jm-item-wrapper'><div class='thumbnail'><div class='jm-item-image'><img class='img-portfolio img-responsive' src='"
							+value.spotThumbnail 
							+" ' style='width:330px; height:220px;'><div class='jm-item-description'>"
							+value.spotIntro							
							+ "</div></div>"
							+ "<a href='#'><div class='jm-item-title'>"
							+ value.spotName
							+"</div></a></div></div></div>"
							//+ "</div><div class='ratings'><p class='pull-right'>個人按讚</p><p id='p"+value.spotId+"' class='pull-right'> "+value.spotLike+"</p><t class='"+value.spotId+"'>"
					); // end of jQuery
				}else{
					jQuery('#listDetails').append(
							"<div class='col-xs-4'><div class='jm-item second'><div class='jm-item-wrapper'><div class='thumbnail'><div class='jm-item-image'><img class='img-portfolio img-responsive'  src='"
							+value.spotThumbnail +" ' style='width:330px; height:220px;'><div class='jm-item-description'>"
							+value.spotIntro							
							+ "</div></div>"
							+ "<a href='#'><div class='jm-item-title'>"
							+ value.spotName
							+"</div></a></div></div></div>"
							//+ "</div><div class='ratings'><p class='pull-right'>個人按讚</p><p id='p"+value.spotId+"' class='pull-right'> "+value.spotLike+"</p><t class='"+value.spotId+"'>"
					); // end of jQuery
					
				}
				jQuery.ajax({
					url : '<c:url value='/controller/CheckSpotLikeServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",
					async : false,
					dataType : "text",	
					data : {SpotId:value.spotId},						
					success : function(data) {						
						if(data=="NoAccount"){							
							jQuery('.'+value.spotId).append("<a id='social' href='javascript: void(0);' ><i id='ih"+value.spotId+"' class='fa fa-heart-o fa-2x' style='color:#ff443e;' title='按讚' onclick='like(this.id)'></i></a>");
							
						}else if(data=="Like"){
						//有登錄的話依據like紀錄顯示圖片
							jQuery('.'+value.spotId).append("<a id='social' href='javascript: void(0);' ><i id='ih"+value.spotId+"' class='fa fa-heart fa-2x' style='color:#ff443e;' title='收回讚' onclick='like(this.id)'></i></a>");
							
						}else if(data=="NoLike"){
						//有登錄的話依據like紀錄顯示圖片
							jQuery('.'+value.spotId).append("<a id='social' href='javascript: void(0);' ><i id='ih"+value.spotId+"' class='fa fa-heart-o fa-2x' style='color:#ff443e;' title='按讚' onclick='like(this.id)'></i></a>");
						
						}																						
					}				
				});	
				
				jQuery.ajax({
					url : '<c:url value='/controller/CheckSpotCollectServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",
					async : false,
					dataType : "text",	
					data : {SpotId:value.spotId},						
					success : function(data) {														
						if(data=="NoAccount"){							
							jQuery('.'+value.spotId).append("<a id='social' href='javascript: void(0);' ><i id='ip"+value.spotId+ "' class='fa fa-plus fa-2x' title='收藏'onclick='collect(this.id)'></i></a>");
							
						}else if(data=="Collect"){
						
							jQuery('.'+value.spotId).append("<a id='social' href='javascript: void(0);' ><i id='ip"+value.spotId+"' class='fa fa-minus fa-2x'  title='取消收藏' onclick='collect(this.id)'></i></a>");
							
						}else if(data=="NoCollect"){
						
							jQuery('.'+value.spotId).append("<a id='social' href='javascript: void(0);' ><i id='ip"+value.spotId+ "' class='fa fa-plus fa-2x' title='收藏'onclick='collect(this.id)'></i></a>");
						
						}																						
					}				
				});					
				jQuery('#listDetails').append("</t></div>");				
				jQuery('#listDetails').append("</div></div>");
				
			});
			
			//console.log("total page count : " + totalPageCount);
			// pagination
			if(redrawIndex == true) {
				jQuery("#pages").empty();
				jQuery("#pages").append("<ul id='pagination' class='pagination-sm' ></ul>");
				
				jQuery('#pagination').twbsPagination({
			        totalPages: totalPageCount,
			        visiblePages: 5,
			        
			        onPageClick: function (event, page) {
			        	//console.log("select page : " + page);
			            jQuery('#page-content').text('Page ' + page);
			            activeQuery(page, false);
			        }
			    });
			}
		});
	}// end of avtiveQuery
	
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
		
		/*
		var spot_infowindow = new google.maps.InfoWindow();
		
		var_marker = new google.maps.Marker({
			position : var_location,
			map : var_map,
			maxWidth : $("#searchSpot-map-container").width(),
			maxHeight : $("#searchSpot-map-container").height(), 
		});
		*/
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
	
	function infoContent(neighbor) {
		//設定資訊視窗內容要呈現什麼	
		 var html = "<div style='width:100px; height:100px;'>";
		 html += "<img src='"+ neighbor.spotThumbnail + "' style='max-width:100%; max-height:100%;margin:auto;display:block;'></div>";
		 html += "<div>" + neighbor.spotName + "</div>";
		 
		 return html;
	}
	  
	function showInfo(mapObj , markerObj, neighbor) {
		/*
		console.log("showInfo : " + mapObj);
		console.log("showInfo : " + markerObj);
		console.log("name : " + neighbor.spotName);
		console.log("thumbnail : " + neighbor.spotThumbnail);
		*/
		
		//開啟資訊視窗		
		 if (neighborhood_infowindow)
			 neighborhood_infowindow.close();
		
		 neighborhood_infowindow.setContent(infoContent(neighbor));
		 neighborhood_infowindow.open(mapObj, markerObj);			
	}
	
}(jQuery, google));
</script>
    	
</body>
</html>