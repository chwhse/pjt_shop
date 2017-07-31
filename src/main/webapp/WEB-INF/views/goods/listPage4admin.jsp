<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="../include/header_head.jsp"%> 
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	img{max-width:100%;}
		*{transition: all .5s ease;-moz-transition: all .5s ease;-webkit-transition: all .5s ease}
	.my-list {
	    width: 100%;
	    padding: 10px;
	    border: 1px solid #f5efef;
	    float: left;
	    margin: 15px 0;
	    border-radius: 5px;
	    box-shadow: 2px 3px 0px #e4d8d8;
	    position:relative;
	    overflow:hidden;
	}
	.my-list h3{
	    text-align: left;
	    font-size: 14px;
	    font-weight: 500;
	    line-height: 21px;
	    margin: 0px;
	    padding: 0px;
	    border-bottom: 1px solid #ccc4c4;
	    margin-bottom: 5px;
	    padding-bottom: 5px;
    }
	.my-list span{float:left;font-weight: bold;}
	.my-list span:last-child{float:right;}
	.my-list .offer{
	    width: 100%;
	    float: left;
	    margin: 5px 0;
	    border-top: 1px solid #ccc4c4;
	    margin-top: 5px;
	    padding-top: 5px;
	    color: #afadad;
    }
	.detail {
	    position: absolute;
	    top: -100%;
	    padding-top: 15px;
	    left: 0;
	    text-align: center;
	    background: #fff;height: 100%;width:100%;
		
	}
		
	.my-list:hover .detail{top:0;}
	
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
	<div class="container">
		<div class="page-post">
			<h2 class="page-post-title">Shopping list</h2><hr>
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
				<c:if test='${login=="admin" }'>
					<c:forEach var="good" items="${list }">
					<div class="col-lg-3 col-md-4 col-sm-6 col-xs-11">
						<div class="my-list">
							<div style="text-align:center">
								<a href="read${pageMaker.makeSearch(pageMaker.cri.page)}&gcode=${good.gcode}">
									<c:if test="${!empty good.gtitleimg}">
										<img src="displayFile?filename=${good.gtitleimg}" >
									</c:if>
									<c:if test="${empty good.gtitleimg}">
										<img src="${pageContext.request.contextPath}/resources/images/failthumb.jpg" alt="사진 업로드 실패 ㅠ_ㅠ" />
									</c:if>
								</a>
							</div>
							<h3> ${good.gname}</h3>
							<span>:</span>
							<span class="pull-right">${good.gprice}</span>
							<div class="offer">Only Cafe Atto</div>
							<div class="detail">
								<p>사장님 강력 추천! </p>
							<div>
								<c:if test="${!empty good.gtitleimg}">
									<img src="displayFile?filename=${good.gtitleimg}" >
								</c:if>
								<c:if test="${empty good.gtitleimg}">
									<img src="${pageContext.request.contextPath}/resources/images/failthumb.jpg" alt="사진 업로드 실패 ㅠ_ㅠ" />
								</c:if>
							</div>
							<a href="${pageContext.request.contextPath}/orders/buy?gcode=${good.gcode}" class="btn btn-info">구매하기</a>
							<a href="read${pageMaker.makeSearch(pageMaker.cri.page)}&gcode=${good.gcode}" class="btn btn-info" >상세보기</a>
							</div>
						</div>
					</div>
					</c:forEach>
				</c:if><!-- 관리자가 보이는 리스트 -->
						
				</c:if>
			</div>
			
			        
           
        </div><!-- /.blog-post --><br><br><br>  <br><br><br>
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