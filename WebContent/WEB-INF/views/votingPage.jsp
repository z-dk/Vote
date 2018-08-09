<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>欢迎投票</title>
<%
	//该方法路径以/开始不以/结束
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-3.3.1.js"></script>
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<iframe src="${APP_PATH }/iframes/header.jsp" width="100%"
		frameborder="0" height="75px"></iframe>
	来投票喽！
	<br /> 投票 标题：${vote.voteName }
	<form action="">
		<div class="col-sm-8 col-sm-offset-2">
			<table class="table table-hover" id="votetable">
				<caption>${vote.voteName }</caption>
				<thead>
					<tr>
						<th style="text-align: center">#</th>
						<th style="text-align: center">OptionName</th>
						<th style="text-align: center">OptionBrief</th>
						<th style="text-align: center">select</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${vote.options }" var="item" varStatus="id">
						<tr>
							<td align="center">${id.count }</td>
							<td align="center">${item.opName }</td>
							<td align="center">${item.opBrief }</td>
							<td align="center">
								<input type="radio"></input>
							</td>
						</tr>
						<br />
					</c:forEach>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>