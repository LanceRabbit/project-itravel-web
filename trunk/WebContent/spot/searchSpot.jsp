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

						<div class="tab-pane itravel-tab" id="region">region...</div>
						<div class="tab-pane itravel-tab" id="coupons">coupons...</div>
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
				<form class="form-horizontal" method="post" id="infoForm"
					action='<c:url value="/controller/AddSpot" />'>
					<fieldset>
						<div class="form-group">
							<div class="row">

								<div class="col-md-3">
									<div class="input-group" id="queryCityGroup" data-toggle="popover"
										data-placement="top" data-content="請選擇縣市">
										<input id="queryCity" name="city" type="text" placeholder="縣市"
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
	</div>
	
<jsp:include page="/fragment/bottom.jsp" />
<!--  <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script> -->
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
	$('#spotInfoModal').on('shown.bs.modal', function() {
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
		
		activeQuery();
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
		
		activeQuery();
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
		
		activeQuery();
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
			
			jQuery("#briefInfoTab").click();
			jQuery('#spotInfoModal').modal("show");
		});
		//jQuery('#spotInfoModalLabel')
	});
	
	
	// input field : spot name
	jQuey('#querySpotName').on("change", function() {
		
		activeQuery();
	}); 
	
	// load data from server
	activeQuery();
	
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
	
	jQuery("#commentInfoTab").on("click", function(){
		console.log("selectedSpotId : " + selectedSpotId + "'s tab of comments pressed");		
		console.log(spotInfo.spotComments); 
		
		var comments = spotInfo.spotComments;
		$("#commentList").empty();
		
		if(comments.length == 0) {
			//console.log("no comments")
			jQuery("#commentList").append("<div><a href='#' class='list-group-item'><div class='panel panel-default'><div class='panel-heading'>尚無任何評論</div></div></a></div>");
			
		}
		else {
			jQuery.each(comments, function(index, value){
				var comment = value;
				//console.log("index : " + index); start from 0
				jQuery("#commentList").append(
						"<div><a href='#' class='list-group-item list-group-item-info'>"+
							"<div class='panel panel-primary'>"+
								"<div class='panel-heading'>"+
									"<label>" + comment.commenterNickname + "</label><label class='text-right'> " +comment.creationDate +"</label>"+
								"</div>"+

								"<div class='panel-body'>"+
									"<p id='" + index +"'>"+ comment.comment + "</p>" +
								"</div>"+	
							"</div>"+
							
							<c:if test='${! empty user}'>
							"<button type='button' class='btn btn-default addReportBtn'>檢舉</button>"+
							"<button type='button' class='btn btn-default resetReportBtn'>放棄</button>"+
							"<button type='button' class='btn btn-primary saveReportBtn'>儲存</button>"+
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
		jQuery("#commentInfoTab").click();
	});
	
	function initElements() {
		// populate city ids
		var cities = [ "基隆", "台北", "桃園", "新竹", "苗栗", "dummy", "彰化", "台中", "南投",
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
	function activeQuery() {
		var spotName = jQuey('#querySpotName').val();
		//console.log("querySpotName : " + spotName);
		var city = jQuey("#queryCity").val();
		//console.log("city : " + city);
		var category = jQuey('#queryCategory').val();
		//console.log("queryCategory : " + category);
		var subcategory = jQuey('#subqueryCategory').val();
		//console.log("subqueryCategory : " + subCategory);

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
}(jQuery, google));
</script>
    	
</body>
</html>