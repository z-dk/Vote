<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
    //获取项目根路径
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
	<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
	<script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.js"></script>
	<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<link rel="icon" href="${APP_PATH }/static/images/vote.ico" type="image/x-icon"/>
<title>帮助中心</title>
</head>
<body>
<iframe src="${APP_PATH }/iframes/header.jsp" width="100%"
		frameborder="0" height="75px" scrolling="no"></iframe>
		<div class="row">
		<div class="col-sm-10 col-sm-offset-1">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
     <img alt="Brand" src="${APP_PATH }/static/images/help.png">
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li id="submit"><a href="#">提交未解决问题</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">常见问题 <span class="caret"></span></a>
          <ul class="dropdown-menu" id="question">
            <li><a href="#">如何创建投票项目</a></li>
            <li><a href="#">如何管理投票项目</a></li>
            <li><a href="#">如何参与投票项目</a></li>
            <li><a href="#">如何查找投票项目</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">用户注册与登录</a></li>
            <li><a href="#">找回密码</a></li>
            <li><a href="#">修改用户密码</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
       <ol class="breadcrumb">
         <li><a href="${APP_PATH }/index.jsp?userName=${userName}&userId=${userId}">主页</a></li>
         <li><a href="${APP_PATH}/help">帮助中心</a></li>
         <li class="active">如何创建投票项目</li>
      </ol>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</div></div>

<div class="row" id="main">
  <div class="col-sm-10 col-sm-offset-1">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">如何创建投票项目</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">如何管理投票项目</a></li>
    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">如何参与投票项目</a></li>
    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">如何查找投票项目</a></li>
    <li role="presentation"><a href="#setting1" aria-controls="setting1" role="tab" data-toggle="tab">用户注册与登录</a></li>
    <li role="presentation"><a href="#setting2" aria-controls="setting2" role="tab" data-toggle="tab">找回密码</a></li>
    <li role="presentation"><a href="#setting3" aria-controls="setting3" role="tab" data-toggle="tab">修改用户密码</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
    <img
		src="${APP_PATH}/static/operate/operate1.png" alt="operate1"
		class="img-thumbnail" id="operate1" style="width:200px; height : 150px"> <br>
    ①首先在网站主页面登录账户，若没有账户可以先进行用户注册。<br>
    <img
		src="${APP_PATH}/static/operate/operate2.png" alt="operate2"
		class="img-thumbnail" id="operate2" style="width:200px; height : 150px"> 
		<img
		src="${APP_PATH}/static/operate/operate3.png" alt="operate3"
		class="img-thumbnail" id="operate3" style="width:200px; height : 150px">
		<img
		src="${APP_PATH}/static/operate/operate4.png" alt="operate4"
		class="img-thumbnail" id="operate4" style="width:200px; height : 150px"> <br>
    ②用户登录之后可以在主页面点击创建投票，或者点击用户名进入个人中心后，点击发起投票。<br>
    <img
		src="${APP_PATH}/static/operate/operate5.png" alt="operate5"
		class="img-thumbnail" id="operate5 " style="width:200px; height : 150px"> <br>
     ③进入创建投票页面后，根据所需填写信息填写信息后，点击完成按钮，完成你需要创建的投票。<br>
    </div>
    
    
    <div role="tabpanel" class="tab-pane" id="profile">
     <img
		src="${APP_PATH}/static/operate/operate1.png" alt="operate1"
		class="img-thumbnail" id="operate1" style="width:200px; height : 150px"> <br>
    ①首先在网站主页面登录账户，若没有账户可以先进行用户注册。<br>
		<img
		src="${APP_PATH}/static/operate/operate3.png" alt="operate3"
		class="img-thumbnail" id="operate3" style="width:200px; height : 150px">
		 <br>
    ②用户登录之后，点击用户名进入个人中心<br>
    <img
		src="${APP_PATH}/static/operate/operate6.png" alt="operate6"
		class="img-thumbnail" id="operate6 " style="width:400px; height : 300px"> <br>
     ③进入个人管理页面后，显示自己创建的投票，可以进行对投票的相关管理，并可以进行投票<br></div>
     
     
    <div role="tabpanel" class="tab-pane" id="messages">
  <img
		src="${APP_PATH}/static/operate/operate1.png" alt="operate1"
		class="img-thumbnail" id="operate1" style="width:200px; height : 150px"> <br>
    ①首先在网站主页面登录账户，若没有账户可以先进行用户注册。<br>
		<img
		src="${APP_PATH}/static/operate/operate3.png" alt="operate3"
		class="img-thumbnail" id="operate3" style="width:200px; height : 150px">
		 <br>
    ②用户登录之后，点击用户名进入个人中心<br>
    <img
		src="${APP_PATH}/static/operate/operate6.png" alt="operate6"
		class="img-thumbnail" id="operate6 " style="width:400px; height : 300px"> <br>
     ③进入个人管理页面后，点击去投票，跳转到所有投票项目页面<br>
     <img
		src="${APP_PATH}/static/operate/operate7.png" alt="operate7"
		class="img-thumbnail" id="operate7 " style="width:400px; height : 300px"> <br>
     ④点击你想投票的项目后的去投票按钮<br>
     </div>
    
    
    <div role="tabpanel" class="tab-pane" id="settings">
     <img
		src="${APP_PATH}/static/operate/operate1.png" alt="operate1"
		class="img-thumbnail" id="operate1" style="width:200px; height : 150px"> <br>
    ①首先在网站主页面登录账户，若没有账户可以先进行用户注册。<br>
		<img
		src="${APP_PATH}/static/operate/operate3.png" alt="operate3"
		class="img-thumbnail" id="operate3" style="width:200px; height : 150px">
		 <br>
    ②用户登录之后，点击用户名进入个人中心点击查看按钮，来查看自己创建的投票项目<br>
    <img
		src="${APP_PATH}/static/operate/operate6.png" alt="operate6"
		class="img-thumbnail" id="operate6 " style="width:400px; height : 300px"> <br>
     ③点击查看按钮，来查看自己创建的投票项目 进入个人管理页面后<br>
     <img
		src="${APP_PATH}/static/operate/operate7.png" alt="operate7"
		class="img-thumbnail" id="operate7 " style="width:400px; height : 300px"> <br>
     ④点击去投票，跳转到所有投票项目页面，点击已投来查看你投过的投票项目详情<br></div>
     
     
    <div role="tabpanel" class="tab-pane" id="setting1">
    <img
		src="${APP_PATH}/static/operate/operate8.png" alt="operate8"
		class="img-thumbnail" id="operate8" style="width:200px; height : 150px"> <br>
    ①点击页面主页右上角的注册按钮<br>
		<img
		src="${APP_PATH}/static/operate/operate9.png" alt="operate9"
		class="img-thumbnail" id="operate9" style="width:300px; height : 400px">
		 <br>
    ②在注册模态框里，填写注册必要的信息，点击注册来进行注册<br>
    <img
		src="${APP_PATH}/static/operate/operate10.png" alt="operate10"
		class="img-thumbnail" id="operate10 " style="width:400px; height : 350px"> <br>
     ③注册成功后,点击页面上的登录按钮后，进行登录<br>
    </div>
    <div role="tabpanel" class="tab-pane" id="setting2">
     <img
		src="${APP_PATH}/static/operate/operate1.png" alt="operate1"
		class="img-thumbnail" id="operate1" style="width:200px; height : 150px"> <br>
    ①点击页面主页右上角的登录按钮<br>
		<img
		src="${APP_PATH}/static/operate/operate10.png" alt="operate10"
		class="img-thumbnail" id="operate10" style="width:300px; height : 400px">
		 <br>
    ②在登录模态框里，点击忘记密码<br>
    <img
		src="${APP_PATH}/static/operate/operate11.png" alt="operate11"
		class="img-thumbnail" id="operate11 " style="width:400px; height : 350px"> <br>
     ③在找回密码模态框里填写相关信息来修改密码<br></div>
     
     
    <div role="tabpanel" class="tab-pane" id="setting3">
    <img
		src="${APP_PATH}/static/operate/operate1.png" alt="operate1"
		class="img-thumbnail" id="operate1" style="width:200px; height : 150px"> <br>
    ①首先在网站主页点击登录按钮进行用户登录<br>
		<img
		src="${APP_PATH}/static/operate/operate6.png" alt="operate6"
		class="img-thumbnail" id="operate6" style="width:400px; height : 300px">
		 <br>
    ②用户登录之后，点击用户名，进入个人中心<br>
    <img
		src="${APP_PATH}/static/operate/operate12.png" alt="operate12"
		class="img-thumbnail" id="operate12 " style="width:400px; height : 300px"> <br>
     ③在个人中心页面，点击用户名下的修改密码<br>
     <img
		src="${APP_PATH}/static/operate/operate13.png" alt="operate13"
		class="img-thumbnail" id="operate13 " style="width:200px; height : 150px"> <br>
     ④在修改密码模态框中修改自己的密码<br>
    </div>
  </div>
