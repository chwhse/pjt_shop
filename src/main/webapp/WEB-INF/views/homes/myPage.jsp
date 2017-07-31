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
		width: 35px;
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
							<button type="button" class="btn btn-success btn-filter" data-target="pagado">주문 완료</button>
							<button type="button" class="btn btn-warning btn-filter" data-target="pendiente">주문 미완료</button>
							<button type="button" class="btn btn-danger btn-filter" data-target="cancelado">주문 취소</button>
							<button type="button" class="btn btn-default btn-filter" data-target="all">주문 전체</button>
						</div>
					</div>
					<div class="table-container">
						<table class="table table-filter">
						<tbody>
							<c:if test="${orderslist.size()>0 }">
							<c:forEach items="${orderslist}" var="order">
								<tr data-status="pagado">
									<td>
										<div class="ckbox">
											<input type="checkbox" id="checkbox1">
											<label for="checkbox1">${order.ono}</label>
										</div>
									</td>
									<td>
										<a href="javascript:;" class="star">
											<i class="glyphicon glyphicon-star"></i>
										</a>
									</td>
									<td>
										<div>
										<a href="#" class="pull-left">
											<c:if test="${!empty good.gtitleimg}">
												<img class="media-photo"  src="displayFile?filename=${good.gtitleimg}" >
											</c:if>
											<c:if test="${empty good.gtitleimg}">
												<img style="width:120px" src="${pageContext.request.contextPath}/resources/images/failthumb.jpg" alt="사진 업로드 실패 ㅠ_ㅠ" />
											</c:if>
										</a>
										</div>
									</td>
									<td>
										<div class="media">
												<span class="media-meta pull-right">${order.odate}</span>
												<h4 class="title">
													${order.goods.gname}
													<span class="pull-right pagado">(done)</span>
												</h4>
												<p class="summary">${order.goods.gprice} x ${order.oquantity}</p>
										</div>
									</td>
									<td>${order.ocondition}</td>
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