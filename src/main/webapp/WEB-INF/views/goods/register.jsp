<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header_head.jsp"%> 
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css?ver4">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script>
  $( function() {
    
    $("form[name='f1']").submit(function () {
		$(".error").css("display","none");
		$(".error2").css("display","none");
	
		if(checkInputEmpty($("input[name]"))==false){
			return false;
		};

		alert("등록 되었습니다.");

	});
    
    
  });
  function btnCancel() {
	  location.href ="listPage"; 
	}
  </script>
</head>
<%@ include file="../include/header.jsp"%> 
	<body>
		<form class="form-horizontal" action="register" name="f1" method="post">
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품명</label>
				<div class="col-sm-6">
					<input class="form-control" type="text" name="gname" id="gname" value="">
					<span class="error">input the goods name.</span>
				</div>
			</div>
			
			<div class="form-group"> 
				<label class="col-sm-3 control-label">카테고리</label><br>
				<div class="col-sm-6">
					<input class="form-control" type="text" name="gcategory" id="gcategory" value="">
					<span class="error">input the goods category.</span>
				</div>
			</div>
			
			<div class="form-group"> 
				<label class="col-sm-3 control-label">썸네일</label><br>
				<div class="col-sm-6">
					<input class="form-control" type="text" name="gthumb" id="gthumb" value="">
					<span class="error">input the Thumb-nail.</span>
				</div>
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품 가격</label>
				<div class="col-sm-6">
					<input class="form-control" type="text" name="gprice"  id="gprice" >
				</div>	
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품 상세설명</label>
				<div class="col-sm-6">
					<textarea class="form-control" rows="10" cols="50" name="gdesc"></textarea>
					<span class="error">input the goods description.</span>
				</div>	
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품 상세이미지</label>
				<div class="col-sm-6">
					<input class="form-control" type="text" name="gdetailimg"  id="gdetailimg" >
				</div>	
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품 재고</label>
				<div class="col-sm-6">
					<input class="form-control" type="text" name="gstock"  id="gstock" >
				</div>	
			</div>

			
			
			<div class="form-group"> <!-- 버튼 -->
				<div class="col-sm-12 text-center">
					<button class="btn btn-danger" >상품 등록</button>
					<button class="btn btn-default" type="button" onclick="btnCancel()" >취소</button>
				</div>
			</div>
		</form>
	</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>

</html>