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
<!--  <link rel="stylesheet" href="<c:url value="/css/container.css" />" /> -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
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
.temp{
width:390px; 
height:450px;
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


#search-trip-map-container {
	height: 400px;
}

.modal.modal-wide .modal-dialog {
	width: 95%;
}
div.tabimg > img{
	width:100%;
	height:100px;
   
}

.scrollable {
    height: auto;
    max-height: 150px;
    overflow-x: hidden;
   
}

div{
border-collapse:collapse;
}

/* irrelevant styling */
.title {
    width:300px;
    text-align:left;
}

#showtrip .caption{
	text-align: center;
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
									<div class="input-group" id="dayGroup" data-toggle="popover"
										data-placement="top" data-content="天數">
										<input id="day" name="day" type="text" placeholder="天數"
											class="form-control test" disabled>
										<div class="input-group-btn" id="dayMenu">
											<button type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown">
												選擇 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu dropdown-menu-right scrollable"
												role="menu">
											 <li role="presentation" value="0"><a role="menuitem"  tabindex="-1" href="#">天數</a></li>
											 <li role="presentation" value="1" default><a role="menuitem" tabindex="-1" href="#">一日遊</a></li>
										     <li role="presentation" value="2"><a role="menuitem" tabindex="-1" href="#">二日遊</a></li>
										     <li role="presentation" value="3"><a role="menuitem"  tabindex="-1" href="#">三日遊</a></li>
											 <li role="presentation" value="4"><a role="menuitem"  tabindex="-1" href="#">四日遊以上</a></li>
											</ul>
										</div>
										<!-- /btn-group -->
									</div>
									<!-- /input-group -->
								</div>
								<div class="col-md-3">
									
									<input id="tripName" name="tripName" type="text" maxlength="20"
										placeholder="行程名稱" class="form-control" data-toggle="popover"
										data-placement="top" data-content="請輸入名稱">
										
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	</div>
	<div class="container">
		<div class="row" id="listTrips">
		</div>	
	</div>
		<!-- Modal -->
		<div class="modal modal-wide fade" id="tripmodals">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="tripTitle" class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4  class="modal-title">1234</h4>
					</div>
					<div class="modal-body" >
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
									<div id="search-trip-map-container" ></div>
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
	<script>


	

	</script>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- 如果從Google下載失敗，我們就從自己的Server上下載jQuery.js檔 -->
