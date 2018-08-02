<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1>welcome!</h1> 
	<form action="${APP_PATH}/admin/in" id="adminlogin" onsubmit="false">
		用户名：<input type="text" name="adName"/><br/><br/>
		密码：<input type="password" name="adPassword"/><br/><br/>
		<button onclick="checkLogin()" type="button">登录</button>
		<input type="submit" value="提交"/>
	</form>
	<script language="javascript">
		function checkLogin(){
			$.ajax({
				url:"${APP_PATH}/admin/in",
				type:"GET",
				data:$("#adminlogin").serialize(),
				success:function(result){
					if(result.code == 100){
						//alert("登录成功！");
						$("#adminlogin").empty();
						build_admin();
					}else{
						alert("用户名或密码错误！");
					}
				},
				error:function(){
					alert("请求失败！");
				}
			})
		}
		function build_admin(){
			$("#adminlogin").empty();
			
			var text = $("<input type='text' id='name'></input>").text("");
			var btnByTheme = $("<input type='button' id='btnByTheme' value='查询主题'></input>");
			var btnByUser = $("<input type='button' id='btnByUser' value='查询用户'></input>");
			var tableDiv = $("<div id='voteTable'></div>");
			//var bootDiv = $("<div></div>").append("没有符合条件的结果");
			$("#adminlogin").append(text).append(btnByTheme)
				.append(btnByUser).append(tableDiv);
			//创建表格表头
			var voteTable = $("<table id='votes' border='1px' width='800px' align='center'></table>");
			var thead = $("<thead></thead>");
			var tbody = $("<tbody></tbody>");
			var voteTr = $("<tr></tr>")
			var checkTd = $("<th align='center'></th>").append("<input type='checkbox' id='checkall'/>");
			var idTd = $("<th align='center'></th>").append("#");
			var nameTd = $("<th align='center'></th>").append("voteName");
			var briefTd = $("<th align='center'></th>").append("voteBrief");
			var uIdTd = $("<th align='center'></th>").append("userId");
			var opTd = $("<th align='center'></th>").append("操作");
			$("#checkall").prop("checked",false);
			voteTr.append(checkTd).append(idTd).append(nameTd)
				.append(briefTd).append(uIdTd).append(opTd);
			thead.append(voteTr);
			thead.appendTo(voteTable);
			tbody.appendTo(voteTable);
			$("#voteTable").append(voteTable);
			var theme = $("#name").val();
			build_votes(theme);
			//添加监听
			$("#btnByTheme").click(function (){
				var theme = $("#name").val();
				build_votes(theme);
			})
		}
		function build_votes(theme){
			$.ajax({
				url:"${APP_PATH}/getvotebytheme/"+theme,
				type:"GET",
				//data:theme,
				success:function(result){
					//console.log(result);
					var votes = result.extend.votes;
					if(votes.length == 0){
						alert("没有符合条件的结果");
					}else{
						$("#voteTable tbody").empty();
						$.each(votes, function(index,item){
							var tr = $("<tr></tr>");
							var cheTd = $("<td align='center'><input type='checkbox' class='select' /></td>");
							var idTd = $("<td align='center'></td>").append(item.voteId);
							var nameTd = $("<td align='center'></td>").append(item.voteName);
							var briefTd = $("<td align='center'></td>").append(item.voteBrief);
							var uIdTd = $("<td align='center'></td>").append(item.uId);
							var see = $("<button id='seemore' type='button'></button>").append("查看");
							var del = $("<button class='del-btn' type='button'></button>").append("删除");
							del.attr("del-id",item.voteId);
							var opTd = $("<td align='center'></td>").append(see).append(del);
							tr.append(cheTd).append(idTd).append(nameTd).append(briefTd)
								.append(uIdTd).append(opTd);
							$("#voteTable tbody").append(tr);
						})
					}
				}
			})
		}
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
						var theme = $("#name").val();
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
	</script>
</body>
</html>