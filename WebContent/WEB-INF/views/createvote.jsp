<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>创建投票</title>
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
<style type="text/css">
html, body {
	margin: 0px 0px;
	width: 100%;
	height: 100%;
}
</style>
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
	<iframe src="${APP_PATH }/iframes/header.jsp" width="100%"
		frameborder="0" height="75px"></iframe>
	<%-- ${param.userId }--%>
	<div class="col-sm-8 col-sm-offset-2">

		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#home"
				aria-controls="home" role="tab" data-toggle="tab" id="1">基本设置 <SPAN
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></SPAN></a></li>
			<li role="presentation"><a href="#profile"
				aria-controls="profile" role="tab" data-toggle="tab" id="2">选项设置
					<SPAN class="glyphicon glyphicon-chevron-right" aria-hidden="true"></SPAN>
			</a></li>
			<li role="presentation"><a href="#messages"
				aria-controls="messages" role="tab" data-toggle="tab" id="3">效果预览
					<SPAN class="glyphicon glyphicon-chevron-right" aria-hidden="true"></SPAN>
			</a></li>
		</ul>
		<!-- 
			通过模态框来添加投票简介，然后保存到数据库，保存时通过校验是否已经保存过该选项
			如果是，则修改，如果不是，则添加
		 -->

		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="home">
				<br />
				<form class="form-horizontal" id="votethemeform">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">投票主题</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="inputEmail3"
								name="voteName" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">投票简介</label>
						<div class="col-sm-8">
							<textarea class="form-control" rows="3" id="voteBrief"
								name="voteBrief"></textarea>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-8 col-sm-1">
							<br />
							<BR />
							<button type="button" class="btn btn-link" onclick="theme()">下一步</button>
						</div>
					</div>
				</form>
			</div>
			<div role="tabpanel" class="tab-pane" id="profile">
				<form class="form-horizontal" id="voteoptions">
					<div class="form-group">
						<br /> <label class="col-sm-2 control-label">投票主题</label> <label
							class="col-sm-2 control-label"> <span id="votename"></span>
						</label>
						<button type="button"
							class="btn btn-default col-sm-2 col-sm-offset-4" id="addoption">添加选项</button>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">投票选项</label>
						<div class="col-sm-10" id="options">
							<div>
								<div class="col-sm-6">
									<input type="text" class="form-control" name="opName" />
								</div>
								<input type="hidden" name="opBrief" />
								<button type="button" class="btn btn-info">添加简介</button>
								<br /> <br />
							</div>
							<div>
								<div class="col-sm-6">
									<input type="text" class="form-control" name="opName" />
								</div>
								<input type="hidden" name="opBrief" />
								<button type="button" class="btn btn-info">添加简介</button>
								<br /> <br />
							</div>
							<div>
								<div class="col-sm-6">
									<input type="text" class="form-control" name="opName" />
								</div>
								<input type="hidden" name="opBrief" />
								<button type="button" class="btn btn-info">添加简介</button>
								<button type="button" class="btn btn-danger">删除选项</button>
								<br /> <br />
							</div>
							<div>
								<div class="col-sm-6">
									<input type="text" class="form-control" name="opName" />
								</div>
								<input type="hidden" name="opBrief" />
								<button type="button" class="btn btn-info">添加简介</button>
								<button type="button" class="btn btn-danger">删除选项</button>
								<br /> <br />
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-1 col-sm-offset-2">
							<button type="button" class="btn btn-link" onclick="">上一步</button>
						</div>
						<div class="col-sm-1 col-sm-offset-5">
							<button type="button" class="btn btn-link" onclick="addoptions()">下一步</button>
						</div>
					</div>
				</form>
			</div>
			<div role="tabpanel" class="tab-pane" id="messages">
				<form class="form-horizontal" id="createoptionsform">
					<div class="form-group">
						<label class="col-sm-2 control-label">投票主题</label> <label
							class="col-sm-2 control-label"> <span id="votetheme3"></span>
						</label>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">投票选项</label> 
						<div id="options3label" class="col-sm-8">
							
						</div>
					</div>
					<div class="col-sm-1 col-sm-offset-8">
						<button type="button" class="btn btn-success" id="finish">完成</button>
					</div>
				</form>
			</div>
		</div>

	</div>
	
	<script type="text/javascript">
		var voteId;
		var i = 0;
		//点击添加选项按钮，添加选项
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
			$(this).parent("div").empty();
		})
		//单击添加简介，为父页面隐藏域添加id值，并将id信息传入提交按钮
		$(document).on("click", ".btn-info", function() {
			$("#optionbriefmodal").modal({
			//backdrop:"static"
			});
			$("#optionbriefmodal form").get(0).reset();
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
		//优先添加投票主题
		function theme() {
			$.ajax({
				url : "${APP_PATH}/createtheme/" + "${param.userId}",
				data : $("#votethemeform").serialize(),
				type : "POST",
				success : function(result) {
					$("#2").tab('show');
					$("#votename").text(result.extend.vote.voteName);
					$("#votetheme3").text(result.extend.vote.voteName);
					voteId=result.extend.vote.voteId;
				}
			})
		}
		//添加选项
		function addoptions() {
			var s = $(this).attr("status");
			if (s == '1') {
				alert("系统正在处理中，请不要重复点击！");
			} else {
				$(this).attr("status", "1");
				$.ajax({
					url : "${APP_PATH}/createoptions/" + voteId,
					data : $("#voteoptions").serializeArray(),
					type : "POST",
					success : function(result) {
						$("#3").tab('show');
						showvote();
					}
				})
				$(this).attr("status", "0");

			}
		}
		//显示vote的信息
		function showvote() {
			//发送请求，查询投票信息
			$.ajax({
				url:"${APP_PATH}/getoptionbyvid/"+voteId,
				type:"GET",
				success:function(result){
					console.log(result);
					$.each(result.extend.options,function(index,item){
						var label = $("<label class='col-sm-2 control-label'></label>");
						var span = $("<span data-toggle='tooltip'></span>");
						var br = $("<br/>");
						span.attr("title",item.opBrief);
						span.append(item.opName);
						label.append(span);
						$("#options3label").append(label);
					})
				}
			})
		}
		$("#finish").click(function() {
			window.location.href = "${APP_PATH}/user.jsp?userName="
					+ "${param.userName}" + "&userId="
					+ "${param.userId}";
		})
	</script>
</body>
</html>