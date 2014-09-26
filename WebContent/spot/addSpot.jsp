<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add a Spot</title>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.css" />  -->
<!-- Optional theme -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.css" />  -->
<link rel="stylesheet" href="<c:url value="/css/bootstrap.css" />" />
<link rel="stylesheet" href="<c:url value="/css/bootstrap-theme.css" />" />
<link rel="stylesheet" href="<c:url value="/css/dropzone.css" />" />
<link rel="stylesheet" href="<c:url value="/css/container.css" />" />
<link rel="stylesheet" href="<c:url value="/css/spot-modalview.css" />" />

<style>
#infoForm {
	height: auto;
    max-height: 200px;
    overflow-x: hidden;
    overflow-y:auto
}
</style>
</head>

<body>
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp" />
	<!-- Page Content -->
	
	<!-- Button trigger modal -->
	<button class="btn btn-primary btn-lg" data-toggle="modal"
		data-target="#myModal">
		<span class="glyphicon glyphicon-plus"></span>
	</button>

	<!-- Modal -->

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增景點</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-6 itravel-block-frame">

							<div class="itravel-block-1-pic well imagePreview_zone" id="imagePreview_zone_1">
								<span
									class="glyphicon glyphicon-picture itravel-block-1-pic-content fileinput-button"
									id="fileinputBtn"></span>
							</div>
							<div id="previews_zone_1">
								<div id="template_1"></div>
								<!-- <div id="template_1"> -->
							</div>
							<!-- <div id="previews_zone_1"> -->

						</div>
						<!-- <div class="col-md-6 itravel-block">  -->
						
						<div class="col-md-6 itravel-block-frame hidden-element" id="itravel-block-thumbnails">
							<div class="row">
								<div class="col-md-offset-1 col-md-5 itravel-block-1-thumbnail well">
									<div id="imagePreview_zone_2" class='imagePreview_zone'>
									</div>
								</div>
								<div class="col-md-5 col-md-offset-0.5 itravel-block-1-thumbnail well">
									<div id="imagePreview_zone_3" class='imagePreview_zone'>
									</div>
								</div>

							</div>
							<!-- <div class="row"> -->
							<div class="row">
								<div class="col-md-offset-1 col-md-5 itravel-block-1-thumbnail well">
									<div id="imagePreview_zone_4" class='imagePreview_zone'>
									</div>
								</div>
								<div class="col-md-5 col-md-offset-0.5 itravel-block-1-thumbnail well">
									<div id="imagePreview_zone_5" class='imagePreview_zone'>
									</div>
								</div>
							</div>
							<!-- <div class="row"> -->
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 itravel-block-frame">
							<div class="well well-md itravel-block-1-group">
								<form class="form-horizontal" method="post" id="infoForm" action='<c:url value="/controller/AddSpot" />'>
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
													<input id="spotName" name="spotName" type="text"
														placeholder="景點名稱" class="form-control" 
														data-toggle="popover" data-placement="top" data-content="請輸入名稱">
												</div>

												<div class="col-md-5 col-md-offset-0">
													<input id="spotOwner" name="spotOwner" type="text"
														placeholder="分店負責人" class="form-control">
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<div class="col-md-5 col-md-offset-1">

													<div class="input-group" id="cityGroup" data-toggle="popover" data-placement="top" data-content="請選擇縣市">
														<input id="city" name="city" type="text" placeholder="縣市"
															class="form-control" disabled>
														<div class="input-group-btn" id="cityIdMenu">
															<button type="button"
																class="btn btn-default dropdown-toggle"
																data-toggle="dropdown">
																選擇 <span class="caret"></span>
															</button>
															<ul class="dropdown-menu dropdown-menu-right scrollable" role="menu">
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
													<div class="input-group" id="categoryGroup" data-toggle="popover" data-toggle="popover" data-placement="top" data-content="請選擇分類">
														<input id="category" name="category" type="text"
															placeholder="分類" class="form-control" disabled>
														<div class="input-group-btn" id="categoryIdMenu">
															<button type="button"
																class="btn btn-default dropdown-toggle"
																data-toggle="dropdown">
																選擇 <span class="caret"></span>
															</button>
															<ul class="dropdown-menu dropdown-menu-right scrollable" role="menu">
															</ul>
														</div>
														<!-- /btn-group -->
													</div>
													<!-- /input-group -->
												</div>

												<div class="col-md-5 col-md-offset-0">
													<div class="input-group" id="subcategoryGroup" data-toggle="popover" data-placement="top" data-content="請選擇子分類">
														<input id="subcategory" name="subcategory" type="text"
															placeholder="子分類" class="form-control" disabled>
														<div class="input-group-btn" id="subcategoryIdMenu">
															<button type="button"
																class="btn btn-default dropdown-toggle"
																data-toggle="dropdown">
																選擇 <span class="caret"></span>
															</button>
															<ul class="dropdown-menu dropdown-menu-right scrollable" role="menu">
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
												<div class="col-md-10 col-md-offset-1">
													<input id="address" name="address" type="text"
														placeholder="地址" class="form-control">
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-offset-1">
													<input id="phone" name="phone" type="text" placeholder="電話"
														class="form-control">
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-offset-1">
													<textarea class="form-control" id="intro" name="intro"
														placeholder="簡介" rows="7"></textarea>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-offset-1">
													<div class="input-group" id="hiddens">
													</div>
												</div>
											</div>
										</div>

									</fieldset>
								</form>
							</div>
						</div>
						<div class="col-md-6 itravel-block-frame hidden-element" id="itravel-block-map">
							<div class="itravel-block-1-group" id="map-container"></div>
						</div>
					</div>
				</div>
				<!-- <div class="modal-body"> -->

				<div class="modal-footer">
					<button id="resetBtn" type="button" class="btn btn-default" data-dismiss="modal">放棄</button>
					<button id="saveBtn" type="button" class="btn btn-primary">儲存</button>
				</div>
			</div>
			<!-- <div class="modal-content"> -->
		</div>
	</div>

