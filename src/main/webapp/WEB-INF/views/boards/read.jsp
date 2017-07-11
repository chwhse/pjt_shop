<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script type="text/javascript">

	$(function () {
		$("#del").click(function(e) {
			e.preventDefault();
			var res = confirm("정말로 삭제하시겠습니까?");
			var no = ${project.projectno};
			if(res == true){
				location.href = "delete?no="+no; 
			}else{
				return false;
			}
		});
	});
</script>
</head>
<body>
	
	<table border="1">
			<tr>
				<th>title</th>
				<td>${board.btitle}</td>
			</tr>
			<tr>
				<th>writer</th>
				<td>${board.uid}</td>
			</tr>			
			<tr>
				<th>게시글 내용</th>
				<td><%-- ${boardcontent.content} --%></td>
			</tr>

			<tr>
				<th>register date</th>
				<td>${board.bregdate}</td>
			</tr>
			<tr>
				<th>read count</th>
				<td>${board.breadcnt}</td>
			</tr>
			
	</table>
	
	
	<a href="modify?no=${board.bno }">[수정]</a>
	<a href="#" id="del">[삭제]</a>
	
	<a href="listPage">[돌아가기]</a>
	
	
	
</body>
</html>