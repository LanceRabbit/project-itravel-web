<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>This is a test page.</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrap-theme.css" />
<link rel="stylesheet" href="css/jquery.datetimepicker.css" />

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<!-- 如果從Google下載失敗，我們就從自己的Server上下載jQuery.js檔 -->
<script>
	!window.jQuery && document.write("<script src='js/jquery-1.11.1.min.js'><\/script>")
</script>
<script src="js/bootstrap.js"></script>

</head>
<body>



<script type="text/javascript">
		$(document).ready(function() {
			 console.log("get data from server....");

			var maxDay = 0 ;
			$.ajax({
				 url:"TripDetailServlet",
				 type:"post",
				 contentType: "application/json; charset=utf-8",
				 dataType:"json", //xml,text
				 success:function(data){
					 console.log("get data from server....");
					 //console.log(String(data));
					 console.log(data);
					 $.each(data,function(index,value){
						 maxDay = (maxDay < value.dayOrder)?value.dayOrder:maxDay;
						 console.log(value.spotName +  value.stayTime );
						 
						 console.log(value.dayOrder +  value.spotOrder + value.stayTime );
						
						
						
					 });	
					 console.log(maxDay);
				 }
			 });
			
		 });
</script>		
</body>


</html>