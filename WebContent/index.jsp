<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE script PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
    //获取项目根路径
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
	<script type="text/javascript" src="${APP_PATH }/static/js/canvas-particle.js"></script>
	<link rel="stylesheet" href="${APP_PATH }/static/css/jigsaw.css">
	<script src="${APP_PATH }/static/js/jigsaw.js"></script>
	
	
	<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
	<script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.js"></script>
	<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<style>
		body{
			background-color: #2D2D2D
		}
		.header{
			position:fixed; 
			z-index:1; 
			top:0; 
			width:100%; 
			height:70px;
			background-color:transparent; 
		}
		.btn:hover{
			background-color:#ffc526;
		}
			
		.btn-index{
			background:none;
			background-color:transparent;
			color:#ffc526;
			border:1px solid #ffc526;
		}
	</style>
	<link rel="icon" href="${APP_PATH }/static/images/vote.ico" type="image/x-icon"/>
	<title>Vote</title>
</head>
<body>

<!--找回密码时所弹出的模态框 -->
<div class="modal fade" id="findpwdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">找回密码</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">用户名</label>
		    <div class="col-sm-9">
		      <input type="text" name="userName" class="form-control" id="userName3" placeholder="UserName">
		       <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">手机号码</label>
		    <div class="col-sm-9">
		      <input type="text" name="phoneNum" class="form-control" id="phoneNum3" placeholder="phoneNum">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">密码</label>
		    <div class="col-sm-9">
			    <input type="password" class="form-control" id="passwordInput3" placeholder="Password" name="userPassword">
			    <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">确认密码</label>
		    <div class="col-sm-9">
			    <input type="password" class="form-control" id="passwordconfirm3" placeholder="Password">
			    <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-7">
			  <div id="findpwd" style="position: relative"></div>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-9 col-sm-3">
		      <button type="button" class="btn btn-primary" id="commit3" onclick="">提交</button>
		      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		    </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
<!--登陆时所弹出的模态框 -->
<div class="modal fade" id="userLoginInModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">用户登录</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">用户名</label>
		    <div class="col-sm-9">
		      <input type="text" name="userName" class="form-control" id="inputUsername" placeholder="UserName">
		       <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">密码</label>
		    <div class="col-sm-9">
		      <input type="password" name="userPassword" class="form-control" id="inputPassword" placeholder="Password">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-7">
			  <div id="captcha" style="position: relative"></div>
			  <div id="msg"></div>
			  
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-9 col-sm-3">
		      <button type="button" class="btn btn-primary" id="log_in" onclick="login()">登录</button>
		      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		    </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <a href="javascript:void(0);"onclick="findpwda()">忘记密码</a>
      </div>
    </div>
  </div>
</div>

<!-- 注册时弹出的模态框 -->
 <div class="modal fade" id="RegisterInModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">用户注册</h4>
      </div>
      <div class="modal-body">
       <form >
		  <div class="form-group">
		    <label for="col-sm-2 control-label">用户名</label>
		    <input type="text" class="form-control" id="userInput" placeholder="UserName" name="userName">
		    <span class="help-block"></span>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">密码</label>
		    <input type="password" class="form-control" id="passwordInput" placeholder="Password" name="userPassword">
		    <span class="help-block"></span>
		  </div>
		   <div class="form-group">
		    <label for="exampleInputPassword1">确认密码</label>
		    <input type="password" class="form-control" id="passwordInput2" placeholder="Password">
		    <span class="help-block"></span>
		  </div>
		  <div class="form-group">
		    <label for="col-sm-2 control-label">电话号码</label>
		    <input type="text" class="form-control" id="teleNumberInput" placeholder="Telephonenumber" name="phoneNum">
		    <span class="help-block"></span>
		  </div>
		
		  <button type="button" class="btn btn-info" id="Register">注册</button>
		  <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		</form>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
<%-- --%>
	<div style="height:700px;background-image:url('${APP_PATH }/static/images/top.jpg');  background-size:100%100%">
		<div class="header">
		    <div style="height:20px"> </div>
		    <div class="row">
		       <div class="col-sm-2"></div>
		       <div class="col-sm-1">
		       		<button type="button" class="btn btn-index">特色介绍</button>
		       </div>
		       <div class="col-sm-1">
		       		<button type="button" class="btn btn-index">最新案例</button>
		       	</div>
		       <div class="col-sm-1">
		       		<button type="button" class="btn btn-index">运营专区</button>
		       	</div>
		       <div class="col-sm-1">
		       		<button type="button" class="btn btn-index">合作品牌</button>
		       	</div>
		       <div class="col-sm-2"></div>
		       <div class="col-sm-1" id="registerdiv">
		       		<button type="button" class="btn btn-block btn-index" data-toggle="modal" 
		       			data-target="#RegisterInModal" id="Registerbtn">注册</button>
		   		</div>
		       <div class="col-sm-1" id="LoginChange"></div>
		       <div class="col-sm-1"></div>
	  		</div>
	  	</div>
	  	<div class="row">
		   <div style="height:300px"></div>
		   <h1 align="center"><font color="white">更简单的操作、更多用户的选择、更强大的功能</font></h1>
		   <h2 align="center">稳定安全的投票定制工具</h2>
		  
		   <div class="col-sm-5"></div>
		   <div class="col-sm-2">
		   		<button type="button" class="btn btn-warning btn-block" 
		   			id="Createbtn" code="error">创建投票</button>
		   	</div>
		   <div class="col-sm-5"></div>
	  </div>
	  
