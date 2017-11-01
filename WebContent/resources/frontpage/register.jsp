<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>LONERS注册</title>
	<script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="../js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../resources/js/jquery.validate.min.js" type="text/javascript"></script>
	<script src="../js/messages_zh.js" type="text/javascript"></script>
	<!-- <link rel="stylesheet" type="text/css" href="css/normalize.css" /> -->
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/default.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">
	<style type="text/css">
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
			#usernameInfo{
				height:30px;
				margin-top:-50px;
				right:20px;
				position:absolute;
			}
			.warning{
				color:red;
			}
			.success{
				color:green;
			}
			#emailInfo{
				height:30px;
				margin-top:-47px;
				right:20px;
				position:absolute;
			}
			.nullContent{
				color:red;
			}	
			#repasswordInfo{
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
		</style>
		<script type="text/javascript">
			
			$(function(){
				var flagUsername=false;
				var flagEmail=false;
				var flagPassword=false;
				var flagRepassword=false;
				//为输入框绑定事件
				$("#username").focus(function(){
					$(this).attr('placeholder','用户名由6到16位字母,数字或字符混合');
				});
				$("#password").focus(function(){
					$(this).attr('placeholder','密码由6到16位字母,数字或字符混合');
				});
				$("#password-again").focus(function(){
					$(this).attr('placeholder','请再次输入密码');
				});
				$("#email").focus(function(){
					$(this).attr('placeholder','请输入邮箱');
				});
				$("#username").blur(function(){
					//失去焦点获取输入框的内容
					var usernameInput=$(this).val();
					var usernameInfo="";
					if(usernameInput!=""){
						
						//去服务端校验用户名是否存在-ajax
						$.post(
							//url地址
							"${pageContext.request.contextPath}/checkUserName",
							//传递待发送的key:value参数
							{"username":usernameInput},
							//发送成功回调函数
							function(data){
								//获取isExist的值
								var isExist=data.isExist;
								//根据isExist动态显示信息
								
								if(isExist){
								
									//用户名存在
									usernameInfo="该用户名存在";
									$("#usernameInfo").html("")
									$('#usernameInfo').removeClass("success");
									$("#usernameInfo").addClass("warning");
									$("#usernameInfo").html(usernameInfo);
								}else{
									//对用户名格式进行校验
									var num=0;
									var number=0;
									var letter=0;
									var bigLetter=0;
									var chars=0;
									if(usernameInput.search(/[0-9]/) != -1){
										num+=1;
										number=1;
									}
									if(usernameInput.search(/[A-Z]/) != -1){
										num+=1;
										bigLetter=1;
									}
									if(usernameInput.search(/[a-z]/) != -1){
										num+=1;
										letter=1;
									}
									if(usernameInput.search(/[^A-Za-z0-9]/) != -1){
										num+=1;
										letter
									}
									if(num>=2&&(usernameInput.length>=6&&usernameInput.length<=16)){
										usernameInfo="该用户名可用";
										$("#usernameInfo").html("")
										$('#usernameInfo').removeClass("warning");
										$("#usernameInfo").addClass("success");
										$("#usernameInfo").html(usernameInfo);
										flagUsername=true;
									}else if(usernameInput.length<6){
										usernameInfo="用户名至少 6位";
										$("#usernameInfo").html("")
										$('#usernameInfo').removeClass("success");
										$("#usernameInfo").addClass("warning");
										$("#usernameInfo").html(usernameInfo);			
									}else if(usernameInput.length>16){
										usernameInfo="用户名最多16位";
										$("#usernameInfo").html("")
										$('#usernameInfo').removeClass("success");
										$("#usernameInfo").addClass("warning");
										$("#usernameInfo").html(usernameInfo);
									}else if(num==1){
										if(number==1){
											usernameInfo="不能全为数字";
											$("#usernameInfo").html("")
											$('#usernameInfo').removeClass("success");
											$("#usernameInfo").addClass("warning");
											$("#usernameInfo").html(usernameInfo);
										}
										if(letter==1){
											usernameInfo="不能全为小写字母";
											$("#usernameInfo").html("")
											$('#usernameInfo').removeClass("success");
											$("#usernameInfo").addClass("warning");
											$("#usernameInfo").html(usernameInfo);
										}
										if(bigLetter==1){
											usernameInfo="不能全为大写字母";
											$("#usernameInfo").html("")
											$('#usernameInfo').removeClass("success");
											$("#usernameInfo").addClass("warning");
											$("#usernameInfo").html(usernameInfo);
										}if(chars==1){
											usernameInfo="不能全为字符";
											$("#usernameInfo").html("")
											$('#usernameInfo').removeClass("success");
											$("#usernameInfo").addClass("warning");
											$("#usernameInfo").html(usernameInfo);
										}
									}
									
								}
							},
							//返回内容的格式
							"json"
						);
					}else{
						usernameInfo="用户名不能为空";
						$("#usernameInfo").html("")
						$('#usernameInfo').removeClass("success");
						$('#usernameInfo').addClass("warning");
						$("#usernameInfo").html(usernameInfo);
					}					
				});	
				
				
				$("#email").blur(function(){
					//失去焦点获取输入框的内容
					var emailInput=$(this).val();
					var emailInfo="";
					if(emailInput!=""){
						if (!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/.test(emailInput)) {
							emailInfo="邮箱格式不正确";
							$("#emailInfo").html("")
							
							$('#emailInfo').removeClass("success");
							$('#emailInfo').addClass("warning");
							$("#emailInfo").html(emailInfo);
						}else{
							//去服务端校验用户名是否存在-ajax
							$.post(
								//url地址
								"${pageContext.request.contextPath}/checkEmail",
								//传递待发送的key:value参数
								{"email":emailInput},
								//发送成功回调函数
								function(data){
									//获取isExist的值
									var isExist=data.isExist;
									//根据isExist动态显示信息
									
									if(isExist){
									
										//用户名存在
										emailInfo="此邮箱已被注册";
										$("#emailInfo").html("")
										$('#emailInfo').removeClass("success");
										$("#emailInfo").addClass("warning");
										$("#emailInfo").html(emailInfo);
										
									}else{
										
										emailInfo="此邮箱可以使用"
										$("#emailInfo").html("")
										$('#emailInfo').removeClass("warning");
										$("#emailInfo").addClass("success");
										$("#emailInfo").html(emailInfo);
										flagEmail=true;
									}
								},
								//返回内容的格式
								"json"
							);	
						}
					}else{
						emailInfo="邮箱不能为空";
						$("#emailInfo").html("")
						$('#emailInfo').removeClass("success");
						$('#emailInfo').addClass("warning");
						
						$("#emailInfo").html(emailInfo);
					}
					
				});	
				$("#password").blur(function(){
					var passwordInput=$(this).val();
					
					var passwordInfo="";
					if(passwordInput==""){
						passwordInfo="密码不能为空";
						$("#passwordInfo").html("")
						$('#passwordInfo').removeClass("success");
						$("#passwordInfo").addClass("warning");
						$("#passwordInfo").html(passwordInfo);
					}else{
						//对密码格式进行校验
						var num=0;
						var number=0;
						var letter=0;
						var bigLetter=0;
						var chars=0;
						if(passwordInput.search(/[0-9]/) != -1){
							num+=1;
							number=1;
						}
						if(passwordInput.search(/[A-Z]/) != -1){
							num+=1;
							bigLetter=1;
						}
						if(passwordInput.search(/[a-z]/) != -1){
							num+=1;
							letter=1;
						}
						if(passwordInput.search(/[^A-Za-z0-9]/) != -1){
							num+=1;
							letter
						}
						if(num>=2&&(passwordInput.length>=6&&passwordInput.length<=16)){
							passwordInfo="该密码可用";
							$("#passwordInfo").html("")
							$('#passwordInfo').removeClass("warning");
							$("#passwordInfo").addClass("success");
							$("#passwordInfo").html(passwordInfo);
							flagPassword=true;
						}else if(passwordInput.length<6){
							passwordInfo="密码至少 6位";
							$("#passwordInfo").html("")
							$('#passwordInfo').removeClass("success");
							$("#passwordInfo").addClass("warning");
							$("#passwordInfo").html(passwordInfo);			
						}else if(passwordInput.length>16){
							passwordInfo="密码最多16位";
							$("#passwordInfo").html("")
							$('#passwordInfo').removeClass("success");
							$("#passwordInfo").addClass("warning");
							$("#passwordInfo").html(passwordInfo);
						}else if(num==1){
							if(number==1){
								passwordInfo="不能全为数字";
								$("#passwordInfo").html("")
								$('#passwordInfo').removeClass("success");
								$("#passwordInfo").addClass("warning");
								$("#passwordInfo").html(passwordInfo);
							}
							if(letter==1){
								passwordInfo="不能全为小写字母";
								$("#passwordInfo").html("")
								$('#passwordInfo').removeClass("success");
								$("#passwordInfo").addClass("warning");
								$("#passwordInfo").html(passwordInfo);
							}
							if(bigLetter==1){
								passwordInfo="不能全为大写字母";
								$("#passwordInfo").html("")
								$('#passwordInfo').removeClass("success");
								$("#passwordInfo").addClass("warning");
								$("#passwordInfo").html(passwordInfo);
							}if(chars==1){
								passwordInfo="不能全为字符";
								$("#passwordInfo").html("")
								$('#passwordInfo').removeClass("success");
								$("#passwordInfo").addClass("warning");
								$("#passwordInfo").html(passwordInfo);
							}
						}
						
					}
					
				});
				
				
				$("#password-again").blur(function(){
					var passwordInput=$("#password").val();
					
					var repasswordInput=$(this).val();
					
					repasswordInfo="";
					if(repasswordInput!=""){
						if(passwordInput!=repasswordInput){
							repasswordInfo="两次密码不一致";
							$("#repasswordInfo").html("")
							$('#repasswordInfo').removeClass("success");
							$("#repasswordInfo").addClass("warning");
							$("#repasswordInfo").html(repasswordInfo);
						}else{
							repasswordInfo="成功确认密码";
							$("#repasswordInfo").html("")
							$('#repasswordInfo').removeClass("warning");
							$("#repasswordInfo").addClass("success");
							$("#repasswordInfo").html(repasswordInfo);
							flagRepassword=true;
						}
					}else{
						repasswordInfo="确认密码不能为空";
						$("#repasswordInfo").html("")
						$('#repasswordInfo').removeClass("success");
						$("#repasswordInfo").addClass("warning");
						$("#repasswordInfo").html(repasswordInfo);
					}
				});
				$("#registerButton").click(function(){
					var userNameInput=$("#username").val();
					var passwordInput=$("#password").val();
					var repasswordInput=$("#password-again").val();
					var emaiInput=$("#email").val();
					var usernameInfo="";
					var passwordInfo="";
					var repasswordInfo="";
					var emailInfo="";
					if(flagUsername&&flagPassword&&flagRepassword&&flagEmail){
						alert("注册成功");	
						$("#registerForm").submit();
							
					}else{
						if(userNameInput==""){
							usernameInfo="用户名不能为空";
							$("#usernameInfo").html("")
							$('#usernameInfo').removeClass("success");
							$('#usernameInfo').addClass("warning");
							$("#usernameInfo").html(usernameInfo);
						}
						if(passwordInput==""){
							passwordInfo="密码不能为空";
							$("#passwordInfo").html("")
							$('#passwordInfo').removeClass("success");
							$("#passwordInfo").addClass("warning");
							$("#passwordInfo").html(passwordInfo);
						}
						if(repasswordInput==""){
							repasswordInfo="确认密码不能为空";
							$("#repasswordInfo").html("")
							$('#repasswordInfo').removeClass("success");
							$("#repasswordInfo").addClass("warning");
							$("#repasswordInfo").html(repasswordInfo);
						}
						if(emaiInput==""){
							emailInfo="邮箱不能为空";
							$("#emailInfo").html("")
							$('#emailInfo').removeClass("success");
							$('#emailInfo').addClass("warning");
							$("#emailInfo").html(emailInfo);
						}
					}
					
				});
				
			});
		</script>
		<!--[if IE]>
		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
	</head>

	<body class="blue" style="width:500px">
		<div id="login-page" class="row">
			<div class="col s12 z-depth-6 card-panel">
				<form class="login-form" method="post" action="${pageContext.request.contextPath}/register" id="registerForm">
					<div class="row">
						<div class="input-field col s12 center">
							<img src="../img/logo.png" alt="" class="responsive-img valign profile-image-login">
							<p class="center login-form-text" style="font-size: 25px;">CSDM欢迎你</p>
							<div class="htmleaf-links">
								<a class="htmleaf-icon icon-htmleaf-home-outline" href="#" title="返回主页" target="_blank"><span> 返回主页</span></a>
								<a class="htmleaf-icon icon-htmleaf-arrow-forward-outline" href="#" title="退出注册" target="_blank"><span> 退出注册</span></a>
							</div>
						</div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							<i class="mdi-social-person-outline prefix"></i>
							<input name="userID" id="username" type="text" class="validate">
							<label for="username" class="center-align">请输入用户名</label>
							<span id="usernameInfo"></span>
						</div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							<i class="mdi-action-lock-outline prefix"></i>
							<input name="password" id="password" type="password" class="validate">
							<label for="password">请输入密码</label>
							<span id="passwordInfo"></span>
						</div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							<i class="mdi-action-lock-outline prefix"></i>
							<input name="password-again" id="password-again" type="password">
							<label for="password-again">请再次输入密码</label>
							<span id="repasswordInfo"></span>
							
						</div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							<i class="mdi-communication-email prefix"></i>
							<input name="email" id="email" type="email" class="validate">
							<label for="email" class="center-align">请输入Email</label>
							<span id="emailInfo"></span>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<!--<input class="btn waves-effect waves-light col s12" type="submit" value="立即注册">-->
							<a id="registerButton"  href="javascript:" class="btn waves-effect waves-light col s12"  >           立      刻     注     册                             </a>
						</div>
						<div class="input-field col s12">
							<p class="margin center medium-small sign-up">已经有了账号? <a href="#">登录</a></p>
						</div>
					</div>
				</form>
			</div>
		</div>
	
	<script type="text/javascript" src="http://libs.useso.com/js/jquery/1.11.0/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
  	<!--materialize js-->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>
</body>
</html>