<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>This is a test page.</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="../css/bootstrap.css" />
<link rel="stylesheet" href="../css/bootstrap-theme.css" />
<link rel="stylesheet" href="../css/jquery.datetimepicker.css" />

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<!-- 如果從Google下載失敗，我們就從自己的Server上下載jQuery.js檔 -->
<script>
	!window.jQuery && document.write("<script src='js/jquery-1.11.1.min.js'><\/script>")
</script>
<script src="../js/bootstrap.js"></script>
	<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
<style>
#map-container {
	height: 450px
}

.modal.modal-wide .modal-dialog {
	width: 90%;
}

.modal-wide .modal-body {
	overflow-y: auto;
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
body {
	text-align: center;
}

body p {
	max-width: 400px;
	margin: 20px auto;
}


.title {
    width:300px;
  
    text-align:left;
    padding-left:40px;
}

	


#tallModal .modal-body p {
	margin-bottom: 900px;
	
	
}
#mapmodals .modal-body {
 margin: 1px;
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
<div class="row" id="showTrip">
</div>



		<!-- Modal -->
		<div class="modal modal-wide fade" id="mapmodals">
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
								<div class="col-sm-4"  >
									<ul class="nav nav-tabs" id="myTab" style=" margin: 0px;">
									<li class="active"><a data-toggle="tab" href="#page1">Home</a></li>
									</ul>

									<div class="tab-content scrollable" id="tabContent" >
									<div class="tab-pane active" id="page1" autofocus="">1234</div>
									</div>
								</div>
								<div class="col-sm-8" style=" border: 1px solid; padding: 0px ;" >
									<div id="map-container" style="margin: 0px; padding: 0px;content: 0px;"></div>
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
	</div>
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
		$('#mapmodals').on('shown.bs.modal', function() {
			google.maps.event.trigger(var_map, "resize");
			var_map.setCenter(var_location);
		});

	</script>

