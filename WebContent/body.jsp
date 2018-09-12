<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<div style="height:20px"> </div>
<h1 align="center"><font color="white">经典投票案例</font></h1>
<!-- 案例图片 -->
<div class="row">
<div class="col-sm-2 col-sm-offset-3">
	<img src="${APP_PATH}/static/images/Example1.png" alt="Example1"
		class="img-thumbnail" id="Example1"></div>
<div class="col-sm-2" > 
	<img src="${APP_PATH}/static/images/Example2.png"
		alt="Example2" class="img-thumbnail" id="Example2"> </div>
<div class="col-sm-2" >
	<img
		src="${APP_PATH}/static/images/Example3.png" alt="Example3"
		class="img-thumbnail" id="Example3"> </div>
</div>
<div style="height:20px"> </div>
<div class="row">
<div class="col-sm-2 col-sm-offset-3">
	<img src="${APP_PATH}/static/images/Example4.png" alt="Example4"
		class="img-thumbnail" id="Example4"></div>
<div class="col-sm-2" > 
	<img src="${APP_PATH}/static/images/Example5.png"
		alt="Example5" class="img-thumbnail" id="Example5"> </div>
<div class="col-sm-2" >
	<img
		src="${APP_PATH}/static/images/Example6.png" alt="Example6"
		class="img-thumbnail" id="Example6"> </div>
</div>
<div style="height:20px"> </div>
<div class="row">
<div class="col-sm-2 col-sm-offset-3">
	<img src="${APP_PATH}/static/images/Example7.png" alt="Example7"
		class="img-thumbnail" id="Example7"></div>
<div class="col-sm-2" > 
	<img src="${APP_PATH}/static/images/Example8.png"
		alt="Example8" class="img-thumbnail" id="Example8"> </div>
<div class="col-sm-2" >
	<img
		src="${APP_PATH}/static/images/Example9.png" alt="Example9"
		class="img-thumbnail" id="Example9"> </div>
</div>

<!-- 特色介绍 -->
<div style="height:20px"> </div>
<h1 align="center"><font color="white">我们的服务优势</font></h1>
<div style="height:20px"> </div>
<div class="row">
<div class="col-sm-2 col-sm-offset-2">
	<img src="${APP_PATH}/static/images/Characteristic1.png" alt="Characteristic1.png"
		class="img-thumbnail" id="Characteristic1.png">
		<h3 align="center"><font color="white">行业翘楚</font></h3>
		<font color="white">我们专业提供投票营销工具;</font><br>
		<font color="white">帮助用户公众号轻松涨粉,提高知名度;</font><br>
		<font color="white">目前已为多场活动提供技术支持。</font></div>
<div class="col-sm-2" > 
	<img src="${APP_PATH}/static/images/Characteristic2.png"
		alt="Characteristic2.png" class="img-thumbnail" id="Characteristic2.png">
		<h3 align="center"><font color="white">操作简单</font></h3>
		<font color="white">报名信息自由删改，模板皮肤随心更换;</font><br>
		<font color="white">生成一个投票活动仅需几分钟；</font><br>
		<font color="white">后台实时监测数据波动。</font> </div>
<div class="col-sm-2" >
	<img
		src="${APP_PATH}/static/images/Characteristic3.png" alt="Characteristic3.png"
		class="img-thumbnail" id="Characteristic3.png"> 
		<h3 align="center"><font color="white">高效涨粉</font></h3>
		<font color="white">有效提升品牌人气，扩大知名度;</font><br>
		<font color="white">一键生成二维码＆链接线上线下都能用;</font><br>
		<font color="white">单次活动当天浏览量20万人次。</font></div>
		<div class="col-sm-2" >
	<img
		src="${APP_PATH}/static/images/Characteristic4.png" alt="Characteristic4.png"
		class="img-thumbnail" id="Characteristic4.png"> 
		<h3 align="center"><font color="white">稳定无忧</font></h3>
		<font color="white">阿里云百兆带宽服务器;</font><br>
		<font color="white">客服7*15小时全程在线;</font><br>
		<font color="white">51微投票团队为你的活动保驾护航。</font></div>
</div>

<div style="height:20px"> </div>
<!-- 合作品牌轮播图 -->
<h1 align="center"><font color="white">合作品牌</font></h1>
<h2 align="center"><font color="white">你信任的品牌也在使用</font></h2>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox" style=" width: 1080px;height: 178px;overflow: hidden;position: relative;margin: 0 auto;">
    <div class="item active">
      <img src="${APP_PATH}/static/images/hezuo1.png" alt="1" style="width: 1080px;height: 178px">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img src="${APP_PATH}/static/images/hezuo2.png" alt="2" style="width: 1080px;height: 178px">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img src="${APP_PATH}/static/images/hezuo3.png" alt="3" style="width: 1080px;height: 178px">
      <div class="carousel-caption">
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<script type="text/javascript">
$("#Example1").click(function(){
	alert("chenggong")
})
$("#Example2").click(function(){
	
})
$("#Example3").click(function(){
	
})
$("#Example4").click(function(){
	
})
$("#Example5").click(function(){
	
})
$("#Example6").click(function(){
	
})
$("#Example7").click(function(){
	
})
$("#Example8").click(function(){
	
})
$("#Example9").click(function(){
	
})
$("#to_Characteristic").click(function(){
	 var $page = $('html,body')
	    var distance = $('html').scrollTop() + $('body').scrollTop()
	       // 总时间
	    var time = 500
	      // 间隔时间
	    var intervalTime = 50
	    var itemDistance = 1390/(time/intervalTime)
	      // 使用循环定时器不断滚动
	    var intervalId = setInterval(function () {
	      distance += itemDistance
	      // 到达顶部, 停止定时器
	      if(distance>=1390) {
	        distance = 1390 //修正
	        clearInterval(intervalId)
	      }
	      $page.scrollTop(distance)
	    }, intervalTime) 

})
$("#to_bottom").click(function(){
	 var $page = $('html,body')
	    var distance = $('html').scrollTop() + $('body').scrollTop()
	       // 总时间
	    var time = 500
	      // 间隔时间
	    var intervalTime = 50
	    var itemDistance = 1787/(time/intervalTime)
	      // 使用循环定时器不断滚动
	    var intervalId = setInterval(function () {
	      distance += itemDistance
	      // 到达顶部, 停止定时器
	      if(distance>=1787) {
	        distance = 1787 //修正
	        clearInterval(intervalId)
	      }
	      $page.scrollTop(distance)
	    }, intervalTime) 
 
})

$("#to_case").click(function(){
	 var $page = $('html,body')
	    var distance = $('html').scrollTop() + $('body').scrollTop()
	       // 总时间
	     var time = 500
	      // 间隔时间
	    var intervalTime = 50
	    var itemDistance = 672/(time/intervalTime)
	      // 使用循环定时器不断滚动
	    var intervalId = setInterval(function () {
	      distance += itemDistance
	      // 到达顶部, 停止定时器
	      if(distance>=672) {
	        distance = 672 //修正
	        clearInterval(intervalId)
	      }
	      $page.scrollTop(distance)
	    }, intervalTime)  
 
})

</script>