<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header_head.jsp"%> 
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script type="text/javascript">
	function btnDelete() {
		var res = confirm("정말로 삭제하시겠습니까?");
		var bno = ${board.bno};
		if(res == true){
			/* location.href = "delete?bno="+bno;  */
			 $("#f1").attr("action","${pageContext.request.contextPath}/boards/delete"); //post형식의 delete커맨드 호출됨
	         $("#f1").submit();
		}else{
			return false;
		}
	}
	function btnBack() {
        $("#f1").attr("action","listPage${pageMaker.makeSearch(pageMaker.cri.page)}");
        $("#f1").attr("method","get");
        $("#f1").submit();
	}
	function btnModify() {
		$("#f1").attr("action","${pageContext.request.contextPath}/boards/modify");
        $("#f1").attr("method","get");
        $("#f1").submit();
	}
</script>
</head>
<%@ include file="../include/header.jsp"%>
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
					<td>${board.bcontent}</td>
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
		<br>
		<div>
			<form role="form" method="post" id="f1">
               <input type="hidden" name="bno" value="${board.bno}">
            </form>
		</div>
		<div class="btn-group btn-group-sm">
			<c:if test="${board.uid==login }">			
				<button class="btn btn-warning " onclick="btnModify()">게시글 수정</button>
				<button class="btn btn-danger" onclick="btnDelete()">게시글 삭제</button>
			</c:if>
			<button class="btn btn-success" onclick="btnBack()">돌아가기</button>
		</div>
	</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>
</html>