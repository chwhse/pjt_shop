<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href="register">[새 프로젝트 등록]</a>
	
	<c:if test="${list.size() == 0 }">
		등록된 프로젝트가 없습니다.
	</c:if>
	
	<c:if test="${list.size() > 0 }">
		<table border="1">
			<tr>
				<th>프로젝트 이름</th>
				<th>시작날짜</th>
				<th>종료날짜</th>
				<th>상태</th>
			</tr>
			
	<c:forEach var="board" items="${list }">
		<tr>
			<td><a href="read?no=${board.btitle}">
			${board.projectname}</a></td>
			<td>${board.startdate}</td>
			<td>${board.enddate}</td>
			<td>${board.projecting}</td>
		
		</tr>
	</c:forEach>
				
				
</table>	
		
</c:if>
	
	
	
	
</body>
</html>