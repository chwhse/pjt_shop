<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header_head.jsp"%> 
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
	  calEachPrice(); 
	  calTotalPrice();  
	  
	  
    $(document).on("click","#btnChngQntt",function(){  
      var oqtt =  parseInt($(this).prev().prev().val());
   	  var gprice =  parseInt($(this).parent().prev().find(".gprice").html());
   	  var sum = oqtt*gprice; 
   	  $(this).parent().next().html(sum);
   	  alert("수량이 변경되었습니다.");
   	  
	  calEachPrice(); 
	  calTotalPrice();  
   	  
   	  var ono = parseInt($(this).parent().prev().prev().html());
   	  changeQuantity(ono, oqtt, tPrice);
   	  
    });
  });
	
  	var tPrice = 0;
  	function calTotalPrice() {
  	tPrice = 0;	
  		for(i=0 ; i < ${list.size()} ; i++){
		  tPrice += parseInt($(".eachSum").eq(i).html());
		}
  		$("#calOtotalprice").html(tPrice);
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
  	function btnBuy() {
  	  var res = confirm("결제하시겠습니까?");
  	  if(res){
	  	  $("form").attr("action", "${pageContext.request.contextPath}/orders/buy");
	  	  $("form").attr("method","post");
	  	  $("form").submit();
  	  }else{
  	  	return;
  	  }
	}
  	function btnRemove(rono) {
   	  var res = confirm("삭제하시겠습니까?");
  	  if(res){
	  		$.ajax({	
				url: "${pageContext.request.contextPath}/orders/removeOrdr/"+rono,
				type:"post",
				dataType:"text",
				success:function(data){
					console.log(data);
					
				}
				
			}) 
  	  }else{
  	  	return;
  	  }
  		
	}
  	
  	
  	
	function changeQuantity(ono, oqtt, tPrice) {
		$.ajax({	
			url: "${pageContext.request.contextPath}/orders/changeQtt/"+ono+"/"+oqtt+"/"+tPrice,
			type:"post",
			dataType:"text",
			success:function(data){
				console.log(data);
				/* data를 remove시켜주면 됨 */
			}
			
		})
	}
  </script>
</head>

<%@ include file="../include/header.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
			<input type="hidden" name="uid"  id="uid" value="${login}" readonly="readonly">
			<input type="hidden" name="ocodes" value="${list.get(0).ocode }">
            <table class="table table-hover">
                <thead>
                    <tr>
                    	<th>check box</th>
                        <th>상품</th>
                        <th>수량</th>
                        <th class="text-center">가격</th>
                        <th class="text-center">총합</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                	<c:if test="${list.size() > 0 }">
                	<c:forEach var="order" items="${list }" >	
                		<form name="f1">
	                    <tr>
	                    	<td><input type="checkbox">확인용:${order.ono}</td>
	                        <td class="col-sm-8 col-md-6">
		                        <div class="media">
		                            <a class="thumbnail pull-left" href="${pageContext.request.contextPath}/goods/"> 
		                            	<img class="media-object div-displayimg" src="displayFile?filename=${order.goods.gtitleimg}" 
		                            		style="width: 72px; height: 72px;"> 
		                            </a>
		                            <div class="media-body">
		                                <h4 class="media-heading"><a href="#">${order.goods.gname}</a></h4>
		                                <h5 class="media-heading"> by <a href="#">Brand name</a></h5>
		                            </div>
		                        </div></td>
	                        <td class="col-sm-1 col-md-1" style="text-align: center">
		                        <input type="number" value="${order.oquantity}" class="oquantity4cal" style="width:30px;">
		                        <br><button type="button" id="btnChngQntt">수량변경</button>
	                        </td>
	                        <td class="gprice col-sm-1 col-md-1 text-center"><strong>${order.goods.gprice}</strong></td>
	                        <td class="eachSum col-sm-1 col-md-1 text-center"><strong></strong></td>
	                        <td class="col-sm-1 col-md-1">
		                        <button type="button" class="btn btn-danger" onclick="btnRemove(${order.ono})">
		                            <span class="glyphicon glyphicon-remove"></span> 삭제하기
		                        </button>
	                        </td>
	                    </tr>
	                </c:forEach>
	                </c:if>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>상품총합</h5></td>
                        <td class="text-right"><h5><strong id="calOtotalprice">0</strong></h5></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Estimated shipping</h5></td>
                        <td class="text-right"><h5><strong>$6.94</strong></h5></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3><strong>$31.53</strong></h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <button type="button" class="btn btn-default" onclick="btnCancel()">
                            <span class="glyphicon glyphicon-shopping-cart"></span>취소
                        </button></td>
                        <td>
                        <button type="button" class="btn btn-success" onclick="btnBuy()">
                            	결제하기 <span class="glyphicon glyphicon-play"></span>
                        </button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>

</html>