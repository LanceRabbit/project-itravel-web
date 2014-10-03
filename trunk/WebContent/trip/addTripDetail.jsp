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
<link rel="stylesheet" href="../css/jquery.dynatable.css"/>
<link rel="stylesheet" href="../css/jquery.bootstrap-touchspin.min.css"/>
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

.select-div {
	background: #d0dafd;
	
}


}
div{
border-collapse:collapse;
}
/*confirm window size*/
.bootbox > .modal-dialog {
width: 300px;
}
  ul {
  list-style-type: none;
  
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
	padding-left: 0px;
}
</style>
</head>

<body>
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp" />
	<!-- Page Content -->
	<div class="container thumbnail">
	<div class="trip-name">
		<div style="width:350px; text-align: center;">
		<h4>${param.tripName}</h4>
		</div>
		<span id='tripId' hidden>${param.tripName}</span>
		<span id='startDay' hidden>${param.dateStart}</span>
		<span id='days' hidden>${param.totalDay}</span>
	</div>
	<div class="row"> 
		<div class='col-xs-6'>

			<ul id="pageTab" class="nav nav-tabs" role="tablist">
		        <li class="active"><a href="#contact_1" data-toggle="tab">Day1</a>
		        </li>

		        <li><a href="#add-tab" id ="add-tab" class="add-contact">+</a>
		        </li>
		    </ul>
		    <div id="pageContent" class="tab-content">
		        <div class="tab-pane active" id="contact_1"></div>
		    </div>
		
		</div>
		<div class="clearfix visible-xs-block"></div>
		<div class='col-xs-6'>
			<ul id="spotTab" class="nav nav-tabs" role="tablist">
		        <li class="active">
		        <a href="#spot_1" data-toggle="tab">搜尋景點</a>
		        </li>
		        <li><a id="myselfcollect" href="#spot_2" data-toggle="tab">收藏景點</a> 
		        </li>
		    </ul>
		    <div id="spotContent" class="tab-content">
		        <div class="tab-pane active" id="spot_1">
 <div class="container">
	<div class="row">
		<div class="col-md-12">
				<form class="form-horizontal" method="post" id="infoForm"
					action='<c:url value="/controller/AddSpot" />'>
					<fieldset>
						<div class="form-group">
							<div class="row">
								<div class="col-xs-2">
									<div class="input-group" id="queryCityGroup" data-toggle="popover"
										data-placement="top" data-content="請選擇縣市">
										<input id="queryCity" name="city" type="text" placeholder="縣市"
											class="form-control" disabled>
										<div class="input-group-btn" id="queryCityIdMenu">
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

								<div class="col-xs-2">
									<div class="input-group" id="queryCategoryGroup"
										data-toggle="popover" data-toggle="popover"
										data-placement="top" data-content="請選擇分類">
										<input id="queryCategory" name="category" type="text"
											placeholder="全部" class="form-control" disabled>
										<div class="input-group-btn" id="queryCategoryIdMenu">
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

							

								<div class="col-xs-2">
									<input id="querySpotName" name="spotName" type="text"
										placeholder="景點名稱" class="form-control" data-toggle="popover"
										data-placement="top" data-content="請輸入名稱">
								</div>
							</div>
						</div>
					</fieldset>
				</form>
		</div>
		</div>
	</div>

	
			<div class="row" id="listDetails">
			<ul class="thumbnails">
                <li class="span5 clearfix">
                  <div class="thumbnail clearfix">
                    <img src="http://placehold.it/320x200" alt="ALT NAME" class="pull-left span2 clearfix" style="margin-right:10px">
                    <div class="caption">
                      <a href="http://bootsnipp.com/" class="btn btn-primary icon  pull-right">Select</a>
                      <h4>      
                      <a href="#">Luis Felipe Kaufmann</a>
                      </h4>
                      <small><b>RG: </b>99384877</small>  
                    </div>
                  </div>
                </li>
            </ul>
			</div>	
		</div>

		<div class="tab-pane" id="spot_2">
	
			<ul id="mycollect"  class="row-fluid">
			</ul>
			
          </div>
	</div>
		</div>

	</div>
		<div class="modal-footer">
		<button id="doNothing"  type="button" class="btn btn-default" 
				>取消</button>
		<input id="createTrip" type="submit" class="btn btn-info" value="建立" />
	</div>	
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- 如果從Google下載失敗，我們就從自己的Server上下載jQuery.js檔 -->
<script>!window.jQuery && document.write("<script src='${pageContext.request.contextPath}/js/jquery-1.11.1.min.js'><\/script>")</script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootbox.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.datetimepicker.js"></script>
<script src="../js/jquery.dynatable.js"></script>
<script src="../js/jquery.bootstrap-touchspin.min.js"></script>
<script>
var tempDay = $("#days").text() ;
var currentDiv = "#contact_1";

