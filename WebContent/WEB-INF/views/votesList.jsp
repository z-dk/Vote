<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>投票列表</title>
<%
	//该方法路径以/开始不以/结束
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.js"></script>
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<iframe src="${APP_PATH }/iframes/header.jsp" width="100%"
		frameborder="0" height="75px" scrolling="no"></iframe>
	<form action="">
		<div class="row">
			<div class="col-sm-2 col-sm-offset-2">
      			<input type="text" class="form-control" id="theme"/>
			</div>
			<div class="col-sm-1">
				<input type="button" class="btn btn-default btn-block" value="搜索" id="search"/>
			</div>
			<div class="col-sm-8 col-sm-offset-2">
			<table class="table table-hover" id="votetable">
				<thead>
					<tr>
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
			<div class="row">
				<div class="col-md-4 col-sm-offset-2" id="page_info_area"></div>
				<div class="col-md-4" id="nav_info_area"></div>
			</div>
		</div>
	</form>
	
	<script language="javascript">
		var totalRecord;
		var currentPage;
	
		$(function(){
			build_admin();
		})
		function build_admin(){
			$("#checkall").prop("checked",false);
			var theme = $("#theme").val();
			toPage(theme,1);
			//添加监听
			$("#search").click(function (){
				var theme = $("#theme").val();
				toPage(theme,1);
			})
		}
		function build_votes_table(votes){
			$("#votetable tbody").empty();
			$.each(votes, function(index,item){
				var tr = $("<tr></tr>");
				var idTd = $("<td align='center'></td>").append(item.voteId);
				var nameTd = $("<td align='center'></td>").append(item.voteName);
				var briefTd = $("<td align='center'></td>").append(item.voteBrief);
				var uIdTd = $("<td align='center'></td>").append(item.uId);
				var see = $("<button id='seemore' class='btn btn-primary' type='button'></button>").append("去投票");
				see.attr("see-id",item.voteId);
				var opTd = $("<td align='center'></td>").append(see).append(" ");
				tr.append(idTd).append(nameTd).append(briefTd)
					.append(uIdTd).append(opTd);
				$("#votetable tbody").append(tr);
			})
		}
		//build_votes()修改为toPage()
		//toPage不完善
		function toPage(theme,pn){
			$.ajax({
				url:"${APP_PATH}/getvotebytheme/"+theme+"do",
				data : "pn=" + pn,
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
		//去投票，进入投票页面
		$(document).on("click","#seemore",function(){
			var voteId = $(this).attr("see-id");
			$.ajax({
				url:"${APP_PATH}/checklimit/"+voteId,
				type:"GET",
				cache:false,
				success:function(result){
					if(result.extend.result){
						window.location.href="${APP_PATH}/user/voteinfo?voteId="+voteId;
					}else{
						window.location.href="${APP_PATH}/user/votingPage?voteId="+voteId;
					}
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
				var theme = $("#theme").val();
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
				var theme = $("#theme").val();
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
					var theme = $("#theme").val();
					toPage(theme,item);
				});
				ul.append(li);
			});

			ul.append(nextPageLi).append(lastPageLi);
			var nav = $("<nav></nav>").append(ul).appendTo("#nav_info_area");
		}
	</script>
</body>
</html>