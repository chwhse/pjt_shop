<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="container">
	
		 <!-- Fixed navbar -->
		    <nav class="navbar navbar-default navbar-fixed-top">
		      <div class="container">
		        <div class="navbar-header">
		          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		            <span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		          </button>
		          <a class="navbar-brand" href="#">Cafe Atto Shop</a>
		        </div>
		        <div id="navbar" class="collapse navbar-collapse">
		          <ul class="nav navbar-nav">
		            <li class="active"><a href="#">Home</a></li>
		            <li><a href="#">Our Coffee</a></li>
		            <li><a href="#">Menu Items</a></li>
		            <li><a href="#">Take Home</a></li>
		            <li><a href="#">About Us</a></li>
		            <li class="dropdown">
		              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">다른거? <span class="caret"></span></a>
		              <ul class="dropdown-menu">
		                <li><a href="#">니가 뭘 좋아할지 몰라서</a></li>
		                <li><a href="#">준비했다</a></li>
		                <li><a href="#">이것도 있고</a></li>
		                <li><a href="#">저것도 있어</a></li>
		                <li role="separator" class="divider"></li>
		                <li class="dropdown-header">짜잔</li>
		                <li><a href="#">이모티콘 안써짐</a></li>
		                <li><a href="#">쩝쩝</a></li>
		              </ul>
		            </li>
		          </ul>
		        </div><!--/.nav-collapse -->
		      </div>
			  </nav>
			  <div display="block" height="34px">
				<div class="pull-right">
	                    <c:if test="${!empty login }">
	                    <spand>${login}님 환영합니다.</spand>
	                     <a href="${pageContext.request.contextPath}/users/logout" id="btnlogout" class="btn btn-default btn-flat">Logout</a>
	                    </c:if>
	                    <c:if test="${empty login }">
	                     <a href="${pageContext.request.contextPath}/users/login" id="btnlogin" class="btn btn-default btn-flat">Login</a>
	                    </c:if>
	            </div>
			  </div>