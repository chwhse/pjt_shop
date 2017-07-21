<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header_head.jsp"%> 
<style type="text/css">
	.div-displayimg{
		width: 140px; height: 100px;
	}
</style>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css?ver4">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script>
  $( function() {
	  calEachPrice(); 
	  calTotalPrice();  
	  
    $("form[name='f1']").submit(function () {
		$(".error").css("display","none");
		$(".error2").css("display","none");
	
		if(checkInputEmpty($("input[name]"))==false){
			return false;
		};

		alert("등록 되었습니다.");

	});
    
    $(document).on("click","#btnChngQntt",function(){  
      var oqtt = $(this).prev().prev().val();
   	  var gprice = $(this).parent().prev().find(".gprice").html();
   	  var sum = oqtt*gprice; 
   	  $(this).parent().next().html(sum);
   	  alert("수량이 변경되었습니다.");
   	  calTotalPrice();
   	  
    });
  });

  	function calTotalPrice() {
  		var tPrice = 0;
  		for(i=0 ; i < ${list.size()} ; i++){
		  tPrice += parseInt($(".eachSum").eq(i).html());
		}
  		$("#calOtotalprice").html(tPrice);
  		$("input[name='ordersVOList[i].ototalprice']").val(tPrice);
	}
  	function calEachPrice() {
  		var ePrice = 0;
  		for(i=0 ; i < ${list.size()} ; i++){
  			gprice = parseInt($(".gprice").eq(i).html());
  			oquantity = parseInt($(".oquantity4cal").eq(i).val());
  			ePrice = gprice*oquantity
  			$(".eachSum").eq(i).html(ePrice);
		}
  		
	}
  	function btnCancel() {
	  location.href ="listPage"; 
	}
  </script>
</head>
<%@ include file="../include/header.jsp"%> 
<body>
	<div class="page-post">
            <h2 class="page-post-title">장바구니</h2>
	            <c:if test="${empty login }">
	            	<p>로그인해야 구매가 가능합니다. </p>
	            </c:if>
	            <c:if test="${!empty login }">
		            <div style="float:right;">
							<p>${login}</p>
							<input class="form-control" type="hidden" name="uid"  id="uid" value="${login}" readonly="readonly">
					</div>	
				</c:if>
            <hr>
 		<div class="box-body">
            <c:if test="${list.size() == 0 }">
					장바구니가 비었습니다.
				</c:if>
				
				<c:if test="${list.size() > 0 }">
					
					<table border="1">
							<tr>
								<th>주문코드</th>
								<th>주문번호</th>
								<th>주문상품</th>
								<th>주문수량</th>
								<th>가격(상품*수량)</th>
							</tr>
							
							<c:forEach var="order" items="${list }" varStatus="i">
							
							
							<form:form commandName="OrdersVO" name="dataForm" id="dataForm" >
							<input type="text" name="ordersVOList[i].ocode" 
								value="${list.get(0).getOcode() }">
							<input type="text" name="ordersVOList[i].ono" 
								value="${order.ono}">
							<input type="text" name="ordersVOList[i].uid" 
								value="${login }">
							<c:forEach var="good" items="${order.goods }" varStatus="j">	
								<input type="text" name="ordersVOList[i].goods[j]" 
									value="${order(i).good(j) }">
							</c:forEach>
							<input type="text" name="ordersVOList[i].oquantity" 
								value="${order.oquantity}">
							<input type="text" name="ordersVOList[i].ototalprice" >
							</form:form>
							
								<tr>
									<td>${list.get(0).getOcode() }</td>
									<td>${order.ono}</td>
									<td>
										<c:forEach var="good" items="${order.goods }">
				                           <div class="div-displayimg">
				                           		<img src="displayFile?filename=${good.gtitleimg}" class="div-displayimg">
				                           </div>
				                           <p>${good.gname}</p>  
				                           <p class="gprice">${good.gprice}</p>
			                           </c:forEach>
				                    </td>	
									<td style="padding-left:10px;">
										<input type="number" value="${order.oquantity}" class="oquantity4cal" style="width:30px;">
										<br><button id="btnChngQntt">수량변경</button>
									</td>
									<td class="eachSum">0</td>
								</tr>
							</c:forEach>
						</table>	
					<br>	<p>최종가격:</p><p id="calOtotalprice">00</p>
				</c:if>
			</div>
              
			
			
			
			
			
			<div class="form-group"> <!-- 버튼 -->
				<div class="col-sm-12 text-center">
					<button class="btn btn-danger" >결제하기</button>
					<button class="btn btn-default" type="button" onclick="btnCancel()" >취소</button>
				</div>
			</div>
	</div><br><br><br><br><br><br>	<br><br>
</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>

</html>