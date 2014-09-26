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

.scrollable {
    height: auto;
    max-height: 150px;
    overflow-x: hidden;
    overflow-y:auto
}
</style>
</head>

<body>
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp" />
	<!-- Page Content -->

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
	
	<div class="container">
		<div class="row" id="listTrips">
		</div>	
	</div>
	
<jsp:include page="/fragment/bottom.jsp" />
<script>
$(document).ready(function() {
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

		 	$("#listTrips").append("<div id='"+count+"' class='col-xs-3 temp'>"
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
	});
	
	
});
(function(jQuey){

	//根據 天數去做搜尋,若click同一個欄位則不執行搜尋
	$("#dayMenu .dropdown-menu li").click(function(){
		console.log($(this).text());
		console.log($(this).val());
		($("#day").val()==$(this).text())?true:
			$.ajax({
				type : "POST",
				url : '<c:url value='/controller/SearchTripServlet' />',
				data : {
					day : $(this).val()
				},
				async : false
			}).done(function(data) {
				//console.log("detail from server....." + data);
				$('#listTrips').empty();
				 count = 1 ;
				$.each(data,function(index,value){

				 	$("#listTrips").append("<div id='"+count+"' class='col-xs-3 temp'>"
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
			}); //end Ajax
		$("#day").val($(this).text());
	}); //end--- $("#dayMenu .dropdown-menu li")  
	
	$("#tripName").change(function(){
		console.log($(this).val());
		console.log($(this).text());
	});
	function activeQuery() {
		var spotName = jQuey('#spotName').val();
		//console.log("spotName : " + spotName);
		var city = jQuey("#city").val();
		//console.log("city : " + city);
		var category = jQuey('#category').val();
		//console.log("category : " + category);
		var subcategory = jQuey('#subcategory').val();
		//console.log("subcategory : " + subcategory);

		$.ajax({
			type : "POST",
			url : '<c:url value='/controller/SearchTripServlet' />',
			data : {
				spotName : spotName,
				city : city,
				category : category,
				subcategory : subcategory
			}
		}).done(function(data) {
			//console.log("detail from server....." + data);
			$('#listDetails').empty();	
			$.each(data, function(index, value){

			});
		});
	}

	}(jQuery));
</script>
    	
</body>
</html>