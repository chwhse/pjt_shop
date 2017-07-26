<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header_head.jsp"%> 
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
</head>
<script type="text/javascript">
	function btnBack() {
		  location.href ="listPage"; 
	}
</script>
<body>
 	<h1>결제 화면</h1>
 	
 	<button class="btn btn-default" type="button" onclick="btnBack()" >돌아가기</button>

</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>

</html>