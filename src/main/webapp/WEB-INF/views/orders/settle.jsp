<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header_head.jsp"%> 
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>

</head>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
	function btnGoMyPage() {
		  location.href = "${pageContext.request.contextPath}/homes/myPage";
	}
</script>
<body>
 	<h1>결제 화면</h1>
 	
 	<button class="btn btn-default" type="button" onclick="btnGoMyPage()" >주문내역 보러가기</button>

</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>

</html>