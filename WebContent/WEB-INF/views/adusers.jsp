<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
	<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"rel="stylesheet" />
	<script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.js"></script>
	<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<link rel="icon" href="${APP_PATH }/static/images/vote.ico"type="image/x-icon" />
<title>用户列表</title>
</head>
<body>
	<form action="">
		<div class="row">
			<div class="col-sm-2 col-sm-offset-5">
				<h3>用户信息管理</h3>
			</div>
			<div class="col-sm-2 col-sm-offset-1">
				<h4>${adName }</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-2 col-sm-offset-2">
      			<input type="text" class="form-control" id="theme"/>
			</div>
			<div class="col-sm-1">
				<input type="button" class="btn btn-default btn-block" value="搜索" id="search"/>
			</div>
			<div class="col-sm-1">
				<input type="button" class="btn btn-default btn-block" value="投票管理" id="vote"/>
			</div>
			
			<div class="col-sm-8 col-sm-offset-2">
			<table class="table table-hover" id="usertable">
				<thead>
					<tr>
						<th style="text-align:center">#</th>
						<th style="text-align:center">userName</th>
						<th style="text-align:center">userInfo</th>
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
	</form>
	
	<script language="javascript">
		var adName = "${adName}";
		var adId = "${adId}";
		var totalRecord;
		var currentPage;
		var theme="";
	
		$(function(){
			build_admin();
		})
		function build_admin(){
			$("#checkall").prop("checked",false);
			theme = $("#theme").val();
			toPage(theme,1);
			//添加监听
			$("#search").click(function (){
				theme = $("#theme").val();
				toPage(theme,1);
			})
			$("#append").click(function (){
				theme = $("#theme").val();
				toPage(theme,1);
			})
		}
		function build_users_table(users,flag){
			$("#usertable tbody").empty();
			$.each(users, function(index,item){
				var tr = $("<tr></tr>");
				var idTd = $("<td align='center'></td>").append(item.userId);
				var nameTd = $("<td align='center'></td>").append(item.userName);
				var uIdTd = $("<td align='center'></td>").append(item.phoneNum);
				
				var del = $("<button class='btn btn-danger' type='button'></button>").append("注销");
				
				del.attr("see-id",item.userId);
				var opTd = $("<td align='center'></td>").append(del).append(" ");
				tr.append(idTd).append(nameTd)
					.append(uIdTd).append(opTd);
				$("#usertable tbody").append(tr);
			})
		}
		//build_votes()修改为toPage()
		//toPage不完善
		function toPage(theme,pn){
			$.ajax({
				url:"${APP_PATH}/admin/getusers/"+theme+"do",
				data : "pn=" + pn ,
				type:"POST",
				success:function(result){
					if(result.extend.pageInfo==null){
						console.log(result);
						alert("暂无任何用户！");
						theme=" ";
					}else{
						var users = result.extend.pageInfo.list;
						if(users.length == 0){
							alert("没有符合条件的结果");
						}else{
							console.log(result);
							build_users_table(users);
							build_page_info(result);
							build_nav_info(result);
						}
					}
				}
			})
		}
		//去投票，进入投票页面
		$(document).on("click",".btn-danger",function(){
			var userId = $(this).attr("see-id");
			$.ajax({
				url:"${APP_PATH}/admin/getvotebyuserid?userId="+userId,
				type:"GET",
				success:function(result){
					console.log(result);
					if(result.extend.count==0){
						window.location.href="${APP_PATH}/admin/del?userId="+userId;
						alert("删除成功！");
					}else{
						alert("该用户已有发起的投票，如要继续删除该用户，请先删除该用户已发起的投票！");
					}
				},
				error:function(){
					alert("系统错误！");				
				}
			})
		})
		
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
		//构建分页条
		function build_nav_info(result,flag) {
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
				theme = $("#theme").val();
				firstPageLi.click(function() {
					toPage(theme,1);
				});
				prePageLi.click(function() {
					toPage(theme,result.extend.pageInfo.pageNum - 1);
				});
			}
			if (result.extend.pageInfo.hasNextPage == false) {
				lastPageLi.addClass("disabled");
				nextPageLi.addClass("disabled");
			} else {
				theme = $("#theme").val();
				lastPageLi.click(function() {
					toPage(theme,totalRecord);
				});
				nextPageLi.click(function() {
					toPage(theme,result.extend.pageInfo.pageNum + 1);
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
					theme = $("#theme").val();
					toPage(theme,item);
				});
				ul.append(li);
			});

			ul.append(nextPageLi).append(lastPageLi);
			var nav = $("<nav></nav>").append(ul).appendTo("#nav_info_area");
		}
		$("#vote").click(function(){
			window.location.href="${APP_PATH}/admin/success?adName="+adName+"&adId="+adId;
		})
	</script>
</body>
</html>