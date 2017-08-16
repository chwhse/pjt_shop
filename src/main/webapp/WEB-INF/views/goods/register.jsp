<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header_head.jsp"%> 
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script>
  $( function() {
    
    $("form[name='f1']").submit(function () {
		$(".error").css("display","none");
		$(".error2").css("display","none");
 		if(checkInputEmpty($("input[type='text']"))==false){
 			return false;
 		}else if(checkInputEmpty($("input[name='gtitleimgfile']"))==false){		
 			return false;
		}else if($("#txtAGdesc").val()==""){
			var $next = $("#txtAGdesc").next(".error");
			$next.css("display", "block");
			return false;
		}
		
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
		<form class="form-horizontal" action="register" name="f1" method="post"  enctype="multipart/form-data">
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품명</label>
				<div class="col-sm-6">
					<input class="form-control" type="text" placeholder="상품명 10자 이내 입력"  name="gname" id="gname" value="">
					<span class="error">input the goods name.</span>
				</div>
			</div>
			
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품분류</label><br>
				<div class="col-sm-6">
					<select class="form-control" name="gcategory" id="gcategory">
						<c:forEach var="gcategory" items="${gcategorylist }">
							<option>${gcategory }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품 가격</label>
				<div class="col-sm-6">
					<input class="form-control" type="number" min="0" value="10000" name="gprice"  id="gprice" >
					<span class="error">input the good's price.</span>
				</div>	
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품 공급 가격</label>
				<div class="col-sm-6">
					<input class="form-control" type="number" min="0" value="10000" name="gsupprice"  id="gsupprice" >
					<span class="error">input the good's supply price.</span>
				</div>	
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품 상세설명</label>
				<div class="col-sm-6">
					<textarea id="txtAGdesc" class="form-control" rows="10" cols="50" placeholder="상품설명입력" name="gdesc"></textarea>
					<span class="error">input the goods description.</span>
				</div>	
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">대표이미지</label>
				<div class="col-sm-6">
					<input class="form-control" type="file" name="gtitleimgfile">
					<span class="error">input the good's title image.</span>
				</div>
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품 상세이미지</label>
				<div class="col-sm-6">
					<input class="form-control" type="file" name="gdetailimgfile" multiple="multiple">
				</div>	
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품 재고</label>
				<div class="col-sm-6">
					<input class="form-control" type="number" min="0" value="0" name="gstock"  id="gstock" >
					<span class="error">input the good's stock.</span>
				</div>	
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품 진열여부</label>
				<div class="col-sm-6">
					<input class="form-control" type="checkbox" checked="checked" name="gisdisplay" id="gisdisplay">
				</div>	
			</div>

			
			
			<div class="form-group"> <!-- 버튼 -->
				<div class="col-sm-12 text-center">
					<button class="btn btn-danger" >상품 등록</button>
					<button class="btn btn-default" type="button" onclick="btnCancel()" >취소</button>
				</div>
			</div>
		</form><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>

</html>