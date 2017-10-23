<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CSDM登录</title>
<!-- <link rel="stylesheet" type="text/css" href="css/normalize.css" /> -->
<script src="./resources/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="./resources/js/bootstrap.min.js" type="text/javascript"></script>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./resources/css/default.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style type="text/css">
html, body {
	height: 100%;
}

html {
	display: table;
	margin: auto;
}

body {
	display: table-cell;
	vertical-align: middle;
}

.margin {
	margin: 0 !important;
}
#checkImg{
	margin-top:24px;
	position:absolute;
}
#checkImgInfo{
	height:30px;
	margin-top:-50px;
	right:20px;
	position:absolute;
}
#usernameInfo{
	height:30px;
	margin-top:-47px;
	right:20px;
	position:absolute;
}
#passwordInfo{
	height:30px;
	margin-top:-47px;
	right:20px;
	position:absolute;
}
.warning{
	color:red;
}
</style>
<script type="text/javascript">
	$(function(){
		var usernameflag=false;
		var passwordflag=false;
		var checkImgflag=false;
		$("#checkImg").click(function(){
			$(this).attr('src','${pageContext.request.contextPath}/checkImg?time='+new Date().getTime()); 
		});
		$("#checkImgInput").focus(function(){
			$(this).attr('placeholder','注意区分大小写');
		});
		$("#username").blur(function(){
			var usernameInput=$(this).val();
			var usernameInfo="";
			if(usernameInput==""){
				usernameInfo="用户名不能为空";
				$("#usernameInfo").html("");
				$("#usernameInfo").addClass("warning");
				$("#usernameInfo").html(usernameInfo);
			}else{
				$("#usernameInfo").html("");
				usernameflag=true;
			}
		});
		$("#checkImgInput").blur(function(){
			var checkImgInput=$(this).val();
			var checkImgInfo="";
			if(checkImgInput==""){
				checkImgInfo="验证码不能为空";
				$("#checkImgInfo").html("");
				$("#checkImgInfo").addClass("warning");
				$("#checkImgInfo").html(checkImgInfo);
			}else{
				$("#checkImgInfo").html("");
				checkImgflag=true;
			}
		});
		$("#password").blur(function(){
			var passwordInput=$(this).val();
			var passwordInfo="";
			if(passwordInput==""){
				passwordInfo="密码不能为空";
				$("#passwordInfo").html("");
				$("#passwordInfo").addClass("warning");
				$("#passwordInfo").html(passwordInfo);
			}else{
				$("#passwordInfo").html("");
				passwordflag=true;
			}
		});		
		$("#loginButton").click(function(){
			var userNameInput=$("#username").val();
			var passwordInput=$("#password").val();
			var checkImgInput=$("#checkImgInput").val();
			var usernameInfo="";
			var passwordInfo="";
			var checkImgInfo="";
			if(userNameInput!=""&&passwordInput!=""&&checkImgInput!=""){
				//去服务器校验用户名和密码是否正确
				$.post(
					//url地址
					"${pageContext.request.contextPath}/login",
					//传递key-value值
					{"username":userNameInput,"password":passwordInput,"checkCode":checkImgInput},
					//发送成功回调函数
					function(data){
						var isLogin=data.isLogin;
						var isCheckCode=data.isCheckCode;
					
						if(isLogin==false){
							usernameInfo="用户名或密码错误";
							$("#usernameInfo").html("");
							$("#usernameInfo").addClass("warning");
							$("#usernameInfo").html(usernameInfo);
						}
						if(isCheckCode==false){
							checkImgInfo="验证码错误";
							$("#checkImgInfo").html("");
							$("#checkImgInfo").addClass("warning");
							$("#checkImgInfo").html(checkImgInfo);
						}
						if(isLogin&&isCheckCode){
							$("#loginForm").submit();
						}
					},
					"json"
				);
			}else{
				if(userNameInput==""){
					usernameInfo="用户名不能为空";
					$("#usernameInfo").html("");
					$("#usernameInfo").addClass("warning");
					$("#usernameInfo").html(usernameInfo);
				}
				if(passwordInput==""){
					passwordInfo="密码不能为空";
					$("#passwordInfo").html("");
					$("#passwordInfo").addClass("warning");
					$("#passwordInfo").html(passwordInfo);
				}
				if(checkImgInput==""){
					checkImgInfo="验证码不能为空";
					$("#checkImgInfo").html("");
					$("#checkImgInfo").addClass("warning");
					$("#checkImgInfo").html(checkImgInfo);
				}				
			}
			
		});
	});
</script>
<!--[if IE]>
		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body class="red" style="width: 500px;">
	<div id="login-page" class="row">
		<div class="col s12 z-depth-6 card-panel">
			<form id="loginForm" class="login-form" action="${pageContext.request.contextPath}/personFirstPage" method="post">
				<div class="row">
					<div class="input-field col s12 center">
						<p class="center login-form-text" style="font-size: 50px;">LONERS</p>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<i class="mdi-social-person-outline prefix"></i>
						<input class="validatee" id="username" type="text"> 
						<label for="username" data-error="wrong" data-success="right" class="center-align">请输入用户名</label>
						<span id="usernameInfo"></span>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<i class="mdi-action-lock-outline prefix"></i> 
						<input id="password" type="password"> <label for="password">请输入密码</label>
						<span id="passwordInfo"></span>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s6">
						<i class="material-icons prefix">input</i> 
						<input id="checkImgInput" type="text"> <label for="checkImgInput">请输入验证码</label>
						<span id="checkImgInfo"></span>
					</div>
					<div>
						<img id="checkImg" src="${pageContext.request.contextPath}/checkImg">
						<label for="checkImg" style="font-size: 14px;color: #16AEC5">看不清，点击图片换一张</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12 m12 l12  login-text">
						<input type="checkbox" id="remember-me" /> <label
							for="remember-me">记住我</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<a id="loginButton"  href="javascript:" class="btn waves-effect waves-light col s12">登
							录</a>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6 m6 l6">
						<p class="margin medium-small">
							<a href="./register">现在注册!</a>
						</p>
					</div>
					<div class="input-field col s6 m6 l6">
						<p class="margin right-align medium-small">
							<a href="./forgetPassword">忘记密码?</a>
						</p>
					</div>
			</form>
		</div>
	</div>
	</div>

	<script type="text/javascript"
		src="http://googleapis.useso.com/js/jquery/1.11.0/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/jquery-2.1.1.min.js"><\/script>')
	</script>
	<!--materialize js-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>
</body>
</html>