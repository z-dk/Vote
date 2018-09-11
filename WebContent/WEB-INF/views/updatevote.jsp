<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%
	//该方法路径以/开始不以/结束
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link rel="icon" href="${APP_PATH }/static/images/vote.ico" type="image/x-icon"/>
<title>投票信息修改</title>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.js"></script>
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- Modal选项简介修改模态框 -->
	<div class="modal fade" id="optionbriefmodal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">简介修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">选项名称</label>
							<div class="col-sm-9">
								<p class="form-control-static" id="opname"></p>

							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">选项简介</label>
							<div class="col-sm-8">
								<textarea class="form-control" rows="3" name="opBrief"></textarea>
								<span class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="commit">保存</button>
				</div>
			</div>
		</div>
	</div>
	<div>
		<form class="form-horizontal" id="voteoptions">
			<div class="form-group">
				<br /> <label class="col-sm-2 control-label">投票主题</label>
				<label class="col-sm-2 control-label">${vote.voteName }</label>
				<button type="button"
					class="btn btn-default col-sm-1 col-sm-offset-3" id="addoption">添加选项</button>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">投票选项</label>
				<div class="col-sm-10" id="options">
					<c:forEach items="${vote.options }" var="item">
						<div>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="opName" value="${item.opName }"/>
							</div>
							<input type="hidden" name="opBrief" value="${item.opBrief }"/>
							<button type="button" class="btn btn-info">添加简介</button>
							<button type="button" class="btn btn-danger">删除选项</button>
							<input type="hidden" name="opId" value="${item.opId }"></input>
							<br /> <br />
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-1 col-sm-offset-5">
					<button type="button" class="btn btn-link" onclick="updateoptions()">保存修改</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		//设置模态框中文本域的动态id值
		var i=0;
		var voteId="${vote.voteId}";
		$("#addoption").click(function() {
			var div = $("<div></div>");
			var textdiv = $("<div class='col-sm-6'><input type='text' class='form-control' name='opName'/></div>");
			var brief = $("<input type='hidden' name='opBrief'/>");
			var btn1 = $(
					"<button type='button' class='btn btn-info'></button>")
					.append("添加简介");
			var btn2 = $(
					"<button type='button' class='btn btn-danger'></button>")
					.append("删除选项");
			var br = $("<br/><br/>");
			div.append(textdiv).append(brief).append(btn1)
					.append(" ").append(btn2).append(br);
			$("#options").append(div);
		})
		//单击删除选项按钮，删除该选项
		$(document).on("click", ".btn-danger", function() {
			var opName=$(this).prevAll("div").find("input").val();
			$.ajax({
				url:"${APP_PATH}/deleteoption/"+opName,
				type:"DELETE",
				success:function(){
					alert("选项已删除！");
				}
			})
			$(this).parent("div").empty();
		})
		//单击添加简介，为父页面隐藏域添加id值，并将id信息传入提交按钮
		$(document).on("click", ".btn-info", function() {
			$("#optionbriefmodal").modal({});
			$("#optionbriefmodal form").get(0).reset();
			$("#optionbriefmodal form").find("textarea").text($(this).prev("input").val());
			$("#opname").text($(this).parent("div").find("input").val());
			var inputid = $(this).prev("input").attr("id");
			if (inputid == null) {
				$(this).prev("input").attr("id", "id" + i);
				$("#commit").attr("hiddenid", i);
				i++;
			} else {

				$("#commit").attr("hiddenid", inputid);
			}
		});
		//单击模态框保存按钮，将模态框文本域的值传入父页面的hidden隐藏域中
		$("#commit").click(function() {
			var opbrief = $(this).parent("div").parent("div").find("textarea").val();
			var hidden = $(this).attr("hiddenid");
			$("#id" + hidden).val(opbrief);
			$("#optionbriefmodal").modal("hide");
		})
		//保存修改
		function updateoptions() {
			var s = $(this).attr("status");
			if (s == '1') {
				alert("系统正在处理中，请不要重复点击！");
			} else {
				$(this).attr("status", "1");
				$.ajax({
					url : "${APP_PATH}/updateoptions/" + voteId,
					data : $("#voteoptions").serializeArray(),
					type : "POST",
					success : function(result) {
						$("#3").tab('show');
						window.location.href="${APP_PATH}/user/voteinfo?voteId="+voteId;
					}
				})
				$(this).attr("status", "0");

			}
		}
	</script>
</body>
</html>