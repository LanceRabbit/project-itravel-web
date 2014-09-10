<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="model.dao.*" %>
<%@ page import="model.util.*" %>
<%@ page import="model.*" %>
<%@ page import="org.hibernate.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>This is a test page.</title>
</head>
<body>
<%
	SpotDetailDAOHibernate spotDetailDAO = new SpotDetailDAOHibernate();
	SpotDetail spot = spotDetailDAO.select("RES14090008");
	
	Set<SpotImg> images = spot.getSpotImgs();
	
	if(images == null) {
		System.out.println("no image got from spot");
		return;
	}
	
	Iterator<SpotImg> it = images.iterator();
	
	out.println("<table>");
	String path = null;

	while(it.hasNext()) {
		out.println("<tr>");
		SpotImg image = (SpotImg)it.next();
		if(!((image != null) && (image.getSpotImg() != null))) {
			System.out.println("no image");
			continue;	
		}
		
		path = "images/" + image.getSpotId() + "/" + image.getImgId();
		System.out.println("path : " + path);
		ImageIOUtil.saveImage(image.getSpotId(), image.getImgId(), image.getSpotImg());
		session.setAttribute("spot", image.getSpotDetail());
%>
	<a href="<c:url value='SpotInfo.do?id=${spot.spotId}'/>">
<%		
		
		out.println("<img src=\'"+path+"\'/>");
%>
	</a>
<%
		out.println("</tr><br/>");
	}
	out.println("</table>");
%>
</body>
</html>