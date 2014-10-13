<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/css/spot-modalview.css" />" />
<!--  <link rel="stylesheet" href="<c:url value="/css/container.css" />" />  -->	
<title>Myspot</title>
<style type="text/css">

p { /*用於內文   多行文字溢出用...取代*/
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 4;
	-webkit-box-orient: vertical;
	display: -webkit-box;
}
.jm-item-title{ /*用於單行文字溢出用...取代*/
	white-space: nowrap;
	max-width: 180px; /* IE6 需要定义宽度 */
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

/*
.thumbnail {
    margin: 10px 10px 10px 10px;
    -webkit-transform: scale(1, 1);
    -ms-transform: scale(1, 1);
    transform: scale(1, 1);
    transition-duration: 0.3s;
    -webkit-transition-duration: 0.3s; 
    }
   

.thumbnail:hover {
	cursor: pointer;
	-webkit-transform: scale(1.2, 1.2);
    -ms-transform: scale(1.2, 1.2);
    transform: scale(1.2, 1.2);
    transition-duration: 0.3s;
    -webkit-transition-duration: 0.3s; 
    box-shadow: 10px 10px 5px #888888;
    z-index: 1;
    }
*/ 
#alterSpotInfoForm {
	height: auto;
    max-height: 225px;
    overflow-x: hidden;
    overflow-y:auto
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
			<h4>我的景點</h4>
			<div class="row" id="listDetails">

			</div>
		
	</div>
	
	<div class="modal fade" id="confimModal" tabindex="-1" role="dialog"
		aria-labelledby="confirmModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="confirmModalLabel">刪除景點</h4>
				</div>
				<div class="modal-body" id="confirmModalDescription">
				</div>
				<!-- <div class="modal-body"> -->

				<div class="modal-footer">
					<button id="cancelBtn" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button id="confirmBtn" type="button" class="btn btn-primary">確認</button>
				</div>
			</div>
			<!-- <div class="modal-content"> -->
		</div>
	</div>
	
	<!-- Modal for spot -->

	<div class="modal fade" id="alterSpotModal" tabindex="-1" role="dialog"
		aria-labelledby="alterSpotModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" style="text-align: center;" id="alterSpotModalLabel">修改景點</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-6 itravel-block-frame">

							<div class="itravel-block-1-pic well alterSpotImagePreview_zone" id="alterSpotImagePreview_zone_1">
								<!--  <span class="glyphicon glyphicon-picture itravel-block-1-pic-content alterspot-fileinput-button" id="alterspotFileinputBtn"></span> -->
							</div>
							<!--  
							<div id="alterSpotPreviews_zone_1">
								<div id="alterSpotTemplate_1"></div>
								
							</div>
							-->
							<!-- <div id="alterSpotPreviews_zone_1"> -->

						</div>
						<!-- <div class="col-md-6 itravel-block">  -->
						
						<div class="col-md-6 itravel-block-frame hidden-element" id="alterspot-itravel-block-thumbnails">
							<div class="row">
								<div class="col-md-offset-1 col-md-5 itravel-block-1-thumbnail well">
									<div id="alterSpotImagePreview_zone_2" class='alterSpotImagePreview_zone'>
									</div>
								</div>
								<div class="col-md-5 col-md-offset-0.5 itravel-block-1-thumbnail well">
									<div id="alterSpotImagePreview_zone_3" class='alterSpotImagePreview_zone'>
									</div>
								</div>

							</div>
							<!-- <div class="row"> -->
							<div class="row">
								<div class="col-md-offset-1 col-md-5 itravel-block-1-thumbnail well">
									<div id="alterSpotImagePreview_zone_4" class='alterSpotImagePreview_zone'>
									</div>
								</div>
								<div class="col-md-5 col-md-offset-0.5 itravel-block-1-thumbnail well">
									<div id="alterSpotImagePreview_zone_5" class='alterSpotImagePreview_zone'>
									</div>
									<div id="alterSpotImagePreview_zone_6" class='alterSpotImagePreview_zone hidden'>
									</div>
								</div>
							</div>
							<!-- <div class="row"> -->
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 itravel-block-frame">
							<div class="well well-md itravel-block-1-group">
								<form class="form-horizontal" method="post" id="alterSpotInfoForm" action='<c:url value="/controller/AlterSpot" />'>
									<fieldset>
										<legend class="text-center header"><h4>景點資訊</h4></legend>



										<!-- 名稱 -->
										<!-- 分店負責人 -->
										<!-- 地址 -->
										<!-- 電話 -->
										<!-- 簡介 -->
										<!-- 經緯度 -->
										<div class="form-group">
											<div class="row">
												<div class="col-md-5 col-md-offset-1">

													<div class="input-group" id="alterSpotCityGroup" data-toggle="popover" data-placement="top" data-content="請選擇縣市">
														<input id="alterSpotCity" name="alterSpotCity" type="text" placeholder="縣市"
															class="form-control" disabled>
														<div class="input-group-btn" id="alterSpotCityIdMenu">
															<button type="button"
																class="btn btn-default dropdown-toggle"
																data-toggle="dropdown">
																選擇 <span class="caret"></span>
															</button>
															<ul class="dropdown-menu dropdown-menu-right spot-scrollable" role="menu">
															</ul>
														</div>
														<!-- /btn-group -->
													</div>
													<!-- /input-group -->
												</div>
											</div>
											<!-- <div class="row"> -->
										</div>
										<!-- <div class="form-group"> -->
										
										<!-- 大小分類 -->
										<div class="form-group">
											<div class="row">
												<div class="col-md-5 col-md-offset-1">
													<div class="input-group" id="alterSpotCategoryGroup" data-toggle="popover" data-toggle="popover" data-placement="top" data-content="請選擇分類">
														<input id="alterSpotCategory" name="alterSpotCategory" type="text"
															placeholder="分類" class="form-control" disabled>
														<div class="input-group-btn" id="alterSpotCategoryIdMenu">
															<button type="button"
																class="btn btn-default dropdown-toggle"
																data-toggle="dropdown">
																選擇 <span class="caret"></span>
															</button>
															<ul class="dropdown-menu dropdown-menu-right spot-scrollable-small" role="menu">
															</ul>
														</div>
														<!-- /btn-group -->
													</div>
													<!-- /input-group -->
												</div>

												<div class="col-md-5 col-md-offset-0">
													<div class="input-group" id="subalterSpotCategoryGroup" data-toggle="popover" data-placement="top" data-content="請選擇子分類">
														<input id="subalterSpotCategory" name="subalterSpotCategory" type="text"
															placeholder="子分類" class="form-control" disabled>
														<div class="input-group-btn" id="subalterSpotCategoryIdMenu">
															<button type="button"
																class="btn btn-default dropdown-toggle"
																data-toggle="dropdown">
																選擇 <span class="caret"></span>
															</button>
															<ul class="dropdown-menu dropdown-menu-right spot-scrollable-small" role="menu">
															</ul>
														</div>
														<!-- /btn-group -->
													</div>
													<!-- /input-group -->
												</div>
											</div>
										</div>
										
										<div class="form-group">
											<div class="row">
												<div class="col-md-5 col-md-offset-1">
													<input id="alterSpotName" name="alterSpotName" type="text"
														placeholder="景點名稱" class="form-control" 
														data-toggle="popover" data-placement="top" data-content="請輸入名稱">
												</div>

												<div class="col-md-5 col-md-offset-0">
													<c:if test="${user.accountLevel == 2}">
													<input id="alterSpotOwner" name="alterSpotOwner" type="text"
														placeholder="分店負責人" class="form-control"
														data-toggle="popover" data-placement="top" data-content="請輸入名稱">
													</c:if>	
												</div>
											</div>
										</div>
										
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-offset-1">
													<input id="alterSpotAddress" name="alterSpotAddress" type="text"
														placeholder="地址" class="form-control">
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-offset-1">
													<input id="alterSpotPhone" name="alterSpotPhone" type="text" placeholder="電話"
														class="form-control">
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-offset-1">
													<textarea class="form-control" id="alterSpotIntro" name="alterSpotIntro"
														placeholder="簡介" rows="7"></textarea>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-offset-1">
													<div class="input-group" id="alterSpotHiddens">
													</div>
												</div>
											</div>
										</div>

									</fieldset>
								</form>
							</div>
						</div>
						<div class="col-md-6 itravel-block-frame" id="alterspot-map">
							<div class="itravel-block-1-group" id="alterspot-map-container"></div>
						</div>
					</div>
				</div>
				<!-- <div class="modal-body"> -->

				<div class="modal-footer">
					<button id="alterSpotResetBtn" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button id="alterSpotSaveBtn" type="button" class="btn btn-primary">更新</button>
				</div>
			</div>
			<!-- <div class="modal-content"> -->
		</div>
	</div>
	
	<jsp:include page="/fragment/bottom.jsp" />
	<script type="text/javascript">
	// spot related 
	
	/*
	var categories = [{"type":"美食", "subtype":["餐廳", "小吃", "美食街", "甜品", "其他"]}, 
	                  {"type":"購物", "subtype":["百貨公司", "大賣場", "個性商店", "路邊攤", "其他"]}, 
	                  {"type":"住宿", "subtype":["飯店", "旅舍", "民宿", "營地", "其他"]},
	                  {"type":"景點", "subtype":["風景區", "國家公園", "古蹟", "遊樂園", "其他"]},
	                  {"type":"活動", "subtype":["藝文展覽", "親子活動", "競賽活動", "其他"]}];*/
	                  
	Dropzone.autoDiscover = false; //Turn off autoDiscover globally to avoid the second self-created dropzone causing an error (need to be refined....)
	var alterSpotDropzone;
	var alterspot_zone_index = 1;
	var alterspot_location = new google.maps.LatLng(25.051133, 121.555130);
	var alterspot_map;
	var alterspot_marker;
	var alterspot_infowindow;
	var alterspotInfo;
	
	function alter(id){
		//傳入的id是SpotId
		jQuery.ajax({
			url : "<c:url value='/controller/GetSpot' />",
			type : "POST",
			//contentType : "application/json; charset=utf-8",
			async : false,
			data : {
				//AccountId : "${user.accountId}",  
				spotId:id},	
			dataType : "json"
		}).done(function(data){		
			
			// modal google map
			jQuery('#alterSpotModal').on('shown.bs.modal', function() {
				/*
				console.log("modal google map.....");
				google.maps.event.trigger(alterspot_map, "resize");
				alterspot_map.setCenter(alterspot_location);
				*/
				alterspot_map_init();
			});
			
			resetAlterSpotPage();
			alterspotInfo = data;
			
			if((alterspotInfo.latitude != 0.0) && (alterspotInfo.longitude != 0.0))
				alterspot_location =  new google.maps.LatLng(alterspotInfo.latitude, alterspotInfo.longitude);
			
			// populate the html elements
			jQuery("#alterSpotCity").val(alterspotInfo.city);
			
			// populate category
			jQuery("#alterSpotCategory").val(alterspotInfo.category); //jQuery("#alterSpotCategoryIdMenu .dropdown-menu li").trigger('click');
			jQuery("#subalterSpotCategory").val(alterspotInfo.subcategory);
		
			jQuery.each(categories, function(index, value){
				if(categories[index].type == alterspotInfo.category) {
					var subcategories = categories[index].subtype;
					//console.log(subcategories);
					
					jQuery.each(subcategories, function(index, value){
						jQuery("#subalterSpotCategoryIdMenu ul:first").append("<li><a href='#'>"+value+"</a></li>");
					});
				} 
			});
			
			jQuery("#alterSpotName").val(alterspotInfo.spotName); //jQuery("#alterSpotName").trigger('change');
			jQuery("#alterSpotAddress").val(alterspotInfo.address);
			jQuery("#alterSpotPhone").val(alterspotInfo.phone);

			<c:if test="${user.accountLevel == 2}">
				jQuery("#alterSpotOwner").val(alterspotInfo.leader);
			</c:if>
			
			jQuery("#alterSpotIntro").val(alterspotInfo.intro);
			jQuery("#alterSpotModal").modal('show');
			
			// images
			jQuery.each(alterspotInfo.spotImgs, function(index, value) {
				//jQuery("#alterSpotFileinputBtn").hide();
				
				var className;
				if(alterspot_zone_index != 1) {
					//height = '95px';
					//width = '150px';
					className = 'itravel-block-1-thumbnail-content';
				} else {
					//height = '190px';
					//width = '300px';
					className = 'itravel-block-1-pic-content';
					
					jQuery("#alterspot-itravel-block-thumbnails").show();
				}
				
				var oImg=document.createElement("img");
			  	oImg.setAttribute('src', value); //console.log("image src : " + value);
			  	oImg.setAttribute('alt', value);
			  	oImg.setAttribute("class", className);
			  	oImg.setAttribute("style", "max-width:100%; max-height:100%;margin:auto;display:block;");
			  	
			  	document.getElementById("alterSpotImagePreview_zone_" + alterspot_zone_index).appendChild(oImg);
			  	var imgPZ = "#alterSpotImagePreview_zone_" + alterspot_zone_index;
			  	jQuery(imgPZ).append("<span class='glyphicon glyphicon-trash alterSpotDeleteImg '</span>");
			  	
			  	// move and then show
			  	alterspot_zone_index++; //console.log("zone index : " + alterspot_zone_index);
			});
			
			// append for drop zone
			jQuery("#alterSpotImagePreview_zone_" + alterspot_zone_index).parents(".itravel-block-frame").append(
				"<div id='alterSpotPreviews_zone_1'>"+
					"<div id='alterSpotTemplate_1'>"+
					"</div>"+
				"</div>"
			);
			
			var imgPZ = "#alterSpotImagePreview_zone_" + alterspot_zone_index;
		  	jQuery(imgPZ).append("<span class='glyphicon glyphicon-picture itravel-block-1-pic-content alterspot-fileinput-button' id='alterspotFileinputBtn'></span>");
		  	alterSpotInitDropzone("#alterSpotPreviews_zone_1","#alterSpotTemplate_1");
		  	
		 	// config drop zone
			alterSpotDropzone.on("addedfile", function(file) {
				  
				  jQuery("#alterspotFileinputBtn").hide();
				  //console.log("addedfile...");
				  //console.log(file);
				  
				});

			alterSpotDropzone.on("thumbnail", function(file, dataUrl){
				//console.log("thumbnail...");
				var className;
				
				if(alterspot_zone_index != 1) {
					//height = '95px';
					//width = '150px';
					className = 'itravel-block-1-thumbnail-content';
				} else {
					//height = '190px';
					//width = '300px';
					className = 'itravel-block-1-pic-content';
					
					jQuery("#alterspot-itravel-block-thumbnails").show();
				}
				
				var oImg=document.createElement("img");
			  	oImg.setAttribute('src', dataUrl);
			  	oImg.setAttribute('alt', file.name);
			  	//oImg.setAttribute('height', height);
			  	//oImg.setAttribute('width', width);
			  	oImg.setAttribute("class", className);
			  	oImg.setAttribute("style", "max-width:100%; max-height:95%;margin:auto;display:block;");
			  	
			  	document.getElementById("alterSpotImagePreview_zone_" + alterspot_zone_index).appendChild(oImg);
			  	var imgPZ = "#alterSpotImagePreview_zone_" + alterspot_zone_index;
			  	jQuery(imgPZ).append("<span class='glyphicon glyphicon-trash alterSpotDeleteImg '</span>");
			  	
			  	// move and then show
			  	alterspot_zone_index++; //console.log("zone index : " + alterspot_zone_index);
			  	jQuery("#alterspotFileinputBtn").show().detach().appendTo("#alterSpotImagePreview_zone_" + alterspot_zone_index);
			  
			});

			alterSpotDropzone.on("queuecomplete", function(progress) {
				  console.log("finished uploading");
			});
			
			/*
			alterSpotDropzone.on("done", function(file){
				console.log("donw.....");
			});
			
			alterSpotDropzone.on("maxFilesize", function(file){
				console.log("maxFilesize.....");
			});
			
			alterSpotDropzone.on("maxfilesexceeded", function(file){
				console.log("maxfilesexceeded.....");
			});
			*/
		});
	}
	
	function delet(id){
		jQuery("#confimModal").modal('show');
		
		console.log("delete : " + id);
		var tokens = id.split("#");
		var spotId = tokens[0];
		var spotName = tokens[1];
		jQuery("#confirmModalDescription").empty().append("<p id='"+spotId+"'>確認刪除景點"+spotName+"嗎?</p>");
	}
	
	// config buttons
	/*
	function popoverHandler(elem) {
		
		jQuery(elem).popover('enable');	
		jQuery(elem).popover('show');
		//jQuery('body').scrollTo('');
		jQuery(elem).on('click', function(){
			jQuery(elem).popover('disable');
			jQuery(elem).off('click');
		});
	}                  
	*/
	
	function resetAlterSpotPage() {
		// reset the image zones
		alterspot_zone_index = 1;
		jQuery('.alterSpotImagePreview_zone img').remove();
		jQuery('.alterSpotDeleteImg').remove();
		
		// reset the form
		jQuery('#alterSpotInfoForm input').val('');
		jQuery('#alterSpotIntro').val('');
		jQuery("#alterspot-map").hide();
		
		// reset drop zone
		
		jQuery("#alterSpotPreviews_zone_1").remove();
		jQuery("#alterspotFileinputBtn").remove();
	}
	
	// drop zone
	function alterSpotInitDropzone(previews_zone_id, template_id) {
		// Get the template HTML and remove it from the doument
		var previewNode = document.querySelector(template_id);
		previewNode.id = "";
		var previewTemplate = previewNode.parentNode.innerHTML;
		previewNode.parentNode.removeChild(previewNode);

		alterSpotDropzone = new Dropzone(previews_zone_id, { // Make the whole body a dropzone
		  //url: "http://www.torrentplease.com/dropzone.php", // Set the url
		  url: "<c:url value='/controller/Fileuploader' />",
		  thumbnailWidth: 5000,
		  thumbnailHeight: 5000,
		  //maxFilesize: 2, //MB
		  parallelUploads: 5,
		  
		  previewTemplate: previewTemplate,
		  autoQueue: true, // Make sure the files aren't queued until manually added
		  previewsContainer: previews_zone_id, // Define the container to display the previews
		  clickable: ".alterspot-fileinput-button" // Define the element that should be used as click trigger to select files.
		});
	}
	
	function alterSpotInitElements() {
		// populate city ids
		var cities = ["基隆", "台北", "桃園", "新竹", "苗栗", "dummy", "彰化", "台中", "南投", "雲林", "嘉義", "dummy", "台南", "高雄", "屏東", "dummy", "宜蘭", "花蓮", "台東", "dummy", "綠島", "蘭嶼", "澎湖", "金門", "馬祖"];
		jQuery.each(cities, function(index, value){
			//console.log(value);
			if(value == 'dummy')
				jQuery("#alterSpotCityIdMenu ul:first").append("<li class='divider'></li>");
			else
				jQuery("#alterSpotCityIdMenu ul:first").append("<li><a href='#'>"+value+"</a></li>");
		});
		
		// populate category
		jQuery.each(categories, function(index, value){
			var type = value.type;
			jQuery("#alterSpotCategoryIdMenu ul:first").append("<li><a href='#'>"+type+"</a></li>");
		});
	}
	
	function alterspot_map_init() {
		//console.log("alterspot_map_init called");
		var alterspot_mapoptions = {
			center : alterspot_location,
			zoom : 14,
			mapTypeId : google.maps.MapTypeId.ROADMAP,
			mapTypeControl : false,
			panControl : false,
			rotateControl : false,
			streetViewControl : false,
		};
		
		alterspot_map = new google.maps.Map(document
				.getElementById("alterspot-map-container"), alterspot_mapoptions);
		
		google.maps.event.addListenerOnce(alterspot_map, 'idle', function() {
			   google.maps.event.trigger(alterspot_map, 'resize');
			   alterspot_map.setCenter(alterspot_location);
			   
			   alterspot_infowindow = new google.maps.InfoWindow();
			   
			   if(alterspot_marker != null)
				   alterspot_marker.setMap(null);
			   
			   alterspot_marker = new google.maps.Marker({
					
					position : alterspot_location,
					map : alterspot_map,
					title : "台灣",
					maxWidth : jQuery("#alterspot-map-container").width(),
					maxHeight : jQuery("#alterspot-map-container").height(), 
					draggable:true,
				    animation: google.maps.Animation.DROP
				});
		
				//增加標記點的click事件
				google.maps.event.addListener(alterspot_marker, 'click', function() {
					//console.log("spot marker clicked");
					//spot_infowindow.open(alterspot_map, alterspot_marker);
					
					LatLng = alterspot_marker.getPosition();
					alterspot_location = LatLng;
					geocoder.geocode({'latLng': LatLng}, function(results, status) {
				   		if (status == google.maps.GeocoderStatus.OK) {
					        if (results[1]) {
					        	address = results[1].formatted_address;
					        	alterspot_marker.setTitle(address);	//重新設定標記點的title
					        	jQuery('#alterSpotAddress').val(address);
					        	jQuery('#alterSpotAddress').focus();
					        }
					    }else 
					      	console.log("Geocoder failed due to: " + status);
				   });
				});
				
				//增加標記點的mouseup事件
				google.maps.event.addListener(alterspot_marker, 'mouseup', function() {
					//console.log("spot marker mouseup");
					
					LatLng = alterspot_marker.getPosition();
					geocoder.geocode({'latLng': LatLng}, function(results, status) {
				   		if (status == google.maps.GeocoderStatus.OK) {
					        if (results[1]) {
					        	address = results[1].formatted_address;
					        	alterspot_marker.setTitle(address);	//重新設定標記點的title
					        	
					        	promptMarkerInfo(alterspot_map, alterspot_infowindow, alterspot_marker, "按下,可將標記處地址更新至景點資訊中");
					        	//jQuery('#spotAddress').val(address);
					        	//jQuery('#spotAddress').focus();
					        }
					    }else 
					      	console.log("Geocoder failed due to: " + status);
				   });
				});  
				
				// trigger as map ready
				jQuery("#alterSpotName").trigger('change');
		});
	} 
	
	function alterSpotGetAddressMarkerByName(address){	 
		//重新定位地圖位置與標記點位置
		 //address = jQuery("#spotName").val();
		 geocoder = new google.maps.Geocoder();
		 geocoder.geocode({'address':address},function (results,status) {
				if(status==google.maps.GeocoderStatus.OK) 
				{
				   //console.log(results[0].geometry.location);
				   LatLng = results[0].geometry.location;
				   alterspot_location = LatLng;
				   
				   alterspot_map.setCenter(LatLng);		//將地圖中心定位到查詢結果
				   alterspot_marker.setPosition(LatLng);	//將標記點定位到查詢結果
				   
				   // Reverse geocoding to get the address
				   var rev_address = "";
				   geocoder.geocode({'latLng': LatLng}, function(results, status) {
				   		if (status == google.maps.GeocoderStatus.OK) {
					        if (results[1]) {
					        	rev_address = results[1].formatted_address;
					        	alterspot_marker.setTitle(rev_address);	//重新設定標記點的title
					        	jQuery('#spotAddress').val(rev_address);
					        	
					        	promptMarkerInfo(alterspot_map, alterspot_infowindow, alterspot_marker, "可拖拉更改標記地址");
					        }
					    }else 
					      	console.log("Geocoder failed due to: " + status);
				   });
				   
				   jQuery('#spotAddress').focus();
				} // end of if(status==google.maps.GeocoderStatus.OK) 
			 }// end of function
		 ); // end of  geocoder.geocode({'address':address},function (results,status) 
	  }
	
	function alterSpotGetAddressMarkerByAddr(address){	 
		 //重新定位地圖位置與標記點位置
		 //address = jQuery("#spotName").val();
		 geocoder = new google.maps.Geocoder();
		 geocoder.geocode({'address':address},function (results,status) {
				if(status==google.maps.GeocoderStatus.OK) 
				{
				   //console.log(results[0].geometry.location);
				   LatLng = results[0].geometry.location;
				   alterspot_location = LatLng;
				   
				   alterspot_map.setCenter(LatLng);		//將地圖中心定位到查詢結果
				   alterspot_marker.setPosition(LatLng);	//將標記點定位到查詢結果
				   
				   alterspot_marker.setTitle(address);	//重新設定標記點的title
				} // end of if(status==google.maps.GeocoderStatus.OK) 
			 }// end of function
		 ); // end of  geocoder.geocode({'address':address},function (results,status) 
	  }	
	</script>
	<script type="text/javascript">
		jQuery(document).ready(	function() {
			//google.maps.event.addDomListener(window, 'load', alterspot_map_init);
		
			var count = 0;
			jQuery.ajax({
				url : '<c:url value='/controller/MySpotServlet' />',
				type : "GET",
				contentType : "application/json; charset=utf-8",
				async : false,
				dataType : "json",	
				data : {AccountId : "${user.accountId}"	},								
				success : function(data) {
					jQuery.each(data,function(index,value) {
						jQuery('#listDetails').append(
							"<div class='col-xs-4'><div class='jm-item second'><div class='jm-item-wrapper'><div class='thumbnail'><div class='jm-item-image'><img class='img-portfolio img-responsive' src='"
								+value.spotThumbnail
								+" ' style='width:330px; height:220px;'><div class='jm-item-description'>"
								+value.spotIntro							
								+ "</div></div>"+ "<a href='#'><div class='jm-item-title' id='" + value.spotId + "'>"
								+ value.spotName
								+"</div></a><div style='text-align:right;'><a class='btn btn-primary btn-sm' id='"+value.spotID+"' href='javascript: void(0);' onclick='alter(this.id)'><i  class='fa fa-pencil fa-lg' >修改</i></a><a class='btn btn-danger btn-sm' id='"+(value.spotId+"#"+value.spotName)+"' href='javascript: void(0);' onclick='delet(this.id)'><i class='fa fa-trash-o fa-lg '>刪除</i></a></div></div></div></div>");			
					});
				},
			});
							
			// spot info modal 
			jQuery("#listDetails").on("click", ".jm-item-title", function(){
				selectedSpotId = jQuery(this).attr("id");
				//console.log("spot id : " + selectedSpotId);
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
			
			// configure confirmBtn
			jQuery("#confirmBtn").on('click', function(){
				var spotId = jQuery("#confirmModalDescription p").attr("id");
				//console.log("confirm button pressed : " + spotId);
				
				jQuery.ajax({
					url:"<c:url value='/control/DeleteSpot' />",
					type:"POST",
					//contentType:"text/html; charset=utf-8",
					data:{SpotId:spotId},
					dataType : "text"
				}).done(function(data) {
					window.location.reload();
				});
			});
							
			
			// spot related
			alterSpotInitElements();
			
			// config category
			jQuery('#alterSpotCityIdMenu').on('show.bs.dropdown', function () {
				jQuery("#alterSpotCityIdMenu .dropdown-menu").show();
			}).on("hide.bs.dropdown", function(){
				jQuery("#alterSpotCityIdMenu .dropdown-menu").hide();
			});
			
			jQuery("#alterSpotCityIdMenu .dropdown-menu li").click(function(){
				//console.log(jQuery(this).text());
				jQuery("#alterSpotCity").val(jQuery(this).text());
				jQuery("#alterSpotCityIdMenu .dropdown-menu").hide();
				
				// redraw map
				if(!jQuery("#alterspot-map").is(':visible')) {
					jQuery("#alterspot-map").show();
					
					google.maps.event.trigger(alterSpot_map, "resize");
					alterSpot_map.setCenter(alterSpot_location);
				}
				
				var addr = "台灣";
				var spot = jQuery("#alterSpotName").val();
				var city = jQuery("#alterSpotCity").val();
				if(spot.length > 0)
					addr = addr + city + spot;
				else 
					addr = addr + city;
				
				alterSpotGetAddressMarkerByName(addr);
			}) 
			
			jQuery('#alterSpotCategoryIdMenu').on('show.bs.dropdown', function () {
				jQuery("#alterSpotCategoryIdMenu .dropdown-menu").show();
			}).on("hide.bs.dropdown", function(){
				jQuery("#alterSpotCategoryIdMenu .dropdown-menu").hide();
			});
			
			jQuery("#alterSpotCategoryIdMenu .dropdown-menu li").click(function(){
				//console.log(jQuery(this).index());
				jQuery("#alterSpotCategory").val(jQuery(this).text());
				jQuery("#alterSpotCategoryIdMenu .dropdown-menu").hide();
				
				// populate subcategory
				var subcategories = categories[jQuery(this).index()].subtype;
				//console.log(subcategories);
				jQuery("#subalterSpotCategory").attr("placeholder", "子分類");
				jQuery("#subalterSpotCategory").val("");
				jQuery("#subalterSpotCategoryIdMenu ul:first").empty();
				jQuery.each(subcategories, function(index, value){
					jQuery("#subalterSpotCategoryIdMenu ul:first").append("<li><a href='#'>"+value+"</a></li>");
				});
				
				//if (!jQuery('#subalterSpotCategoryGroup').is(':visible'))
				//	jQuery("#subalterSpotCategoryGroup").show();
			})
			
			// config subcategory
			//jQuery("#subalterSpotCategoryGroup").hide();
			jQuery('#subalterSpotCategoryIdMenu').on('show.bs.dropdown', function () {
				jQuery("#subalterSpotCategoryIdMenu .dropdown-menu").show();
			}).on("hide.bs.dropdown", function(){
				jQuery("#subalterSpotCategoryIdMenu .dropdown-menu").hide();
			});
			
			jQuery("#subalterSpotCategoryIdMenu .dropdown-menu").on("click", "li",function(){
				//console.log(jQuery(this).text());
				jQuery("#subalterSpotCategory").val(jQuery(this).text());
				jQuery("#subalterSpotCategoryIdMenu .spot-scrollable").hide();
			})
			
			// config image deletion
			jQuery('.alterSpotImagePreview_zone').on('click', '.alterSpotDeleteImg', function(){
				//console.log('deleting image.....' + jQuery(this));
				var zone = jQuery(this).closest('.alterSpotImagePreview_zone');
				zone.find('img:first').remove();
				
				// reset icons and the alterspot_zone_index
				jQuery(this).remove();
				var curIndex = zone.attr('id').substr(zone.attr('id').lastIndexOf('_')+1);
				
				// create all the ids to be processed
				var zoneIds = [];
				for(var i = curIndex; i <= 6; i++)
					zoneIds.push("#alterSpotImagePreview_zone_" + i);
			
				//console.log("zoneIds : " + zoneIds);
				var reachEmptyZone = false;
					
				jQuery(zoneIds).each(function(index){
					if((index != 0) && !reachEmptyZone) {
						var curZoneId = zoneIds[index];
						var prevZoneId = zoneIds[index-1]; 
						
						var curZoneIndex = curZoneId.substr(curZoneId.lastIndexOf('_')+1);
						//console.log("curZoneIndex : " + curZoneIndex);
						if(curZoneIndex == 6) {
							jQuery("#alterspotFileinputBtn").show();
							alterspot_zone_index = 5;
						}
						
						//if(!jQuery(curZoneId).is(':empty')) {
						if(jQuery(curZoneId).html().trim().length > 0) {
							
							//console.log("children : " + jQuery(curZoneId).html());
							//console.log("children with length : " + jQuery(curZoneId).html().length);
							jQuery(curZoneId).children().detach().appendTo(jQuery(prevZoneId));
						}
						else {
								//console.log("index : " + index);
								//console.log("current zone : " + zoneIds[index]);	
								var emptyZoneId = zoneIds[index].substr(zoneIds[index].lastIndexOf('_')+1);
								
								alterspot_zone_index = emptyZoneId - 2; // 1 for the original next preview zone; 1 for the deletion
								reachEmptyZone = true;
								
								//console.log("reach empty zone, zone_index : " + zone_index);
						}	
					} 
				});

			});
			
			jQuery("#alterSpotSaveBtn").click(function(){
				//console.log("saveBtn pressed.....");
				
				// check the fields
				if(jQuery("#alterSpotCity").val().length == 0)
					popoverHandler("#alterSpotCityGroup");
				else if(jQuery("#alterSpotCategory").val().length == 0)
					popoverHandler("#alterSpotCategoryGroup");
				else if(jQuery("#subalterSpotCategory").val().length == 0)
					popoverHandler("#subalterSpotCategoryGroup");
				else if(jQuery("#alterSpotName").val().length == 0)
					popoverHandler("#alterSpotName", "#alterSpotName");
				<c:if test="${user.accountLevel == 2}">
				else if(jQuery("#alterSpotOwner").val().length == 0)
					popoverHandler("#alterSpotOwner");
				</c:if>
				else { 
					// add hidden fields for images into form
					var name;
					var value;
					var content;
					jQuery(".alterSpotImagePreview_zone").each(function(index){
						
						name = jQuery(this).attr('id');
						value = jQuery(this).find('img:first').attr('alt'); //console.log("value : " + value);
						
						content = "<input type='hidden' name='"+name+"' value=' "+value+"'>";
						//console.log("content : "+content);
						jQuery("#alterSpotHiddens").append(content);
					});
					
					
					// add hidden fields for input field filled by drop down menu
					content = "<input type='hidden' name='dupCity' value=' "+jQuery("#alterSpotCity").val()+"'>";
					jQuery("#alterSpotHiddens").append(content);
					
					content = "<input type='hidden' name='dupCategory' value=' "+jQuery("#alterSpotCategory").val()+"'>";
					jQuery("#alterSpotHiddens").append(content);
					
					content = "<input type='hidden' name='dupSubcategory' value=' "+jQuery("#subalterSpotCategory").val()+"'>";
					jQuery("#alterSpotHiddens").append(content);
					
					// add hidden fields for longitude and latitude
					var lng = alterspot_location.lng();
					var lat = alterspot_location.lat();
					
					//console.log("lng : " + lng);
					//console.log("lat : " + lat);
					
					content = "<input type='hidden' name='lng' value=' "+lng+"'>";
					jQuery("#alterSpotHiddens").append(content);
					content = "<input type='hidden' name='lat' value=' "+lat+"'>";
					jQuery("#alterSpotHiddens").append(content);
					// spot id
					//console.log("spot id : " + alterspotInfo.spotId);
					content = "<input type='hidden' name='spotId' value=' "+alterspotInfo.spotId+"'>";
					jQuery("#alterSpotHiddens").append(content);
					
					// ready to submit
					jQuery("#alterSpotInfoForm").submit();
					resetAlterSpotPage();
				}
			});
			
			jQuery("#alterSpotResetBtn").click(function(){
				resetAlterSpotPage();
			});
			
			
			jQuery("#alterSpotName").change(function(){
				//console.log("spot name : changing....");
				
				if(!jQuery("#alterspot-map").is(':visible')) {
					jQuery("#alterspot-map").show();
					
					google.maps.event.trigger(alterspot_map, "resize");
					alterspot_map.setCenter(alterspot_location);
				}
				
				var addr = "台灣";
				var city = jQuery("#alterSpotCity").val();
				if(city.length > 0)
					addr = addr + city + jQuery(this).val();
				else 
					addr = addr + jQuery(this).val();
				
				alterSpotGetAddressMarkerByName(addr);
			});
			
			jQuery("#alterSpotpotAddress").change(function(){
				//console.log("spot address : changing....");
				alterSpotGetAddressMarkerByAddr(jQuery(this).val());
			});
			
		});
	</script>
</body>
</html>