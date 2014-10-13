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
<!--  <link rel="stylesheet" href="<c:url value="/css/container.css" />" />  -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/css/spot-modalview.css" />" />

<style type="text/css">

.fixedHeight { /*用於內文   多行文字溢出用...取代*/
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
/*
.col-xs-3{
width:220px;
height:330px;

}
*/
.queryItemScrollable {
    height: auto;
    max-height: 150px;
    overflow-x: hidden;
    overflow-y:auto
}

/*
#myCarousel .carousel-caption {
	left: 0;
	right: 0;
	bottom: 0;
	text-align: left;
	padding: 10px;
	background: rgba(0, 0, 0, 0.6);
	text-shadow: none;
}

#myCarousel .list-group {
	position: absolute;
	top: 0;
	right: 0;
}

#myCarousel .list-group-item {
	border-radius: 0px;
	cursor: pointer;
}

#myCarousel .list-group .active {
	background-color: #eee;
}

@media ( min-width : 992px) {
	#myCarousel {
		padding-right: 33.3333%;
	}
	#myCarousel .carousel-controls {
		display: none;
	}
}

@media ( max-width : 991px) {
	.carousel-caption p,#myCarousel .list-group {
		display: none;
	}
}
*/

/*basic*/
.jm-item {
	padding: 10px;
	display: inline-block;
	text-align: left;
}

.jm-item-wrapper {
	position: relative;
	padding: 7px;
	background: #e0e8b6;
}

.jm-item-image {
	position: relative;
	overflow: hidden;
}

.jm-item-image img {
	display: block;
}

.jm-item second{
width:320px;
height:200px;
}
.jm-item-title {
	position: absolute;
	left: -10px;
	bottom: 17px;
	background: #FF6B0E;
	line-height: 1.5em;	
	font-weight: normal;
	padding: 7px 9px 6px;
	text-transform: uppercase;
	font-family:'Microsoft JhengHei',"微軟正黑體",sans-serif;
	color: #FFFFFF;
	font-size: 1.4em;
}

.jm-item-overlay {
	background: #000;
	opacity: 0;
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	-webkit-transition: opacity 0.5s ease-in 0s;
	-moz-transition: opacity 0.5s ease-in 0s;
	-o-transition: opacity 0.5s ease-in 0s;
	transition: opacity 0.5s ease-in 0s;
}

.jm-item-wrapper:hover .jm-item-overlay {
	opacity: 0.3;
}

.jm-item-button {
	
	height: 50px;
	width: 50px;
	text-align: center;
	position: absolute;
	left: 50%;
	margin-left: -25px;
}

.jm-item-button a {
	
	border-radius: 50%;
	-webkit-border-radius: 50%;
	background: #FF6B0E;
	text-transform: uppercase;
	font-family:'Microsoft JhengHei',"微軟正黑體",sans-serif;
	color: #FFFFFF;
	font-size: 1.2em;
	line-height: 50px;
	-webkit-transition: all 0.2s ease-in 0s;
	-moz-transition: all 0.2s ease-in 0s;
	-o-transition: all 0.2s ease-in 0s;
	transition: all 0.2s ease-in 0s;
	text-decoration: none !important;
	display: block;
}

.jm-item-button a:hover {
	background: #3b3b3b;
}
/**/
.second .jm-item-wrapper .jm-item-title {
	-webkit-transition: all 0.2s ease-in 0s;
	-moz-transition: all 0.2s ease-in 0s;
	-o-transition: all 0.2s ease-in 0s;
	transition: all 0.2s ease-in 0s;
}

.second .jm-item-wrapper:hover .jm-item-title {
	/*visibility:hidden;*/
	
	left: -10%;
}

.second .jm-item-description {
	font-family:'Microsoft JhengHei',"微軟正黑體",sans-serif;
	position: absolute;
	width: 100%;
	height: 100%;
	padding: 10px;
	font-size:20px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	background: rgba(0, 0, 0, 0.4);
	color: #fff;
	top: 100%;
	-webkit-transition: all 0.5s ease-in 0s;
	-moz-transition: all 0.5s ease-in 0s;
	-o-transition: all 0.5s ease-in 0s;
	transition: all 0.5s ease-in 0s;
}

.second .jm-item-wrapper:hover .jm-item-description {
	top: 0;
}

</style>
</head>

<body>
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp" />
	<!-- Page Content -->

	<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="well well-md">
				<form class="form-horizontal" method="post" id="infoForm">
					<fieldset>
						<div class="form-group">
							<div class="row">

								<div class="col-md-3">
									<div class="input-group" id="queryCityGroup" data-toggle="popover"
										data-placement="top" data-content="請選擇縣市">
										<input id="queryCity" name="city" type="text" placeholder="全部縣市"
											class="form-control" disabled>
										<div class="input-group-btn" id="queryCityIdMenu">
											<button type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown">
												選擇 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu dropdown-menu-right queryItemScrollable"
												role="menu">
											</ul>
										</div>
										<!-- /btn-group -->
									</div>
									<!-- /input-group -->
								</div>

								<div class="col-md-3">
									<div class="input-group" id="queryCategoryGroup"
										data-toggle="popover" data-toggle="popover"
										data-placement="top" data-content="請選擇分類">
										<input id="queryCategory" name="category" type="text"
											placeholder="全部分類" class="form-control" disabled>
										<div class="input-group-btn" id="queryCategoryIdMenu">
											<button type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown">
												選擇 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu dropdown-menu-right queryItemScrollable"
												role="menu">
											</ul>
										</div>
										<!-- /btn-group -->
									</div>
									<!-- /input-group -->
								</div>

								<div class="col-md-3">
									<div class="input-group" id="subqueryCategoryGroup"
										data-toggle="popover" data-placement="top"
										data-content="請選擇子分類">
										<input id="subqueryCategory" name="subcategory" type="text"
											placeholder="全部子分類" class="form-control" disabled>
										<div class="input-group-btn" id="subqueryCategoryIdMenu">
											<button type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown">
												選擇 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu dropdown-menu-right queryItemScrollable"
												role="menu">
											</ul>
										</div>
										<!-- /btn-group -->
									</div>
									<!-- /input-group -->
								</div>

								<div class="col-md-3">
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
	</div>
	
	<div class="row" style="margin-top: 40px;text-align: center;" id="pages">
    </div>
 </div>

<jsp:include page="/fragment/bottom.jsp" />
<!--  <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script> -->
<script src="${pageContext.request.contextPath}/js/jquery.twbsPagination.js"></script>
<script type="text/javascript">
		function like(id) {
			//傳入的id是SpotId				
			console.log(document.getElementById(id));
			//收回讚
			if(jQuery("#"+id).attr("class")=="fa fa-heart fa-lg"){
				//換heart-o圖
				jQuery("#"+id).attr('title','按讚');
				jQuery("#"+id).removeAttr("class");
				jQuery("#"+id).addClass("fa fa-heart-o fa-lg").css("color","#ff443e");		
				
				var spotidNo = id.substring(2);	
				var No = "p"+spotidNo;
				var N =jQuery("#"+No).text();
				var count = parseInt(N)-parseInt("1");
				jQuery("#"+No).text(count);			
				
				jQuery.ajax({
					url : '<c:url value='/controller/SpotReccordServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",				
					dataType : "text",	
					data : {State:"delet",
						SpotId:id},						
					success : function(data) {						
						if(data=='false'){							
							jQuery('[name="loginError"]').text("請登入後使用。");
							jQuery('#topmodals').modal('show');
						}						
														
					}				
				});				
			}else{ //按讚
				//換heart圖				
				jQuery.ajax({
					url : '<c:url value='/controller/SpotReccordServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",
					dataType : "text",	
					data : {State:"like",
							SpotId:id},						
					success : function(data) {						
						if(data=='false'){							
							jQuery('[name="loginError"]').text("請登入後使用。");
							jQuery('#topmodals').modal('show');
							
						}else{							
							jQuery("#"+id).attr('title','收回讚');
							jQuery("#"+id).removeAttr("class");
							jQuery("#"+id).addClass("fa fa-heart fa-lg").css("color","#ff443e");
							var spotidNo = id.substring(2);	
							var No = "p"+spotidNo;
							var N =jQuery("#"+No).text();
							var count = parseInt(N)+parseInt("1");
							jQuery("#"+No).text(count);			
						}
															
					}				
				});				
				
			}
			

		}

		function collect(id) {
			console.log(id);
		//fa-minus
			if(jQuery("#"+id).attr("class")=="fa fa-minus fa-lg"){
				jQuery("#"+id).attr('title','收藏');
				jQuery("#"+id).removeAttr("class");
				jQuery("#"+id).addClass("fa fa-plus fa-lg");				
				jQuery.ajax({
					url : '<c:url value='/controller/SpotReccordServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",				
					dataType : "text",	
					data : {State:"deletCollect",
						SpotId:id},						
					success : function(data) {						
						if(data=='false'){							
							jQuery('[name="loginError"]').text("請登入後使用。");
							jQuery('#topmodals').modal('show');
						}						
														
					}				
				});	
			}else{
				
				jQuery.ajax({
					url : '<c:url value='/controller/SpotReccordServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",				
					dataType : "text",	
					data : {State:"Collect",
						SpotId:id},						
					success : function(data) {						
						if(data=='false'){							
							jQuery('[name="loginError"]').text("請登入後使用。");
							jQuery('#topmodals').modal('show');
						}else{
							jQuery("#"+id).attr('title','取消收藏');
							jQuery("#"+id).removeAttr("class");
							jQuery("#"+id).addClass("fa fa-minus fa-lg");
						}						
														
					}				
				});	
				
			}			
		}		
		/*已經搬到top了唷! 
		function btnPrint(id){
			console.log(id);
			
		} */
</script>

<script>

jQuery(document).ready(function() {
//(function(jQuery){
	
	var categories = [{"type":"全部分類", "subtype":["全部子分類"]},
	                  {"type":"美食", "subtype":["全部子分類", "餐廳", "小吃", "美食街", "甜品", "其他"]}, 
	                  {"type":"購物", "subtype":["全部子分類", "百貨公司", "大賣場", "個性商店", "路邊攤", "其他"]}, 
	                  {"type":"住宿", "subtype":["全部子分類", "飯店", "旅舍", "民宿", "營地", "其他"]},
	                  {"type":"景點", "subtype":["全部子分類", "風景區", "國家公園", "古蹟", "遊樂園", "其他"]},
	                  {"type":"活動", "subtype":["全部子分類", "藝文展覽", "親子活動", "競賽活動", "其他"]}];
	
	initElementsSpotInfo();
	
	
	
	
	// config category
	jQuery('#queryCityIdMenu').on('show.bs.dropdown', function () {
		jQuery("#queryCityIdMenu .dropdown-menu").show();
	}).on("hide.bs.dropdown", function(){
		jQuery("#queryCityIdMenu .dropdown-menu").hide();
	});
	
	jQuery("#queryCityIdMenu .dropdown-menu li").click(function(){
		//console.log(jQuery(this).text());
		jQuery("#queryCity").val(jQuery(this).text());
		jQuery("#queryCityIdMenu .dropdown-menu").hide();
		
		activeQuery(0, true);
	}); 
	
	jQuery('#queryCategoryIdMenu').on('show.bs.dropdown', function () {
		jQuery("#queryCategoryIdMenu .dropdown-menu").show();
	}).on("hide.bs.dropdown", function(){
		jQuery("#queryCategoryIdMenu .dropdown-menu").hide();
	});
	
	jQuery("#queryCategoryIdMenu .dropdown-menu li").click(function(){
		//console.log(jQuery(this).index());
		jQuery("#queryCategory").val(jQuery(this).text());
		jQuery("#queryCategoryIdMenu .dropdown-menu").hide();
		
		// populate subcategory
		var subcategories = categories[jQuery(this).index()].subtype;
		//console.log(subcategories);
		jQuery("#subqueryCategory").attr("placeholder", "全部子分類");
		jQuery("#subqueryCategory").val("");
		jQuery("#subqueryCategoryIdMenu ul:first").empty();
		jQuery.each(subcategories, function(index, value){
			jQuery("#subqueryCategoryIdMenu ul:first").append("<li><a href='#'>"+value+"</a></li>");
		});
		
		if (!jQuery('#subqueryCategoryGroup').is(':visible'))
			jQuery("#subqueryCategoryGroup").show();
		
		activeQuery(0, true);
	});
	
	// config subcategory
	jQuery("#subqueryCategoryGroup").hide();
	jQuery('#subqueryCategoryIdMenu').on('show.bs.dropdown', function () {
		jQuery("#subqueryCategoryIdMenu .dropdown-menu").show();
	}).on("hide.bs.dropdown", function(){
		jQuery("#subqueryCategoryIdMenu .dropdown-menu").hide();
	});
	
	jQuery("#subqueryCategoryIdMenu .dropdown-menu").on("click", "li",function(){
		//console.log(jQuery(this).text());
		jQuery("#subqueryCategory").val(jQuery(this).text());
		jQuery("#subqueryCategoryIdMenu .queryItemScrollable").hide();
		
		activeQuery(0, true);
	});
	
	// to trigger modal view
	//var selectedSpotId;
	//var spotInfo;
	
	jQuery("#listDetails").on("click", ".jm-item-title", function(){
		
		selectedSpotId = jQuery(this).attr("id");
		console.log("spot id : " + selectedSpotId);
		jQuery.ajax({
			type : "POST",
			url : '<c:url value='/controller/GetSpot' />',
			data : {
				spotId : selectedSpotId
			},
			dataType : "json"
		}).done(function(data){
			displaySpotInfo(data);
		});
		//jQuery('#spotInfoModalLabel')
	});
	
	
	// input field : spot name
	jQuery('#querySpotName').on("change", function() {
		
		activeQuery(0, true);
	}); 
	
	// load data from server
	activeQuery(0, true);
	
	
	
	function initElementsSpotInfo() {
		// populate city ids
		var cities = [ "全部縣市", "基隆", "台北", "桃園", "新竹", "苗栗", "dummy", "彰化", "台中", "南投",
				"雲林", "嘉義", "dummy", "台南", "高雄", "屏東", "dummy", "綠島", "蘭嶼",
				"澎湖", "金門", "馬祖" ];
		jQuery.each(cities, function(index, value) {
			//console.log(value);
			if (value == 'dummy')
				jQuery("#queryCityIdMenu ul:first").append("<li class='divider'></li>");
			else
				jQuery("#queryCityIdMenu ul:first").append(
						"<li><a href='#'>" + value + "</a></li>");
		});

		// populate category
		jQuery.each(categories, function(index, value) {
			var type = value.type;
			jQuery("#queryCategoryIdMenu ul:first").append(
					"<li><a href='#'>" + type + "</a></li>");
		});
	}

	/*
	var curPath = window.location.pathname;
	var rootPath = window.location.protocol+"//"+window.location.host+
					":"+window.location.port+"/"
	*/					
	function activeQuery(pageNo, redrawIndex) {
		//console.log("activeQuery : page : " + pageNo);
		//console.log("activeQuery : redrawIndex : " + redrawIndex);	
		
		var spotName = jQuery('#querySpotName').val();
		//console.log("querySpotName : " + spotName);
		var city = jQuery("#queryCity").val();
		//console.log("city : " + city);
		var category = jQuery('#queryCategory').val();
		//console.log("queryCategory : " + category);
		var subcategory = jQuery('#subqueryCategory').val();
		//console.log("subqueryCategory : " + subCategory);
        
		var totalPageCount = 0;
		jQuery.ajax({
			type : "POST",
			url : '<c:url value='/controller/SearchSpotPaging' />',
			data : {
				spotName : spotName,
				city : city,
				category : category,
				subcategory : subcategory,
				pageNo:pageNo
			}
		}).done(function(data) {
			//console.log("detail from server....." + data);
			jQuery('#listDetails').empty();	
			
			jQuery.each(data, function(index, value){
				//console.log("Hello" + index + ":" + value);		
				if(index == 0) {
					totalPageCount = value.totalPageCount;
					return;
				}
				
				var owner=value.Leader;
				if(owner==""){						
					jQuery('#listDetails').append(
							"<div class='col-xs-4'><div class='jm-item second'><div class='jm-item-wrapper'><div class='thumbnail'><div class='jm-item-image'><img class='img-portfolio img-responsive' src='"
							+value.spotThumbnail 
							+" ' style='width:330px; height:220px;'><p class='pull-right'>個人按讚</p><p id='p"+value.spotId+"' class='pull-right'> "+value.spotLike+"</p><div  class='jm-item-description'>"
							+value.spotIntro							
							+ "</div></div>"
							+ "<a href='#'><div class='jm-item-title' id='" + value.spotId + "'>"
							+ value.spotName
							+"</div></a></div><div id='l"+value.spotId+"' style=' text-align:right;'></div></div><div>"
							//+ "<div class='ratings'><p class='pull-right'>個人按讚</p><p id='p"+value.spotId+"' class='pull-right'> "+value.spotLike+"</p><t class='"+value.spotId+"'>"
					); // end of jQuery
				}else{
					jQuery('#listDetails').append(
							"<div class='col-xs-4'><div class='jm-item second'><div class='jm-item-wrapper'><div class='thumbnail'><div class='jm-item-image'><img class='img-portfolio img-responsive'  src='"
							+value.spotThumbnail 
							+" ' style='width:330px; height:220px;'><p class='pull-right'>個人按讚</p><p id='p"+value.spotId+"' class='pull-right'> "+value.spotLike+"</p><div class='jm-item-description'>"
							+value.spotIntro							
							+ "</div></div>"
							+ "<a href='#'><div class='jm-item-title' id='" + value.spotId + "'><img src='../images/hometag.png' style='width:25px; hight:25px;'/>"
							+ value.spotName
							+"</div></a></div><div id='l"+value.spotId+"' style='text-align:right;'></div></div><div>"
							//+ "</div><div class='ratings'><p class='pull-right'>個人按讚</p><p id='p"+value.spotId+"' class='pull-right'> "+value.spotLike+"</p><t class='"+value.spotId+"'>"
					); // end of jQuery
					
				}
				jQuery.ajax({
					url : '<c:url value='/controller/CheckSpotLikeServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",
					async : false,
					dataType : "text",	
					data : {SpotId:value.spotId},						
					success : function(data) {						
						if(data=="NoAccount"){							
							jQuery('#l'+value.spotId).append("<a id='social' href='javascript: void(0);' ><i id='ih"+value.spotId+"' class='fa fa-heart-o fa-lg' style='margin-left:5px; color:#ff443e;' title='按讚' onclick='like(this.id)'></i></a>");
							
						}else if(data=="Like"){
						//有登錄的話依據like紀錄顯示圖片
							jQuery('#l'+value.spotId).append("<a id='social' href='javascript: void(0);' ><i id='ih"+value.spotId+"' class='fa fa-heart fa-lg' style='margin-left:5px; color:#ff443e;' title='收回讚' onclick='like(this.id)'></i></a>");
							
						}else if(data=="NoLike"){
						//有登錄的話依據like紀錄顯示圖片
							jQuery('#l'+value.spotId).append("<a id='social' href='javascript: void(0);' ><i id='ih"+value.spotId+"' class='fa fa-heart-o fa-lg' style='margin-left:5px; color:#ff443e;' title='按讚' onclick='like(this.id)'></i></a>");
						
						}																						
					}				
				});	
				
				jQuery.ajax({
					url : '<c:url value='/controller/CheckSpotCollectServlet'/>',
					type : "GET",
					contentType : "application/json; charset=utf-8",
					async : false,
					dataType : "text",	
					data : {SpotId:value.spotId},						
					success : function(data) {														
						if(data=="NoAccount"){							
							jQuery('#l'+value.spotId).append("<a id='social' href='javascript: void(0);' ><i id='ip"+value.spotId+ "' class='fa fa-plus fa-lg' style='margin-left:5px;' title='收藏'onclick='collect(this.id)'></i></a>");
							
						}else if(data=="Collect"){
						
							jQuery('#l'+value.spotId).append("<a id='social' href='javascript: void(0);' ><i id='ip"+value.spotId+"' class='fa fa-minus fa-lg' style='margin-left:5px;' title='取消收藏' onclick='collect(this.id)'></i></a>");
							
						}else if(data=="NoCollect"){
						
							jQuery('#l'+value.spotId).append("<a id='social' href='javascript: void(0);' ><i id='ip"+value.spotId+ "' class='fa fa-plus fa-lg' style='margin-left:5px;' title='收藏'onclick='collect(this.id)'></i></a>");
						
						}																						
					}				
				});					
				jQuery('#listDetails').append("</t></div>");				
				jQuery('#listDetails').append("</div></div>");
				
			});
			
			//console.log("total page count : " + totalPageCount);
			// pagination
			if(redrawIndex == true) {
				jQuery("#pages").empty();
				jQuery("#pages").append("<ul id='pagination' class='pagination-sm' ></ul>");
				
				jQuery('#pagination').twbsPagination({
			        totalPages: totalPageCount,
			        visiblePages: 5,
			        
			        onPageClick: function (event, page) {
			        	//console.log("select page : " + page);
			            jQuery('#page-content').text('Page ' + page);
			            activeQuery(page, false);
			        }
			    });
			}
		});
	}// end of avtiveQuery
	
	

});	
//}(jQuery, google));
</script>
    	
</body>
</html>