</div>
	 <script type="text/javascript">
	 var userName,userId;
	
	//找回密码验证码
	jigsaw.init(document.getElementById('findpwd'), function () {
		document.getElementById("commit3").disabled="";
	})

	  /* 鼠标追随特效
	 window.onload = function() {
		    //配置
		    var config = {
		        vx: 4,	//小球x轴速度,正为右，负为左
		        vy: 4,	//小球y轴速度
		        height: 2,	//小球高宽，其实为正方形，所以不宜太大
		        width: 2,
		        count: 200,		//点个数
		        color: "121, 162, 185", 	//点颜色
		        stroke: "130,255,255", 		//线条颜色
		        dist: 6000, 	//点吸附距离
		        e_dist: 20000, 	//鼠标吸附加速距离
		        max_conn: 10 	//点到点最大连接数
		    }

		    //调用
		    CanvasParticle(config);
		} */
	 $(function(){
		  build_login();
		}); 
	 function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
	 $(document).on("click",".login_btn",function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			//alert("绑定成功");
			reset_form("#userLoginInModal form");
		});
	 
	 function show_validate_msg(ele,status,msg){
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error" == status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
	 
	 //发送ajax请求校验用户名是否可用
	 $("#inputUsername").change(function(){
			var userName = this.value;
			$.ajax({
				url:"${APP_PATH}/user/checkuser",
				data:"userName="+userName,
				type:"POST",
				success:function(result){
					if(result.code==200){
						show_validate_msg("#inputUsername","success","");
						$("#log_in").attr("ajax-va","success");
					}else if(result.code==100){
						show_validate_msg("#inputUsername","error","用户名不存在");
						$("#log_in").attr("ajax-va","error");
					}else{
						alert("有问题");
						console.log(result);
					}
				}
			});
		});
	      $("#Createbtn").click(function(){
	    	  if($(this).attr("code")=="error")
	    		  alert("请先进行用户登录");
	    	  else{
	    		  window.location.href="${APP_PATH}/user/createvote?userId="+userId+"&userName="+userName;
	    	  }
	      });
	 
	      $("#Registerbtn").click(function(){
	    	  reset_form("#RegisterInModal form");
	    	//window.location.href="index.jsp";
	      }); 
	    
	    function login(){
	    	$("#log_in").attr("disabled","disabled");
	    	$(".refreshIcon").click();
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
				
			$.ajax({
				url:"${APP_PATH}/user/check",
				type:"GET",
				data:$("#userLoginInModal form").serialize(),
				success:function(result){
					if(result.code == 100){
						userName = result.extend.user.userName;
						userId = result.extend.user.userId;
						$("#userLoginInModal").modal('hide');
						$("#Createbtn").attr("code","success");	
						$("#Createbtn").attr("username",userName);
						build_successLogin();
					}
					else
						{alert(result.msg);}
					}
				})
			
		  };
			
			
			function build_login(){
			  $("#LoginChange").empty();
	    	  $("<button></button>").addClass("btn btn-block btn-index login_btn")
				.attr("data-toggle","modal").attr("data-target","#userLoginInModal").append("登录").appendTo("#LoginChange");
	    	  document.getElementById("log_in").disabled="disabled";
	    	  //用户登录验证码
	    		jigsaw.init(document.getElementById('captcha'), function () {
	    			document.getElementById("log_in").disabled="";
	    		})
	    	}
			

			function build_successLogin(){
				$("#LoginChange").empty();
				var a = $("<li></li>").append($("<a></a>").append("个人中心").attr("href","${APP_PATH}/user/success?userName="
						+userName+"&userId="+userId));
				var a1 = $("<a></a>").append("退出登录").attr("href","${APP_PATH }/user/exit");
				var b = $("<li></li>").append(a1);
				var ul = $("<ul></ul>").addClass("dropdown-menu").append(a).append(b);
				var button =$("<button></button>").addClass("btn btn-index dropdown-toggle").append(userName)
				.attr("data-toggle","dropdown").attr("aria-haspopup","true").attr("aria-expanded","false")
				.append($("<span></span>").addClass("caret"));
				$("#LoginChange").addClass("dropdown").append(button).append(ul);
				$("#registerdiv").empty();
			}
			
			/* 注册页面各组件调用函数 */
			 $("#userInput").change(function(){
					//发送ajax请求校验用户名是否可用
					var userName = this.value;
					$.ajax({
						url:"${APP_PATH}/user/checkuser",
						data:"userName="+userName,
						type:"POST",
						success:function(result){
							if(result.code==100){
								show_validate_msg("#userInput","success","用户名可用");
								$("#Register").attr("ajax-va","success");
							}else{
								show_validate_msg("#userInput","error",result.extend.va_msg);
								$("#Register").attr("ajax-va","error");
							}
						}
					});
				});
			
			 $("#passwordInput").change(function(){
				   var password = $("#passwordInput").val();
					var regpassword = /(^[a-zA-Z0-9_-]{6,16}$)/;
					if(!regpassword.test(password)){
						show_validate_msg("#passwordInput", "error", "密码为6-16位，且不能有非法字符");
						$("#Register").attr("ajax-va","error");
						}
					else{
						show_validate_msg("#passwordInput", "success", "");
						$("#Register").attr("ajax-va","success");
					}
			   });
			   //注册模态框两次密码确认
			   $("#passwordInput2").change(function(){
				   var password = $("#passwordInput").val();
				   var password2 = $("#passwordInput2").val();
					if(password!=password2){
						show_validate_msg("#passwordInput2", "error", "两次密码输入不一致");
						$("#Register").attr("ajax-va","error");
						}
					else{
						show_validate_msg("#passwordInput2", "success", "");
						$("#Register").attr("ajax-va","success");
					}
			   });
			   //找回密码模态框两次密码确认
			   $("#passwordconfirm3").change(function(){
				   var password = $("#passwordInput3").val();
				   var password2 = $("#passwordconfirm3").val();
					if(password!=password2){
						show_validate_msg("#passwordconfirm3", "error", "两次密码输入不一致");
					}
					else{
						show_validate_msg("#passwordconfirm3", "success", "");
					}
			   });
			    $("#teleNumberInput").change(function(){
				   var telenumber = $("#teleNumberInput").val();
				   var a = /^1[34578]\d{9}$/; 
					if(!a.test(telenumber)){
						show_validate_msg("#teleNumberInput", "error", "请输入正确的电话号码");
						$("#Register").attr("ajax-va","error");
						}
					else{
						show_validate_msg("#teleNumberInput", "success", "");
						$("#Register").attr("ajax-va","success");
					}
			   });
			   
			   
			    $("#Register").click(function(){
					//1、判断之前的ajax用户名校验是否成功。如果成功。
					 if($(this).attr("ajax-va")=="error"){
						return false; 
					} 
					//2、发送ajax请求保存
					$.ajax({
						url:"${APP_PATH}/user/adduser",
						type:"POST",
						data:$("#RegisterInModal form").serialize(),
						success:function(result){
							//alert(result.msg);
							if(result.code == 100){
								alert("注册成功");
								$("#RegisterInModal").modal('hide');
							}else {
								//有哪个字段的错误信息就显示哪个字段的；
								if(undefined != result.extend.errorFields.userName){
									show_validate_msg("#userInput", "error", result.extend.errorFields.userName);
								}
								if(undefined != result.extend.errorFields.userPassword){
									show_validate_msg("#passwordInput", "error", result.extend.errorFields.userPassword);
								}
								if(undefined != result.extend.errorFields.userTel){
									show_validate_msg("#teleNumberInput", "error", result.extend.errorFields.userTel);
								}
								
							} 
						}
					});
				});
	 	function findpwda(){
	 		$('#userLoginInModal').modal('hide');
	 		$('#findpwdModal').modal('show');
	 		reset_form("#findpwdModal form");
	 		$("#commit3").attr("disabled","disabled");
	 	}
	 	$("#commit3").click(function(){
	 		$(".refreshIcon").click();
	 		$("#commit3").attr("disabled","disabled");
	 		$.ajax({
	 			url:"${APP_PATH}/user/findpwd",
	 			data:$("#findpwdModal form").serialize(),
	 			type:"POST",
	 			success:function(result){
	 				if(result.code==100){
	 					alert("密码重置成功！");
	 					$('#findpwdModal').modal('hide');
	 				}else if(result.code==200){
	 					alert("用户名或手机号码验证失败！");
	 					reset_form("#findpwdModal form");
	 				}else{
	 					alert("有问题！");
	 				}
	 			}
	 		})
	 	})
	 </script>
</body>
</html>