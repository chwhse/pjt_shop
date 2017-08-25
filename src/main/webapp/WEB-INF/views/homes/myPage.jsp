<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header_head.jsp"%> 
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		font-family: 'Open Sans', sans-serif;
		color: #353535;
	}
	.content h1 {
		text-align: center;
	}
	.content .content-footer p {
		color: #6d6d6d;
	    font-size: 12px;
	    text-align: center;
	}
	.content .content-footer p a {
		color: inherit;
		font-weight: bold;
	}
	
	/*	--------------------------------------------------
		:: Table Filter
		-------------------------------------------------- */
	.panel {
		border: 1px solid #ddd;
		background-color: #fcfcfc;
	}
	.panel .btn-group {
		margin: 15px 0 30px;
	}
	.panel .btn-group .btn {
		transition: background-color .3s ease;
	}
	.table-filter {
		background-color: #fff;
		border-bottom: 1px solid #eee;
	}
	.table-filter tbody tr:hover {
		cursor: pointer;
		background-color: #eee;
	}
	.table-filter tbody tr td {
		padding: 10px;
		vertical-align: middle;
		border-top-color: #eee;
	}
	.table-filter tbody tr.selected td {
		background-color: #eee;
	}
	.table-filter tr td:first-child {
		width: 38px;
	}
	.table-filter tr td:nth-child(2) {
		width: 35px;
	}
	.ckbox {
		position: relative;
	}
	.ckbox input[type="checkbox"] {
		opacity: 0;
	}
	.ckbox label {
		-webkit-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
		user-select: none;
	}
	.ckbox label:before {
		content: '';
		top: 1px;
		left: 0;
		width: 18px;
		height: 18px;
		display: block;
		position: absolute;
		border-radius: 2px;
		border: 1px solid #bbb;
		background-color: #fff;
	}
	.ckbox input[type="checkbox"]:checked + label:before {
		border-color: #2BBCDE;
		background-color: #2BBCDE;
	}
	.ckbox input[type="checkbox"]:checked + label:after {
		top: 3px;
		left: 3.5px;
		content: '\e013';
		color: #fff;
		font-size: 11px;
		font-family: 'Glyphicons Halflings';
		position: absolute;
	}
	.table-filter .star {
		color: #ccc;
		text-align: center;
		display: block;
	}
	.table-filter .star.star-checked {
		color: #F0AD4E;
	}
	.table-filter .star:hover {
		color: #ccc;
	}
	.table-filter .star.star-checked:hover {
		color: #F0AD4E;
	}
	.table-filter .media-photo {
		width: 120px;
		height: auto;
	}
	.table-filter .media-body {
	    display: block;
	    /* Had to use this style to force the div to expand (wasn't necessary with my bootstrap version 3.3.6) */
	}
	.table-filter .media-meta {
		font-size: 11px;
		color: #999;
	}
	.table-filter .media .title {
		color: #2BBCDE;
		font-size: 14px;
		font-weight: bold;
		line-height: normal;
		margin: 0;
	}
	.table-filter .media .title span {
		font-size: .8em;
		margin-right: 20px;
	}
	.table-filter .media .title span.pagado {
		color: #5cb85c;
	}
	.table-filter .media .title span.pendiente {
		color: #f0ad4e;
	}
	.table-filter .media .title span.cancelado {
		color: #d9534f;
	}
	.table-filter .media .summary {
		font-size: 14px;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$( function() {
	
	 
		$(document).on("click","#btn",function(){  
		  
		});
	});
	$(document).ready(function () {
	
	$('.star').on('click', function () {
		$(this).toggleClass('star-checked');
		});
		
		$('.ckbox label').on('click', function () {
		$(this).parents('tr').toggleClass('selected');
		});
		
		$('.btn-filter').on('click', function () {
		  var $target = $(this).data('target');
		  if ($target != 'all') {
		    $('.table tr').css('display', 'none');
		    $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
		  } else {
		    $('.table tr').css('display', 'none').fadeIn('slow');
		  }
		});
	
	}); 
	
	$(document).on("click","#btnWrtReview",function(){
    	 var res = confirm("해당 주문에 대한 후기작성을 하시겠습니까?");
    	 var rono = parseInt($(this).parent().parent().parent().prev().prev().prev().find("#ono").text());
    	 if(res){
			
    		location.href="${pageContext.request.contextPath}/reviews/register?ono="+rono;
	  	  	
    	 }
	})
	$(document).on("click","#btnRdReview",function(){
		var rno = parseInt($(this).find("span").text());
    		location.href="${pageContext.request.contextPath}/reviews/read?rno="+rno;
	})
	$(document).on("click","#btnCancel",function(){
    	 var res = confirm("해당 주문에 대한 취소요청을 하시겠습니까?");
    	 var cono = parseInt($(this).parent().parent().parent().prev().prev().prev().find("#ono").text());
    	 if(res){
	     	cancelOrder(cono);
    	 }
	})
	
  	function cancelOrder(cono) {
  		$.ajax({	
			url: "${pageContext.request.contextPath}/orders/cancelOrdr/"+cono,
			type:"post",
			dataType:"text",
			success:function(data){
				console.log(data);
				location.href = "${pageContext.request.contextPath}/homes/myPage";
			}
		}); 
	}	
	
</script>
</head>
<%@ include file="../include/header.jsp"%>
<body>
<div class="container">
<div class="page-post row">
	<h2 class="page-post-title">My Page</h2>
        <p>Order History..</p>				
	<hr>
	<section class="content">
		<div class="col-md-8 col-md-offset-2">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="pull-right">
						<div class="btn-group">
							<button type="button" class="btn btn-success btn-filter" data-target="pagado">주문 완료 건</button>
							<button type="button" class="btn btn-warning btn-filter" data-target="pendiente">미입금 건</button>
							<button type="button" class="btn btn-danger btn-filter" data-target="cancelado">주문 취소 건</button>
							<button type="button" class="btn btn-default btn-filter" data-target="all">주문 전체 건</button>
						</div>
					</div>
					<div class="table-container">
						<table class="table table-filter">
						<tbody>
							<c:if test="${orderslist.size()>0 }">
							<c:forEach  var="order" items="${orderslist}" varStatus="i">
								<c:if test="${order.ocondition==1}">
								<tr data-status="pagado">
								</c:if>
								<c:if test="${order.ocondition==-1}">
								<tr data-status="pendiente">
								</c:if>
								<c:if test="${order.ocondition==-2}">
								<tr data-status="cancelado">
								</c:if>
									<td>
										<div class="ckbox">
											<input type="checkbox" id="checkbox1">
											<label for="checkbox1" id="ono"></label>
										</div>
									</td>
									<td>
										<a href="javascript:;" class="star">
											<i class="glyphicon glyphicon-star"></i>
										</a>
									</td>
									<td>
										<div style="text-align:center">
										<a href="${pageContext.request.contextPath}/goods/read?gcode=${order.goods.gcode}">
											<c:if test="${!empty order.goods.gtitleimg}">
												<img class="media-photo"  src="displayFile?filename=${order.goods.gtitleimg}" >
											</c:if>
											<c:if test="${empty order.goods.gtitleimg}">
												<img style="width:120px" src="${pageContext.request.contextPath}/resources/images/failthumb.jpg" alt="사진 업로드 실패 ㅠ_ㅠ" />
											</c:if>
										</a>
										</div>
									</td>
									<td>
										<div class="media">
												<span class="media-meta pull-right">${order.odate}</span>
												<h4 class="title"> ${order.goods.gname}</h4>
												<p class="pull-right">
													<script type="text/javascript">
														document.write(${order.goods.gprice}*${order.oquantity});
													</script>
												</p>
												<p class="summary">${order.goods.gprice} x ${order.oquantity}</p>
												
												
												<c:if test="${order.ocondition==1}">
												<div class="pull-right pagado"><h4 class="text-success text-right">${order.getOcondition2Str() }</h4>
													
													<c:if test="${(order.rno==0)}">
														<button type="button" class="btn btn-sm btn-primary" id="btnWrtReview">
								                            <span class="glyphicon glyphicon-pencil"></span>후기쓰기
								                        </button>
								                    </c:if>    
								                    
							                        <c:if test="${(order.rno!=0)}">
														<button type="button" class="btn btn-sm btn-primary" id="btnRdReview" hidden="${order.rno}">
								                            <span style="display:none">${order.rno}</span>후기작성 완료
								                        </button>
													</c:if>
													<button type="button" class="btn btn-sm btn-danger" id="btnCancel">
							                            <span class="glyphicon glyphicon-remove"></span>주문취소요청
							                        </button>
												</div>
												</c:if>
												<c:if test="${order.ocondition==-1}">
													<div class="pull-right pendiente"><h4 class="text-warning text-right">${order.getOcondition2Str() }</h4>
														<button type="button" class="btn btn-sm btn-danger" id="btnCancel">
								                            <span class="glyphicon glyphicon-remove"></span>주문취소요청
								                        </button>
													</div>
												</c:if>
												<c:if test="${order.ocondition==-2}">
													<div class="pull-right cancelado"><h4 class="text-danger text-right">${order.getOcondition2Str() }</h4></div>
												</c:if>
										</div>
									</td>
								</tr>
							</c:forEach>
							</c:if>
							<c:if test="${empty orderslist or orderslist.size()==0 }">
								<tr><td><h4>주문 내역이 없습니다. </h4></td></tr>      
							</c:if>
						</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	
</div>
</div>
</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>

</html>