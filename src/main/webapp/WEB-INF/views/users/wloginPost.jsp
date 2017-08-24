<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="browser" value="${header['User-Agent']}" scope="session"/>
	<c:if test="${fn:contains(browser,'Android')}">
		{"uid" : "${login}", "UserIsExist":"${UserIsExist}"}
	</c:if>
	<c:if test="!${fn:contains(browser,'Android')}"> </c:if> --%>
		<!DOCTYPE html>
		<html>
		<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		</head>
		<body>${browser }
			<script type="text/javascript">
			// 주소가:/ex001/user/sboard/listPage됨..
				location.href = "${pageContext.request.contextPath}/homes/home";
			</script>
		
		</body>
		</html>
