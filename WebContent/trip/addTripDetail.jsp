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
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
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

}
div{
border-collapse:collapse;
}
/*confirm window size*/
.bootbox > .modal-dialog {
width: 300px;
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

.trip-name {
	text-align: center;
}
</style>
</head>

<body>
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp" />
	<!-- Page Content -->
	<div class="container thumbnail">
	<div class="trip-name">
		<h4>${param.tripName}</h4>
		<span id='tripId' hidden>${param.tripName}</span>
		<span id='tripName' hidden>${param.dateStart}</span>
		<span id='totalDay' hidden>${param.totalDay}</span>
	</div>
	<div class="row"> 
			<div class='col-xs-5'>
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
	<div class='col-xs-7'>
		<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div>
				<form class="form-horizontal" method="post" id="infoForm"
					action='<c:url value="/controller/AddSpot" />'>
					<fieldset>
						<div class="form-group">
							<div class="row">
							<div class="col-xs-2">
									<input id="spotName" name="spotName" type="text"
										placeholder="景點名稱" class="form-control" data-toggle="popover"
										data-placement="top" data-content="請輸入名稱">
								</div>
								<div class="col-xs-2">
									<div class="input-group" id="cityGroup" data-toggle="popover"
										data-placement="top" data-content="請選擇縣市">
										<input id="city" name="city" type="text" placeholder="縣市"
											class="form-control" disabled>
										<div class="input-group-btn" id="cityIdMenu">
											<button type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown">
												選擇 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu dropdown-menu-right scrollable"
												role="menu">
											</ul>
										</div>
										<!-- /btn-group -->
									</div>
									<!-- /input-group -->
								</div>

								<div class="col-xs-3">
									<div class="input-group" id="categoryGroup"
										data-toggle="popover" data-toggle="popover"
										data-placement="top" data-content="請選擇分類">
										<input id="category" name="category" type="text"
											placeholder="全部分類" class="form-control" disabled>
										<div class="input-group-btn" id="categoryIdMenu">
											<button type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown">
												選擇 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu dropdown-menu-right scrollable"
												role="menu">
											</ul>
										</div>
										<!-- /btn-group -->
									</div>
									<!-- /input-group -->
								</div>

				

					
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	
	
		<div class="row" id="listDetails">
		</div>	
	</div>
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
<script src="${pageContext.request.contextPath}/js/bootbox.min.js"></script>
<script>

	jQuery(document).ready(function() {
	
		
		$("#test").click(function(){
			bootbox.dialog({
				  message: "確定取消新增行程表? ",
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
				    	  window.location.href = '<c:url value="/first.jsp"/>';  
				      }
				    }
				  }
				});
			
			
		/* 	bootbox.confirm("確定取消新增行程表?", function(result) {
				 if (result == true) {                                             
					 window.location.href = '<c:url value="/first.jsp"/>';                          
					  } else {
						  console.log("do nothing");                        
				}
			});  */
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
		    $()
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