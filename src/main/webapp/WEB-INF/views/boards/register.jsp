<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<style type="text/css">
	form{
		width:500px;
	}
   label{
      width : 150px;
      text-align: right;
      float: left;
      margin-right: 20px;
   }
   .a1{
      padding-left: 850px;
   }
</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script>
  $( function() {
    
    $("form[name='f1']").submit(function () {
		$(".error").css("display","none");
		$(".error2").css("display","none");
	
		if(checkInputEmpty($("input[name]"))==false){
			return false;
		};

		alert("등록되었습니다.");

	});
  });
  </script>

<title>Insert title here</title>
</head>
<body>
	<form action="register" name="f1" method="post">
		<p>
			<label>board title</label><input type="text" name="btitle" id="btitle" value="">
			<span class="error">게시글 제목을 입력하세요.</span>
		</p>
		
		<p>
			<label>board content</label><input type="text" name="bcontent" value="">
			<span class="error">게시글 내용을 입력하세요.</span>
		</p>
		<p>
			<label>writer</label><input type="text" name="uid"  id="uid" value="">
		</p>
		<p>
			<input type="submit" value="추가">
		</p>
	</form>
</body>
</html>