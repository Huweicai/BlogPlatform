<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LONERS重置密码</title>
<!-- <link rel="stylesheet" type="text/css" href="css/normalize.css" /> -->
<script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/default.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">
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
#newPasswordInfo{
				height:30px;
				margin-top:-47px;
				right:20px;
				position:absolute;
}
#reNewPasswordInfo{
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
		$("#newPassword").focus(function(){
			$(this).attr('placeholder','请输入新密码');
		});
		$("#reNewPassword").focus(function(){
			$(this).attr('placeholder','请重新输入新密码');
		});
		$("#newPassword").keypress(function(){
			$("#newPasswordInfo").html("");
		});
		$("#reNewPassword").keypress(function(){
			$("#reNewPasswordInfo").html("");
		});
		$("#reSetPasswordButton").click(function(){
			var newPassword=$("#newPassword").val();
			var reNewPassword=$("#reNewPassword").val();
			var newPasswordInfo="";
			var reNewPasswordInfo="";
			var newpasswordFlag=false;
			if(newPassword==""){
				newPasswordInfo="密码不能为空";
				$("#newPasswordInfo").html("");
				$("#newPasswordInfo").addClass("warning");
				$("#newPasswordInfo").html(newPasswordInfo);
			}else{
				//对密码格式进行校验
				var num=0;
				var number=0;
				var letter=0;
				var bigLetter=0;
				var chars=0;
				if(newPassword.search(/[0-9]/) != -1){
					num+=1;
					number=1;
				}
				if(newPassword.search(/[A-Z]/) != -1){
					num+=1;
					bigLetter=1;
				}
				if(newPassword.search(/[a-z]/) != -1){
					num+=1;
					letter=1;
				}
				if(newPassword.search(/[^A-Za-z0-9]/) != -1){
					num+=1;
					letter
				}
				if(num>=2&&(newPassword.length>=6&&newPassword.length<=16)){
					newPasswordInfo="";
					$("#newPasswordInfo").html("")
					$("#newPasswordInfo").addClass("success");
					$("#newPasswordInfo").html(newPasswordInfo);
					newpasswordFlag=true;
				}else if(newPassword.length<6){
					newPasswordInfo="密码至少 6位";
					$("#newPasswordInfo").html("")
					
					$("#newPasswordInfo").addClass("warning");
					$("#newPasswordInfo").html(newPasswordInfo);			
				}else if(newPassword.length>16){
					newPasswordInfo="密码最多16位";
					$("#newPasswordInfo").html("")
					$("#newPasswordInfo").addClass("warning");
					$("#newPasswordInfo").html(newPasswordInfo);
				}else if(num==1){
					if(number==1){
						newPasswordInfo="不能全为数字";
						$("#newPasswordInfo").html("")
						$("#newPasswordInfo").addClass("warning");
						$("#newPasswordInfo").html(newPasswordInfo);
					}
					if(letter==1){
						newPasswordInfo="不能全为小写字母";
						$("#newPasswordInfo").html("")
						$("#newPasswordInfo").addClass("warning");
						$("#newPasswordInfo").html(newPasswordInfo);
					}
					if(bigLetter==1){
						newPasswordInfo="不能全为大写字母";
						$("#newPasswordInfo").html("")
						$("#newPasswordInfo").addClass("warning");
						$("#newPasswordInfo").html(newPasswordInfo);
					}if(chars==1){
						newPasswordInfo="不能全为字符";
						$("#newPasswordInfo").html("")
						$("#newPasswordInfo").addClass("warning");
						$("#newPasswordInfo").html(newPasswordInfo);
					}
				}
			}
			if(reNewPassword==""){
				
				reNewPasswordInfo="确认密码不能为空";
				$("#reNewPasswordInfo").html("");
				$("#reNewPasswordInfo").addClass("warning");
				$("#reNewPasswordInfo").html(reNewPasswordInfo);
			}else{
				
				if(newPassword==reNewPassword&&newpasswordFlag==true){
					$.post(
							//url地址
							"$./resetpasswordondb",
							//data
							{"reNewPassword":reNewPassword},
							function(data){
								reNewPasswordInfo="";
								$("#reNewPasswordInfo").html("");
								$("#reNewPasswordInfo").html(reNewPasswordInfo);
								$("#reSetPasswordButton").submit();
								alert("已经发送");
							},
							"json"
							);				
				}else{
					reNewPasswordInfo="两次密码不一致";
					$("#reNewPasswordInfo").html("");
					$("#reNewPasswordInfo").addClass("warning");
					$("#reNewPasswordInfo").html(reNewPasswordInfo);
				}
			}
		});
	});
</script>
<!--[if IE]>
		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
</head>

<body class="yellow" style="width: 500px;">
	<div id="login-page" class="row">
		<div class="col s12 z-depth-6 card-panel">
			<form class="login-form" action="$./setpasswordagain.jsp" method="post">
				<div class="row">
					<div class="input-field col s12 center">
						<img src="http://w3lessons.info/logo.png" alt=""
							class="responsive-img valign profile-image-login">
						<p class="center login-form-text" style="font-size: 25px;">LONERS</p>
						<div class="htmleaf-links">
							<a class="htmleaf-icon icon-htmleaf-home-outline" href="#"
								title="返回主页" target="_blank"><span> 返回主页</span></a> <a
								class="htmleaf-icon icon-htmleaf-arrow-forward-outline" href="#"
								title="取消找回" target="_blank"><span> 取消找回</span></a>
						</div>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<i class="mdi-action-lock-outline prefix"></i> <input
							id="newPassword" type="password"> <label for="password">新密码</label>
						<span id="newPasswordInfo">dsada</span>
					</div>
				</div>
				<div class="row margin">
					<div class="input-field col s12">
						<i class="mdi-action-lock-outline prefix"></i> <input
							id="reNewPassword" type="password"> <label for="password">确认密码</label>
						<span id="reNewPasswordInfo">dsadsa</span>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<a id="reSetPasswordButton" href="javascript:"
							class="btn waves-effect waves-light col s12">确认修改</a>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s6 m6 l6">
						<p class="margin medium-small">
							<a href="register.html">立刻注册!</a>
						</p>
					</div>
					<div class="input-field col s6 m6 l6">
						<p class="margin right-align medium-small">
							<a href="index.html">登录</a>
						</p>
					</div>
				</div>

			</form>
		</div>
	</div>

	<script type="text/javascript"
		src="http://libs.useso.com/js/jquery/1.11.0/jquery.min.js"></script>
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