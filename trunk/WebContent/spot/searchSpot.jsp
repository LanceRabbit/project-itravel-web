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
p {/*用於內文   多行文字溢出用...取代*/
	overflow: hidden;
	text-overflow: ellipsis; display : -webkit-box;
	-webkit-line-clamp: 4;
	-webkit-box-orient: vertical;
	display: -webkit-box;
}

h4 {/*用於標題   單行文字溢出用...取代*/
	white-space: nowrap;
	width: 100%; /* IE6 需要定义宽度 */
	overflow: hidden;
	-o-text-overflow: ellipsis; /* Opera */
	text-overflow: ellipsis; /* IE, Safari (WebKit) */
}

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


.scrollable {
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

</style>
</head>

<body>
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp" />
	<!-- Page Content -->

	<!-- Modal -->

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<!--  <h4 class="modal-title" id="myModalLabel">新增景點  縣市 分類資訊</h4> -->
				</div>

				<div class="modal-body">
					<ul class="nav nav-tabs" role="tablist" id="myTab">
						<li class="active"><a href="#info" role="tab"
							data-toggle="tab">景點資訊</a></li>
						<li><a href="#regions" role="tab" data-toggle="tab">附近景點</a></li>
						<li><a href="#coupons" role="tab" data-toggle="tab">折價券</a></li>
						<li><a href="#comments" role="tab" data-toggle="tab">評論</a></li>
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
											<div class="itravel-block-1-group" id="map-container"></div>
										</div>
									</div>
								</div>
							</div>
							<!-- <div class="row"> -->

						</div>
						<!-- <div class="tab-pane active" id="info"> -->

						<div class="tab-pane itravel-tab" id="regions">region...</div>
						<div class="tab-pane itravel-tab" id="coupons">coupons...</div>
						<div class="tab-pane itravel-tab" id="comments">comments...</div>
					</div>


				</div>
				<!-- <div class="modal-body"> -->
				
				<!--
				<div class="modal-footer">
					<button id="resetBtn" type="button" class="btn btn-default" data-dismiss="modal">放棄</button>
					<button id="saveBtn" type="button" class="btn btn-primary">儲存</button>
				</div>  <div class="modal-footer"> -->
				
			</div> <!-- <div class="modal-content"> -->	
				
		</div> <!-- <div class="modal-dialog modal-lg"> -->
	</div> <!-- Modal -->	
	<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="well well-md">
				<form class="form-horizontal" method="post" id="infoForm"
					action='<c:url value="/controller/AddSpot" />'>
					<fieldset>
						<div class="form-group">
							<div class="row">

								<div class="col-md-3">
									<div class="input-group" id="cityGroup" data-toggle="popover"
										data-placement="top" data-content="請選擇縣市">
										<input id="city" name="city" type="text" placeholder="縣市"
											class="form-control" disabled>
										<div class="input-group-btn" id="cityIdMenu">
											<button type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown">
												選擇 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu dropdown-menu-right scrollable"
												role="menu">
											</ul>
										</div>
										<!-- /btn-group -->
									</div>
									<!-- /input-group -->
								</div>

								<div class="col-md-3">
									<div class="input-group" id="categoryGroup"
										data-toggle="popover" data-toggle="popover"
										data-placement="top" data-content="請選擇分類">
										<input id="category" name="category" type="text"
											placeholder="全部分類" class="form-control" disabled>
										<div class="input-group-btn" id="categoryIdMenu">
											<button type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown">
												選擇 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu dropdown-menu-right scrollable"
												role="menu">
											</ul>
										</div>
										<!-- /btn-group -->
									</div>
									<!-- /input-group -->
								</div>

								<div class="col-md-3">
									<div class="input-group" id="subcategoryGroup"
										data-toggle="popover" data-placement="top"
										data-content="請選擇子分類">
										<input id="subcategory" name="subcategory" type="text"
											placeholder="全部子分類" class="form-control" disabled>
										<div class="input-group-btn" id="subcategoryIdMenu">
											<button type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown">
												選擇 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu dropdown-menu-right scrollable"
												role="menu">
											</ul>
										</div>
										<!-- /btn-group -->
									</div>
									<!-- /input-group -->
								</div>

								<div class="col-md-3">
									<input id="spotName" name="spotName" type="text"
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
	</div>
	
<jsp:include page="/fragment/bottom.jsp" />
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
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
		
</script>
<script>
	
(function(jQuey){
	var var_map;
	var var_location = new google.maps.LatLng(23.973299, 120.978398);
	var var_marker;
	
	var categories = [{"type":"全部分類", "subtype":["全部子分類"]},
	                  {"type":"美食", "subtype":["全部子分類", "餐廳", "小吃", "美食街", "甜品", "其他"]}, 
	                  {"type":"購物", "subtype":["全部子分類", "百貨公司", "大賣場", "個性商店", "路邊攤", "其他"]}, 
	                  {"type":"住宿", "subtype":["全部子分類", "飯店", "旅舍", "民宿", "營地", "其他"]},
	                  {"type":"景點", "subtype":["全部子分類", "風景區", "國家公園", "古蹟", "遊樂園", "其他"]},
	                  {"type":"活動", "subtype":["全部子分類", "藝文展覽", "親子活動", "競賽活動", "其他"]}];
	
	initElements();
	google.maps.event.addDomListener(window, 'load', map_init);
	
	// modal google map
	$('#myModal').on('shown.bs.modal', function() {
		google.maps.event.trigger(var_map, "resize");
		var_map.setCenter(var_location);
	});
	
	// config category
	jQuey('#cityIdMenu').on('show.bs.dropdown', function () {
		jQuey("#cityIdMenu .dropdown-menu").show();
	}).on("hide.bs.dropdown", function(){
		jQuey("#cityIdMenu .dropdown-menu").hide();
	});
	
	jQuey("#cityIdMenu .dropdown-menu li").click(function(){
		//console.log(jQuey(this).text());
		jQuey("#city").val(jQuey(this).text());
		jQuey("#cityIdMenu .dropdown-menu").hide();
		
		activeQuery();
	}); 
	
	jQuey('#categoryIdMenu').on('show.bs.dropdown', function () {
		jQuey("#categoryIdMenu .dropdown-menu").show();
	}).on("hide.bs.dropdown", function(){
		jQuey("#categoryIdMenu .dropdown-menu").hide();
	});
	
	jQuey("#categoryIdMenu .dropdown-menu li").click(function(){
		//console.log(jQuey(this).index());
		jQuey("#category").val(jQuey(this).text());
		jQuey("#categoryIdMenu .dropdown-menu").hide();
		
		// populate subcategory
		var subcategories = categories[jQuey(this).index()].subtype;
		//console.log(subcategories);
		jQuey("#subcategory").attr("placeholder", "全部子分類");
		jQuey("#subcategory").val("");
		jQuey("#subcategoryIdMenu ul:first").empty();
		jQuey.each(subcategories, function(index, value){
			jQuey("#subcategoryIdMenu ul:first").append("<li><a href='#'>"+value+"</a></li>");
		});
		
		if (!jQuey('#subcategoryGroup').is(':visible'))
			jQuey("#subcategoryGroup").show();
		
		activeQuery();
	});
	
	// config subcategory
	jQuey("#subcategoryGroup").hide();
	jQuey('#subcategoryIdMenu').on('show.bs.dropdown', function () {
		jQuey("#subcategoryIdMenu .dropdown-menu").show();
	}).on("hide.bs.dropdown", function(){
		jQuey("#subcategoryIdMenu .dropdown-menu").hide();
	});
	
	jQuey("#subcategoryIdMenu .dropdown-menu").on("click", "li",function(){
		//console.log(jQuey(this).text());
		jQuey("#subcategory").val(jQuey(this).text());
		jQuey("#subcategoryIdMenu .scrollable").hide();
		
		activeQuery();
	});
	
	// to trigger modal view
	jQuery("#listDetails").on("click", ".detail", function(){
		
		
		var selectedSpotId = jQuery(this).attr("id");
		//console.log("spot id : " + selectedSpotId);
		jQuery.ajax({
			type : "POST",
			url : '<c:url value='/controller/GetSpot' />',
			data : {
				spotId : selectedSpotId
			},
			dataType : "json"
		}).done(function(data){
			var spotInfo = data;
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
			} else
				jQuery("#spotOwnerP").text(spotInfo.leader);
	
			// set google map marker
			//console.log("lat : " + spotInfo.latitude);
			//console.log("lng : " + spotInfo.longitude);
			addSpotMarker(spotInfo.latitude, spotInfo.longitude);
			
			jQuery('#myModal').modal("show");
		});
		//jQuery('#myModalLabel')
	});
	
	
	// input field : spot name
	jQuey('#spotName').on("change", function() {
		
		activeQuery();
	}); 
	
	// load data from server
	activeQuery();
	
	function initElements() {
		// populate city ids
		var cities = [ "基隆", "台北", "桃園", "新竹", "苗栗", "dummy", "彰化", "台中", "南投",
				"雲林", "嘉義", "dummy", "台南", "高雄", "屏東", "dummy", "綠島", "蘭嶼",
				"澎湖", "金門", "馬祖" ];
		jQuey.each(cities, function(index, value) {
			//console.log(value);
			if (value == 'dummy')
				jQuey("#cityIdMenu ul:first").append("<li class='divider'></li>");
			else
				jQuey("#cityIdMenu ul:first").append(
						"<li><a href='#'>" + value + "</a></li>");
		});

		// populate category
		jQuey.each(categories, function(index, value) {
			var type = value.type;
			jQuey("#categoryIdMenu ul:first").append(
					"<li><a href='#'>" + type + "</a></li>");
		});
	}

	/*
	var curPath = window.location.pathname;
	var rootPath = window.location.protocol+"//"+window.location.host+
					":"+window.location.port+"/"
	*/					
	function activeQuery() {
		var spotName = jQuey('#spotName').val();
		//console.log("spotName : " + spotName);
		var city = jQuey("#city").val();
		//console.log("city : " + city);
		var category = jQuey('#category').val();
		//console.log("category : " + category);
		var subcategory = jQuey('#subcategory').val();
		//console.log("subcategory : " + subcategory);

		jQuey.ajax({
			type : "POST",
			url : '<c:url value='/controller/SearchSpot' />',
			data : {
				spotName : spotName,
				city : city,
				category : category,
				subcategory : subcategory
			}
		}).done(function(data) {
			//console.log("detail from server....." + data);
			jQuery('#listDetails').empty();	
			jQuey.each(data, function(index, value){
				//console.log("Hello" + index + ":" + value);
											
				jQuery('#listDetails').append(
						"<div class='col-xs-3'><div class='thumbnail'><img src='" +
						value.spotThumbnail + "' alt=''><div class='caption'><h4><a href='#' class='detail' id='"+value.spotId+"'>"
						+ value.spotName
						+ "</a></h4>"
						+"<div class='fixedHeight'>"
						+ value.spotIntro
						+"</div>"
						+ "</div><div class='ratings'><p class='pull-right'>個人按讚</p><p id='p"+value.spotId+"' class='pull-right'> "+value.spotLike+"</p><t class='"+value.spotId+"'>"
				); // end of jQuery
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
		});
	}
	
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
				.getElementById("map-container"), var_mapoptions);
		
		/*
		var spot_infowindow = new google.maps.InfoWindow();
		
		var_marker = new google.maps.Marker({
			position : var_location,
			map : var_map,
			maxWidth : $("#map-container").width(),
			maxHeight : $("#map-container").height(), 
		});
		*/
	} 

	function addSpotMarker(lat, lng) {
		//console.log("addSpotMarker()");
		var_location =  new google.maps.LatLng(lat, lng); 
		
		
		var_marker = new google.maps.Marker({
			position : var_location,
			map : var_map,
			maxWidth : $("#map-container").width(),
			maxHeight : $("#map-container").height(), 
		});
		
	}
}(jQuery, google));
</script>
    	
</body>
</html>