jQuery(document).ready(function() {
	console.log($("#days").text());
	console.log($("#tripId").text());
	//according to days to create the tabs on the left side of screen.
	for(var index = 2; index <= $("#days").text(); index++ ) {
		
		//console.log(index);
		var tabId = 'contact_' + index;
	    $("#pageTab li:last").before('<li><a href="#contact_' + index + '">Day'+index+'</a> <span> x </span></li>');
	    $('#pageContent').append('<div class="tab-pane" id="' + tabId + '"></div>');
	    $('#pageTab li:nth-child(' + index + ') a').click();
		if ($("#pageTab").children().length>5) {
		    	$('#pageTab .add-contact').hide();
		 }
		
		
	}
	//record current tab is where focus.
	$('#pageTab').on('click','li',function(e){
		 e.stopPropagation();
		//console.log($(this).index());
		
		currentDiv = "#contact_"+($(this).index()+1);
		//console.log(currentDiv);
	});
	//dynamic add tabs when user click this one 
	$('#pageTab .add-contact').click(function (e) {
		 e.stopPropagation();
	    e.preventDefault();
	   
	    var id = $("#pageTab").children().length; //think about it ;)
		var tabId = 'contact_' + id;
	    $(this).closest('li').before('<li><a href="#contact_' + id + '">Day'+id+'</a> <span> x </span></li>');
	    $('#pageContent').append('<div class="tab-pane" id="' + tabId + '"></div>');
	    $('#pageTab li:nth-child(' + id + ') a').click();
		if ($("#pageTab").children().length>5) {
		    	$('#pageTab .add-contact').hide();
		 }
		console.log("add-contact==="+$("#pageTab").children().length);
		tempDay = $("#pageTab").children().length - 1;
		console.log("tempDay=="+tempDay);
	});
		
	//
	$("#createTrip").click(function(){
		//$("#tripForm").submit();
		var info = {};
		
		info.TripName =  "要去哪裡玩";
		info.StartDay =  "2014/10/03";
		info.TotalDay = 2;
		var spotInfo = [];
		var listSpot = {};
		var byDay = [];
		 var id = $("#pageTab").children().length-1;
		 console.log("adddddddd="+id);
		for(var i = 1 ; i <= id ; i ++){
			
			 byDay = [];
			$('#contact_'+i).children().length;
			//console.log("#contact_"+i+'='+$('#contact_'+i).children().length);
			$('#contact_'+i+'> div').each(function(){
				 listSpot = {};
				 listSpot.spotId = $(this).attr("id")
				 listSpot.stayTime = 60;
				console.log($(this).attr("id"));
				byDay.push(listSpot);
			});
			spotInfo.push(byDay);
			console.log(byDay);
			console.log(i+"===========");
		};
		info.spot=spotInfo;
		console.log(info);
/* 		 $.ajax({
			type : "POST",
			 dataType:"json", //xml,text
			 async: false,
			url : '<c:url value='/controller/AddTripServlet' />',
			data : {
				tripInfo :  JSON.stringify(tripInfo)
			}
		}).done(function(data) {
			//console.log("detail from server....." + data);
		
		});  */
		
	});
		
	//confirm doalog when user want to cancel current add trip step.
	$("#doNothing").click(function(){
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
	
	});
		
		$("#pageTab").on("click", "a", function (e) {
			 
	        e.preventDefault();
	        if (!$(this).hasClass('add-contact')) {
	            $(this).tab('show');
	        }
	    })
	    .on("click", "span", function (e) {
	    	 e.stopPropagation();
		    var tabId = $(this).parents('li').children('a').attr('href');
		    $(this).parents('li').remove('li');
		    $(tabId).remove();
		    reNumberPages();
		    reContentPages();
	        if($("#pageTab").children().length<6){
		    	
		    	$('#pageTab .add-contact').show();
		    }
	        $("#pageTab li").children('a').first().click();
		    var id = $("#pageTab").children().length; //think about it ;)
			tempDay = $("#pageTab").children().length - 1;
			//console.log("tempDay=="+tempDay);
			currentDiv = "#contact_1";
			//console.log(currentDiv);
	    });

		/**
		* Reset numbering on tab buttons
		*/
		function reNumberPages() {
		    pageNum = 1;
		    listNum = 1;
		    
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
		   if($("#pageTab").children().length>5){
		    	$('#pageTab .add-contact').hide();
		    }
		}	
		/**
		* Reset numbering on contents
		*/
		function reContentPages() {
		    pageNum = 1;
		    listNum = 1;
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
});
</script>    
<script>
//Function that renders the list items from our records
function ulWriter(rowIndex, record, columns, cellWriter) {
	var index = 1;
	console.log("writer==="+index);
  var cssClass = "span4", li;
  if (rowIndex % 3 === 0) { cssClass += ' first'; }
  li = '<li>'
	  	  +'<div id="'+record.spotId+'"class="col-xs-12">'
	  		+'<div class="row">'
	  			+'<div class="col-xs-6">'
	  				+'<div class="thumbnail">'
	  	 			+ record.thumbnail 
	  	 			+'</div>'
	  	 		+'</div>'
	  			+'<div class="col-xs-6">'
	  		 		+'<div class="caption">' 
	  	 				+ record.caption 
	  	 			+'</div>'
	  	 		+'</div>'
	  	 	+'</div>'
	  	 +'</div></li>';
  return li;
}
/* 
	<li>
		<div id='div"+count+"'class='col-xs-12'>
			<div class='row'>
				<div class='col-xs-6'>
					<div class='thumbnail'>
						<img src='"+value.spotThumbnail+"' alt=''>
					</div>"
				</div>
				<div class='col-xs-6'>
					<div class='caption'>
						<h4>
						<p>value.spotName</p>
						</h4>
						value.spotIntro
					</div>
				</div>
			</div>
		</div>
	</li>




<li class="span4 first">
	<div class="thumbnail">
imgae	<div class="thumbnail-image">
    		<img src="https://s3.amazonaws.com/dynatable-docs-assets/images/dinosaurs/Stegosaurus_BW.jpg">
 		 </div>
caption		<div class="caption">
label    	<h3>Stegosaurus armatus</h3>
	    	<p>State: Colorado</p>
	  	  	<p>Year: 1982</p>
	 	    <p>
		 	   <a target="_blank" 
		 	   href="http://en.wikipedia.org/wiki/Stegosaurus" 
		 	   class="btn btn-primary">View</a> <a href="#" class="btn">
		 	   Action</a>
	 	    </p>
 	    </div>
 	 </div>
</li> 
*/
/* function ulReader(index, li, record) {
	  var $li = $(li),
	      $caption = $li.find('.caption');
	  record.thumbnail = $li.find('.thumbnail-image').html();
	  record.caption = $caption.html();
	  record.label = $caption.find('h3').text();
	  record.description = $caption.find('p').text();
	  record.color = $li.data('color');
	} */
// Function that creates our records from the DOM when the page is loaded
function ulReader(index, li, record) {
		var index = 1;
		console.log("Reader==="+index);
  var $li = $(li),
   $caption = $li.find('.caption');
  record.spotId =$li.find('div').attr("id");
  //console.log(record.spotId);
  record.thumbnail = $li.find('.thumbnail').html();
  record.caption = $caption.html();
  console.log(record.caption);
  record.label = $caption.find('h4').text();
  record.description = $caption.find('p').text();

}
/* <li><div id='div"+count+"'class='col-xs-12'>
<div class='row'>
	<div class='col-xs-6'>
		<div class='thumbnail'>
			<img src='"+value.spotThumbnail+"' alt=''>
		</div>"
	</div>
	<div class='col-xs-6'>
		<div class='caption'>
			<h4>
			value.spotName
			</h4>
			<p>value.spotIntro</p>
		</div>
	</div>
</div>
</div> */





</script>
<script type="text/javascript">
jQuery(document).ready(	function() {
	$("#myselfcollect").one("click",function(){
		$("#mycollect").empty();
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
						jQuery('#mycollect').append("<li><div id='"+value.spotId+"'class='col-xs-12'><div class='row'>"
								+"<div class='col-xs-6'>"
								+"<div class='thumbnail'><img style='width:200px;height:200px' src='"+value.spotThumbnail+"' alt=''></div>"
								+"</div><div class='col-xs-6'><div class='caption'><h4>"
							+ value.spotName
							+ "</h4><p>"
							+ value.spotIntro
							+ "</p></div></div>"
							+ "</div></div></li>"
							);
						
						count++;
						
					});
				}else{											
						jQuery('#mycollect').append("<div class='col-xs-3'><div class='thumbnail'><img src='http://placehold.it/300x300' alt=''><div class='caption'><h4><a>無收藏景點</a></h4>無收藏景點資訊</div><div class='ratings'><p class='pull-right'></p></div></div></div>");	
						
				
				}
			}
		});

		$('#mycollect').dynatable({
			  table: {
			    bodyRowSelector: 'li'
			  },
			  dataset: {
			    perPageDefault: 3,
			    perPageOptions: [3, 6]
			  },
			  writers: {
			    _rowWriter: ulWriter
			  },
			  readers: {
			    _rowReader: ulReader
			  },
			  params: {
			    records: 'spot'
			  },
			});
	});
	

});
</script>


