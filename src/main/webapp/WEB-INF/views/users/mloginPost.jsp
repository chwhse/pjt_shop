<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>{"uid" : "${login}", "UserIsExist":"${UserIsExist}"}
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="browser" value="${header['User-Agent']}" scope="session"/>
	<c:if test="${fn:contains(browser,'Android')}">
		{"uid" : "${login}", "UserIsExist":"${UserIsExist}"}
	</c:if> --%>