<script type="text/javascript">
		$(document).ready(function() {

			$.ajax({
				 url:"../controller/TripServlet",
				 type:"post",
				 async : false,
				 data : {AccountId : "${user.accountId}"	},
				 dataType:"json", //xml,text
				 success:function(data){
					 console.log("get data from server....");
					 console.log(data);
					 count = 1 ;
					 $.each(data,function(index,value){
						 //console.log(value.tripId);
						 //console.log(value.tripName);
						 //console.log(value.totalDay);
						 //console.log(value.startDate);
						 
					/* 	 "<div id="+count+" class='col-xs-3'><a href='#mapmodals' "
								 			+"'data-toggle='modal' data-target='#mapmodals'><div class='thumbnail'><img src='http://placehold.it/300x300' alt=''><div class='caption'><h4><a href='#'>"
											+ value.tripName
											+ "</a></h4>"
											+ value.totalDay
											+ "</div><div class='ratings'><p class='pull-right'>15 reviews</p><a class='icon' id='heart"
											+count+"' href=''><i id='social' class='fa fa-heart fa-2x'></i>"
											+"</a><a class='icon' id='thumbs' href=''><i id='social'class='fa fa-thumbs-up fa-2x '>"
											+"</i></a> <a class='icon' id='plus' href=''><i id='social' class='fa fa-plus fa-2x'>"
											+"</i></a></div></div></div>" */

					 		 
							
						 		
								 	$("#showTrip").append('<div id="'+count+'" class="col-xs-3">'+
											'<a href="#mapmodals" '+
											'data-toggle="modal" data-target="#mapmodals"><div class="thumbnail">'
											+'<img src="<c:url value="/controller/TripImageServlet?id='
											+value.tripId+'"/>""></a><div class="caption"><h4>'
											+value.tripName+'</h4></div></div>'
											+'<span id="tripId" hidden>'+value.tripId+'</span>'+
											'<span id="tripName" hidden>'+value.tripName+'</span>'+
											'<span id="totalDay" hidden>'+value.totalDay+'</span>'+
											'</div>')
								

						 count++;
					 });	
				 }
			 });
			$("#showTrip").on("click","div", function() {
				//console.log($(this).index());
				var tripId = $("#"+($(this).index()+1)+" span:first").text();
				var totalDay =$("#"+($(this).index()+1)+" span:last").text();
				var tripName = $("#"+($(this).index()+1)+" span:eq(1)").text();
				console.log(tripId);
				console.log(totalDay);
				console.log(tripName);
				//console.log($("#"+($(this).index()+1)+" span:first").text());
				//console.log($("#"+($(this).index()+1)+" span:eq(1)").text());
				//console.log($("#"+($(this).index()+1)+" span:last").text());
				
				var height = $(window).height() - 200;
				$(this).find(".modal-body").css("max-height",
						height);
				//According to trip day to dynamic create Tabs. 
				$("#myTab , #tabContent ").empty();
				 console.log()
				$(".modal-header").html('<h4 class="modal-title">'
						+$("#"+($(this).index()+1)+" span:eq(1)").text()+
						'</h4>');
				
				for(var dayNum=1,max=$("#"+($(this).index()+1)+" span:last").text();dayNum<=max;dayNum++) { 
					
					$('#myTab').append(
							$('<li><a href="#day' 
									+ dayNum 
									+ '">' 
									+'Day ' 
									+ dayNum 
									+'</a></li>'));
					
					$.ajax({
						 url:"../controller/TripDetailServlet",
						 type:"post",
						
						 data:{"TripId":tripId,"totalDay":dayNum},
						 dataType:"json", //xml,text
						 async: false,
						 success:function(data){
							 console.log("get data from server....");
							 console.log(data);
							 count = 1 ;
							 $.each(data,function(index,value){
								 console.log(value.spotName);
								 console.log(value.spotId);
								 console.log(value.spotAddress);
								 console.log(value.stayTime);
								 //console.log(value.startDate);
							
										
									(count==1) ?	
										$('#tabContent').append(
											$('<div class="tab-pane" id="day' + dayNum +
											'">	<div class="row" style="border: 1px solid;">' 
											+'<div class="col-sm-3"  style="padding:5px" >'
											+'<img src="<c:url value="/controller/TripDetailImageServlet?id='
											+value.spotId+'&index=1"/>" width="130" height="95" alt="map Venice"'
											+'title="click to open Map"/>'
											+'</div>'
											+'<div class="col-sm-9" style="padding:1px">'
											+'<div class="row">'
											+'<div class="title"><label>'+value.spotName+'</label></div>'
									        +'<div class="title"><label>'+value.spotAddress+'</label></div>'
									        +'<div class="title"><label>'+value.stayTime+'</label></div>'
									        +'</div></div>'+
									        +'</div></div>')
										) 
										:
										$('#day'+dayNum).append(
											$('<div class="row" style="border-bottom: 1px solid;">' 
													+'<div class="col-sm-3"  style="padding:5px">'
													+'<img  style="  content: 0px;" src="<c:url value="/controller/TripDetailImageServlet?id='
													+value.spotId+'&index=1"/>" width="130" height="95" alt="map Venice"'
													+'title="click to open Map"/>'
													+'</div>'
													+'<div class="col-sm-9" style="padding:1px">'
													+'<div class="row">'
													+'<div class="title"><label>'+value.spotName+'</label></div>'
											        +'<div class="title"><label>'+value.spotAddress+'</label></div>'
											        +'<div class="title"><label>'+value.stayTime+'</label></div>'
											        +'</div></div>'
											    	+'</div>')
										) ;
									    count++;
										$('#day' + dayNum).tab('show');	 
							
							 });	
						 }
					 });
					
				
						

				} 
				$('#myTab a:first').tab('show');
				
			})


/**
* When modal shown, reset the its content 
*/	
$('#mapmodals').on('shown.bs.modal', function (e) {
	$('.scrollable').scrollTop(0);
})	

/**
* Click Tab to show its content 
*/

	$("#myTab").on("click", "a", function(e) {
							$('.scrollable').scrollTop(0);
							e.preventDefault();
							$(this).tab('show');
						});
					});
</script>	
<script>
// when .modal-wide opened, set content-body height based on browser height; 
// 200 is appx height of modal padding, modal title and button bar

	$(function() {
		

});
</script>	
</body>


</html>