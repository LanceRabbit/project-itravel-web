<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Spots</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />" />
<!--  <link rel="stylesheet" href="<c:url value="/css/bootstrap-theme.css" />" /> -->
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
/*移動到上方放大*/
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
	-webkit-transform: scale(1.1, 1.1);
    -ms-transform: scale(1.1, 1.1);
    transform: scale(1.1, 1.1);
    transition-duration: 0.3s;
    -webkit-transition-duration: 0.3s; 
    box-shadow: 10px 10px 5px #888888;
    z-index: 1;
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
	
	-moz-transform: scale(0.8);
	-o-transform: scale(0.8);
	-webkit-transition-duration: 0.5s;
	-moz-transition-duration: 0.5s;
	-o-transition-duration: 0.5s;
}
*/

#my-trip-map-container {
	height: 400px;
}

.modal.modal-wide .modal-dialog {
	width: 95%;
}
div.tabimg > img{
	width:100%;
	height:100px;
   
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
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp" />
	<!-- Page Content -->
<div class="container">
	<div class="row" id="showtrip">
	</div>
</div>
	<jsp:include page="/fragment/bottom.jsp" />

		<!-- Modal -->
		<div class="modal modal-wide fade" id="tripmodals">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="tripTitle" class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">1234</h4>
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
		
<div class="modal fade" id="modifyTripModal" tabindex="-1" role="dialog"
		aria-labelledby="addTripModal" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" style="text-align: center;" id="myModalLabel">修改行程</h4>
				</div>
				<div class="top-modal-body">
					<form action="<c:url value="/trip/modifyTripDetail.jsp"/>;"
						method="POST">
						<table>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="font-weight: bold; width: 75px">行程名稱：</td>
								<td><input type="text" id="modifytripName" name="modifytripName" class="top-form-control"
									required></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">起始日期：</td>
								<td><input id="modifyDate" type="text" name="modifyDate"
									class="top-form-control" required></td>
							</tr>
							
							<tr>
								<td>&nbsp;</td>
								<td><input id="totalDays" name="totalDays" type="text" hidden></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><input id="modfiyTripId" name="modfiyTripId" type="text" hidden></td>
							</tr>
						</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" 
						data-dismiss="modal">取消</button>
					<input type="submit" class="btn btn-info" value="繼續" />
					
				</div>
				</form>
			</div>
		</div>
	</div>		
		
<script src="${pageContext.request.contextPath}/js/bootbox.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.datetimepicker.js"></script>
<script>


/* 			var contentString = '<div id="mapInfo">'
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
						maxWidth : 200,
						maxHeight : 200
					});

			google.maps.event.addListener(var_marker, 'click', function() {
				var_infowindow.open(var_map, var_marker);
			}); */
		//}


</script>

<script type="text/javascript">
(function(jQuery){

	$.ajax({
		
		 url: "<c:url value='/controller/TripServlet' />",
		 type:"post",
		 async : false,
		 data : {AccountId : "${user.accountId}"},
		 dataType:"json", //xml,text
		 success:function(data){
			 console.log("get data from server....");
			 //console.log(data);
			 //count = 1 ;
			 $.each(data,function(index,value){

			 	$("#showtrip").append("<div name='test' id='"+value.tripId+"' class='col-xs-4'><div class='jm-item second'><div class='jm-item-wrapper'>"
						+"<div class='thumbnail'>"
						+"<div class='jm-item-image'><a href='#tripmodals' data-toggle='modal' data-target='#tripmodals'>"
						+"<img class='img-portfolio img-responsive' src='<c:url value='/controller/TripImageServlet?id="
						+value.tripId+"'/>' style='width:330px; height:220px;'></a></div>"
						+"<div class='jm-item-title'>"
						+value.tripName+"</div><div ><h5 style='text-align:right;'>行程天數:"
						+value.totalDay+"</h5><h5 style='text-align:right;'>遊玩日期:"+value.startDate+"</h5></div>"
						+"</div><div style='text-align:right;'>"
						+"<a class='btn btn-primary btn-sm modify' id='"
						+value.tripId+"'  href='javascript: void(0);'>"						
						+"<i  class='fa fa-pencil fa-lg' style='margin-left:5px;'>修改</i></a>"						
						+"<a class='btn btn-danger btn-sm delete' id='"+value.tripId+"'"
						+" href='javascript: void(0);'><i class='fa fa-trash-o fa-lg ' style='margin-left:5px;'>"
						+"刪除</i></a></div>"
						+"<span id='tripId' hidden>"+value.tripId+"</span>"+
						"<span id='tripName' hidden>"+value.tripName+"</span>"+
						"<span id='startDate' hidden>"+value.startDate+"</span>"+
						"<span id='totalDay' hidden>"+value.totalDay+"</span>"+
						"</div></div>");
			 	//count++;
			 });	
		 }
	 });  //--ajax

		var var_list = [];
		var var_my_trip_map;
		var var_my_trip_location = new google.maps.LatLng(23.973299, 120.978398);
		var var_my_trip_marker;
		var var_my_trip_infowindow = new google.maps.InfoWindow();  
		google.maps.event.addDomListener(window, 'load', my_trip_map_init);

		//start of modal google map
		$('#tripmodals').on('shown.bs.modal', function() {
			google.maps.event.trigger(var_my_trip_map, "resize");
			var_my_trip_map.setCenter(var_my_trip_location);
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
	

	 
	 $("#showtrip").on("click",".modify", function(e) {
			var tripId = $("#"+($(this).parent().parent().parent().parent().attr("id"))+" span:first").text();
			var totalDay =$("#"+($(this).parent().parent().parent().parent().attr("id"))+" span:last").text();
			var tripName = $("#"+($(this).parent().parent().parent().parent().attr("id"))+" span:eq(1)").text();
			var startDate = $("#"+($(this).parent().parent().parent().parent().attr("id"))+" span:eq(2)").text();
			console.log(tripId);
			console.log(totalDay);
			console.log(tripName);
			console.log(startDate);
		 console.log("Modify");
		 //console.log($(this).attr("id"));
		
		 $("#modifytripName").val(tripName);
		 var transferDay = new Date(startDate);
		 var setDay = transferDay.getFullYear()+"/"+(transferDay.getMonth()+1)+"/"+padLeft(transferDay.getDate(),2)
		 $("#modfiyTripId").val(tripId);
		 $("#totalDays").val(totalDay);
		 $("#modifyDate").val(setDay);
		 $('#modifyTripModal').modal('show');
		 //$('#'+$(this).attr("id")+' #modify'+$(this).attr("id")).submit();
		 e.stopPropagation();
	 });
	 //add 0 on str left side when the str is not enough Double-digit
	 function padLeft(str, len) {
		    str = '' + str;
		    if (str.length >= len) {
		        return str;
		    } else {
		        return padLeft("0" + str, len);
		    }
		}
	 
		// trip related
	 jQuery('#modifyDate').datetimepicker({
	  format:'Y/m/d',
	  startDate:0,
      minDate:false,
	  closeOnDateSelect:true,
	  onShow:function( ct ){
	  },
	  timepicker:false
 });
	 $("#showtrip").on("click",".delete", function(e) {
		 e.stopPropagation();
		 console.log("Delete");
		 console.log($(this).attr("id"));
		 var tripId = $(this).attr("id");
			bootbox.dialog({
				  message: "確定刪除行程表? ",
				  buttons: {
				    cancel: {
				      label: "取消",
				      className: "btn btn-default",
				      callback: function() {
				    	  console.log("do nothing");  
				      }
				    },
				    confirm: {
				      label: "確定",
				      className: "btn btn-info",
				      callback: function() {
				    	  //window.location.href = '<c:url value="/first.jsp"/>';
				    	  jQuery.ajax({
								url:"<c:url value='/control/DeleteTripServelt' />",
								type:"POST",
								//contentType:"text/html; charset=utf-8",
								data:{TripId:tripId},
								dataType : "text"
							}).done(function(data) {
								var result = String(data);
								if(result == 'true' ) {
									window.location.reload();
								} else {
									
								}
							});
				      }
				    }
				  }
				});
		 
		 
	
	 });
	 
	 $("#showtrip").on("click",".jm-item-image", function() {
		 my_trip_map_init();
		var tripId = $("#"+($(this).parent().parent().parent().parent().attr("id"))+" span:first").text();
		var totalDay =$("#"+($(this).parent().parent().parent().parent().attr("id"))+" span:last").text();
		var tripName = $("#"+($(this).parent().parent().parent().parent().attr("id"))+" span:eq(1)").text();
		console.log(tripId);
		console.log(totalDay);
		console.log(tripName);
		console.log("AAAAA="+$(this).parent().parent().parent().parent().attr("id"));
		
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
								
							
								var_my_trip_location = new google.maps.LatLng(value.Lat,value.Lng)
								var_my_trip_marker = new google.maps.Marker({
												position : var_my_trip_location,
												map : var_my_trip_map,
												title : value.spotName,
												maxWidth : 200,
												maxHeight : 200
											});
								google.maps.event.addListener(var_my_trip_marker, 'click', function() {
									spotInfo(var_my_trip_map,value,var_my_trip_marker);
								});
			
								
						    count++;
							$('#day' + dayNum).tab('show');	 
					 });//.each	
				 }
			 });//ajax

		}//for loop
		
		$('#mytab a:first').tab('show');
		
	}); //on click
	function infoContent(spotObj) {
		
		//<img src=""
		//設定資訊視窗內容要呈現什麼	
		 var html = "<div style='width:100px; height:100px;'>";
		 html += "<img src='<c:url value='/controller/TripDetailImageServlet?id="+spotObj.spotId+"&index=1'/>' style='max-width:100%; max-height:100%;margin:auto;display:block;'></div>";
		 //html += "<img src='"+ neighbor.spotThumbnail + "' style='max-width:100%; max-height:100%;margin:auto;display:block;'></div>";
		 html += "<div>" + spotObj.spotName + "</div>";
		 
		 return html;
	}
	  
	function spotInfo(mapObj , spotObj, marker) {
		/*
		console.log("showInfo : " + mapObj);
		console.log("showInfo : " + markerObj);
		console.log("name : " + neighbor.spotName);
		console.log("thumbnail : " + neighbor.spotThumbnail);
		*/
		
		//開啟資訊視窗		
		 if (var_my_trip_infowindow)
			 var_my_trip_infowindow.close();
		
		var_my_trip_infowindow.setContent(infoContent(spotObj));
		var_my_trip_infowindow.open(mapObj, marker);			
	}

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