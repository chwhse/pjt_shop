<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header_head.jsp"%> 
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
	.div-displayimg{
		width: auto; height: auto;
	/*    	max-width: 300px; */
	   	max-height: 300px;
	}
	.mystyle {
	    display: block;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script type="text/javascript">
$(function () {
		$("#div-reviewslist").css("display","none");
		
		$(document).on("click","#btnShowReviews", function () {
			$("#div-reviewslist").toggle(".mystyle");
		});
	

})

	function btnBuy() {
		$("#f1").attr("action","${pageContext.request.contextPath}/orders/buy");
        $("#f1").attr("method","get");
        $("#f1").submit();
	}
	function btnBack() {
	    $("#f1").attr("action","listPage${pageMaker.makeSearch(pageMaker.cri.page)}");
	    $("#f1").attr("method","get");
	    $("#f1").submit();
	}
</script>
</head>
<%@ include file="../include/header.jsp"%>
<body>
	<div class="page-post">
		<div class="col-sm-7"> <!-- 상품설명 -->
			<table border="1">
					<tr>
						<th>상품코드</th>
						<td>${good.gcode}</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>${good.gname}</td>
					</tr>
					<tr>
						<th>상품분류</th>
						<td>${good.gcategory}</td>
					</tr>			
					<tr>
						<th>상품 대표이미지</th>
						<td>
							 <div class="div-displayimg">
	                      		 <img src="displayFile?filename=${good.gtitleimg}" class="img-displayimg">
	                         </div>   
						</td>
					</tr>
		 
					<tr>
						<th>상품 상세이미지</th>
						<td>
							<c:forEach var="gdimg" items="${good.gdetailimg}">
								<div class="div-displayimg">
		                      		<img src="displayFile?filename=${gdimg}" class="img-displayimg">
		                         </div>
		                    </c:forEach>
						</td>
					</tr>
					<tr>
						<th>상품 상품 설명</th>
						<td>${good.gdesc}</td>
					</tr>
					<tr>
						<th>상품 재고 수량</th>
						<td>${good.gstock}</td>
					</tr>
					<tr>
						<th>상품 가격</th>
						<td>${good.gprice}</td>
					</tr>
					<tr>
						<th>상품 공급 가격</th>
						<td>${good.gsupprice}</td>
					</tr>
					<tr>
						<th>상품 판매상태</th>
						<td>${good.gisonsale}</td>
					</tr>
					<tr>
						<th>상품 등록일</th>
						<td>${good.gregdate}</td>
					</tr>
					
			</table>
			
		<br>
			<div>
				<form role="form" method="post" id="f1">
	               <input type="hidden" name="mygcode" value="${good.gcode}">
	            </form>
			</div>
					
			<div class="div-btn">
				<button class="btn btn-info" onclick="btnBack()">돌아가기</button>
				<button class="btn btn-primary" onclick="btnBuy()">장바구니 담기</button>
				<button class="btn btn-warning" type="button" id="btnShowReviews">후기</button>
			</div>
		</div>
		
		<div class="col-sm-7" id="div-reviewslist"> <!-- 리뷰리스트 -->
				<div class="review-block">
					<c:if test="${!empty reviewslist}">
					<c:forEach var="review" items="${reviewslist }">
						<hr/>
						<div class="row">
							<div class="col-sm-3">
								<div class="review-block-name">${review.uid}</div>
								<div class="review-block-date"><fmt:formatDate value="${review.rregdate}" pattern="yyyy-MM-dd HH:mm"/></div>
							</div>
							<div class="col-sm-9">
								<div class="review-block-title">${review.rtitle}</div>
								<div class="review-block-description">${review.rcontent}</div>
							</div>
						</div>
						
					</c:forEach>
					</c:if>
					<c:if test=" ${empty reviewslist}">
						<p>작성된 리뷰가 없습니다. </p>
					</c:if>
				</div>
		</div>
	</div>
		
</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>
</html>