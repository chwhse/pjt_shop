<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header_head.jsp"%> 
<style type="text/css">
	.div-displayimg{
		width: auto; height: auto;
	/*    	max-width: 300px; */
	   	max-height: 300px;
	}
</style>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script type="text/javascript">
	function btnBuy() {
		$("#f1").attr("action","${pageContext.request.contextPath}/orders/buy");
        $("#f1").attr("method","get");
        $("#f1").submit();
	}
</script>
</head>
<%@ include file="../include/header.jsp"%>
	<body>
		
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
<%--			<tr>
					<th>상품 진열상태</th>
					<td>${good.gisdisplay}</td>
				</tr> --%>
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
				
		<div class="btn-group btn-group-sm">
			<button class="btn btn-primary" onclick="btnBuy()">장바구니 담기</button>
		</div><br><br><br><br><br><br><br><br>
	</body>
<%@ include file="../include/footer.jsp"%>
</html>