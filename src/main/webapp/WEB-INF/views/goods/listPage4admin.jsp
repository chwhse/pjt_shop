<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>    
<head>
<%@ include file="../include/header_head.jsp"%> 
<style type="text/css">
	.div-displayimg{
		/* width: 100%; height: 300px; line-height: 300px; text-align: center; */
		width: auto; height: auto;
	   	max-width: 300px;
	   	max-height: 300px;
	}
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
		$(function () {
		
			$("#searchBtn").click(function () {
				var keyword = $("input[name='keyword']").val();
				var searchType = $("select").val();
				location.href= "listPage?keyword="+keyword+"&searchType="+searchType;
			});
		
		});	
		function btnRegist(){
			location.href="register";
		}
</script>
	<%@ include file="../include/header.jsp"%>
	<body>
		
		<div class="page-post">
			<h2 class="page-post-title">Shopping list</h2>
            <div class="box-body">
					<select name="searchType">
						<option value="n" ${cri.searchType==null ? 'selected' : ''}>---</option>
						<option value="t" ${cri.searchType=='t' ? 'selected' : ''}>상품명</option>
					</select>	
					<input type="text" value="${cri.keyword }" name="keyword">
					<button id="searchBtn">Search</button>				
				</div>

			<div class="box-body"> <!-- 상품 리스트 div -->
				<c:if test='${login=="admin" }'>			
					<button class="btn btn-primary" onclick="btnRegist()">상품 등록</button><br><br>
				</c:if>
				
				<c:if test="${list.size() == 0 }">
					등록된 상품이 없습니다.
				</c:if>
				
				<c:if test="${list.size() > 0 }">
					<table border="1">
							<tr>
								<th>상품명</th>
								<th>상품분류</th>
								<th>상품대표이미지</th>
								<th>상품가격</th>
								<th>진열상태</th>
								<th>판매상태</th>
								<th>상품등록일</th>
							</tr>
							
						<c:if test='${login=="admin" }'>
							<c:forEach var="good" items="${list }">
								<tr>
									<td><a href="read${pageMaker.makeSearch(pageMaker.cri.page)}&gcode=${good.gcode}">
										${good.gname}</a></td>
									<td>${good.gcategory}</td>
									<td>
				                           <div class="div-displayimg">
				                           		<img src="displayFile?filename=${good.gtitleimg}"  class="div-displayimg">
				                           </div>      
				                    </td>	
									<td>${good.gprice}</td>
									<td>${good.gisdisplay}</td>
									<td>${good.gisonsale}</td>
									<td><fmt:formatDate value="${good.gregdate}" pattern="yyyy-MM-dd HH:mm"/></td>
								</tr>
							</c:forEach>
						</c:if><!-- 관리자가 보이는 리스트 -->
						
											
					</table>	
	
				</c:if>
			</div>
			
			        
           
          </div><!-- /.blog-post --><br><br><br>  <br><br><br>
	
	</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>

</html>