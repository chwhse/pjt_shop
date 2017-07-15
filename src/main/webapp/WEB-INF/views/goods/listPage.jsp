<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>    
<head>
<%@ include file="../include/header_head.jsp"%> 

<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
			/*레디하고, $("#btnRegister").click(function () {location.href= "register";}); */
			function btnRegist(){
				location.href="register";
			}
</script>
	<%@ include file="../include/header.jsp"%>
	<body>
		
		<div class="page-post">
            

			<div> <!-- 게시글리스트 div -->
				<button class="btn btn-primary" onclick="btnRegist()">게시글 등록</button><br><br>
				
				<c:if test="${list.size() == 0 }">
					등록된 게시글이 없습니다.
				</c:if>
				
				<c:if test="${list.size() > 0 }">
					<table border="1">
							<tr>
								<th>상품명</th>
								<th>썸네일</th>
								<th>가격</th>
							</tr>
							
					<c:forEach var="good" items="${list }">
							<tr>
								<td><a href="read${pageMaker.makeSearch(pageMaker.cri.page)}&gcode=${good.gcode}">
								${good.gname}</a></td>
								<td>${good.gthumb}</td>
								<td>${good.gprice}</td>
							
							</tr>
					</c:forEach>
					</table>	
	
				</c:if>
			</div>
			
			        
           
          </div><!-- /.blog-post --><br><br><br>  <br><br><br>
	
	</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>

</html>