<jsp:include page="/fragment/bottom.jsp" />
<script src="${pageContext.request.contextPath}/js/dropzone.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>

<script>
(function($){	
	var myDropzone;
	var zone_index = 1;
	var var_map;
	var var_location = new google.maps.LatLng(45.430817, 12.331516);

	var categories = [{"type":"美食", "subtype":["餐廳", "小吃", "美食街", "甜品", "其他"]}, 
	                  {"type":"購物", "subtype":["百貨公司", "大賣場", "個性商店", "路邊攤", "其他"]}, 
	                  {"type":"住宿", "subtype":["飯店", "旅舍", "民宿", "營地", "其他"]},
	                  {"type":"景點", "subtype":["風景區", "國家公園", "古蹟", "遊樂園", "其他"]},
	                  {"type":"活動", "subtype":["藝文展覽", "親子活動", "競賽活動", "其他"]}];
	
	initDropzone();
	initElements();
	google.maps.event.addDomListener(window, 'load', map_init);
	
	
	// modal google map
	$('#myModal').on('shown.bs.modal', function() {
		google.maps.event.trigger(var_map, "resize");
		var_map.setCenter(var_location);
	});
	
	// config drop zone
	myDropzone.on("addedfile", function(file) {
		  //console.log("addedfile...");
		  //console.log(file);
		  
		});

	myDropzone.on("thumbnail", function(file, dataUrl){
		//console.log("thumbnail...");
		var height, width, className;
		
		if(zone_index != 1) {
			height = '95px';
			width = '150px';
			className = 'itravel-block-1-thumbnail-content';
		} else {
			height = '190px';
			width = '300px';
			className = 'itravel-block-1-pic-content';
			
			$("#itravel-block-thumbnails").show();
		}
		
		var oImg=document.createElement("img");
	  	oImg.setAttribute('src', dataUrl);
	  	oImg.setAttribute('alt', file.name);
	  	oImg.setAttribute('height', height);
	  	oImg.setAttribute('width', width);
	  	oImg.setAttribute("class", className);
	  	
	  	document.getElementById("imagePreview_zone_" + zone_index).appendChild(oImg);
	  	var imgPZ = "#imagePreview_zone_" + zone_index;
	  	$(imgPZ).append("<span class='glyphicon glyphicon-trash deleteImg '</span>");
	  	
	  	// move and then show
	  	zone_index++; //console.log("zone index : " + zone_index);
	  	$("#fileinputBtn").detach().appendTo("#imagePreview_zone_" + zone_index);
	});

	myDropzone.on("queuecomplete", function(progress) {
		  console.log("finished uploading");
	});
		
	// config category
	$('#cityIdMenu').on('show.bs.dropdown', function () {
		$("#cityIdMenu .dropdown-menu").show();
	}).on("hide.bs.dropdown", function(){
		$("#cityIdMenu .dropdown-menu").hide();
	});
	
	$("#cityIdMenu .dropdown-menu li").click(function(){
		//console.log($(this).text());
		$("#city").val($(this).text());
		$("#cityIdMenu .dropdown-menu").hide();
	}) 
	
	$('#categoryIdMenu').on('show.bs.dropdown', function () {
		$("#categoryIdMenu .dropdown-menu").show();
	}).on("hide.bs.dropdown", function(){
		$("#categoryIdMenu .dropdown-menu").hide();
	});
	
	$("#categoryIdMenu .dropdown-menu li").click(function(){
		//console.log($(this).index());
		$("#category").val($(this).text());
		$("#categoryIdMenu .dropdown-menu").hide();
		
		// populate subcategory
		var subcategories = categories[$(this).index()].subtype;
		//console.log(subcategories);
		$("#subcategory").attr("placeholder", "子分類");
		$("#subcategory").val("");
		$("#subcategoryIdMenu ul:first").empty();
		$.each(subcategories, function(index, value){
			$("#subcategoryIdMenu ul:first").append("<li><a href='#'>"+value+"</a></li>");
		});
		
		if (!$('#subcategoryGroup').is(':visible'))
			$("#subcategoryGroup").show();
	})
	
	// config subcategory
	$("#subcategoryGroup").hide();
	$('#subcategoryIdMenu').on('show.bs.dropdown', function () {
		$("#subcategoryIdMenu .dropdown-menu").show();
	}).on("hide.bs.dropdown", function(){
		$("#subcategoryIdMenu .dropdown-menu").hide();
	});
	
	$("#subcategoryIdMenu .dropdown-menu").on("click", "li",function(){
		//console.log($(this).text());
		$("#subcategory").val($(this).text());
		$("#subcategoryIdMenu .scrollable").hide();
	})
	
	// config image deletion
	$('.imagePreview_zone').on('click', '.deleteImg', function(){
		//console.log('deleting image.....' + $(this));
		var zone = $(this).closest('.imagePreview_zone');
		zone.find('img:first').remove();
		
		// reset icons and the zone_index
		$(this).remove();
		var curIndex = zone.attr('id').substr(zone.attr('id').lastIndexOf('_')+1);
		
		// create all the ids to be processed
		var zoneIds = [];
		for(var i = curIndex; i <= 5; i++)
			zoneIds.push("#imagePreview_zone_" + i);
	
		var reachEmptyZone = false;
		$(zoneIds).each(function(index){
			if((index != 0) && !reachEmptyZone) {
				var curZoneId = zoneIds[index];
				var prevZoneId = zoneIds[index-1]; 
				
				//if(!$(curZoneId).is(':empty')) {
				if($(curZoneId).html().trim().length > 0) {
					
					//console.log("children : " + $(curZoneId).html());
					//console.log("children with length : " + $(curZoneId).html().length);
					$(curZoneId).children().detach().appendTo($(prevZoneId));
				}
				else {
						//console.log("index : " + index);
						//console.log("current zone : " + zoneIds[index]);	
						var emptyZoneId = zoneIds[index].substr(zoneIds[index].lastIndexOf('_')+1);
						
						zone_index = emptyZoneId - 2; // 1 for the original next preview zone; 1 for the deletion
						reachEmptyZone = true;
				}	
			} 
		});
	});
	
	// config buttons
	function popoverHandler(elem) {
		
		$(elem).popover('enable');	
		$(elem).popover('show');
		//$('body').scrollTo('');
		$(elem).on('click', function(){
			$(elem).popover('disable');
			$(elem).off('click');
		});
	}
	
	$("#saveBtn").click(function(){
		//console.log("saveBtn pressed.....");
		
		// check the fields
		if($("#spotName").val().length == 0)
			popoverHandler("#spotName", "#spotName");
		else if($("#city").val().length == 0)
			popoverHandler("#cityGroup");
		else if($("#category").val().length == 0)
			popoverHandler("#categoryGroup");
		else if($("#subcategory").val().length == 0)
			popoverHandler("#subcategoryGroup");
		else { 
			// add hidden fields for images into form
			var name;
			var value;
			var content;
			$(".imagePreview_zone").each(function(index){
				
				name = $(this).attr('id');
				value = $(this).find('img:first').attr('alt'); //console.log("value : " + value);
				
				content = "<input type='hidden' name='"+name+"' value=' "+value+"'>";
				//console.log("content : "+content);
				$("#hiddens").append(content);
			});
			
			
			// add hidden fields for input field filled by drop down menu
			content = "<input type='hidden' name='dupCity' value=' "+$("#city").val()+"'>";
			$("#hiddens").append(content);
			
			content = "<input type='hidden' name='dupCategory' value=' "+$("#category").val()+"'>";
			$("#hiddens").append(content);
			
			content = "<input type='hidden' name='dupSubcategory' value=' "+$("#subcategory").val()+"'>";
			$("#hiddens").append(content);
			
			$("#infoForm").submit();
			resetPage();
		}
	});
	
	$("#resetBtn").click(function(){
		//console.log("reset......");
		resetPage();
	});
	
	
	$("#spotName").change(function(){
		//console.log("changing....");
		if(!$("#itravel-block-map").is(':visible')) {
			$("#itravel-block-map").show();
			google.maps.event.trigger(var_map, "resize");
			var_map.setCenter(var_location);
		}
	});
	
	function resetPage() {
		// reset the image zones
		zone_index = 1;
		$('.imagePreview_zone img').remove();
		$("#fileinputBtn").detach().appendTo("#imagePreview_zone_1");
		$('.deleteImg').remove();
		
		// reset the form
		$('input').val('');
		$('#intro').val('');
		$('#subcategoryGroup').hide();
	}
	
	// drop zone
	function initDropzone() {
		// Get the template HTML and remove it from the doument
		var previewNode = document.querySelector("#template_1");
		previewNode.id = "";
		var previewTemplate = previewNode.parentNode.innerHTML;
		previewNode.parentNode.removeChild(previewNode);

		myDropzone = new Dropzone("#previews_zone_1", { // Make the whole body a dropzone
		  //url: "http://www.torrentplease.com/dropzone.php", // Set the url
		  url: "controller/Fileuploader",
		  //thumbnailWidth: 300,
		  //thumbnailHeight: 200,
		  parallelUploads: 5,
		  previewTemplate: previewTemplate,
		  
		  
		  autoQueue: true, // Make sure the files aren't queued until manually added
		  previewsContainer: "#previews_zone_1", // Define the container to display the previews
		  clickable: ".fileinput-button" // Define the element that should be used as click trigger to select files.
		});
	}
	
	function initElements() {
		// populate city ids
		var cities = ["基隆", "台北", "桃園", "新竹", "苗栗", "dummy", "彰化", "台中", "南投", "雲林", "嘉義", "dummy", "台南", "高雄", "屏東", "dummy", "宜蘭", "花蓮", "台東", "dummy", "綠島", "蘭嶼", "澎湖", "金門", "馬祖"];
		$.each(cities, function(index, value){
			//console.log(value);
			if(value == 'dummy')
				$("#cityIdMenu ul:first").append("<li class='divider'></li>");
			else
				$("#cityIdMenu ul:first").append("<li><a href='#'>"+value+"</a></li>");
		});
		
		// populate category
		$.each(categories, function(index, value){
			var type = value.type;
			$("#categoryIdMenu ul:first").append("<li><a href='#'>"+type+"</a></li>");
		});
	}
	
	function map_init() {
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

		var contentString = '<div id="mapInfo">'
				+ '<p><strong>Peggy Guggenheim Collection</strong><br><br>'
				+ 'Dorsoduro, 701-704<br>'
				+ '30123<br>Venezia<br>'
				+ 'P: (+39) 041 240 5411</p>'
				+ '<a href="http://www.guggenheim.org/venice" target="_blank">Plan your visit</a>'
				+ '</div>';

		var var_infowindow = new google.maps.InfoWindow({
			content : contentString
		});

		var var_marker = new google.maps.Marker(
				{
					position : var_location,
					map : var_map,
					title : "Click for information about the Guggenheim museum in Venice",
					maxWidth : 300,
					maxHeight : 200
				});

			google.maps.event.addListener(var_marker, 'click', function() {
			var_infowindow.open(var_map, var_marker);
		});
	} 
}(jQuery, google));

(function($){
	console.log("Hello, jQuery!!");
}(jQuery, google));

</script>
</body>
</html>