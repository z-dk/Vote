<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%
	//该方法路径以/开始不以/结束
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link rel="icon" href="${APP_PATH }/static/images/vote.ico" type="image/x-icon"/>
<title>welcome</title>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
	<script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.js"></script>
	<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<form>
	<div id="userlogin">
		<div class="row">
			<div class="dropdown">
			<div class="col-sm-2 col-sm-offset-8">
	  			<button id="dLabel" type="button" data-toggle="dropdown" 
	  				aria-haspopup="true" aria-expanded="false" class="btn btn-default btn-block">
	    			${param.userName }
	    			<span class="caret"></span>
	  			</button>
	  			<ul class="dropdown-menu" aria-labelledby="dLabel">
	   				<li id="updatephone"><a href="#">修改信息</a></li>
	   				<li id="updatepwd"><a href="#">修改密码</a></li>
	   				<li><a href="${APP_PATH }/user/exit">退出</a></li>
	   			</ul>
			</div>
			</div>
		
			<div class="col-sm-2 col-sm-offset-2">
      			<input type="text" class="form-control" id="theme"/>
			</div>
			<div class="col-sm-1">
				<input type="button" class="btn btn-default btn-block" value="搜索" id="search"/>
			</div>
			<div class="col-sm-1">
				<input type="button" class="btn btn-danger btn-block" value="删除" id="deleteall"/>
			</div>
			<div class="col-sm-1">
				<input type="button" class="btn btn-primary btn-block" value="发起投票" id="createvote"/>
			</div>
			<div class="col-sm-1">
				<input type="button" class="btn btn-primary btn-block" value="去投票" onclick="tovoting()"/>
			</div>
			<div class="col-sm-8 col-sm-offset-2">
			<table class="table table-hover" id="votetable">
				<thead>
					<tr>
						<th style="text-align:center"><input type="checkbox" id="checkall"/></th>
						<th style="text-align:center">#</th>
						<th style="text-align:center">voteName</th>
						<th style="text-align:center">voteBrief</th>
						<th style="text-align:center">操作</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			</div>
			<div class="row">
				<div class="col-md-4 col-sm-offset-2" id="page_info_area"></div>
				<div class="col-md-4" id="nav_info_area"></div>
			</div>
		</div>
	</div>
	</form>
	<!-- Modal用户密码修改模态框 -->
	<div class="modal fade" id="userpwdmodal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">密码修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="userpwdmodalform">
					  <div class="form-group">
					    <label class="col-sm-3 control-label">用户名</label>
					    <div class="col-sm-9">
					      <p class="form-control-static" id="userName2"></p>
					      
					    </div>
					  </div>
					  <div class="form-group">
					  	<label class="col-sm-3 control-label">新密码</label>
					  	<div class="col-sm-4">
							<input type="password" name="userPassword" class="form-control" id="newpwd"/>
					      	<span class="help-block"></span>
					  	</div>
					  </div>
					  <div class="form-group">
					  	<label class="col-sm-3 control-label">确认新密码</label>
					  	<div class="col-sm-4">
							<input type="password" class="form-control" id="confirmnewpwd"/>
					      	<span class="help-block"></span>
					  	</div>
					  </div>
					</form>
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="commit2">确认</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal用户信息修改模态框 -->
	<div class="modal fade" id="userphonemodal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">信息修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="userphonemodalform">
					  <div class="form-group">
					    <label class="col-sm-3 control-label">用户名</label>
					    <div class="col-sm-9">
					      <p class="form-control-static" id="userName1"></p>
					      
					    </div>
					  </div>
					  <div class="form-group">
					  	<label class="col-sm-3 control-label">手机号码</label>
					  	<div class="col-sm-4">
							<input type="text" name="phoneNum" class="form-control" id="phone"/>
					      	<span class="help-block"></span>
					  	</div>
					  </div>
					  
					</form>
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="commit1">确认</button>
				</div>
			</div>
		</div>
	</div>
	
	<script language="javascript">
		var totalRecord;
		var currentPage;
		var userId="${param.userId}";
		var userName="${param.userName}";
	
		$(function(){
			build_user();
		})
		function build_user(){
			$("#checkall").prop("checked",false);
			var theme = $("#theme").val();
			toPage(theme,1,userId);
			
			//添加监听
			$("#search").click(function (){
				var theme = $("#theme").val();
				toPage(theme,1,userId);
			})
		}
		function build_votes_table(votes){
			$("#votetable tbody").empty();
			$.each(votes, function(index,item){
				var tr = $("<tr></tr>");
				var cheTd = $("<td align='center'><input type='checkbox' class='select' /></td>");
				var idTd = $("<td align='center'></td>").append(item.voteId);
				var nameTd = $("<td align='center'></td>").append(item.voteName);
				var briefTd = $("<td align='center'></td>").append(item.voteBrief);
				var see = $("<button class='btn btn-primary seemore' type='button'></button>").append("查看");
				var del = $("<button class='del-btn btn btn-danger' type='button'></button>").append("删除");
				del.attr("del-id",item.voteId);
				see.attr("see-id",item.voteId);
				var opTd = $("<td align='center'></td>").append(see).append(" ").append(del);
				tr.append(cheTd).append(idTd).append(nameTd).append(briefTd).append(opTd);
				$("#votetable tbody").append(tr);
			})
		}
		function toPage(theme,pn,uId){
			$.ajax({
				url:"${APP_PATH}/getuservote/"+theme+"do",
				data :{ "pn": pn,"uId":uId},
				type:"POST",
				success:function(result){
					
					var votes = result.extend.pageInfo.list;
					if(votes.length == 0){
						alert("没有符合条件的结果");
					}else{
						build_votes_table(votes);
						build_page_info(result);
						build_nav_info(result);
					}
				}
			})
		}
		//单击查看按钮，显示投票详情
		$(document).on("click",".seemore",function(){
			var voteId = $(this).attr("see-id");
			window.location.href="${APP_PATH}/user/voteinfo?voteId="+voteId;
			
		})
		//单击单个员工删除按钮
		$(document).on("click",".del-btn",function(){
			var voteName = $(this).parents("tr").find("td:eq(2)").text();
			var voteId = $(this).attr("del-id");
			if(confirm("确认要删除【"+voteName+"】吗？")){
				//如果为真，则要删除
				$.ajax({
					url:"${APP_PATH}/delete/"+voteId,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						var theme = $("#theme").val();
						toPage(theme,1,userId);
					},
					error:function(){
						alert("处理失败！");
					}
				})
			}
		})
		//单击全选按钮，选择全部
		$(document).on("click","#checkall",function(){
			//使用attr来获取自定义属性值，prop来获取原生属性值
			$(".select").prop("checked",$(this).prop("checked"));
		})
		$(document).on("click",".select",function(){
			var flag = $(".select:checked").length==$(".select").length;
			$("#checkall").prop("checked",flag);
		})
		$("#deleteall").click(function(){
			var voteNames = "";
			var votedelids = "";
			$.each($(".select:checked"),function(){
				voteNames += $(this).parents("tr").find("td:eq(2)").text()+",";
				votedelids += $(this).parents("tr").find("td:eq(1)").text()+"-";
			})
			voteNames = voteNames.substring(0,voteNames.length-1);
			votedelids = votedelids.substring(0,votedelids.length-1);
			if(confirm("确认要删除【"+voteNames+"】吗？")){
				$.ajax({
					url:"${APP_PATH}/delete/"+votedelids,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						toPage("",1,userId);
					}
				})
			}
		});
		
