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
<div>
<c:set value='images' var='imgDir'/>
<c:set value='/' var='dir'/>
<c:set value='${imgDir}${dir}${spotDetail.spotId}${dir}${spotDetail.spotImgs.size()}' var='path'>
</c:set>

<img src='${path}'/>
<br/>
<h2>${spotDetail.spotName}</h2>

</div>
</body>
</html>