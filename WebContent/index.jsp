<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Welcome</title>
</head>
<%
	//该方法路径以/开始不以/结束
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<body>
	<script type="text/javascript"
		src="${APP_PATH}/static/js/jquery-3.3.1.js"></script>
	<h1>welcome!</h1> 
	<form action="" id="adminlogin">
		用户名：<input type="text" name="adName"/><br/><br/>
		密码：<input type="password" name="adPassword"/><br/><br/>
		<button type="reset">重置</button>
		<input type="button" value="提交" onclick="checkLogin()"/>
	</form>
	<!-- Ajax提交之后，返回modelandview对象，实现跳转登录成功的页面，但Ajax的回调函数会阻止跳转 -->
	<script type="text/javascript">
	function checkLogin(){
		$.ajax({
			url:"${APP_PATH}/admin/in",
			type:"GET",
			data:$("#adminlogin").serialize(),
			success:function(result){
				if(result.code == 100){
					window.location.href="${APP_PATH}/admin.jsp?adName="
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
	</script>
</body>
</html>