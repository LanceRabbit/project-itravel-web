<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Collect</title>
</head>
<body>
<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp"/>
	<!-- Page Content -->
	<div class="container">		
			<h4>我的收藏</h4>
			<div class="row" id="listDetails">

			</div>
		
	</div>
	
	<jsp:include page="/fragment/bottom.jsp" />
	
	<script type="text/javascript">
		jQuery(document).ready(	function() {

							
			
							var count = 0;
							jQuery.ajax({
								url : '<c:url value='/controller/MyCollectServlet' />',
								type : "GET",
								contentType : "application/json; charset=utf-8",
								async : false,
								dataType : "json",	
								data : {AccountId : "${user.accountId}"	},								
								success : function(data) {									
									if(data){
										jQuery.each(data,function(index,value) {				
										
											jQuery('#listDetails').append("<div id='div"+count+"'class='col-xs-3'><div class='thumbnail'><img src='http://placehold.it/300x300' alt=''><div class='caption'><h4><a href='#'>"
																	+ value.spotName
																	+ "</a></h4>"
																	+ value.spotIntro
																	+ "</div><div class='ratings'><p class='pull-right'><a class='btn btn-danger btn-sm' id='"+value.spotId+"' href='javascript: void(0);' onclick='delet(this.id)'><i class='fa fa-trash-o fa-lg '>取消收藏</i></a></p></div></div></div>");
											count++;
											
										});
									}else{											
											jQuery('#listDetails').append("<div class='col-xs-3'><div class='thumbnail'><img src='http://placehold.it/300x300' alt=''><div class='caption'><h4><a>無收藏景點</a></h4>無收藏景點資訊</div><div class='ratings'><p class='pull-right'></p></div></div></div>");	
											
									
									}
								},
							});
							
							
							

						});
	</script>
	
</body>
</html>