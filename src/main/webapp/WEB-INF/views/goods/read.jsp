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

/*****************globals*************/
body {
  font-family: 'open sans';
  overflow-x: hidden; }

img {
  max-width: 100%; }

.preview {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }
  @media screen and (max-width: 996px) {
    .preview {
      margin-bottom: 20px; } }

.preview-pic {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1; }

.tab-content {
  overflow: hidden; }
  .tab-content img {
    width: 100%;
    -webkit-animation-name: opacity;
            animation-name: opacity;
    -webkit-animation-duration: .3s;
            animation-duration: .3s; }

.card {
  margin-top: 50px;
  background: #eee;
  padding: 3em;
  line-height: 1.5em; }

@media screen and (min-width: 997px) {
  .wrapper {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex; } }

.details {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }

.colors {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1; }

.product-title, .price, .sizes, .colors {
  text-transform: UPPERCASE;
  font-weight: bold; }

.checked, .price span {
  color: #ff9f1a; }

.product-title, .rating, .product-description, .price, .vote, .sizes {
  margin-bottom: 15px; }

.product-title {
  margin-top: 0; }

.size {
  margin-right: 10px; }
  .size:first-of-type {
    margin-left: 40px; }

.color {
  display: inline-block;
  vertical-align: middle;
  margin-right: 10px;
  height: 2em;
  width: 2em;
  border-radius: 2px; }
  .color:first-of-type {
    margin-left: 20px; }

.add-to-cart, .like {
  background: #ff9f1a;
  padding: 1.2em 1.5em;
  border: none;
  text-transform: UPPERCASE;
  font-weight: bold;
  color: #fff;
  -webkit-transition: background .3s ease;
          transition: background .3s ease; }
  .add-to-cart:hover, .like:hover {
    background: #b36800;
    color: #fff; }

.not-available {
  text-align: center;
  line-height: 2em; }
  .not-available:before {
    font-family: fontawesome;
    content: "\f00d";
    color: #fff; }

.orange {
  background: #ff9f1a; }

.green {
  background: #85ad00; }

.blue {
  background: #0076ad; }

.tooltip-inner {
  padding: 1.3em; }

@-webkit-keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }

@keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }

/*# sourceMappingURL=style.css.map */

	.mystyle {
	    display: block;
	}
</style>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
</script>
</head>
<%@ include file="../include/header.jsp"%>
<body>		
<div class="container">			
	<div class="page-post row">		
	<h2 class="page-post-title">Goods Detail</h2>
	<hr>
		<div class="col-sm-12 col-md-10 col-md-offset-1">
			<div class="preview col-md-6">
				<div class="preview-pic tab-content">
				  <div class="tab-pane active" >
				  	<img src="displayFile?filename=${good.gtitleimg}" >
				  </div>
				</div>
				
			</div>
			<div class="details col-md-6">
				<form role="form" method="post" id="f1">
	               <input type="hidden" name="mygcode" value="${good.gcode}">
	            </form>
				<h3 class="product-title">${good.gname}</h3>
				
				<p>${good.gcategory}</p>
				<p class="product-description">${good.gdesc}</p>
				<h4 class="price">가격 : <span>${good.gprice}</span></h4>
				<div class="action">
					<c:if test="${good.gstock > 0}">
						<button class="add-to-cart btn btn-default" type="button" onclick="btnBuy()">구매하기</button>
					</c:if>
					<c:if test="${good.gstock < 1}">
						<button class="add-to-cart btn btn-default" type="button" disabled="disabled">품절</button>
					</c:if>
					<button class="like btn btn-default" type="button"><span class="fa fa-heart">좋아요</span></button>
					
				</div>
			</div>
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<div class="pull-right ">
					<span class="review-no">${reviewslist.size() } reviews</span>
					<button class="btn btn-warning" type="button" id="btnShowReviews">후기보기</button>
				</div><br><hr>
				<div class="col-sm-12 col-md-10 col-md-offset-1" id="div-reviewslist"> <!-- 리뷰리스트 -->
					<div class="review-block">
						<c:if test="${!empty reviewslist}">
						<c:forEach var="review" items="${reviewslist }">
							<hr/>
							<div class="row">
								<div class="col-sm-4 col-md-4">
									<div class="review-block-name">${review.uid}</div>
									<div class="review-block-date"><fmt:formatDate value="${review.rregdate}" pattern="yyyy-MM-dd HH:mm"/></div>
								</div>
								<div class="col-sm-8 col-md-8">
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
			<div class="col-sm-12 col-md-10 col-md-offset-1" style="text-align:center; padding-top:30px;">
				<c:forEach var="gdimg" items="${good.gdetailimg}">
					<div >
                     		<img src="displayFile?filename=${gdimg}">
                    </div><br><br><br><br>
                </c:forEach>
			</div>
    	</div>
	</div>
</div> <!-- /container -->
</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>

</html>

	