<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header_head.jsp"%> 
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.strong{
		font-size: 20px;
		font-weight: bold;	
	}
</style>

</head>

<%@ include file="../include/header.jsp"%>
<div class="container">
	<div class="page-post">
		<h2 class="page-post-title">Shopping Cart</h2>
		<hr>
	    <div class="row">
	        <div class="col-sm-12 col-md-10 col-md-offset-1">
				
				<form name="f1">
				<input type="hidden" name="uid"  id="uid" value="${login}" readonly="readonly">
				<input type="hidden" name="ocodes" value="${list.get(0).ocode }">
	            <table class="table table-hover" id="t1">
	                <tbody>
	                    <tr>
	                    	<th><input type="checkbox" id="selectAllCheckbox"></td>
	                        <th>상품</th>
	                        <th class="text-center">수량</th>
	                        <th class="text-center">가격</th>
	                        <th class="text-center">총합</th>
	                        <th> </th>
	                    </tr>
	                	<c:if test="${list.size() > 0 }">
	                	<c:forEach var="order" items="${list }" >	
	                		
		                    <tr class="tr-good">
		                    	<td><input type="hidden" name="ono" id="ono" value="${order.ono}"><input type="checkbox" ></td>
		                        <td class="col-sm-8 col-md-6">
			                        <div class="div-good">
			                            <a class="thumbnail pull-left" href="${pageContext.request.contextPath}/goods/"> 
			                            	<img class="media-object" src="displayFile?filename=${order.goods.gtitleimg}" 
			                            		style="width: 72px; height: 72px;"> 
			                            </a>
			                            <div class="media-body">
			                                <h4 class="media-heading"><a href="#">${order.goods.gname}</a></h4>
			                                <span class="media-heading"> by <a href="#">atto</a></span>
			                            </div>
			                        </div></td>
		                        <td class="col-sm-1 col-md-1" style="text-align: center">
			                        <input type="number" value="${order.oquantity}" class="oquantity4cal" style="width:40px; margin-bottom:5px;">
			                        <button type="button" class="btn btn-primary" id="btnChngQntt">수량변경</button>
		                        </td>
		                        <td> <p class="gprice col-sm-1 col-md-1 text-center">${order.goods.gprice}</p> </td>
		                        <td> <p class="eachSum col-sm-1 col-md-1 text-center strong">0</p> </td>
		                        <td class="col-sm-1 col-md-1">
			                        <button type="button" class="btn btn-danger" id="btnRemove">
			                            <span class="glyphicon glyphicon-remove"></span> 삭제하기
			                        </button>
		                        </td>
		                    </tr>
		                </c:forEach>
		                
	                    <tr>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>상품총합</td>
	                        <td class="text-right strong" id="calOtotalprice">0</td>
	                    </tr>
	                    <tr>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>Estimated shipping</td>
	                        <td class="text-right strong" id="deliveryfee">2500</td>
	                    </tr>
	                    <tr>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td><h3>Total</h3></td>
	                        <td class="text-right strong" id="calOtotalpriceWithDeliveryfee">0</td>
	                    </tr>
	                    <tr>
	                        <td>
	                        	<button type="button" class="btn btn-danger" id="btnSelectiveRemove">
		                            <span class="glyphicon glyphicon-remove"></span> 선택삭제
		                        </button>   
	                        </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>
		                        <button type="button" class="btn btn-default" onclick="btnCancel()">
	                            <span class="glyphicon glyphicon-play"></span> 쇼핑 계속하기
	                        	</button>
	                        </td>
	                        <td>
		                        <button type="button" class="btn btn-success" onclick="btnBuy()">
		                            	결제하기 <span class="glyphicon glyphicon-shopping-cart"></span>
		                        </button>
	                        </td>
	                    </tr>
	                    </c:if>
	                   
	                </tbody>
	            </table>
	            </form>
	            <c:if test="${empty list or list.size() == 0}">
	            	<h3>장바구니에 담긴 상품이 없습니다. </h3>        	
	            </c:if>
	        </div>
	    </div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>
<script>
  $( function() {
	  calEachPrice(); 
	  calTotalPrice();  
	
	  $('#selectAllCheckbox').click(function() {
		  var checkedStatus = this.checked;
		  $('#t1 tbody tr').find('td:first :checkbox').each(function() {
		    $(this).prop('checked', checkedStatus);
		  });
		});
	
	$(document).on("click","#btnRemove",function(){
     	 var res = confirm("선택한 상품을 장바구니에서 삭제하시겠습니까?");
     	 var rono = $(this).parent().prev().prev().prev().prev().prev().find("#ono").val();
     	 if(res){
	     	removeOrder(rono);
	  	   	$(this).parent().parent().remove();
	  	  	
     	 }
	})
	$(document).on("click","#btnSelectiveRemove",function(){
     	  var res = confirm("선택한 상품들을 장바구니에서 삭제하시겠습니까?");
    	  if(res){
    		$('#t1 tbody tr').find('td :checkbox').each(function() {
  		    	if($(this).is(':checked')){
	  		    	removeOrder($(this).prev().val());
	  		    	$(this).parent().parent().remove();
  		    	}
  		  	});
    	  }else{
    	  	return;
    	  }
	    		
	})
    $(document).on("click","#btnChngQntt",function(){  
	      var oqtt =  parseInt($(this).prev().val());
	   	  var gprice =  parseInt($(this).parent().next().find(".gprice").text());
	   	  var sum = oqtt*gprice; 
	   	  $(this).parent().next().next().find(".eachSum").text(sum);
	   	  
	   	  
		  calEachPrice(); 
		  calTotalPrice();  
	   	  
	   	  var ono = parseInt($(this).parent().prev().prev().find("#ono").val());
	   	  changeQuantity(ono, oqtt, tPrice);
	   	  alert("수량이 변경되었습니다.");
    });
  });
	
  	var tPrice = 0;
  	function calTotalPrice() {
  		tPrice = 0;	
  		for(i=0 ; i < $(".tr-good").length ; i++){
		  tPrice += parseInt($(".eachSum").eq(i).text());
		}
  		$("#calOtotalprice").text(tPrice);
  		var deliveryfee = parseInt($("#deliveryfee").text());
  		var tPriceWithDeliveryfee = tPrice+deliveryfee;
  		$("#calOtotalpriceWithDeliveryfee").text(tPriceWithDeliveryfee);
	}
  	function calEachPrice() {
  		var ePrice = 0;
  		for(i=0 ; i < $(".tr-good").length ; i++){
  			gprice = parseInt($(".gprice").eq(i).text());
  			oquantity = parseInt($(".oquantity4cal").eq(i).val());
  			ePrice = gprice*oquantity
  			$(".eachSum").eq(i).text(ePrice);
		}
  		
	}
  	function btnCancel() {
	  history.back();
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

  	
  	function removeOrder(rono) {
	  		$.ajax({	
				url: "${pageContext.request.contextPath}/orders/removeOrdr/"+rono,
				type:"post",
				dataType:"text",
				success:function(data){
					console.log(data);
					calEachPrice(); 
					calTotalPrice(); 
				}
			}); 
	}
  	
  	
	function changeQuantity(ono, oqtt, tPrice) {
		$.ajax({	
			url: "${pageContext.request.contextPath}/orders/changeQtt/"+ono+"/"+oqtt+"/"+tPrice,
			type:"post",
			dataType:"text",
			success:function(data){
				console.log(data);
			}
		})
	}
  </script>

</html>