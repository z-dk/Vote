<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<iframe src="${APP_PATH }/iframes/header.jsp" width="100%"
		frameborder="0" height="75px"></iframe>
	来投票喽！
	<br /> 投票 标题：${vote.voteName }
	<form action="">
		<div class="col-sm-8 col-sm-offset-2">
			<table class="table table-hover" id="votetable">
				<caption>${vote.voteName }</caption>
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
						type:"POST",
						success:function(result){
							alert(result.msg);
							window.location.href="${APP_PATH}/voteinfo?voteId="+voteId;
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
						type:"POST",
						success:function(result){
							alert(result.msg);
							window.location.href="${APP_PATH}/voteinfo?voteId="+voteId;
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