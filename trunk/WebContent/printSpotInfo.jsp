<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	int i = 0;
%>
<c:set value='images' var='imgDir'/>
<c:set value='/' var='dir'/>
<c:set value='0' var='counter' />

<c:forEach var='spot' items='${spots}'>
	<c:set value='${imgDir}${dir}${spot.spotId}${dir}${spot.spotImgs.size()}' var='path'/>
	
	<!--  
	<c:catch var='e'>
    	<c:import url='${path}' />
	</c:catch>
	<c:if test='${!empty e}'>
		<c:set value='dummy' var='dummy' />
	    <c:set value='${imgDir}${dir}${dummy}' var='path'/>
	</c:if>
	-->
	<div>
		<img src='${path}'/>
		<br/>
		<h2>${spot.spotName}</h2>
	</div>	
	<%
		i++;
		if(i%3 == 0)
			out.println("<br/>");
	%>
</c:forEach>



</body>
</html>