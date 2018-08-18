<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>欢迎投票</title>
<%
	//该方法路径以/开始不以/结束
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-3.3.1.js"></script>
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div style="height:70px; width:100px; float:left;"></div>
	<a href="${APP_PATH }/index.jsp">
		<img src="${APP_PATH }/static/images/vote.png" style="float:left;"/>
	</a>
	<br /> <br /><br /><br />
	
	<!-- Nav tabs -->
	<div class="col-sm-4">
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active">
				<a href="#home" aria-controls="home" role="tab" data-toggle="tab" id="1">背景介绍</a>
			</li>
			<li role="presentation">
				<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" id="2">投票说明</a>
			</li>
			
		</ul>
		
		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="home" style="height:150px;">
				<br />
				<h4>&nbsp&nbsp&nbsp&nbsp${vote.voteName }</h4>
				<h5>&nbsp &nbsp &nbsp &nbsp ${vote.voteBrief }</h5>
			</div>
			<div role="tabpanel" class="tab-pane" id="profile">
				投票规则
				时间
				<fmt:formatDate value="${vote.endTime}" pattern="yyyy-MM-dd HH:mm:ss" /> 
				之前
				限制说明
			</div>
		</div>
	</div>
	<form action="">
		<div class="col-sm-8 col-sm-offset-2">
			<table class="table table-hover" id="votetable">
				<thead>
					<tr>
						<th style="text-align: center">#</th>
						<th style="text-align: center">OptionName</th>
						<th style="text-align: center">OptionBrief</th>
						<th style="text-align: center">select</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${vote.options }" var="item" varStatus="id">
						<tr>
							<td align="center">${item.opId }</td>
							<td align="center">${item.opName }</td>
							<td align="center">${item.opBrief }</td>
							<c:if test="${vote.voteType>1 }">
								<td align="center">
									<input type="checkbox" class="checkbox"></input>
								</td>
							</c:if>
							<c:if test="${vote.voteType==1 }">
								<td align="center">
									<input type="radio" name="radio" class="radio"></input>
								</td>
							</c:if>
						</tr>
						<br />
					</c:forEach>
				</tbody>
			</table>
			<div class="col-sm-2 col-sm-offset-10">
				<button type="button" class="btn btn-primary btn-block" id="commit">选好了</button>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		var voteId = "${vote.voteId}";
		var voteType = "${vote.voteType}";
		//提交选择的选项，对选项的total值加一
		$("#commit").click(function(){
			if(voteType==1){
				var optionName = $(".radio:checked").parents("tr").find("td:eq(1)").text();
				var optionId = $(".radio:checked").parents("tr").find("td:eq(0)").text();
				if(confirm("确认要投给【"+optionName+"】吗？")){
					$.ajax({
						url:"${APP_PATH}/votingto/"+optionId,
						data:{"voteId":voteId},
						type:"POST",
						success:function(result){
							alert(result.msg);
							window.location.href="${APP_PATH}/user/voteinfo?voteId="+voteId;
						}
					})
				}
			}else if(voteType>1){
				var optionNames = "";
				var optionids = "";
				$.each($(".checkbox:checked"),function(){
					optionNames += $(this).parents("tr").find("td:eq(1)").text()+",";
					optionids += $(this).parents("tr").find("td:eq(0)").text()+"-";
				})
				optionNames = optionNames.substring(0,optionNames.length-1);
				optionids = optionids.substring(0,optionids.length-1);
				if(confirm("确认要投给【"+optionNames+"】吗？")){
					$.ajax({
						url:"${APP_PATH}/votingto/"+optionids,
						data:{"voteId":voteId},
						type:"POST",
						success:function(result){
							alert(result.msg);
							window.location.href="${APP_PATH}/user/voteinfo?voteId="+voteId;
						}
					})
				}
			}else{
				alert("投票已结束，请选择其他投票进行投票！");
				window.location.href="${APP_PATH}/user/votesall";
			}
		})
		//对复选框的可选个数进行限制，不能为0，也不能超出允许选择的个数
		$(document).on("click",".checkbox",function(){
			var flag = $(".checkbox:checked").length>voteType;
			if(flag){
				$(this).prop("checked",false);
				alert("最多只能选择"+voteType+"个！");
			}
		})
	</script>
</body>
</html>