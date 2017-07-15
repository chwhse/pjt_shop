<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header_head.jsp"%> 
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css?ver2">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script type="text/javascript">
	$( function() {
	    
	    $("form[name='f1']").submit(function () {
			$(".error").css("display","none");
			$(".error2").css("display","none");
		
			if(checkInputEmpty($("input[name]"))==false){
				return false;
			};
			alert("수정 되었습니다.");
	
	    });
	});    
	function btnCancel() {
		history.back();
	}
</script>
</head>
<%@ include file="../include/header.jsp"%>
	<body>
		<form class="form-horizontal" action="modify" name="f1" method="post">
			<div class="form-group"> 
				<input type="hidden" name="bno"
					value="${board.bno }">
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">board title</label>
				<div class="col-sm-6">
					<input class="form-control" type="text" name="btitle" value="${board.btitle }">
				</div>
				<span class="error">input the board-title.</span>
			</div>
			
			<div class="form-group"> 
				<label class="col-sm-3 control-label">board content</label><br>
				<div class="col-sm-6">
				<textarea class="form-control" rows="10" cols="50" name="bcontent">${board.bcontent }</textarea>
					<span class="error">input the board-content.</span>
				</div>
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">writer</label>
				<div  class="col-sm-6">
					<input class="form-control" type="text" name="uid" value = "${board.uid }" readonly="readonly">
				</div>
			</div>
			<div class="form-group"> 
				<div class="col-sm-12 text-center">
					<button class="btn btn-danger" >게시글 수정</button>
					<button class="btn btn-default" type="button" onclick="btnCancel()" >취소</button>
				</div>
			</div>
		</form>
	</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>
</html>