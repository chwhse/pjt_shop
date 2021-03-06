<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>    
<head>
<%@ include file="../include/header_head.jsp"%> 

<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
			/*레디하고, $("#btnRegister").click(function () {location.href= "register";}); */
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
</head>
<body>
	<div class="page-post">
		<h2 class="page-post-title">공지사항</h2>
	         <p>Announcement </p>
	         <p class="page-post-meta">August 25, 2017 by <a href="#">조시은</a></p>
	         	
	    <hr> 
	            <div class="box-body input-group">
					<select class="form-control" name="searchType">
						<option value="n" ${cri.searchType==null ? 'selected' : ''}>---</option>
						<option value="t" ${cri.searchType=='t' ? 'selected' : ''}>Title</option>
						<option value="c" ${cri.searchType=='c' ? 'selected' : ''}>Content</option>
						<option value="w" ${cri.searchType=='w' ? 'selected' : ''}>Writer</option>
						<option value="tc" ${cri.searchType=='tc' ? 'selected' : ''}>Title OR Content</option>
						<option value="cw" ${cri.searchType=='cw' ? 'selected' : ''}>Content OR Writer</option>
						<option value="tcw" ${cri.searchType=='tcw' ? 'selected' : ''}>Title OR Content OR Writer</option>
					</select>
					<input style="width:70% " class="form-control" value="${cri.keyword }" name="keyword" placeholder="Search for" required>
					<button type="button" class="btn btn-default" style="width:30%; padding:5px;" id="searchBtn"> 검색 </button>	
				</div>
	       <div class="box-body row"> <!-- 게시글 리스트 div -->
			<div class="col-sm-9">
				<br><br><button class="btn btn-primary" onclick="btnRegist()">게시글 등록</button><br><br>
					
					<c:if test="${list.size() == 0 }">
						등록된 게시글이 없습니다.
					</c:if>
					
					<c:if test="${list.size() > 0 }">
						<table class="table table-list-search">
	                    	<thead>
		                        <tr>
										<th>번호</th>
										<th>제목</th>
										<th>아이디</th>
										<th>등록일</th>
										<th>조회수</th>									
		                        </tr>
	                    	</thead>
	                    	<tbody>
		                        <c:forEach var="board" items="${list }">
									<tr>
										<td>${board.bno}</td>
										<td><a href="read${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${board.bno}">
										${board.btitle}</a></td>
										<td>${board.uid}</td>
										<td>${board.bregdate}</td>
										<td>${board.breadcnt}</td>
									
									</tr>
								</c:forEach>
	                   		</tbody>
	                </table> 
	            </c:if>  
			</div>
		</div>	
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
	</div>
</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>
</html>