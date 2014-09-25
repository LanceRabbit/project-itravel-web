<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>searchSpot</title>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<style type="text/css">
body {
	padding: 20px;
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
</style>
<body>
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp" />
	<!-- Page Content -->


	<h3>測試取得的資料</h3>

	<div class="container">
		<h4>找景點</h4>
		<div class="row" id="listDetails"></div>

	</div>

	<jsp:include page="/fragment/bottom.jsp" />

	<script type="text/javascript">
		function like(id) {
			//傳入的id是SpotId				
			console.log(document.getElementById(id));
			//按讚
			if(jQuery("#"+id).attr("class")=="fa fa-heart fa-2x"){
				//換heart-o圖
				jQuery("#"+id).removeAttr("class");
				jQuery("#"+id).addClass("fa fa-heart-o fa-2x");
				
				jQuery.ajax({
					url : '<c:url value='/controller/AddLikeServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",
					async : false,
					dataType : "json",	
					data : {SpotId:id},						
					success : function(data) {						
						
														
					}				
				});				
			}else{ //取消按讚
				//換heart圖
				$("#"+id).removeAttr("class");
				$("#"+id).addClass("fa fa-heart fa-2x");
				jQuery.ajax({
					url : '<c:url value='/controller/DeletLikeServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",
					async : false,
					dataType : "json",	
					data : { 
							SpotId:id},						
					success : function(data) {						
						
															
					}				
				});				
				
			}
			

		}

		function collect(id) {
			console.log(id);

		}
	</script>

	<script type="text/javascript">
		jQuery(document)
				.ready(
						function() {

							jQuery
									.ajax({
										url : "../controller/SearchSpotTestServlet",
										type : "GET",
										contentType : "application/json; charset=utf-8",
										async : false,
										dataType : "json",
										success : function(data) {
											jQuery
													.each(
															data,
															function(index,
																	value) {
																if (value.spotThumbnailURL) {
																	jQuery(
																			'#listDetails')
																			.append(
																					"<div class='col-xs-3'><div class='thumbnail'><img src='"+value.spotThumbnailURL+"' alt=''><div class='caption'><h4><a href='#'>"
																							+ value.spotName
																							+ "</a></h4>"
																							+ value.spotIntro
																							+ "</div><div class='ratings'><p class='pull-right'>15 reviews</p><a id='social' href='javascript: void(0);' ><i id='"
																							+ value.spotID
																							+ "' class='fa fa-heart fa-2x' onclick='like(this.id)'></i></a><a id='social' href='javascript: void(0);' ><i id='"
																							+ value.spotID
																							+ "' class='fa fa-plus fa-2x' onclick='collect(this.id)'></i></a></div></div>"

																			);

																}
															});

										},
									});

						});
	</script>

</body>
</html>