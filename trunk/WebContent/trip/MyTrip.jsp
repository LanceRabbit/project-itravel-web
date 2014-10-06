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
.thumbnail {
    margin: 10px 10px 10px 10px;
    -webkit-transform: scale(1, 1);
    -ms-transform: scale(1, 1);
    transform: scale(1, 1);
    transition-duration: 0.3s;
    -webkit-transition-duration: 0.3s; /* Safari */
    }

.thumbnail:hover {
	cursor: pointer;
	-webkit-transform: scale(1.1, 1.1);
    -ms-transform: scale(1.1, 1.1);
    transform: scale(1.1, 1.1);
    transition-duration: 0.3s;
    -webkit-transition-duration: 0.3s; /* Safari */
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
	/* Browser Variations: */
	-moz-transform: scale(0.8);
	-o-transform: scale(0.8);
	-webkit-transition-duration: 0.5s;
	-moz-transition-duration: 0.5s;
	-o-transition-duration: 0.5s;
}


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
</style>
</head>

<body>
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp" />
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
<script src="${pageContext.request.contextPath}/js/bootbox.min.js"></script>
<script>
	var var_map;
	var var_location = new google.maps.LatLng(23.973299, 120.978398);
	var var_marker;

	google.maps.event.addDomListener(window, 'load', map_init);

	//start of modal google map
	$('#tripmodals').on('shown.bs.modal', function() {
		google.maps.event.trigger(var_map, "resize");
		var_map.setCenter(var_location);
	});

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
					.getElementById("my-trip-map-container"), var_mapoptions);

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
		}


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
			 console.log(data);
			 //count = 1 ;
			 $.each(data,function(index,value){

			 	$("#showtrip").append("<div name='test' id='"+value.tripId+"' class='col-xs-3'>"
						+"<div class='thumbnail'>"
						+"<div style='border-bottom: 1px solid; margin-bottom:5px'><h4>"
						+value.tripName+"</h4></div>"
						+"<a href='#tripmodals' data-toggle='modal' data-target='#tripmodals'>"
						+"<img  class='temp' src='<c:url value='/controller/TripImageServlet?id="
						+value.tripId+"'/>'></a><div ><h5>行程天數:"
						+value.totalDay+"</h5></div>"
						+"<div class='ratings' >"
						+"<a class='btn btn-primary btn-sm modify' id='"
						+value.tripId+"'  href='javascript: void(0);'>"
						+"<i  class='fa fa-pencil fa-lg'>修改</i></a>"
						+"<p class='pull-right'>"
						+"<a class='btn btn-danger btn-sm delete' id='"+value.tripId+"'"
						+" href='javascript: void(0);'><i class='fa fa-trash-o fa-lg '>"
						+"刪除</i></a></p>"
						+"<span id='tripId' hidden>"+value.tripId+"</span>"+
						"<span id='tripName' hidden>"+value.tripName+"</span>"+
						"<span id='totalDay' hidden>"+value.totalDay+"</span>"+
						"</div></div>");
						
				 //count++;
			 });	
		 }
	 });  //--ajax

	
	 $("#showtrip").on("click",".modify", function(e) {
		 console.log("Modify");
		 e.stopPropagation();
	 });
	 
	 $("#showtrip").on("click",".delete", function(e) {
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
		 
		 
		 e.stopPropagation();
	 });
	 
	 $("#showtrip").on("click",".temp", function() {
		var tripId = $("#"+($(this).parent().parent().parent().index()+1)+" span:first").text();
		var totalDay =$("#"+($(this).parent().parent().parent().index()+1)+" span:last").text();
		var tripName = $("#"+($(this).parent().parent().parent().index()+1)+" span:eq(1)").text();
		console.log(tripId);
		console.log(totalDay);
		console.log(tripName);
		console.log($(this).parent().parent().parent().index());
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
}(jQuery, google));
</script>

</body>
</html>