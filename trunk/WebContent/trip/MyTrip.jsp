<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>This is a test page.</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
<style>
#map-container {
	height: 400px;
}

.modal.modal-wide .modal-dialog {
	width: 95%;
}
div.tabimg > img{
	width:100%;
	height:100px;
   
}
.temp{
width:390px; 
height:483px;
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
/* 
    Only Needed in Multi-Coloured Variation 
                                               */
.social-fb:hover {
	color: #3B5998;
}

.social-tw:hover {
	color: #4099FF;
}

.social-gp:hover {
	color: #d34836;
}

.social-em:hover {
	color: #f39c12;
}

</style>
</head>
<body>
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp"/>
	<!-- Page Content -->
	<h3>測試取得的資料</h3>
	AccountId= ${user.accountId}
<div class="container">
	<div class="row" id="showtrip">
	</div>
</div>
	<jsp:include page="/fragment/bottom.jsp" />

		<!-- Modal -->
		<div class="modal modal-wide fade" id="tripmodals">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
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
									<div id="map-container" ></div>
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
		var var_map;
		var var_location = new google.maps.LatLng(45.430817, 12.331516);

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
						maxWidth : 200,
						maxHeight : 200
					});

			google.maps.event.addListener(var_marker, 'click', function() {
				var_infowindow.open(var_map, var_marker);
			});
		}

		google.maps.event.addDomListener(window, 'load', map_init);

		//start of modal google map
		$('#tripmodals').on('shown.bs.modal', function() {
			google.maps.event.trigger(var_map, "resize");
			var_map.setCenter(var_location);
		});

	</script>

<script type="text/javascript">
$(document).ready(function() {

	$.ajax({
		
		 url: "<c:url value='/controller/TripServlet' />",
		 type:"post",
		 async : false,
		 data : {AccountId : "${user.accountId}"},
		 dataType:"json", //xml,text
		 success:function(data){
			 console.log("get data from server....");
			 console.log(data);
			 count = 1 ;
			 $.each(data,function(index,value){

			 	$("#showtrip").append("<div id='"+count+"' class='col-xs-4 temp'>"
						+"<div class='thumbnail'>"
						+"<div style='border-bottom: 1px solid; margin-bottom:5px'><h4>"
						+value.tripName+"</h4></div>"
						+"<a href='#tripmodals' data-toggle='modal' data-target='#tripmodals'>"
						+"<img src='<c:url value='/controller/TripImageServlet?id="
						+value.tripId+"'/>'></a><div ><h5>行程天數:"
						+value.totalDay+"</h5></div>"
						+"<div class='ratings'>"
						+"<a class='btn btn-primary btn-sm modify' id='"
						+value.tripId+"' href='javascript: void(0);'>"
						+"<i  class='fa fa-pencil fa-lg'>修改</i></a>"
						+"<p class='pull-right'>"
						+"<a class='btn btn-danger btn-sm delete' id='"+value.tripId+"'"
						+" href='javascript: void(0);'><i class='fa fa-trash-o fa-lg '>"
						+"刪除</i></a></p>"
						+"<span id='tripId' hidden>"+value.tripId+"</span>"+
						"<span id='tripName' hidden>"+value.tripName+"</span>"+
						"<span id='totalDay' hidden>"+value.totalDay+"</span>"+
						"</div></div>");
						
				 count++;
			 });	
		 }
	 });  //--ajax
	 
	 $("#showtrip").on("click",".modify", function(e) {
		 e.stopPropagation();
		 alert("modify check"+ ($("#"+($(this).index()+1)+" span:first").text()));
	 });
	 
	 $("#showtrip").on("click",".delete", function(e) {
		 e.stopPropagation();
		 
		 alert("delete check" + $("#"+($(this).index()+1)+" span:first").text());
	 });
	 
	$("#showtrip").on("click",".temp", function() {
		var tripId = $("#"+($(this).index()+1)+" span:first").text();
		var totalDay =$("#"+($(this).index()+1)+" span:last").text();
		var tripName = $("#"+($(this).index()+1)+" span:eq(1)").text();
		console.log(tripId);
		//console.log(totalDay);
		//console.log(tripName);
		
		// when .modal-wide opened, set content-body height based on browser height; 
		// 200 is appx height of modal padding, modal title and button bar
		var height = $(window).height() - 200;
		$(this).find(".modal-body").css("max-height",
				height);
		
		//According to trip day to dynamic create Tabs. 
		$("#mytab , #tabContent ").empty();
		 console.log()
		$(".modal-header").html('<h4 class="modal-title">'
				+$("#"+($(this).index()+1)+" span:eq(1)").text()+
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
					 console.log("get data from server....");
					 console.log(data);
					 console.log(data.length);
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
							        				+'<div class="title"><label>'+value.spotAddress+'</label></div>'
							       			 		+'<div class="title"><label>'+value.stayTime+'</label></div>'
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
								        +'<div class="title"><label>'+value.spotAddress+'</label></div>'
								        +'<div class="title"><label>'+value.stayTime+'</label></div>'
								        +'</div></div>'
								    	+'</div><')
							) ;
						    count++;
							$('#day' + dayNum).tab('show');	 
					 });//.each	
				 }
			 });//ajax

		}//for loop
		
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
});
</script>

</body>
</html>