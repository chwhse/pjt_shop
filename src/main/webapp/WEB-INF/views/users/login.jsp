<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
	<%@ include file="../include/header_head.jsp"%> 
    <meta charset="UTF-8">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    
  </head>
<%@ include file="../include/header.jsp"%>
  <body class="login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="/resources/index2.html"><b>Cafe Atto Shop Login</b> Login</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">Sign in to start your session</p>

		<form action="loginPost" method="post">
		  <div class="form-group has-feedback"><input type="hidden" name="isweb" value="true">
		    <input type="text" name="uid" class="form-control" placeholder="USER ID"/>
		    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
		  </div>
		  <div class="form-group has-feedback">
		    <input type="password" name="upw" class="form-control" placeholder="Password"/>
		    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
		  </div>
		  <div class="row">
		    <!-- <div class="col-xs-8">    
		      <div class="checkbox icheck">
		        <label>
		          <input type="checkbox" name="useCookie"> Remember Me
		        </label>
		      </div>                        
		    </div>/.col -->
		    <div class="col-xs-4">
		      <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
		    </div><!-- /.col -->
		  </div>
		</form>


        <a href="#">I forgot my password</a><br>
        <a href="joinForm" class="text-center">Register a new membership</a>

      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->

    <!-- jQuery 2.1.4 -->
    <script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    
    <script>
      $(function () {
    	var url_string =  window.location.href;
    	var url = new URL(url_string);
        var result = true;
        result = url.searchParams.get("UserIsExist");
    	if(result=="false"  ){
        	alert("로그인 정보를 확인하세요");
        }
      });
    </script> 
  </body>
 <%@ include file="../include/footer.jsp"%> 
</html>