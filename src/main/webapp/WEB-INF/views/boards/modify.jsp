<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
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
<script>
  $( function() {
    $( "#startdate" ).datepicker({
       dateFormat: "yy-mm-dd"    
    });
    $( "#enddate" ).datepicker({
       dateFormat: "yy-mm-dd"    
    });  
  });
  </script>

<title>Insert title here</title>
</head>
<body>
	<form action="modify" name="f1" method="post">
		<p>
			<input type="hidden" name="bno"
				value="${board.bno }">
		</p>
		<p>
			<label>board title</label><input type="text" name="btitle"
				value="${board.btitle }">
			<span class="error">input the board-title.</span>
		</p>
		
		<p>
			<label>board content</label><input type="text" name="bcontent"
				value="${board.bcontent }" >
			<span class="error">input the board-content.</span>
		</p>
		<p>
			<label>writer</label><input type="text" name="uid"  
				value = "${board.uid }" readonly="readonly">
		</p>
		<p>
			<input type="submit" value="수정">
		</p>
	</form>
</body>
</html>