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
<title>我的景點</title>
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
			<h4>我的景點</h4>
			<div class="row" id="listDetails">
				

			</div>
		
	</div>
	
	<jsp:include page="/fragment/bottom.jsp" />
	<script type="text/javascript">
		jQuery(document).ready(	function() {

							var count = 0;
							jQuery.ajax({
								url : "../controller/MySpotServlet",
								type : "GET",
								contentType : "application/json; charset=utf-8",
								async : false,
								dataType : "json",	
								data : {AccountId : "${user.accountId}"	},								
								success : function(data) {
									jQuery.each(data,function(index,value) {
										jQuery('#listDetails')
																.append(
																		"<div class='col-xs-3'><div class='thumbnail'><img src='http://placehold.it/300x300' alt=''><div class='caption'><h4><a href='#'>"
																				+ value.spotName
																				+ "</a></h4>"
																				+ value.spotIntro
																				+ "</div><div class='ratings'><p class='pull-right'>15 reviews</p><a class='icon' id='heart"+count+"' href=''><i id='social' class='fa fa-heart fa-2x'></i></a><a class='icon' id='thumbs' href=''><i id='social'class='fa fa-thumbs-up fa-2x '></i></a> <a class='icon' id='plus' href=''><i id='social' class='fa fa-plus fa-2x'></i></a></div></div></div>");
									count++;				
									});
								},
							});
							
							
							
							
							
							
							
							

						});
	</script>
</body>
</html>