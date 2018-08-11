<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<%
	//该方法路径以/开始不以/结束
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<style>
	.space{
		height:70px;
		width:100px;
		float:left;
	}
</style>
</head>
<body>
	<div style="background-color:rgba(0,0,0,0);">
		<div class="space"></div>
		<a href="${APP_PATH }/index.jsp">
			<img src="${APP_PATH }/static/images/vote.png" style="float:left;"/>
		</a>
	</div>

</body>
</html>