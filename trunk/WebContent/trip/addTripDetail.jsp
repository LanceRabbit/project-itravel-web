<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- 如果從Google下載失敗，我們就從自己的Server上下載jQuery.js檔 -->
<script>!window.jQuery && document.write("<script src='${pageContext.request.contextPath}/js/jquery-1.11.1.min.js'><\/script>")</script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/css/jquery.datetimepicker.css"/>" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery.datetimepicker.js"></script>
<style>
#myModalLabel {
	text-align: center;
	font-family: 微軟正黑體;
	font-weight: bold;
}

#createtrip {
	margin: 5px;
	padding: 5px;
}

.form-control {
	font-size: 20px;
}

.modal-body {
	font-size: 20px;
	font-family: 微軟正黑體;
}
</style>


</head>
<body>
	<div class="container">
		<a href="javascript:;" id="btnAddPage" role="button">Add Page</a>  
		<ul id="pageTab" class="nav nav-tabs">
			<li class="active"><a href="http://junaidqadir.com/backyard/bootstrap_add_rmove_tabs/#page1" data-toggle="tab">Page1</a></li>
		</ul>
		<div id="pageTabContent" class="tab-content">
			<div class="tab-pane active" id="page1">
			Content Page1
			</div>
		</div>
	</div>
<script>
(function($) {

})(jQuery);
</script>
</body>
</html>