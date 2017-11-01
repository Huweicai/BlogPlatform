<%@page import="service.face.UserOp"%>
<%@page import="domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>个人资料</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 百度静态JQuery资源 -->
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<!-- 百度JQuery.cookie静态资源 -->
<script
	src="http://apps.bdimg.com/libs/jquery.cookie/1.4.1/jquery.cookie.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<!-- 样式表 -->
<link rel="stylesheet" href="./resources/css/personalprofile.css"
	type="text/css">
<script>
	$.cookie('userID', "1234", {
		path : '/'
	});
	$(document).ready(function() {
		//点击修改
		$("#alter").click(function() {
			document.getElementById("username").disabled = false;
			document.getElementById("sex_boy").disabled = false;
			document.getElementById("sex_girl").disabled = false;
			document.getElementById("birthday").disabled = false;
			document.getElementById("self_introduce").disabled = false;
		});
		//点击修改密码
		$("#alterPwd").click(function() {
			window.location.href = "./resources/frontpage/forgetpassword.html";
		});
		//点击保存
		$("#save").click(function() {
			//允许userID和Email发送但禁止修改
			document.getElementById("userID").disabled = false;
			document.getElementById("email").disabled = false;
			$("input").attr("readonly","readonly");
			$("#form").submit();
		});
	});
</script>
</head>
<%
	String userID = null;
	User user = new User(); //初始化，防止null指针报错
	Cookie[] cookies = request.getCookies();
	for (Cookie cookie : cookies) {
		if (cookie.getName().compareTo("userID") == 0) {
			//获取cookie中的userID
			userID = cookie.getValue();
			UserOp userop = (UserOp) utils.Const.context.getBean("userop");
			//通过ID获取User实体
			user = userop.getUserByID(userID);
		}
	}
%>
<body>
	<nav class="navbar navbar-expand-md bg-light navbar-light">
		<div class="container">
			<a class="navbar-brand" href="./"><i
				class="fa d-inline fa-lg fa-cloud"></i><b>&nbsp;LONERS</b></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbar2SupportedContent"
				aria-controls="navbar2SupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse text-center justify-content-end"
				id="navbar2SupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="./personalprofile"> 个人资料 <br>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> 文章管理 <br>
					</a></li>
				</ul>
				<a class="btn navbar-btn ml-2 text-white btn-dark" href="./logout"><i
					class="fa d-inline fa-lg fa-user-circle-o"></i>退出</a>
			</div>
		</div>
	</nav>
	<div class="py-5 border border-light h-100">
		<div class="container">
			<div class="row bg-light text-dark border border-light">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="card text-white p-5 bg-light">
						<div class="card-body">
							<h1 class="mb-4 text-dark">
								个人资料 <br>
							</h1>
							<form id="form" action="./updateprofile" method="post">
								<!--ID-->
								<div class="form-group">
									<label class="text-dark">ID</label> <input id="userID"
										name="userID" id="userID" type="text" class="form-control"
										disabled="true" value="<%=user.getUserID()%>">
								</div>
								<!--邮箱-->
								<div class="form-group">
									<label class="text-dark">邮箱</label> <input id="email"
										name="email" type="email" class="form-control"
										placeholder="邮箱" disabled="true" value="<%=user.getEmail()%>">
								</div>
								<!--用户名-->
								<div class="form-group">
									<label class="text-dark">用户名</label> <input id="username"
										name="username" type="text" class="form-control"
										disabled="true" value="<%=user.getUsername()%>">
								</div>
								<!--生日-->
								<div class="form-group">
									<label class="text-dark">生日</label> <input id="birthday"
										name="birthday" type="date" class="form-control"
										disabled="true" value="<%=user.getBirthday()%>">
								</div>
								<!--性别-->
								<div class="form-group text-dark">
									<label class="text-dark">性别&nbsp;&nbsp;&nbsp;</label> <label
										class="text-dark">男</label> <input id="sex_boy" name="sex"
										type="radio" value="boy" disabled="true"
										<%=new String("boy").equals(user.getSex()) ? "checked" : ""%>>
									<label class="text-dark">女</label> <input id="sex_girl"
										name="sex" type="radio" value="girl" disabled="true"
										<%=new String("girl").equals(user.getSex()) ? "checked" : ""%>>
								</div>
								<!--自我介绍-->
								<div class="form-group">
									<label class="text-dark">简介</label> <input id="self_introduce"
										name="self_introduce" type="text" class="form-control"
										placeholder="简介" disabled="true"
										value="<%=user.getSelf_introduce()%>">
								</div>
								<!--按钮-->
								<button id="alter" type="button" class="btn btn-dark"
									data-toggle="">修改</button>
								<button id="alterPwd" type="button" class="btn btn-dark"
									data-toggle="">修改密码</button>
								<button id="save" type="button" class="btn btn-dark"
									data-toggle="">保存</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<footer class="text-center ">
			<p class=" m-0">
				© 2005-2017 <b>LONERS</b> All rights reserved.
			</p>
		</footer>
	</div>
	<script type="text/javascript">
		var userID = $("#userID").val();
		if (userID.length != 0) {
			//如果userID不为空则写入cookie
			$.cookie('userID', userID, {
				path : '/'
			});
		}
	</script>
</body>

</html>