//=============================================用户密码修改模态框========================================================		
		//用户密码修改模态框显示
		$("#updatepwd").click(function updatepwd(){
			//清空模态框表单数据
			clear_form("#userpwdmodalform");
			$("#commit2").attr("user-id","${param.userId}");
			$("#userpwdmodal").modal({
				backdrop:"static"
			});
			$("#userName2").text("${param.userName}");
		})
		//密码修改确认提交
		$(document).on("click","#commit2",function(){
			if($("#newpwd").val()==$("#confirmnewpwd").val()){
				$.ajax({
					url:"${APP_PATH}/user/updatepwd/"+$(this).attr("user-id"),
					data:$("#userpwdmodalform").serialize(),
					type:"POST",
					success:function(result){
						alert(result.msg);
						$("#userpwdmodal").modal("hide");
					},
					error:function(){
						alert("修改失败！");
					}
				})
			}else{
				show_validate_status("#confirmnewpwd","error","两次密码不一致");
			}
		})
//============================================用户信息修改模态框=================================================
		//用户信息修改模态框显示
		$("#updatephone").click(function updatephone(){
			//清空模态框表单数据
			clear_form("#userphonemodalform");
			$("#commit1").attr("user-id","${param.userId}");
			$("#userphonemodal").modal({
				backdrop:"static"
			});
			$("#userName1").text("${param.userName}");
		})
		//密码修改确认提交
		$(document).on("click","#commit1",function(){
			
			$.ajax({
				url:"${APP_PATH}/user/updatephone/"+$(this).attr("user-id"),
				data:$("#userphonemodalform").serialize(),
				type:"POST",
				success:function(result){
					alert(result.msg);
					$("#userphonemodal").modal("hide");
				},
				error:function(){
					alert("修改失败！");
				}
			})
			
		})
		//清空表单
		function clear_form(ele){
			$(ele)[0].reset();
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		//显示表单校验信息
		function show_validate_status(ele,status,msg){
			//清空校验类型
			$(ele).parent().removeClass("has-error has-success");
			$(ele).next("span").text("");
			if(status== "error"){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text((msg));
			}else if(status=="success"){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text((msg));
			}
		}
		//显示分页信息
		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"第" + result.extend.pageInfo.pageNum + "页,总"
							+ result.extend.pageInfo.pages + "页,总共"
							+ result.extend.pageInfo.total + "条记录");
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}
		//显示分页导航条
		function build_nav_info(result) {
			//清空之前的数据，防止页面刷新，页面叠加显示
			$("#nav_info_area").empty();
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));

			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				var theme=$("#theme").val();
				firstPageLi.click(function() {
					toPage(theme,1,userId);
				});
				prePageLi.click(function() {
					toPage(theme,result.extend.pageInfo.pageNum - 1,userId);
				});
			}
			if (result.extend.pageInfo.hasNextPage == false) {
				lastPageLi.addClass("disabled");
				nextPageLi.addClass("disabled");
			} else {
				var theme=$("#theme").val();
				lastPageLi.click(function() {
					toPage(theme,totalRecord,userId);
				});
				nextPageLi.click(function() {
					toPage(theme,result.extend.pageInfo.pageNum + 1,userId);
				});
			}

			var ul = $("<ul></ul>").addClass("pagination").append(firstPageLi)
					.append(prePageLi);

			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var li = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					li.addClass("active");
				}
				li.click(function() {
					var theme=$("#theme").val();
					toPage(theme,item,userId);
				});
				ul.append(li);
			});

			ul.append(nextPageLi).append(lastPageLi);
			var nav = $("<nav></nav>").append(ul).appendTo("#nav_info_area");
		}
//==============================================发起投票=================================================
		$("#createvote").click(function(){
			window.location.href="${APP_PATH}/user/createvote?userId="+userId+"&userName="+userName;
		})
		function tovoting(){
			window.location.href="${APP_PATH}/user/votesall";
		}
	</script>
</body>
</html>