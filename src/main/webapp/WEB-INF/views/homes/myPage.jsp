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

</head>
<%@ include file="../include/header.jsp"%>
<body>
		<c:if test="${orderslist.size()>0 }">
			<c:forEach items="${orderslist}" var="order">
			<table border="1">
			
				<tr>
					<th>ocode</th>
					<td>${order.ocode}</td>
				</tr>
				<tr>
					<th>ono</th>
					<td>${order.ono}</td>
				</tr>			
				<tr>
					<th>gcode gname</th>
					<td>${order.goods.gcode} : ${order.goods.gname}</td>
				</tr>
<%-- 				<tr>
					<th>gname</th>
					<td>${order.gname}</td>
				</tr> --%>
	 
				<tr>
					<th>oquantity</th>
					<td>${order.oquantity}</td>
				</tr>
				<tr>
					<th>gprice</th>
					<td>${order.goods.gprice}</td>
				</tr>
				<tr>
					<th>ototalprice</th>
					<td>${order.ototalprice}</td>
				</tr>
				<tr>
					<th>ocondition</th>
					<td>${order.ocondition}</td>
				</tr>
<%-- 			<tr>
					<th>rno</th>
					<td>${order.rno}</td>
				</tr> --%>
			
			</table>
			</c:forEach>
			</c:if>	
		<br>
		
			<button class="btn btn-success" onclick="btnBack()">돌아가기</button>
</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>

</html>