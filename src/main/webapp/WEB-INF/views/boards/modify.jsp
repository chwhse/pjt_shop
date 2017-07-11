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
			<input type="hidden" name="projectno"
				value="${project.projectno }">
		</p>
		<p>
			<label>프로젝트 이름</label><input type="text" name="projectname"
				value="${project.projectname }">
			<span class="error">프로젝트 이름을 입력하세요.</span>
		</p>
		
		<p>
			<label>프로젝트 내용</label><input type="text" name="content"
				value="${project.content }" >
			<span class="error">프로젝트 내용을 입력하세요.</span>
		</p>
		<p>
			<label>시작날짜</label><input type="date" name="startdate"  
				value = "${project.startdate }"	id="startdate">
			<span class="error">시작날짜을 입력하세요.</span>
		</p>
		<p>
			<label>종료날짜</label><input type="date" name="enddate"
				value="${project.enddate }" id="enddate">
			<span class="error">종료날짜을 입력하세요.</span>
		</p>
			<label>진행상태</label>
			<select name="projecting" id="projecting">
				<option<c:if test="${project.projecting eq '준비' }">selected</c:if>>준비</option>
				<option<c:if test="${project.projecting eq '진행중' }">selected</c:if>>진행중</option>
				<option<c:if test="${project.projecting eq '종료' }">selected</c:if>>종료</option>
				<option<c:if test="${project.projecting eq '보류' }">selected</c:if>>보류</option>
				
			</select>
		<p>
			<input type="submit" value="수정">
		</p>
	</form>
</body>
</html>