<script>
	
(function(jQuey){
	
	var categories = [{"type":"全部", "subtype":["全部子分類"]},
	                  {"type":"美食", "subtype":["全部子分類", "餐廳", "小吃", "美食街", "甜品", "其他"]}, 
	                  {"type":"購物", "subtype":["全部子分類", "百貨公司", "大賣場", "個性商店", "路邊攤", "其他"]}, 
	                  {"type":"住宿", "subtype":["全部子分類", "飯店", "旅舍", "民宿", "營地", "其他"]},
	                  {"type":"景點", "subtype":["全部子分類", "風景區", "國家公園", "古蹟", "遊樂園", "其他"]},
	                  {"type":"活動", "subtype":["全部子分類", "藝文展覽", "親子活動", "競賽活動", "其他"]}];
	
	initElements();
	
	// modal google map
	$('#myModal').on('shown.bs.modal', function() {
		google.maps.event.trigger(var_map, "resize");
		var_map.setCenter(var_location);
	});
	
	// config category
	jQuey('#queryCityIdMenu').on('show.bs.dropdown', function () {
		jQuey("#queryCityIdMenu .dropdown-menu").show();
	}).on("hide.bs.dropdown", function(){
		jQuey("#queryCityIdMenu .dropdown-menu").hide();
	});
	
	jQuey("#queryCityIdMenu .dropdown-menu li").click(function(){
		//console.log(jQuey(this).text());
		jQuey("#queryCity").val(jQuey(this).text());
		jQuey("#queryCityIdMenu .dropdown-menu").hide();
		
		activeQuery();
	}); 
	
	jQuey('#queryCategoryIdMenu').on('show.bs.dropdown', function () {
		jQuey("#queryCategoryIdMenu .dropdown-menu").show();
	}).on("hide.bs.dropdown", function(){
		jQuey("#queryCategoryIdMenu .dropdown-menu").hide();
	});
	
	jQuey("#queryCategoryIdMenu .dropdown-menu li").click(function(){
		//console.log(jQuey(this).index());
		jQuey("#queryCategory").val(jQuey(this).text());
		jQuey("#queryCategoryIdMenu .dropdown-menu").hide();
		
		// populate subcategory
		var subcategories = categories[jQuey(this).index()].subtype;
		//console.log(subcategories);
		jQuey("#subqueryCategory").attr("placeholder", "全部子分類");
		jQuey("#subqueryCategory").val("");
		jQuey("#subqueryCategoryIdMenu ul:first").empty();
		jQuey.each(subcategories, function(index, value){
			jQuey("#subqueryCategoryIdMenu ul:first").append("<li><a href='#'>"+value+"</a></li>");
		});
		

		
		activeQuery();
	});

	// input field : spot name
	jQuey('#querySpotName').on("change", function() {
		
		activeQuery();
	}); 
	
	// load data from server
	activeQuery();
	
	function initElements() {
		// populate city ids
		var cities = [ "基隆", "台北", "桃園", "新竹", "苗栗", "dummy", "彰化", "台中", "南投",
				"雲林", "嘉義", "dummy", "台南", "高雄", "屏東", "dummy", "綠島", "蘭嶼",
				"澎湖", "金門", "馬祖" ];
		jQuey.each(cities, function(index, value) {
			//console.log(value);
			if (value == 'dummy')
				jQuey("#queryCityIdMenu ul:first").append("<li class='divider'></li>");
			else
				jQuey("#queryCityIdMenu ul:first").append(
						"<li><a href='#'>" + value + "</a></li>");
		});

		// populate category
		jQuey.each(categories, function(index, value) {
			var type = value.type;
			jQuey("#queryCategoryIdMenu ul:first").append(
					"<li><a href='#'>" + type + "</a></li>");
		});
	}

	/*
	var curPath = window.location.pathname;
	var rootPath = window.location.protocol+"//"+window.location.host+
					":"+window.location.port+"/"
	*/					
	function activeQuery() {
		var spotName = jQuey('#querySpotName').val();
		//console.log("querySpotName : " + spotName);
		var city = jQuey("#queryCity").val();
		//console.log("city : " + city);
		var category = jQuey('#queryCategory').val();
		//console.log("queryCategory : " + category);

		jQuey.ajax({
			type : "POST",
			url : '<c:url value='/controller/SearchSpot' />',
			data : {
				spotName : spotName,
				city : city,
				category : category,
				subcategory : null
			}
		}).done(function(data) {
			//console.log("detail from server....." + data);
			jQuery('#listDetails').empty();	
			jQuey.each(data, function(index, value){
				//console.log("Hello" + index + ":" + value);
				
		
				jQuery('#listDetails').append(
						"<div id='"+value.spotId+"'class='col-xs-12'><div class='row'>"
						+"<div class='col-xs-6'>"
						+"<div class='thumbnail'><img  src='"+value.spotThumbnail+"' alt=''></div>"
						+"</div><div class='col-xs-6'><div class='caption'><h4>"
					+ value.spotName
					+ "</h4><p>"
					+ value.spotIntro
					+ "</p></div></div>"
					+ "</div></div>"
				); // end of jQuery
				//console.log(value.spotId);
				//console.log("+++="+$('#'+value.spotId).attr("id"));
				//-- add spot into trip when click this spot.
				$('#'+value.spotId).on('click',function(){
					//console.log("AAAA="+$(this).attr("id"));
					//console.log(currentDiv);
					
 					var flag = 0;
					//----------判斷左側是否有加入過~~~該圖片
					$(currentDiv+" > div").each(function(){
						//console.log("verfiy="+$(this).attr("id"));
						if($(this).attr('id') == value.spotId){						
							flag++;
//							alert("id相同"+"; flag:"+flag)
						} 
					});
					if(flag<1){
						createSportObj(value,value.spotId);
						deleteSportObj(); 
					}
				})
				.mouseover(function(e){
					//console.log($(this).children().children().children().attr('class'));
					$(this).children().children().children().addClass('select-div');
					
				})
				.mouseout(function(e){
					$(this).children().children().children().removeClass('select-div');
					
				});
			});
		});
		function deleteSportObj(e){
			$(currentDiv+' span.glyphicon-remove').click(function(e){
				 e.stopPropagation();
				//console.log($(this).parent().parent().attr('id'));
				var divId = $(this).parent().parent().attr('id');
				$(currentDiv+' #'+divId).remove();
				
				//$(this).parent().parent().index();
				//$(currentDiv+' div:eq('+$(this).parent().parent().index()+')').remove();				
				e.stopImmediatePropagation();
				//counter--;
//				alert(counter);
			});
		}
	function createSportObj (value,sportId){

		$(currentDiv).append(
				"<div id='"+value.spotId+"'class='col-xs-12'><div style='text-align: right;' hidden><span class='glyphicon glyphicon-remove' ></span></div><div class='row'>"
				+"<div class='col-xs-6'>"
				+"<div class='thumbnail'><img  src='"+value.spotThumbnail+"' alt=''></div>"
				+"</div><div class='col-xs-6'><div class='caption'><h4>"
			+ value.spotName
			+ "</h4><div style='width:120px'>"
			+ "	<input id='setTime' type='text'>"
			+
			+ "</div></div></div>"
			+ "</div></div>"
		);
		$("#setTime").TouchSpin();
		
		
		$(currentDiv+' #'+value.spotId).mouseover(function(e){
			//console.log("overover");
			$(this).children('div').removeAttr("hidden");
			//$(this).parents('div').remove();				
			//e.stopImmediatePropagation();

		}).mouseout(function(e){
			 e.stopPropagation();
			$(this).children('div:first-child').attr("hidden","hidden");
			
		});
		
	}
	}
}(jQuery, google));
</script>

</body>
</html>