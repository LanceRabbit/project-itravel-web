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

 .container {
    margin-top: 10px;
}
.nav-tabs > li {
    position:relative;
}
.nav-tabs > li > a {
    display:inline-block;
}
.nav-tabs > li > span {
    display:none;
    cursor:pointer;
    position:absolute;
    right: 6px;
    top: 8px;
    color: red;
}
.nav-tabs > li:hover > span {
    display: inline-block;
}
</style>


</head>
<body>
	<div class="container">
		<ul class="nav nav-tabs" role="tablist">
        <li class="active"><a href="#contact_01" data-toggle="tab">Joe Smith</a><span>x</span>
        </li>
        <li><a href="#contact_02" data-toggle="tab">Molly Lewis</a>  <span> x </span> 
        </li>
        <li><a href="#" class="add-contact">+ Add Contact</a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="contact_01">Contact Form: Joe Smith</div>
        <div class="tab-pane" id="contact_02">Contact Form: Molly Lewis</div>
    </div>
	</div>
<form action="<c:url value="/pages/product.controller" />" method="post">
	<input type="hidden" name="">
<table>
	<tr>
		<td>ID : </td>
		<td><input type="text" name="tripName" value="${param.tripName}"></td>
	</tr>
	<tr>
		<td>Name : </td>
		<td><input type="text" name="date_timepicker_start" value="${param.date_start}"></td>
		<td></td>
	</tr>

	<tr>
		<td>Price : </td>
		<td><input type="text" name="date_timepicker_end" value="${param.date_end}"></td>
	</tr>
	<tr>
		<td>
			<input type="submit" name="prodaction" value="Insert">
			<input type="submit" name="prodaction" value="Update">
		</td>
		<td>
			<input type="submit" name="prodaction" value="Delete">
			<input type="submit" name="prodaction" value="Select">
			<input type="button" value="Clear" onclick="clearForm()">
		</td>
	</tr>
</table>

</form>

<script>
(function($) {

	$(document).ready(function() {
		$(".nav-tabs").on("click", "a", function (e) {
	        e.preventDefault();
	        if (!$(this).hasClass('add-contact')) {
	            $(this).tab('show');
	        }
	    })
	    .on("click", "span", function () {
	        var anchor = $(this).siblings('a');
	        $(anchor.attr('href')).remove();
	        $(this).parent().remove();
	        $(".nav-tabs li").children('a').first().click();
	    });

	$('.add-contact').click(function (e) {
	    e.preventDefault();
	    var id = $(".nav-tabs").children().length; //think about it ;)
	    var tabId = 'contact_' + id;
	    $(this).closest('li').before('<li><a href="#contact_' + id + '">New Tab</a> <span> x </span></li>');
	    $('.tab-content').append('<div class="tab-pane" id="' + tabId + '">Contact Form: New Contact ' + id + '</div>');
	   $('.nav-tabs li:nth-child(' + id + ') a').click();
	});
	});
})(jQuery);
</script>
</body>
</html>