<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
	//该方法路径以/开始不以/结束
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" />
	<script type="text/javascript"
		src="${APP_PATH}/static/js/jquery-3.3.1.js"></script>
	<script
		src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>投票详情</title>
</head>
<body>
	投票标题：${vote.voteName }<br/>
	<c:forEach items="${vote.options }" var="item" varStatus="id">
		<div class="row">
			<div class="col-sm-3">
				投票选项：${item.opName },${item.opBrief },${item.opTotal },${total }
			</div>
			<div class="col-sm-3">
				<div class="progress">
		  			<div class="progress-bar" role="progressbar" aria-valuenow="${item.opTotal*100/total }"
		  				aria-valuemin="0" aria-valuemax="100" 
		  				style="min-width: 2em;width:${item.opTotal*100/total }%">
		    			<fmt:formatNumber type="percent" value="${ item.opTotal/total}"/>
		  			</div>
				</div>
			</div>
		</div>
		<br/>
	</c:forEach>
	<script type="text/javascript">
		
	</script>
</body>
</html>