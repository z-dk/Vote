<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%
	//该方法路径以/开始不以/结束
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link rel="icon" href="${APP_PATH }/static/images/vote.ico" type="image/x-icon"/>
<title>Vote</title>
	<style type="text/css">
		@import "${APP_PATH}/static/css/index.css";
		.space{
		height:70px;
		width:100px;
		float:left;
	}
	</style>
	
</head>
<body>
	<script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="${APP_PATH}/static/js/mousefollowing.js"></script>
	
	<div id="container">
		<%-- <iframe src="${APP_PATH }/iframes/header.jsp" width="100%"
			frameborder="0" height="75px" scrolling="no"></iframe> --%>
			
		<div style="background-color:rgba(0,0,0,0); float:left; width:100%; height:70px;">
			<div class="space"></div>
			<a href="${APP_PATH }/index.jsp">
				<img src="${APP_PATH }/static/images/vote.png" style="float:left;"/>
			</a>
		</div>
			
		<form action="" id="adminlogin">
			用户名：<input type="text" name="adName"/><br/><br/>
			密码：<input type="password" name="adPassword"/><br/><br/>
			<button type="reset">重置</button>
			<input type="button" value="提交" onclick="checkLogin()"/>
		</form><br />
		=================================华丽的分界线=================================<br/><br/>
		<form action="" id="userlogin">
			用户名：<input type="text" name="userName"/><br/><br/>
			密码：<input type="password" name="userPassword"/><br/><br/>
			<button type="reset">重置</button>
			<input type="button" value="提交" onclick="userLogin()"/>
		</form><br />
		=================================华丽的分界线=================================<br/><br/>
		
	</div>
	<canvas id="canvas" width="1280" height="322"></canvas>
	<audio autoplay="autoplay">
		<source src="http://m2.music.126.net/z5t-DBv6ugHWN8BCGynjSw==/7715273092477776.mp3" type="audio/mpeg">
	</audio>
	<!-- Ajax提交之后，返回modelandview对象，实现跳转登录成功的页面，但Ajax的回调函数会阻止跳转 -->
	<script type="text/javascript">
	function checkLogin(){
		$.ajax({
			url:"${APP_PATH}/admin/check",
			type:"GET",
			data:$("#adminlogin").serialize(),
			success:function(result){
				if(result.code == 100){
					window.location.href="${APP_PATH}/admin/success?adName="
							+result.extend.admin.adName+"&adId="+result.extend.admin.adId;
				}else{
					alert("用户名或密码错误！");
				}
			},
			error:function(){
				alert("请求失败！");
			}
		})
	}
	function userLogin(){
		$.ajax({
			url:"${APP_PATH}/user/check",
			type:"GET",
			data:$("#userlogin").serialize(),
			success:function(result){
				if(result.code == 100){
					window.location.href="${APP_PATH}/user/success?userName="
							+result.extend.user.userName+"&userId="+result.extend.user.userId;
				}else{
					alert("用户名或密码错误！");
				}
			},
			error:function(){
				alert("请求失败！");
			}
		})
	}
	
	</script>
</body>
</html>