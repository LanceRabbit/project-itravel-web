<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

<link href="<c:url value="/css/jquery.datetimepicker.css"/>" rel="stylesheet">
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
<style>
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

.trip-name {
	text-align: center;
}
</style>


</head>
<body>
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp"/>
	<!-- Page Content -->
	<div class="container thumbnail">
	<div class="trip-name">
		<h4>${param.tripName}</h4>
		<span id='tripId' hidden>${param.tripName}</span>
		<span id='tripName' hidden>${param.dateStart}</span>
		<span id='totalDay' hidden>${param.totalDay}</span>
	</div>
	<div class="row"> 
			<div class='col-xs-6'>
			<ul id="pageTab" class="nav nav-tabs" role="tablist">
		        <li class="active"><a href="#contact_1" data-toggle="tab">Day1</a>
		        </li>
		        <li><a href="#contact_2" data-toggle="tab">Day2</a>  <span> x </span> 
		        </li>
		        <li><a href="#add-tab" id ="add-tab" class="add-contact">+</a>
		        </li>
		    </ul>
		    <div id="pageContent" class="tab-content">
		        <div class="tab-pane active" id="contact_1">Contact Form: Day1</div>
		        <div class="tab-pane" id="contact_2">Contact Form: Day2</div>
		    </div>
	</div>
	<div class="clearfix visible-xs-block"></div>
	<div id="test" class='col-xs-6'>
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
	</div>
	</div>
	<div class="modal-footer">
		<button id="test"  type="button" class="btn btn-default" 
				">取消</button>
		<input type="submit" class="btn btn-info" value="繼續" />
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- 如果從Google下載失敗，我們就從自己的Server上下載jQuery.js檔 -->
<script>!window.jQuery && document.write("<script src='${pageContext.request.contextPath}/js/jquery-1.11.1.min.js'><\/script>")</script>

<script src="${pageContext.request.contextPath}/js/jquery.datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script>

	jQuery(document).ready(function() {
		$("#test").click(function(){
			console.log("kkkkkkkkkkkkkkkkk");
			like = $("#backToFirst").attr("href");
			console.log(like);
			
			bootbox.confirm("Are you sure?", function(result) {
				 if (result == true) {                                             
					 window.location.href = '<c:url value="/first.jsp"/>';                          
					  } else {
						  console.log("do nothing");                        
				}
			}); 
			//
		
		})
		
		$(".nav-tabs").on("click", "a", function (e) {
	        e.preventDefault();
	        if (!$(this).hasClass('add-contact')) {
	            $(this).tab('show');
	        }
	    })
	    .on("click", "span", function () {
		    var tabId = $(this).parents('li').children('a').attr('href');
		    console.log(tabId);
		    $(this).parents('li').remove('li');
		    $(tabId).remove();
		    reNumberPages();
		    reContentPages();
	        if($(".nav-tabs").children().length<6){
		    	
		    	$('.add-contact').show();
		    }
	        $(".nav-tabs li").children('a').first().click();
	
	    });

		/**
		* Reset numbering on tab buttons
		*/
		function reNumberPages() {
		    pageNum = 1;
		    listNum = 1;
		    var tabCount = $('#pageTab > li').length;
		    $('#pageTab > li').each(function() {
		    	var listId = "#contact_"+listNum;
		    	listNum++;
		        var pageId = $(this).children('a').attr('href');
	
		        if (pageId == "#contact_1") {
		            return true;
		        } else if (pageId =="#add-tab"){
		        	return true;
		        }
		        pageNum++;
		        $(this).children('a').html('Day' + pageNum);
		        if(listId!=pageId){
		        	$(this).children('a').attr('href',listId);
		        	
		        }
		        
		    });
		   if($(".nav-tabs").children().length>5){
		    	$('.add-contact').hide();
		    }
		}	
		/**
		* Reset numbering on tab buttons
		*/
		function reContentPages() {
		    pageNum = 1;
		    listNum = 1;
		    var tabCount = $('#pageContent > div').length;
		    console.log(tabCount);
		    $('#pageContent > div').each(function() {
		    	var listId = "contact_"+listNum;
		    	listNum++;
		        var pageId = $(this).attr('id');
		        console.log(pageId);
		        if (pageId == "contact_1") {
		            return true;
		        }
		        if(listId!=pageId){
		        	$(this).attr('id',listId);
		        }
		        
		    });
		
		}	
			
			
		$('.add-contact').click(function (e) {
			
		    e.preventDefault();
		   
		    var id = $(".nav-tabs").children().length; //think about it ;)
			var tabId = 'contact_' + id;
		    $(this).closest('li').before('<li><a href="#contact_' + id + '">Day'+id+'</a> <span> x </span></li>');
		    $('.tab-content').append('<div class="tab-pane" id="' + tabId + '">Contact Form: New Contact ' + id + '</div>');
		    $('.nav-tabs li:nth-child(' + id + ') a').click();
			   if($(".nav-tabs").children().length>5){
			    	$('.add-contact').hide();
			    }
			});
	    });

		
			
			
		

</script>
</body>
</html>