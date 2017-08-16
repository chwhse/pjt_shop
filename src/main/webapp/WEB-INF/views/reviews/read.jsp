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
		if(res == true){
			 $("#f1").attr("action","${pageContext.request.contextPath}/reviews/delete"); //post형식의 delete커맨드 호출됨
	         $("#f1").submit();
		}else{
			return false;
		}
	}
	function btnCancel() {
        $("#f1").attr("action","listPage${pageMaker.makeSearch(pageMaker.cri.page)}");
        $("#f1").attr("method","get");
        $("#f1").submit();
	}
	function btnModify() {
		$("#f1").attr("action","${pageContext.request.contextPath}/reviews/modify");
        $("#f1").attr("method","get");
        $("#f1").submit();
	}
</script>
</head>
<%@ include file="../include/header.jsp"%>
	<body>
		
		<table border="1">
				<tr>
					<th>review goods</th>
					<td> ${review.goods.gname} </td>
				</tr>
				<tr>
					<th>review title</th>
					<td>${review.rtitle}</td>
				</tr>
				<tr>
					<th>writer</th>
					<td>${review.uid}</td>
				</tr>			
				<tr>
					<th>review content</th>
					<td>${review.rcontent}</td>
				</tr>
	 
				<tr>
					<th>register date</th>
					<td>${review.rregdate}</td>
				</tr>
				
		</table>
		<br>
		<div>
			<form role="form" method="post" id="f1">
               <input type="hidden" name="rno" value="${review.rno}">
               <input type="hidden" name="ono" value="${review.ono}">
            </form>
		</div>
		<div class="btn-group btn-group-sm">
			<c:if test="${review.uid==login }">
				<button class="btn btn-warning " onclick="btnModify()">후기 수정</button>
				<button class="btn btn-danger" onclick="btnDelete()">후기 삭제</button>
			</c:if>	
			<button class="btn btn-success" onclick="btnCancel()">돌아가기</button>
		</div><br><br><br><br>
		
		
	
		<div class="div_comment"> <!-- 댓글 detail -->
			<div class="col-md-8">
				<div class="box box-success">
					<div class="box-body" id="div_comment_display">
						<c:if test="${!empty commentlist}">
						<c:forEach var="comment" items="${commentlist }">
							<p>${comment.ccontent }</p>
						</c:forEach>
						</c:if>	
					</div>
					<c:if test='${login=="admin" }'> 
						<div class="box-body">
							<br>
								<input type="text" id="ccontent" placeholder="Comment content"  class="form-control">
								<button class="btn btn-primary" type="button" id="btnAdd">Add Comment</button>
						</div> <!-- end of body -->
					</c:if>	
					<br>
				</div>
			</div>
		</div> <!-- end of 댓글 detail -->
		
				<!-- 댓글 script -->
		<script type="text/javascript">
			$(function () {
				$(document).on("click","#btnAdd",function(){
					var ccontent = $("#ccontent").val();
					var obj = "X";
					$.ajax({	
						url: "${pageContext.request.contextPath}/reviews/addComment/${review.rno}/"+ccontent,
						type:"post",
						success:function(data){
							console.log(data);
							
							console.log(data.ccontent);
							var ccontent = data.ccontent;
							obj = "<p>"+ccontent+"</p>";
							$("#div_comment_display").append(obj);
							$("#ccontent").val("");
						}
						
					})
					
				})
				
			})
			
		</script> 
	</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>
</html>