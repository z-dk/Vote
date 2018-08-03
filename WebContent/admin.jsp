<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理员登录</title>
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
</head>
<body>
	<form>
	<div id="adminlogin">
	<h1>Welcome! ${param.adName }</h1>
		<div class="row">
			<div class="col-sm-2 col-sm-offset-2">
      			<input type="text" class="form-control" id="theme"/>
			</div>
			<div class="col-sm-1">
				<input type="button" class="btn btn-default btn-block" value="搜索" id="search"/>
			</div>
			<div class="col-sm-1">
				<input type="button" class="btn btn-danger btn-block" value="删除" id="deleteall"/>
			</div>
			<div class="col-sm-8 col-sm-offset-2">
			<table class="table table-hover" id="votetable">
				<thead>
					<tr>
						<th style="text-align:center"><input type="checkbox" id="checkall"/></th>
						<th style="text-align:center">#</th>
						<th style="text-align:center">voteName</th>
						<th style="text-align:center">voteBrief</th>
						<th style="text-align:center">userId</th>
						<th style="text-align:center">操作</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			</div>
		</div>
	</div>
	</form>
	
	
	
	
	
	
	<script language="javascript">
		$(function(){
			build_admin();
		})
		function build_admin(){
			$("#checkall").prop("checked",false);
			
			var theme = $("#theme").val();
			build_votes(theme);
			//添加监听
			$("#search").click(function (){
				var theme = $("#theme").val();
				build_votes(theme);
			})
		}
		function build_votes(theme){
			$.ajax({
				url:"${APP_PATH}/getvotebytheme/"+theme,
				type:"POST",
				success:function(result){
					$("#votetable tbody").empty();
					var votes = result.extend.votes;
					if(votes.length == 0){
						alert("没有符合条件的结果");
					}else{
						$.each(votes, function(index,item){
							var tr = $("<tr></tr>");
							var cheTd = $("<td align='center'><input type='checkbox' class='select' /></td>");
							var idTd = $("<td align='center'></td>").append(item.voteId);
							var nameTd = $("<td align='center'></td>").append(item.voteName);
							var briefTd = $("<td align='center'></td>").append(item.voteBrief);
							var uIdTd = $("<td align='center'></td>").append(item.uId);
							var see = $("<button id='seemore' class='btn btn-primary' type='button'></button>").append("查看");
							var del = $("<button class='del-btn btn btn-danger' type='button'></button>").append("删除");
							del.attr("del-id",item.voteId);
							see.attr("see-id",item.voteId);
							var opTd = $("<td align='center'></td>").append(see).append(" ").append(del);
							tr.append(cheTd).append(idTd).append(nameTd).append(briefTd)
								.append(uIdTd).append(opTd);
							$("#votetable tbody").append(tr);
						})
					}
				}
			})
		}
		//单击查看按钮，显示投票详情
		$(document).on("click","#seemore",function(){
			var voteId = $(this).attr("see-id");
			window.location.href="${APP_PATH}/voteinfo?voteId="+voteId;
			/* $.ajax({
				url:"${APP_PATH}/voteinfo"+voteId,
				type:"POST",
				success:function(){
					
				}
			}) */
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
						build_votes(theme);
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
						build_votes("");
					}
				})
			}
		})
	</script>
</body>
</html>