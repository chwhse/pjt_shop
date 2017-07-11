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

	<a href="register">[게시글 등록]</a>
	
	<c:if test="${list.size() == 0 }">
		등록된 게시글이 없습니다.
	</c:if>
	
	<c:if test="${list.size() > 0 }">
		<table border="1">
			<tr>
				<th>title</th>
				<th>writer</th>
				<th>register date</th>
				<th>read count</th>
			</tr>
			
	<c:forEach var="board" items="${list }">
		<tr>
			<td><a href="read?no=${board.bno}">
			${board.btitle}</a></td>
			<td>${board.uid}</td>
			<td>${board.bregdate}</td>
			<td>${board.breadcnt}</td>
		
		</tr>
	</c:forEach>
				
				
</table>	
		
</c:if>
	
	
	
	
</body>
</html>