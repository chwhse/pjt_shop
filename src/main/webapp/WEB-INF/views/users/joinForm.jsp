<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header_head.jsp"%> 
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script>
  $( function() {
    
    $("form[name='f1']").submit(function () {
		alert("회원가입을 축하합니다.");

	});
    
    
  });
  function btnCancel() {
		history.back();
	}
  </script>
</head>
<%@ include file="../include/header.jsp"%>
<body>
    <div class="joinForm-div">
      <div class="page-header">
 	    <h2>Join Cafe Atto’s Coffee Club </h2>
 	    <p>Become a Cafe Atto's today to get the latest news 
	 	    on all our decadent products and access to exclusive offers and promotions.</p>
      </div>
	    <form class="form-horizontal" name="f1 role="form" method="post" action="joinForm" >
	    
			<div class="form-group">
				<label class="col-sm-3 control-label" for="uid">ID</label>
			      <div class="col-sm-6">
			    	 <input class="form-control" id="uid" name="uid" type="text" placeholder="ID" required>
				</div>
		    </div>
		    
		    <div class="form-group">
		      <label class="col-sm-3 control-label" for="upw">Password</label>
		      <div class="col-sm-6">
		        <input class="form-control" id="upw" name="upw" type="password" placeholder="Password" required>
		    	<p class="help-block">Use at least 8 characters including letter, numeral, and special characters.</p>
		      </div>
		    </div>
		    
		    <div class="form-group">
		      <label class="col-sm-3 control-label" for="upwchk">비밀번호 확인</label>
		      <div class="col-sm-6">
		        <input class="form-control" id="upwchk" type="password" placeholder="Password Check" required>
		          <p class="help-block">Password confirm.</p>
		      </div>
		    </div>
		    
		    <div class="form-group">
		        <label class="col-sm-3 control-label" for="uname">Name</label>
		        <div class="col-sm-6">
		      	  <input class="form-control" id="uname" name="uname" type="text" placeholder="Name" required>
		      	</div>
		    </div>
		    	    
		    <div class="form-group">
		      <label class="col-sm-3 control-label" for="uemail">Email</label>
		      <div class="col-sm-6">
		        <input class="form-control" id="uemail" name="uemail" type="email" placeholder="Email" required>
		      </div>
		    </div>
		    
		    <div class="form-group">
		      <label class="col-sm-3 control-label" for="uaddr">Address</label>
		        <div class="col-sm-6">
		            <div id="locationField">
		  	  		  <input class="form-control" id="uaddr" name="uaddr" type="text" placeholder="Address">
					</div>
		        </div>
		    </div>
		    <div class="form-group">
		        <label class="col-sm-3 control-label" for="uphone">Phone</label>
		        <div class="col-sm-6">
		            <input type="text" class="form-control" id="uphone" name="uphone" placeholder="Phone" required/> 
		        </div>
		    </div>
		    
		
		    <div class="form-group"> 
		      <div class="col-sm-12 text-center">
		        <button class="btn btn-danger" >Join</button>
		        <button class="btn btn-default" type="button" onclick="btnCancel">Cancel</button>
		      </div>
		    </div>
	    </form>
    </div><br><br><br><br><br><br><br><br><br>
</body>

<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>

</html>