</div>
</div>
<div id = "Service" style="display: none" class="row">
<div class="col-sm-10 col-sm-offset-1">
<h3>请将你未解决的问题和遇到的错误提交给我们:</h3>
<form class="form-horizontal">
  <textarea class="form-control" rows="3" id="problemarea"></textarea>
  <br><br>
  <div class="form-group">
    <div class="col-sm-offset-11">
      <button type="submit" class="btn btn-primary" onclick="commit()">提交客服<span class="glyphicon glyphicon-user" aria-hidden="true">
      </span></button>
    </div>
  </div>
</form>
</div>
</div>
<script type="text/javascript">
   var $a=$("#question").find("a")
   $a.click(function(){
	  $("#main").show()
	  $("#Service").hide()
	  /*  $a.index(this) */
	  /*  $(".nav-tabs>li").removeClass("active") */
	  var b = $("ol>li").eq(2)
	  b.empty();
	  var c = $($(".nav-tabs>li").eq( $a.index(this))).children("a").html()
	  b.html(c)
	  $(".nav-tabs>li").eq( $a.index(this)).tab("show")
	  $(".tab-content>div").hide()
	  $(".tab-content>div").eq( $a.index(this)).show()
   })
  var $b = $(".nav-tabs>li")
    $b.click(function(){
      var c = $("ol>li").eq(2)
  	  c.empty();
  	  var d = $(this).children("a").html()
  	  c.html(d)
  	  $(".tab-content>div").hide()
	  $(".tab-content>div").eq( $b.index(this)).show()
    })
   $("#submit").click(function(){
	   $("#main").hide()
	   $("#Service").show()
   })
   function commit(){
	   if($("#problemarea").val()=="")
	   		alert("提交内容不能为空！");
	   else{
		   alert("提交成功！");
	   }
   }
</script>

</body>
</html>