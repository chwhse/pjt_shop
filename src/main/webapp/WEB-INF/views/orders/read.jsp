<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header_head.jsp"%> 
<meta charset="UTF-8">

</head>
<%@ include file="../include/header.jsp"%>
<body>
<c:if test='${login=="admin" }'>
<div class="container">
	<div class="page-post">
		<h2 class="page-post-title">Order Detail Page</h2>
		<hr>
	    <div class="row">
	        <div class="col-sm-12 col-md-10 col-md-offset-1">
				
				<form name="f1">
					<input type="text" name="uid"  id="uid" value="${orderslist.get(0).uid}" readonly="readonly">
					<input type="text" name="ocodes" value="${orderslist.get(orderslist.size()-1).ocode }">
	            <table class="table table-hover" id="t1">
	                <tbody>
	                    <tr>
	                    	<th><input type="checkbox" id="selectAllCheckbox"></th>
	                        <th class="text-center">ocode</th>
	                        <th class="text-center">ono</th>
	                        <th class="text-center">uid</th>
	                        <th class="text-center">oquantity</th>
	                        <th class="text-center">odate</th>
	                        <th class="text-center">ototalprice</th>
	                        <th class="text-center">ocondition</th>
	                    </tr>
	                	
	                	<c:forEach var="order" items="${orderslist }" >	
	                		
		                    <tr class="tr-good">
		                    	<td>
			                    	<input type="hidden" name="ono" id="ono" value="${order.ono}">
			                    	<input type="checkbox" >
		                    	</td>
		                        <td>${order.ocode}</td>
		                        <td>${order.ono}</td>
		                        <td>${order.uid}</td>
		                        <td>${order.oquantity}</td>
		                        <td><fmt:formatDate value="${order.odate}" pattern="yyyy-MM-dd HH:mm"/></td>
		                        <td>${order.ototalprice}</td>
		                        <td>${order.getOcondition2Str()}</td>
		                    </tr>
		                </c:forEach>
	                </tbody>
	            </table>
	            </form>
	            
				<div class="btn-group btn-group-sm">
								
						<button class="btn btn-primary" onclick="btnSuccess()">주문 완료처리</button>
						<button class="btn btn-danger" onclick="btnCancel()">주문 취소처리</button>
					
					<button class="btn btn-success" onclick="btnBack()">돌아가기</button>
				</div>
				
            	   
	            
	        </div>
	    </div>
	</div>
</div>
</c:if> 
</body>
<%@ include file="../include/footer.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(function () {
	  $('#selectAllCheckbox').click(function() {
		  var checkedStatus = this.checked;
		  $('#t1 tbody tr').find('td:first :checkbox').each(function() {
		    $(this).prop('checked', checkedStatus);
		  });
		});
})

	function btnCancel() {
		var res = confirm("주문을 취소처리 하시겠습니까?");
		if(res){
			$('#t1 tbody tr').find('td :checkbox').each(function() {
				var ono = $(this).prev().val();
  		    	if($(this).is(':checked')){
  		    		$.ajax({	
  						url: "${pageContext.request.contextPath}/orders/cancelOrdr/"+ono,
  						type:"post",
  						dataType:"text",
  						success:function(data){
  							console.log(data);
  							window.location.reload(true);
  						}
  					});
  		    	}
  		  	});
			 
		}else{
			return false;
		}
	}
	function btnSuccess() {
		var res = confirm("주문을 완료처리 하시겠습니까?");
		if(res){
			$('#t1 tbody tr').find('td :checkbox').each(function() {
				var ono = $(this).prev().val();
  		    	if($(this).is(':checked')){
  		    		$.ajax({	
  						url: "${pageContext.request.contextPath}/orders/successOrdr/"+ono,
  						type:"post",
  						dataType:"text",
  						success:function(data){
  							console.log(data);
  							window.location.reload(true);
  						}
  					});
  		    	}
  		  	});
		}else{
			return false;
		}
	}
	function btnBack() {
		history.back();
	}
	
</script>
</html>