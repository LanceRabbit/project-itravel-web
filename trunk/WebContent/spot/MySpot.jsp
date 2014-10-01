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
<title>Myspot</title>
<style type="text/css">
body {
	padding: 20px;
}
p { /*用於內文   多行文字溢出用...取代*/
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 4;
	-webkit-box-orient: vertical;
	display: -webkit-box;
}

h4 { /*用於標題   單行文字溢出用...取代*/
	white-space: nowrap;
	width: 100%; /* IE6 需要定义宽度 */
	overflow: hidden;
	-o-text-overflow: ellipsis; /* Opera */
	text-overflow: ellipsis; /* IE, Safari (WebKit) */
}

.col-xs-3{
width:220px;
height:330px;

}

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
	-webkit-transform: scale(1.2, 1.2);
    -ms-transform: scale(1.2, 1.2);
    transform: scale(1.2, 1.2);
    transition-duration: 0.3s;
    -webkit-transition-duration: 0.3s; /* Safari */
    box-shadow: 10px 10px 5px #888888;
    z-index: 1;
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
	function alter(id){
		//按下修改後做的事情
		//傳入的id是SpotId
		alert("修改"+id);
		jQuery.ajax({
			url : '<c:url value='controller/SpotAlterServlet' />',
			type : "GET",
			contentType : "application/json; charset=utf-8",
			async : false,
			dataType : "json",	
			data : {AccountId : "${user.accountId}",  
					SpotId:id},								
			success : function(data) {
				jQuery.each(data,function(index,value) {
					
				});
			},
		});
		
		
		
		
	}
	
	function delet(id){
		alert("刪除"+id);
		
	}
	</script>
	<script type="text/javascript">
		jQuery(document).ready(	function() {

							
			
							var count = 0;
							jQuery.ajax({
								url : '<c:url value='/controller/MySpotServlet' />',
								type : "GET",
								contentType : "application/json; charset=utf-8",
								async : false,
								dataType : "json",	
								data : {AccountId : "${user.accountId}"	},								
								success : function(data) {
									jQuery.each(data,function(index,value) {
										jQuery('#listDetails')
																.append(
																		"<div id='div"+count+"'class='col-xs-3'><div class='thumbnail'><img src='"+value.spotThumbnail+"' alt=''><div class='caption'><h4><a href='#'>"
																				+ value.spotName
																				+ "</a></h4><p>"
																				+ value.spotIntro
																				+ "</p></div><div class='ratings'><a class='btn btn-primary btn-sm' id='"+value.spotID+"' href='javascript: void(0);' onclick='alter(this.id)'><i  class='fa fa-pencil fa-lg'>修改</i></a><p class='pull-right'><a class='btn btn-danger btn-sm' id='"+value.spotID+"' href='javascript: void(0);' onclick='delet(this.id)'><i class='fa fa-trash-o fa-lg '>刪除</i></a></p></div></div></div>");
									count++;				
									});
								},
							});
							
							
							

						});
	</script>
</body>
</html>