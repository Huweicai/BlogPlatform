<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <!-- 3秒之后自动跳转回首页 -->
  <title>提示</title>
  <meta http-equiv="refresh" content="3; url=./" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="./resources/css/personalprofile.css" type="text/css">
</head>

<body>
  <nav class="navbar navbar-expand-md bg-light navbar-light">
    <div class="container">
      <a class="navbar-brand" href="#"><i class="fa d-inline fa-lg fa-cloud"></i><b>&nbsp;LONERS</b></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar2SupportedContent" aria-controls="navbar2SupportedContent" aria-expanded="false"
        aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
      <div class="collapse navbar-collapse text-center justify-content-end" id="navbar2SupportedContent">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="./personalprofile"> 个人资料
              <br> </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#"> 文章管理
              <br> </a>
          </li>
        </ul>
        <a class="btn navbar-btn ml-2 text-white btn-dark"><i class="fa d-inline fa-lg fa-user-circle-o"></i>登录</a>
      </div>
    </div>
  </nav>
  <div class="py-5 border border-light h-100">
    <div class="container">
      <div class="row text-dark border border-light">
        <div class="col-md-3"> </div>
        <div class="col-md-6">
          <div class="card text-white p-5  bg-light">
            <div class="card-body" align="center">
              <h1 class="mb-4 text-dark"><%=request.getAttribute("tip")%></h1>
            </div>
          </div>
        </div>
      </div>
    </div>
    <footer class="text-center">
		<p class=" m-0">
			© 2005-2017 <b>LONERS</b> All rights reserved.
		</p>
	</footer>
  </div>
</body>

</html>