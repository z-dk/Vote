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
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" />
	<script type="text/javascript"
		src="${APP_PATH}/static/js/jquery-3.3.1.js"></script>
	<script
		src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="icon" href="${APP_PATH }/static/images/vote.ico" type="image/x-icon"/>
<title>投票详情</title>
</head>
<body>
	<h3 align="center">${vote.voteName }</h3>
	<h4 align="center"><font color="#b3b5ba">${vote.voteBrief }</font></h4>
	<div class="jumbotron">
	<div class="row">
		<div class="col-sm-3 col-sm-offset-3">
			创建时间：<fmt:formatDate value="${vote.startTime}" pattern="yyyy-MM-dd HH:mm:ss" /> 
		</div>
		<div class="col-sm-3">
			截止时间：<fmt:formatDate value="${vote.endTime}" pattern="yyyy-MM-dd HH:mm:ss" /> 
		</div>
		<br /><br />
	</div>
	
	<c:forEach items="${vote.options }" var="item" varStatus="id">
		<div class="row">
			<div class="col-sm-2 col-sm-offset-3" data-toggle="tooltip" data-placement="top" title="${item.opBrief }">
				${item.opName }
			</div>
			<div class="col-sm-3">
				<div class="progress">
		  			<div class="progress-bar" role="progressbar" aria-valuenow="${item.opTotal*100/(total==0?1:total) }"
		  				aria-valuemin="0" aria-valuemax="100" 
		  				style="min-width: 2em;width:${item.opTotal*100/total }%">
		    			<fmt:formatNumber type="percent" value="${ item.opTotal/(total==0?1:total)}"/>
		  			</div>
				</div>
			</div>
			<div class="col-sm-1">${item.opTotal }票</div>
			<div class="col-sm-1">
				<c:forEach items="${myOptions}" var="item1">
					<c:if test="${item1==item.opId }">
						<span class="glyphicon glyphicon-ok"></span>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</c:forEach>
	<h5 align="center">总票数：${total }</h5>
	<div class="row">
		<div class="col-sm-12">
		<br />
		<br />
			<div class="col-sm-1 col-sm-offset-7">
			<c:choose>
				<c:when test="${not empty userId}">
					<c:if var="result" test="${userId==vote.uId }">
						<button type="button" class="btn btn-warning" onclick="updatevote()">修改投票</button>
					</c:if>
					<c:if test="${!result }">
						<h5>您已投票</h5>
					</c:if>
				</c:when>
				<c:when test="${not empty adId }">
					管理员
				</c:when>
				<c:otherwise>
					出错，既非用户访问，也非管理员访问
				</c:otherwise>
			</c:choose>
			</div>
			<div class="col-sm-1">
				<button type="button" class="btn btn-warning" onclick="backfirst()">个人中心</button>
			</div>
		</div>
	</div>
	</div>
	<script type="text/javascript">
		var who,userName,userId,adName,adId;
		$(function(){
			console.log("${myOptions}");
			if("${not empty userName}"=="true"){
				userName="${userName}";
				userId = "${userId}";
				who = 2;
			}else if("${not empty adName}"=="true"){
				who = 1;
				adName = "${adName}";
				adId = "${adId}";
			}else
				alert("出错，既不是用户访问，也不是管理员访问");
			
		})
		var voteId="${vote.voteId}";
		function updatevote(){
			window.location.href="${APP_PATH}/user/updatevote?voteId="+voteId;
		}
		function backfirst(){
			if(who==2)
				window.location.href="${APP_PATH}/user/success?userName="+userName+"&userId="+userId;
			else if(who==1)
				window.location.href="${APP_PATH}/admin/success?adName="+adName+"&adId="+adId;
		}
	</script>
</body>
</html>