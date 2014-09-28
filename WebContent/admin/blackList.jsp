<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>黑名單</title>
<style>
.container{
	font-family:Microsoft JhengHei;
}
.nav-tabs{
	font-weight: bold;
}

.table-hover{

}

</style>
</head>
<body>
<jsp:include page="/fragment/Top.jsp"/>

<div class="container">
<ul class="nav nav-tabs">
  <li class="active"><a href="#blackListWaiting" data-toggle="tab" >待處理</a></li>
  <li class=""><a href="#oneWeekLockedList" data-toggle="tab">水桶一週</a></li>
  <li class=""><a href="#frozenList" data-toggle="tab">帳戶凍結</a></li>
</ul>

<div id="myTabContent" class="tab-content">
  <div class="tab-pane fade active in" id="blackListWaiting">
  	<table class="table table-striped table-hover ">
	  <thead>
	    <tr>
	      <th>#</th>
	      <th>檢舉人</th>
	      <th>被檢舉人</th>
	      <th>景點序號</th>
	      <th>評論內容</th>
	      <th>狀態</th>
	      <th>確認</th>
	    </tr>
	  </thead>
	  <tbody id="tbBlackList">
	  </tbody>
	</table> 
  </div>
  <div class="tab-pane fade" id="oneWeekLockedList">
  	<p>水桶一週清單</p>
  </div>
  <div class="tab-pane fade" id="frozenList">
  	<p>凍結清單</p>
  </div>
</div>
</div>




<jsp:include page="/fragment/bottom.jsp"/>
<script>
$(document).ready(function(){
	
	
	
});




</script>

</body>
</html>