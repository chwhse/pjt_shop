<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>    
<head>
<%@ include file="../include/header_head.jsp"%> 

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
			<h2 class="page-post-title">Order List Page</h2>
            <div class="box-body">
					<select name="searchType">
						<option value="n" ${cri.searchType==null ? 'selected' : ''}>---</option>
						<option value="t" ${cri.searchType=='t' ? 'selected' : ''}>Title</option>
						<option value="c" ${cri.searchType=='c' ? 'selected' : ''}>Content</option>
						<option value="w" ${cri.searchType=='w' ? 'selected' : ''}>Writer</option>
						<option value="tc" ${cri.searchType=='tc' ? 'selected' : ''}>Title OR Content</option>
						<option value="cw" ${cri.searchType=='cw' ? 'selected' : ''}>Content OR Writer</option>
						<option value="tcw" ${cri.searchType=='tcw' ? 'selected' : ''}>Title OR Content OR Writer</option>
					</select>	
					<input type="text" value="${cri.keyword }" name="keyword">
					<button id="searchBtn">Search</button>				
				</div>

			<div class="box-body"> <!-- 주문목록 div -->
				
				<c:if test="${list.size() == 0 }">
					등록된 상품이 없습니다.
				</c:if>
				
				<c:if test="${list.size() > 0 }">
					<table border="1">
							<tr>
								<th>주문코드</th>
								<th>주문번호</th>
								<th>회원아이디</th>
								<th>장바구니여부</th>
								<th>상품코드</th>
								<th>주문수량</th>
								<th>주문날짜</th>
								<th>최종가격</th>
								<th>주문상태</th>
							</tr>
							
							<c:forEach var="order" items="${list }">
								<tr>
									<td>${order.ocode}</td>
									<td><a href="read${pageMaker.makeSearch(pageMaker.cri.page)}&rno=${order.ono}">
										${order.ono}</a></td>
									<td>${order.uid}</td>
									<td>${order.oisbasket}</td>
									<td>${order.gcode}</td>
									<td>${order.oquantity}</td>
									<td><fmt:formatDate value="${order.odate}" pattern="yyyy-MM-dd HH:mm"/></td>
									<td>${order.ototalprice}</td>
									<td>${order.ocondition}</td>
								</tr>
							</c:forEach>
										
					</table>	
	
				</c:if>
			</div>
			
			        
           
          </div><!-- /.blog-post --><br><br><br><br><br><br>
		  <div> <!-- 페이징처리div -->
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev }">
						<li><a href="listPage${pageMaker.makeSearch(pageMaker.startPage-1)}">&laquo;</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
						<li ${pageMaker.cri.page==idx?'class=active':''}>
							<a href="listPage${pageMaker.makeSearch(idx) }">${idx}</a>
						</li>
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<li><a href="listPage${pageMaker.makeSearch(pageMaker.endPage+1)}">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>

</html>