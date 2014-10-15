<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Spots</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />" />
<!--  <link rel="stylesheet" href="<c:url value="/css/bootstrap-theme.css" />" /> -->
<!--  <link rel="stylesheet" href="<c:url value="/css/container.css" />" /> -->
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

.scrollable {
    height: auto;
    max-height: 400px;
    overflow-x: hidden;
}
</style>
</head>

<body>
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp" />
	<!-- Page Content -->
	<div class="container ">
	<div class="trip-name">
		<div style="width:350px; text-align: center;">
		<h4>${param.tripName}</h4>
		</div>
		<span id='tripName' hidden>${param.tripName}</span>
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
		    <div id="pageContent" class="tab-content scrollable">
		       	<div class="tab-pane active" id="contact_1">
		       	<ul id="sortable" class="sortable grid"></ul>
		       	</div>
		    </div>
		
		</div>
		<div class="clearfix visible-xs-block"></div>
		<div class='col-xs-6'>
			<ul id="spotTab" class="nav nav-tabs" role="tablist">
		        <li class="active">
		        	<a href="#spot_1" id="searchByInput" data-toggle="tab">搜尋景點</a>
		        </li>
		        <li>
		        	<a id="myselfcollect" href="#spot_2" data-toggle="tab">收藏景點</a> 
		        </li>
		    </ul>
		    <div id="spotContent" class="tab-content">
		        <div class="tab-pane active" id="spot_1">
 <div >
	<div class="row">
		<div class="col-md-12">
				<form class="form-horizontal" method="post" id="infoForm"
					action='<c:url value="/controller/AddSpot" />'>
					<fieldset>
						<div class="form-group">
							<div class="row">
								<div style='margin-left:15px' class="col-xs-4">
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

								<div class="col-xs-4">
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

							

								<div class="col-xs-3">
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

	
			<div class="row scrollable" id="listDetails">
			
			</div>	
		</div>

		<div class="tab-pane" id="spot_2">
	
			<div id="mycollect"  class="row scrollable">
			</div>
			
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
<script src="${pageContext.request.contextPath}/js/jquery.dynatable.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.bootstrap-touchspin.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.sortable.min.js"></script>
<script>

var currentDiv = "#contact_1";