<script>!window.jQuery && document.write("<script src='${pageContext.request.contextPath}/js/jquery-1.11.1.min.js'><\/script>")</script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
		function like(id) {
			
			//收回讚
			if(jQuery("#"+id).attr("class")=="fa fa-heart fa-2x"){
				//換heart-o圖
				jQuery("#"+id).attr('title','按讚');
				jQuery("#"+id).removeAttr("class");
				jQuery("#"+id).addClass("fa fa-heart-o fa-2x").css("color","#ff443e");				
				
				var tripidNo = id.substring(2);	
				var No = "p"+tripidNo;
				var N =jQuery("#"+No).text();
				var count = parseInt(N)-parseInt("1");
				jQuery("#"+No).text(count);			
				
				jQuery.ajax({
					url : '<c:url value='/controller/TripRecordServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",				
					dataType : "text",	
					data : {State:"delet",
						TripId:id},						
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
					url : '<c:url value='/controller/TripRecordServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",
					dataType : "text",	
					data : {State:"like",
						TripId:id},						
					success : function(data) {						
						if(data=='false'){							
							$('[name="loginError"]').text("請登入後使用。");
							$('#topmodals').modal('show');
							
						}else{							
							jQuery("#"+id).attr('title','收回讚');
							jQuery("#"+id).removeAttr("class");
							jQuery("#"+id).addClass("fa fa-heart fa-2x").css("color","#ff443e");
							var tripidNo = id.substring(2);	
							var No = "p"+tripidNo;
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
					url : '<c:url value='/controller/TripRecordServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",				
					dataType : "text",	
					data : {State:"deletCollect",
						TripId:id},						
					success : function(data) {						
						if(data=='false'){							
							$('[name="loginError"]').text("請登入後使用。");
							$('#topmodals').modal('show');
						}						
														
					}				
				});	
			}else{
				
				jQuery.ajax({
					url : '<c:url value='/controller/TripRecordServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",				
					dataType : "text",	
					data : {State:"Collect",
						TripId:id},						
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
(function(jQuery){
	//一開始載入頁面就先搜尋所有Trip
	//先設定預設值 0 給 #day, 提供後面做判斷使用 
	$("#day").val($("#dayMenu .dropdown-menu li:eq(0)").text());
	
	$.ajax({
		type : "POST",
		url : '<c:url value='/controller/SearchTripServlet' />',
		data : {
			day : 0
		},
		async : false
	}).done(function(data) {
		//console.log("detail from server....." + data);
		$('#listTrips').empty();
		 count = 1 ;
		$.each(data,function(index,value){

		 
			list(value,count);
			count++;
		
		});	
	});
	var var_search_map;
	var var_search_location = new google.maps.LatLng(23.973299, 120.978398);
	var var_search_marker;
	var var_list = [];
	google.maps.event.addDomListener(window, 'load', search_map_init);
	
	
	//start of modal google map
	$('#tripmodals').on('shown.bs.modal', function() {
		google.maps.event.trigger(var_search_map, "resize");
		var_search_map.setCenter(var_search_location);
	});
	
	function search_map_init() {
		var_list = [];
		var var_search_mapoptions = {
			center : var_search_location,
			zoom : 8,
			mapTypeId : google.maps.MapTypeId.ROADMAP,
			mapTypeControl : false,
			panControl : false,
			rotateControl : false,
			streetViewControl : false,
		};
		var_search_map = new google.maps.Map(document
				.getElementById("search-trip-map-container"), var_search_mapoptions);
		
	}
	function adjustZoom (var_list){
		console.log("ZOOOOOMMMMMMMMMMMM=="+var_list.length);
		var bounds = new google.maps.LatLngBounds();
		 geocoder = new google.maps.Geocoder();
		 var LatLng = 0
		for (var i = 0; i < var_list.length; i++) {
		 console.log(var_list[i])
			geocoder.geocode({'address':var_list[i]},function (results,status) {
			 if(status==google.maps.GeocoderStatus.OK) 
			 {
				 LatLng = results[0].geometry.location;
				  
				
			 }
			 console.log("Lat"+LatLng);
			 var test =  new google.maps.LatLng(22.355803, 91.767919)
			 bounds.extend(test);
		 });
		   console.log("bounds"+var_search_map.getBounds());
		   
		  
		    //在API中說到extend【延伸此界限以包含指定的點】，這個意思是加入多個座標
		    //obj.lat(),obj.
		    //console.log("Lat"+var_list[i].lat());
		    //console.log("Lng"+var_list[i].lng());
		    //bounds.extend(new google.maps.LatLng(var_list[i].lat(),var_list[i].lng()));
		}
		var_search_map.fitBounds(bounds);
	}

	//根據 天數去做搜尋,若click同一個欄位則不執行搜尋
	$("#dayMenu .dropdown-menu li").click(function(){
		
		console.log($(this).text());
		console.log($(this).val());
		($("#day").val()==$(this).text())?true:
			$.ajax({
				type : "POST",
				url : '<c:url value='/controller/SearchTripServlet' />',
				data : {
					input : null,
					day : $(this).val()
				},
				async : false
			}).done(function(data) {
				//console.log("detail from server....." + data);
				$('#listTrips').empty();
				$("#tripName").val("");
				 count = 1 ;
				 
				$.each(data,function(index,value){
					list(value,count);
					count++;
				});	
			}); //end Ajax
		$("#day").val($(this).text());
			
	}); //end--- $("#dayMenu .dropdown-menu li")  
	
	$("#tripName").change(function(){
		console.log($(this).val());
		$("#day").val("");
		$.ajax({
			type : "POST",
			url : '<c:url value='/controller/SearchTripServlet' />',
			data : {
				input : $(this).val(),
				day : 0
			},
			async : false
		}).done(function(data) {
			//console.log("detail from server....." + data);
			$('#listTrips').empty();
			 count = 1 ;
			$.each(data,function(index,value){
				list(value,count);
				count++;
			});	
		}); //end Ajax
		
	});
	
	function list(value, count) {
		$("#listTrips").append("<div id='"+value.tripId+"' class='col-xs-4'><div class='jm-item second'><div class='jm-item-wrapper'>"
				+"<div class='thumbnail'>"
				+"<div class='jm-item-title'>"
				+value.tripName+"</div>"
				+"<div class='jm-item-image'><a href='#tripmodals' data-toggle='modal' data-target='#tripmodals'>"
				+"<img class='temp' src='<c:url value='/controller/TripImageServlet?id="
				+value.tripId+"'/>' style='width:330px; height:220px;'></a></div><div ><h5 style='text-align:right;'>行程天數:"
				+value.totalDay+"</h5><h5 style='text-align:right;'>遊玩日期:"+value.startDate+"</h5><h5 style='text-align:right;'>"+value.tripLike+"個人按讚<h5></div></div>"
				+"<div class='"+value.tripId+"' style='text-align:right;'>");
	 	
	 	jQuery.ajax({
			url : '<c:url value='/controller/CheckTripLikeServlet'/>',
			type : "GET",
			contentType : "application/json; charset=utf-8",
			async : false,
			dataType : "text",	
			data : {TripId:value.tripId},						
			success : function(data) {						
				if(data=="NoAccount"){							
					jQuery('.'+value.tripId).append("<a id='social' class='like' href='javascript: void(0);' ><i id='ih"+value.tripId+"' class='fa fa-heart-o fa-lg' style='color:#ff443e;' title='按讚' onclick='like(this.id)'></i></a>");
					
				}else if(data=="Like"){
				//有登錄的話依據like紀錄顯示圖片
					jQuery('.'+value.tripId).append("<a id='social' class='like' href='javascript: void(0);' ><i id='ih"+value.tripId+"' class='fa fa-heart fa-lg' style='color:#ff443e;' title='收回讚' onclick='like(this.id)'></i></a>");
					
				}else if(data=="NoLike"){
				//有登錄的話依據like紀錄顯示圖片
					jQuery('.'+value.tripId).append("<a id='social' class='like' href='javascript: void(0);' ><i id='ih"+value.tripId+"' class='fa fa-heart-o fa-lg' style='color:#ff443e;' title='按讚' onclick='like(this.id)'></i></a>");
				
				}																						
			}				
		});	
	 	jQuery.ajax({
			url : '<c:url value='/controller/CheckTripCollectServlet'/>',
			type : "GET",
			contentType : "application/json; charset=utf-8",
			async : false,
			dataType : "text",	
			data : {TripId:value.tripId},						
			success : function(data) {														
				if(data=="NoAccount"){							
					jQuery('.'+value.tripId).append("<a id='social' class='collect' href='javascript: void(0);' ><i id='ip"+value.tripId+ "' class='fa fa-plus fa-lg' title='收藏'onclick='collect(this.id)'></i></a></div>");
					
				}else if(data=="Collect"){
				
					jQuery('.'+value.tripId).append("<a id='social' class='collect' href='javascript: void(0);' ><i id='ip"+value.tripId+"' class='fa fa-minus fa-lg'  title='取消收藏' onclick='collect(this.id)'></i></a></div>");
					
				}else if(data=="NoCollect"){
				
					jQuery('.'+value.tripId).append("<a id='social' class='collect' href='javascript: void(0);' ><i id='ip"+value.tripId+ "' class='fa fa-plus fa-lg' title='收藏'onclick='collect(this.id)'></i></a></div>");
				
				}																						
			}				
		});	
		
		jQuery('.'+value.tripId).append("</t></div><span id='tripId' hidden>"+value.tripId+"</span>"
										+"<span id='tripName' hidden>"+value.tripName+"</span>"
										+"<span id='totalDay' hidden>"+value.totalDay+"</span></div></div>");
		
			 	
	}
	
	 $("#listTrips").on("click",".like", function(e) {
		 e.stopPropagation();
	 });
	 
	 $("#listTrips").on("click",".collect", function(e) {
		 e.stopPropagation();
	 });
	 
	$("#listTrips").on("click",".temp", function() {
		search_map_init();
		//var tripId = $("#"+($(this).parent().parent().parent().index()+1)+" span:first").text();
		//var totalDay =$("#"+($(this).parent().parent().parent().index()+1)+" span:last").text();
		//var tripName = $("#"+($(this).parent().parent().parent().index()+1)+" span:eq(1)").text();
		var tripId = $("#"+($(this).parent().parent().parent().parent().parent().parent().attr("id"))+" span:first").text();
		var totalDay =$("#"+($(this).parent().parent().parent().parent().parent().parent().attr("id"))+" span:last").text();
		var tripName = $("#"+($(this).parent().parent().parent().parent().parent().parent().attr("id"))+" span:eq(1)").text();
		
		
		console.log(tripId);
		console.log(totalDay);
		console.log(tripName);
		//console.log($(this).parent().parent().parent().index());
	 	console.log("CCCCC="+$(this).parent().parent().parent().parent().parent().parent().attr("id"));
		// when .modal-wide opened, set content-body height based on browser height; 
		// 200 is appx height of modal padding, modal title and button bar
		var height = $(window).height() - 200;
		$(this).find(".modal-body").css("max-height",
				height);
		
		//According to trip day to dynamic create Tabs. 
		$("#mytab , #tabContent ").empty();

		$("#tripTitle").html('<h4 class="modal-title">'
				+tripName+
				'</h4>');
		//based on Trip Day to create Trip Details
		for(var dayNum=1,max=totalDay; dayNum<=max; dayNum++) { 
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
					 //console.log(data);
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
							//alterTripGetAddressMarkerByAddr(value.spotAddress);
							//var_list.push(value.spotAddress);
						   //var_search_map.setCenter(LatLng);		//將地圖中心定位到查詢結果
						   //var_search_marker.setPosition(LatLng);	//將標記點定位到查詢結果
						   
						   //var_search_marker.setTitle(address);	//重新設定標記點的title
							console.log("spotAddress==="+value.spotAddress);				   
						   	var_search_location = new google.maps.LatLng(value.Lat,value.Lng);
						   	console.log("var_search_location==="+var_search_location);	
							var var_search_marker = new google.maps.Marker(
									{
										position : var_search_location,
										map : var_search_map,
										title : value.spotName,
										maxWidth : 200,
										maxHeight : 200
									});
							google.maps.event.addListener(var_search_marker, 'click', function() {
								console.log("spot marker clicked");
								//spot_infowindow.open(alterspot_map, alterspot_marker);
								
								LatLng = var_search_marker.getPosition();
								var_search_location = LatLng;
								geocoder.geocode({'latLng': LatLng}, function(results, status) {
							   		if (status == google.maps.GeocoderStatus.OK) {
								        if (results[1]) {
								        	address = results[1].formatted_address;
								        	var_search_marker.setTitle(address);	//重新設定標記點的title
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
		  //console.log("var_list==="+var_list);
		//console.log("var_list="+var_list.length);
		//adjustZoom(var_list);
		$('#mytab a:first').tab('show');
		
	}); //on click


	/**
	* When modal shown, reset the its content 
	*/	
	$('#tripmodals').on('shown.bs.modal', function (e) {
		$('.scrollable').scrollTop(0);
	});	

	/**
	* Click Tab to show its content 
	*/
	
	$("#mytab").on("click", "a", function(e) {
							$('.scrollable').scrollTop(0);
							e.preventDefault();
							$(this).tab('show');
						});

}(jQuery, google));
</script>
    	
</body>
</html>