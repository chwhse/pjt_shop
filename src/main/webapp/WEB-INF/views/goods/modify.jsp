<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header_head.jsp"%> 
<style type="text/css">
	.div-displayimg{
		width: auto; height: auto;
		max-width: 300px; max-height: 300px;
	}
	.itembox{
		 width: 300px;
		 margin-left: 15px;
		 float: left;
		 position: relative;
	}
	
	.delbtn{
			position: absolute;
			top:10px;
			left:10px;
	} 	   	
	
</style>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css?ver2">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script type="text/javascript">
	$( function() {
		var selectedCategory = "${good.gcategory }";
		
		$("#gcategory option").each(function(i,obj){
			if($(obj).text() == selectedCategory){
				$(obj).attr("selected", "selected");
			}
			
		});
	    
	    $("form[name='f1']").submit(function () {
			$(".error").css("display","none");
			$(".error2").css("display","none");
		
			if(checkInputEmpty($("input[type='text']"))==false){
				alert("빠뜨린 항목을 확인하세요.");
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
		<form class="form-horizontal" action="modify" name="f1" method="post" enctype="multipart/form-data">
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품코드</label>
				<div class="col-sm-6">
					<input class="form-control" type="hidden" name="gcode" id="gcode" value="${good.gcode}" >
					<p class="form-control" >${good.gcode}</p>
				</div>
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품명</label>
				<div class="col-sm-6">
					<input class="form-control" type="text" name="gname" id="gname" value="${good.gname}">
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
					<input class="form-control" type="text" name="gprice"  id="gprice" value="${good.gprice}">
				</div>	
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품 공급 가격</label>
				<div class="col-sm-6">
					<input class="form-control" type="text" name="gsupprice"  id="gsupprice" value="${good.gsupprice}">
				</div>	
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품 상세설명</label>
				<div class="col-sm-6">
					<textarea class="form-control" rows="10" cols="50" name="gdesc">${good.gdesc}</textarea>
					<span class="error">input the goods description.</span>
				</div>	
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">대표이미지</label>
				<div class="col-sm-6">
					<input class="form-control" type="file" name="modTitleImgFile">
					<div class="form-group">
						<div class="itembox">
                          <img src="displayFile?filename=${good.gtitleimg }" class="div-displayimg">
                          <button class="delbtn" >x</button>
                         </div>
                   	</div>
				</div>
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품 상세이미지</label>
				<div class="col-sm-6">  
					<input class="form-control" type="file" name="modImgFiles" multiple="multiple">
					<div class="form-group" >
                       <c:forEach var="item" items="${good.gdetailimg }">
                          <div class="itembox">
                          <img src="displayFile?filename=${item }" class="div-displayimg">
                          <button class="delbtn" data-src="${item }">x</button>
                          <input type="hidden" name="deletefiles">
                          </div>      
                       </c:forEach>   
                   	</div>
				</div>	
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품 재고</label>
				<div class="col-sm-6">
					<input class="form-control" type="text" name="gstock"  id="gstock" value="${good.gstock}">
				</div>	
			</div>
			<div class="form-group"> 
				<label class="col-sm-3 control-label">상품 진열여부</label>
				<div class="col-sm-6">
					<c:if test="${good.gisdisplay}">
						<input class="form-control" type="checkbox" checked="checked" name="gisdisplay" id="gisdisplay">
					</c:if>
					<c:if test="${!good.gisdisplay}">
						<input class="form-control" type="checkbox" name="gisdisplay" id="gisdisplay">
					</c:if>
				</div>	
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">진열 상품 판매여부</label>
				<div class="col-sm-6">
					<c:if test="${good.gisonsale}">
						<input class="form-control" type="checkbox" checked="checked" name="gisonsale" id="gisonsale">
					</c:if>
					<c:if test="!${!good.gisonsale}">
						<input class="form-control" type="checkbox" name="gisonsale" id="gisonsale">
					</c:if>
				</div>	
			</div>
			
			
			<div class="form-group"><!-- 버튼 -->
				<div class="col-sm-12 text-center">
					<button class="btn btn-danger" >게시글 수정</button>
					<button class="btn btn-default" type="button" onclick="btnCancel()" >취소</button>
				</div>
			</div>
		</form><br><br><br><br><br><br><br><br>
	</body>
<script>
	$(document).on("click",".delbtn", function (event) {
		event.preventDefault();
		
		var imgpath = $(this).attr("data-src");
		if(imgpath != null){
			if($(this).next("input").attr("name")=="deletefiles") {
				$(this).next("input[name='deletefiles']").val(imgpath);
				console.log($(this).next("input[name='deletefiles']").val());
				
			} 
		}
		alert("삭제되었습니다.");
		$(this).parent(".itembox").hide();
	})
	
</script>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>
</html>