jQuery(document).ready(function() {
	var tempDay = $("#days").text() ;
	console.log($("#startDay").text());
	console.log($("#tripName").text());
	//according to days to create the tabs on the left side of screen.
	for(var index = 2; index <= $("#days").text(); index++ ) {
		
		//console.log(index);
		var tabId = 'contact_' + index;
	    $("#pageTab li:last").before('<li><a href="#contact_' + index + '">Day'+index+'</a> <span> x </span></li>');
	    $('#pageContent').append('<div class="tab-pane" id="' + tabId + '"><ul id="sortable" class="sortable"></ul></div>');
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
	    $('#pageContent').append('<div class="tab-pane" id="' + tabId + '"><ul class="sortable"></ul></div>');
	    $('#pageTab li:nth-child(' + id + ') a').click();
		if ($("#pageTab").children().length>5) {
		    	$('#pageTab .add-contact').hide();
		 }
		console.log("add-contact==="+$("#pageTab").children().length);
		
		tempDay = $("#pageTab").children().length - 1;
		console.log("tempDay=="+ tempDay);
	});
		
	//
	$("#createTrip").click(function(){
		//$("#tripForm").submit();
		var noError = 0 ;
		var info = {};
		var spotInfo = [];
		var listSpot = {};
		var byDay = [];
		var tabs = $("#pageTab").children().length-1;
		console.log("tabs count="+tabs);
		for(var index = 0 ; index < tabs ; index ++){
			var times = 0;	
			byDay = [];
			$('#contact_'+(index+1)).children().length;
			//console.log("#contact_"+i+'='+$('#contact_'+i).children().length);
			$('#contact_'+(index+1)+'> ul > li > div').each(function(){
				 times += parseInt($(this).find("input").val());
				 //collect spot info
				 listSpot = {};
				 listSpot.spotId = $(this).attr("id");
				 listSpot.stayTime = $(this).find("input").val();
				 console.log("~~~!@#!@"+$(this).find("input").val());
				 byDay.push(listSpot);
			});
			if (times > 1440) {
				console.log("TimeTime==="+times);
				noError = 1;
				//console.log("index="+index);
				var string = "#pageTab li a:eq("+index+")";
				console.log("string="+string);
				$(string).click();
				bootbox.alert("Day"+(index+1)+"設定停留時間超過 1440 分鐘/日", function() {
					
				});
				break;
			}
			spotInfo.push(byDay);
		};
		// if no error occurs, sent out data to backend.
		if (noError==0) {
			info.userId = "${user.accountId}";
			info.tripName =  $("#tripName").text();
			info.startDay =  $("#startDay").text();
			info.totalDay = tempDay;
			info.spot=spotInfo;
			console.log(info);
 	  		 $.ajax({
				type : "POST",
				 dataType:"json", //xml,text
				 async: false,
				url : '<c:url value='/controller/AddTripServlet' />',
				data : {
					tripInfo :  JSON.stringify(info)
				}
			}).done(function(data) {
				var result = String(data);
				if(result == 'true' ) {
					bootbox.alert("新增行程成功", function() {
						 window.location.href = '<c:url value="/trip/MyTrip.jsp"/>';  
					});
				} else {
					console.log("XXXXXXXXXXXXX=" + data);
					bootbox.alert("新增失敗，請重新再確認", function() {
						
					});
				}

			});  
		}
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

</script>
<script type="text/javascript">
jQuery(document).ready(	function() {

	

});
</script>


<script>
	
(function(jQuey){
	var ovretime = 0;
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
		var cities = [ "全部縣市", "基隆", "台北", "桃園", "新竹", "苗栗", "dummy", "彰化", "台中", "南投",
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
			$("#mycollect").empty();
			jQuey.each(data, function(index, value){
				//console.log("Hello" + index + ":" + value);
	
		
				jQuery('#listDetails').append(
						"<div id='"+value.spotId+"'class='col-xs-12'><div class='row'>"
						+"<div class='col-xs-6'>"
						+"<div class='thumbnail'><img  src='"+value.spotThumbnail+"' alt=''></div>"
						+"</div><div class='col-xs-6'><div class='pull-right' hidden>"
						+"<span class='glyphicon glyphicon-plus'></span></div>"
						+"<div class='caption'><h4>"
						+ value.spotName
						+ "</h4><p>"
						+ value.spotIntro
						+ "</p></div></div>"
						+ "</div></div>"
				); // end of jQuery
				//console.log(value.spotId);
				//console.log("+++="+$('#'+value.spotId).attr("id"));
				//-- add spot into trip when click this spot.
				setEventOnSpan("#listDetails",value);
			});
		});

		$("#myselfcollect").on("click",function(){
			//$('#listDetails').empty();	
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
							jQuery('#mycollect').append(
								"<div id='"+value.spotId+"'class='col-xs-12'><div class='row'>"
								+"<div class='col-xs-6'>"
								+"<div class='thumbnail'><img src='"+value.spotThumbnail+"' alt=''></div>"
								+"</div><div class='col-xs-6'><div class='pull-right' hidden>"
								+"<span class='glyphicon glyphicon-plus'></span></div>"
								+"<div class='caption'><h4>"
								+ value.spotName
								+ "</h4><p>"
								+ value.spotIntro
								+ "</p></div></div>"
								+ "</div></div>"
								);
							
							//style='width:200px;height:200px'
							setEventOnSpan("#mycollect",value);
			
							count++;
						});
					}
				}
			});

	/* 		$('#mycollect').dynatable({
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
				}); */
	});	
		
	function setEventOnSpan (setDiv,value){
		
		$(setDiv+" #"+value.spotId).on('click','span',function(){
			//$(this).parent().parent().parent().parent().attr('id')
			//console.log("AAAA="+$(this).attr("id"));
			//console.log(currentDiv);
			
			var flag = 0;
			//----------判斷左側是否有加入過~~~該圖片
			$(currentDiv+" > ul > li > div").each(function(){
				console.log("verfiy="+$(this).attr('id'));
				if($(this).attr('id') == value.spotId){						
					flag++;
//					alert("id相同"+"; flag:"+flag)
				} 
			});
			if(flag<1){
				createSportObj(value,value.spotId);
				deleteSportObj(); 
			}
		})
		.mouseover(function(e){
			 e.stopPropagation();
			//console.log($(this).children().children().children().attr('class'));
			//$(this).children().children().children().addClass('select-div');
			$(this).children().children().children('div').removeAttr("hidden");
				
		})
		.mouseout(function(e){
			//$(this).children().children().children().removeClass('select-div');
			$(this).children().children().children('div:first-child').attr("hidden","hidden");
		});
		
	}	
		
	function deleteSportObj(e){
		$(currentDiv+' span.glyphicon-remove').click(function(e){
			 e.stopPropagation();
			console.log($(this).parent().parent().parent().parent().attr('id'));
			var divId = $(this).parent().parent().parent().parent().attr('id');
			$(currentDiv+' #'+divId).remove();
			
			//$(this).parent().parent().index();
			//$(currentDiv+' div:eq('+$(this).parent().parent().index()+')').remove();				
			e.stopImmediatePropagation();
		});
	}
	function createSportObj (value,sportId){
		$(currentDiv+' > ul').append(
				"<li ><div style='margin-top: 10px;' id='"+value.spotId+"'class='col-xs-12'>"
				+"<div class='row'><div class='col-xs-6'>"
				+"<div class='thumbnail'><img  src='"+value.spotThumbnail+"' alt=''></div>"
				+"</div><div class='col-xs-6'>"
				+"<div class='pull-right'  hidden>"
				+"<span class='glyphicon glyphicon-remove' ></span></div>"
				+"<div class='caption'><h4>"
				+ value.spotName
				+ "</h4><div style='margin-bottom: 5px'>預計停留：</div><div style='width:120px'>"

				+ "<input id='setTime"+value.spotId+"' type='text' value='60'>"
				+ "</div></div></div>"
				+ "</div></div></li>"
		);
	    $(".sortable").sortable();
		$(currentDiv+" #setTime"+value.spotId).TouchSpin({
            min: 30,
            max: 420,
            step: 30,
            boostat: 5,
            maxboostedstep: 10,
            verticalbuttons: true,
            postfix: '分'
        });
		
		$(currentDiv+' #'+value.spotId).mouseover(function(e){
			//console.log("overover");
			$(this).children().children().children().removeAttr("hidden");
			//$(this).parents('div').remove();				
			//e.stopImmediatePropagation();

		}).mouseout(function(e){
			 e.stopPropagation();
			 $(this).children().children().children('div:first-child').attr("hidden","hidden");
			
		});
		
	}
	}
}(jQuery, google));
</script>

</body>
</html>