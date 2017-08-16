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
		          <a class="navbar-brand" href="${pageContext.request.contextPath}/homes/home">Cafe Atto</a>
		        </div>
		        <div id="navbar" class="collapse navbar-collapse">
		          <ul class="nav navbar-nav">
		            <li><a href="${pageContext.request.contextPath}/homes/aboutUs">About Us</a></li>
		            <li><a href="${pageContext.request.contextPath}/goods/listPage">Shopping</a></li>
		            <li><a href="${pageContext.request.contextPath}/reviews/listPage">Reviews</a></li>
		            <li><a href="${pageContext.request.contextPath}/boards/listPage">Archive</a></li>
		            <li><a href="${pageContext.request.contextPath}/homes/myPage">My Page</a></li>
		            <li><a href="${pageContext.request.contextPath}/orders/buy">Shopping Cart</a></li>
			        <c:if test='${login=="admin" }'>  
			            <li class="dropdown">
			              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">관리자<span class="caret"></span></a>
			              <ul class="dropdown-menu">
			                <li><a href="${pageContext.request.contextPath}/goods/listPage4admin">상품관리</a></li>
			                <li><a href="${pageContext.request.contextPath}/orders/listPage">주문관리</a></li>
			                <li><a href="#">회원관리</a></li>
			                <li><a href="#">기타등등</a></li>
			                <li role="separator" class="divider"></li>
			                <li class="dropdown-header">사장님</li>
			                <li><a href="#">비밀메뉴</a></li>
			                <li><a href="#">ㅇ_ㅇ</a></li>
			                <li><a href="#">ㅎㅎㅎㅎ</a></li>
			              </ul>
			            </li>
		            </c:if>  
		          </ul>
		        </div><!--/.nav-collapse -->
		      </div>
			  </nav>
			  <div id="login-div">
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