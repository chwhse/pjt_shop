<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>    
<head>
<%@ include file="../include/header_head.jsp"%> 
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	img{
		width: auto; height: 100px;
	}
	
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
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
</head>
<%@ include file="../include/header.jsp"%>
<body>
<c:if test='${login=="admin" }'>
<div class="container">
<div class="box body row">
	<div class="page-post col-md-9 col-md-offset-1">
		<h2 class="page-post-title">Shopping list</h2>
         <p>Along with our wide array of beverages, 
         	Cafe Atto offers a broad selection of delicious, freshly prepared coffees. 
         	For a complete list of coffee items, contact us.</p>				
		<hr>
        <div class="box-body input-group">
			<select class="form-control" name="searchType">
				<option value="n" ${cri.searchType==null ? 'selected' : ''}>---</option>
				<option value="t" ${cri.searchType=='t' ? 'selected' : ''}>상품명</option>
			</select>
			<input style="width:70% " class="form-control" value="${cri.keyword }" name="keyword" placeholder="Search for" required>
			<button type="button" class="btn btn-default" style="width:30%; padding:5px;" id="searchBtn"> 검색 </button>	
		</div><hr>
		
		<div class="box-body row"> <!-- 상품 리스트 div -->
			<c:if test='${login=="admin" }'>			
				<button class="btn btn-primary" onclick="btnRegist()">상품 등록</button><br><br>
			</c:if>
			<c:if test="${list.size() == 0 }">
				등록된 상품이 없습니다.
			</c:if>
			
			<c:if test="${list.size() > 0 }">	
				<table class="table table-list-search">
						<tr>
							<th>상품 대표 이미지</th>
							<th>상품 코드</th>
							<th>상품명</th>
							<th>상품가격</th>
							<th>상품등록일</th>
						</tr>
					<c:forEach var="good" items="${list }">		
						<tr>
							<td>
								<div>
									<c:if test="${!empty good.gtitleimg}">
										<img src="displayFile?filename=${good.gtitleimg}"  >
									</c:if>
									<c:if test="${empty good.gtitleimg}">
										<img src="${pageContext.request.contextPath}/resources/images/failthumb.jpg" alt="사진 업로드 실패 ㅠ_ㅠ" />
									</c:if>
								</div>
							</td>
							<td><a href="read${pageMaker.makeSearch(pageMaker.cri.page)}&gcode=${good.gcode}">
								${good.gcode}</a></td>
							<td> ${good.gname}</td>
							<td>${good.gprice }</td>
							<td><fmt:formatDate value="${good.gregdate}" pattern="yyyy-MM-dd"/></td>
						</tr>			
					</c:forEach>
				</table>
			</c:if>
		</div> <!-- 상품 리스트  end-->	
		
	</div>
	<div class="col-sm-9"> <!-- 페이징처리div -->
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
</div>
</div>
</c:if>
</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>

</html>