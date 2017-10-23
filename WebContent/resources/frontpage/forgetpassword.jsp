<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>CSDM找回密码</title>
		<!-- <link rel="stylesheet" type="text/css" href="css/normalize.css" /> -->
		<script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="../js/bootstrap.min.js" type="text/javascript"></script>
		<link href="../css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="../css/default.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">
		<style type="text/css">
			html,
			body {
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
			#emailInfo{
				height: 30px;
				margin-top:-47px !important;
				right: 20px;
				position: absolute;
				
			}
			#usernameInfo{
				height: 30px;
				maigin-top:-47px;
				right: 20px;
				position: absolute;
			}
			.warning{
				color: red;
			}
		</style>
		<script type="text/javascript">
			$(function(){
				var usernameInputFlag=false;
				$("#email").focus(function(){
					$(this).attr('placeholder','请输入邮箱');
				});
				$("#username").focus(function(){
					$(this).attr('placeholder','请输入你需要找回密码的用户名');
				});
				$("#email").focus(function(){
					$("#emailInfo").html("");
				});
				$("#username").keypress(function(){
					$("#usernameInfo").html("");
				});
				$("#username").blur(function(){
					var usernameInput=$(this).val();
					
					var usernameInfo="";
					if(usernameInput!=""){
						$.post(
							//url地址
							"${pageContext.request.contextPath}/checkUserName",
							//传送key-value值
							{"username":usernameInput},
							//回调函数
							function(data){
								var isExist=data.isExist;
								
								if(!isExist){
									usernameInfo="用户名不存在";
									$("#usernameInfo").html("");
									$("#usernameInfo").addClass("warning");
									$("#usernameInfo").html(usernameInfo);
								}else{
									usernameInputFlag=true
								}
							},
							//返回数据的格式
							"json"
						)
					}else{
						usernameInfo="用户名不能为空";
						$("#usernameInfo").html("");
						$("#usernameInfo").addClass("warning");
						$("#usernameInfo").html(usernameInfo);
					}
				});
				$("#setPasswordAgain").click(function(){
					var emailInput=$("#email").val();
					var userNameInput=$("#username").val();
					var emailInfo="";
					if(emailInput==""){
						emailInfo="邮箱不能为空";
						$("#emailInfo").html("");
						$("#emailInfo").addClass("warning");
						$("#emailInfo").html(emailInfo);
						
					}else{
						if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/.test(emailInput)){
							alert(emailInput);
							emailInfo="邮箱格式不正确";
							$("#emailInfo").html("");
							$("#emailInfo").addClass("warning");
							$("#emailInfo").html(emailInfo);
						}else{
							if(usernameInputFlag==true){
								alert(emailInput);
								$.post(
									
										//url地址
										"${pageContext.request.contextPath}/checkUserNameAndEmail",
										//传送key-value值
										{"email":emailInput,"username":userNameInput},
										//回调函数
										function(data){
											var isExist=data.isExist;
											if(!isExist){
												emailInfo="不是此用户名绑定的邮箱";
												$("#emailInfo").html("");
												$("#emailInfo").addClass("warning");
												$("#emailInfo").html(emailInfo);
											}else{
												$("#setPasswordAgain").submit();
											}
										},
										//返回数据的格式
										"json"
									)
								
							}
						}
					}
				});
			});
		</script>
		<!--[if IE]>
		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
	</head>

	<body class="yellow" style="width:500px;">
		<div id="login-page" class="row">
			<div class="col s12 z-depth-6 card-panel">
				<form class="login-form" id="passwordAgainForm" action="${pageContext.request.contextPath}/forgetpassword.jsp" method="post">
					<div class="row">
						<div class="input-field col s12 center">
							<img src="http://w3lessons.info/logo.png" alt="" class="responsive-img valign profile-image-login">
							<p class="center login-form-text" style="font-size: 25px;">CSDM欢迎你</p>
							<div class="htmleaf-links">
								<a class="htmleaf-icon icon-htmleaf-home-outline" href="#" title="返回主页" target="_blank"><span> 返回主页</span></a>
								<a class="htmleaf-icon icon-htmleaf-arrow-forward-outline" href="#" title="取消找回" target="_blank"><span> 取消找回</span></a>
							</div>
						</div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							<i class="mdi-social-person-outline prefix"></i>
							<input name="username" id="username" type="text" class="validate">
							<label for="username" class="center-align">请输入用户名</label>
							<span id="usernameInfo"></span>
						</div>
					</div>
					
					<div class="row margin">
						<div class="input-field col s12">
							<i class="mdi-communication-email prefix"></i>
							<input class="validatee" id="email" type="email">
							<label for="email" data-error="wrong" data-success="right" class="center-align">邮箱</label>
							<span id="emailInfo">wseqwe</span>
						</div>
					</div> 
					<div class="row">
						<div class="input-field col s12">
							<a id="setPasswordAgain" href="javascript:" class="btn waves-effect waves-light col s12">重置我的密码</a>
							
						</div>
					</div>
					<div class="row">
						<div class="input-field col s6 m6 l6">
							<p class="margin medium-small"><a href="register.html">立刻注册!</a></p>
						</div>
						<div class="input-field col s6 m6 l6">
							<p class="margin right-align medium-small"><a href="index.html">登录</a></p>
						</div>
					</div>

				</form>
			</div>
		</div>

		<script type="text/javascript" src="http://libs.useso.com/js/jquery/1.11.0/jquery.min.js"></script>
		<script>
			window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')
		</script>
		<!--materialize js-->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>
	</body>

</html>