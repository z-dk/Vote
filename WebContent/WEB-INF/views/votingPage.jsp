<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="icon" href="${APP_PATH }/static/images/vote.ico" type="image/x-icon"/>
<title>欢迎投票</title>
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-3.3.1.js"></script>
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div style="height:100px; width:100%;background-image:url('${APP_PATH }/static/images/update.jpg');background-size:100%100%">
	<a href="${APP_PATH }/index.jsp?userName=${userName}&userId=${userId}">
		<img src="${APP_PATH }/static/images/vote.png" style="float:left;"/>
	</a>
	<br /> <br /><br /><br />
	</div>
	<div class="row">
	<!-- Nav tabs -->
	<div class="col-sm-3">
		<div class="col-sm-12">
			<br />
			<h4>&nbsp;&nbsp;&nbsp;&nbsp;${vote.voteName }</h4>
			<h5><font color=" #b3b5ba">&nbsp; &nbsp; &nbsp; &nbsp; ${vote.voteBrief }</font></h5>
		</div>
		<div class="col-sm-12">
			<font color="#000080">投票规则: </font><font color="black">每个账号只能对每一个投票活动进行一次投票，不能进行重复的投票，请投出自己宝贵的一票</font><br><br>
			<font color="#000080">时间: </font><font color="black">本投票活动日期 ：
			<fmt:formatDate value="${vote.startTime}" pattern="yyyy-MM-dd HH:mm:ss" />
			- <fmt:formatDate value="${vote.endTime}" pattern="yyyy-MM-dd HH:mm:ss" /></font><br><br>
			<font color="#000080">限制说明: </font><font color="#FF0000">严禁使用第三方软件进行刷票的行为，一经发现，将做永久封号处理</font><br>
		</div>
	</div>
	<div class="col-sm-9">
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
					</c:forEach>
				</tbody>
			</table>
			<div class="col-sm-2 col-sm-offset-10">
				<button type="button" class="btn btn-primary btn-block" id="commit">选好了</button>
			</div>
		</div>
	
	</div>
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
			}else{
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