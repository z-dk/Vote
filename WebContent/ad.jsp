<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link rel="stylesheet" href="${APP_PATH }/static/css/jigsaw.css"/>
	<script src="${APP_PATH }/static/js/jigsaw.js"></script>
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-3.3.1.js"></script>
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="icon" href="${APP_PATH }/static/images/vote.ico"
	type="image/x-icon" />
<title>Vote</title>
<style type="text/css">
	.refreshIcon {
	    position: absolute;
	    right: 0;
	    top: 0;
	    width: 34px;
	    height: 34px;
	    cursor: pointer;
	    background: url(http://cstaticdun.126.net//2.6.3/images/icon_light.f13cff3.png) 0 -437px;
	    background-size: 34px 471px;
    }
</style>

</head>
<body>
	<script type="text/javascript"
		src="${APP_PATH}/static/js/jquery-3.3.1.js"></script>

	<div id="container">
		<div
			style="background-color: rgba(0, 0, 0, 0); float: left; width: 100%; height: 70px;">
			<div class="space"></div>
			<a href="${APP_PATH }/index.jsp"> <img
				src="${APP_PATH }/static/images/vote.png" style="float: left;" />
			</a>
		</div>
		<form class="form-horizontal" id="adminlogin">
			<div class="form-group">
				<label for="inputEmail3"
					class="col-sm-2 col-sm-offset-2 control-label">AdminName</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="adName"
						placeholder="UserName"/>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3"
					class="col-sm-2 col-sm-offset-2 control-label">Password</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" name="adPassword"
						placeholder="Password"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-2 col-sm-offset-4">
					<div id="loginyzm" style="position: relative;width:310px;"></div>
					<div id="msg"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-6 col-sm-1">
					<button type="reset" class="btn btn-block btn-default" id="reset">重置</button>
				</div>
				<div class="col-sm-1">
					<button type="submit" class="btn btn-block btn-default" id="login"
						disabled="disabled" onclick="checkLogin()">登录</button>
				</div>
			</div>
		</form>
	</div>

	<!-- Ajax提交之后，返回modelandview对象，实现跳转登录成功的页面，但Ajax的回调函数会阻止跳转 -->
	<script type="text/javascript">
	jigsaw.init(document.getElementById('loginyzm'), function () {
		document.getElementById("login").disabled="";
	})
	$("#reset").click(function() {
		$("#login").attr("disabled","disabled");
		$(".refreshIcon").click();
	})
		function checkLogin() {
			$(".refreshIcon").click();
			$.ajax({
				url : "${APP_PATH}/admin/check",
				type : "GET",
				data : $("#adminlogin").serialize(),
				success : function(result) {
					if (result.code == 100) {
						window.location.href = "${APP_PATH}/admin/success?adName="
								+ result.extend.admin.adName
								+ "&adId="
								+ result.extend.admin.adId;
					} else {
						alert("用户名或密码错误！");
					}
				},
				error : function() {
					alert("请求失败！");
				}
			})
		}
	</script>
</body>
</html>