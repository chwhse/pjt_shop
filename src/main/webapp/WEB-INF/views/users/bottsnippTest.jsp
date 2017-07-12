<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/bootsnipp.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<div class="container bg">
	    <div class="col-md-10">
	        <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo" />
	         <span class="brand">Dynasofts</span>
	    </div>
	    <div class="col-md-2 pull-right">
	        <i class="social fa fa-facebook fa-2x" style="
	    color: rgb(100, 100, 246);
	"></i>
	        <i class="social fa fa-google-plus fa-2x" style="
	    color: rgb(252, 49, 49);
	"></i>
	        <i class="social fa fa-twitter fa-2x" style="
	    color: rgb(47, 188, 255);
	"></i>
	    </div>
	    
	</div>
	<br>
	<div class="container">
	    <nav class="navbar navbar-default" role="navigation">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">Dynasofts</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="#">Home</a></li>
	        <li><a href="#">About</a></li>
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products <span class="caret"></span></a>
	          <ul class="dropdown-menu" role="menu">
	            <li><a href="#">Web Development</a></li>
	            <li><a href="#">Web Services</a></li>
	            <li><a href="#">Designing</a></li>
	            <li class="divider"></li>
	            <li><a href="#">Branding</a></li>
	            <li class="divider"></li>
	            <li><a href="#">R & D</a></li>
	          </ul>
	        </li>
	      </ul>
	      <form class="navbar-form navbar-left" role="search">
	        <div class="form-group">
	          <input type="text" class="form-control" placeholder="Search">
	        </div>
	        <button type="submit" class="btn btn-default">Submit</button>
	      </form>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="#">Contact Us</a></li>
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Connect <span class="caret"></span></a>
	          <ul class="dropdown-menu" role="menu">
	            <li><a href="#">Facebook</a></li>
	            <li><a href="#">LinkedIn</a></li>
	            <li><a href="#">Google plus</a></li>
	            <li class="divider"></li>
	            <li><a href="#">Tweet</a></li>
	          </ul>
	        </li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	    
	    <div class="col-md-12">
	        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin-bottom:10px;-webkit-box-shadow: -3px 10px 22px -7px rgba(0,0,0,0.75);
	-moz-box-shadow: -3px 10px 22px -7px rgba(0,0,0,0.75);
	box-shadow: -3px 10px 22px -7px rgba(0,0,0,0.75);">
	          <!-- Indicators -->
	          <ol class="carousel-indicators">
	            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
	          </ol>
	        
	          <!-- Wrapper for slides -->
	          <div class="carousel-inner">
	            <div class="item active">
	              <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo" width="100%" height="200px" >
	              <div class="carousel-caption">
	                ...
	              </div>
	            </div>
	            <div class="item">
	              <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo" width="100%" >
	              <div class="carousel-caption">
	                ...
	              </div>
	            </div>
	            <div class="item">
	              <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo" width="100%" >
	              <div class="carousel-caption">
	                ...
	              </div>
	            </div>
	          </div>
	        
	          <!-- Controls -->
	          <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	            <span class="glyphicon glyphicon-chevron-left"></span>
	          </a>
	          <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
	            <span class="glyphicon glyphicon-chevron-right"></span>
	          </a>
	        </div>
	    </div>
	    
	    <div class="col-md-8">
	        <section>
	            <blockquote style="border-left: 5px solid #CA5252;">
	                <header><h3 class="title">Learn HTML5</h3></header>
	                <src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo" class="img_item img-circle"/>
	                <p>Famous Web design scripting language learning made easy grap the tutorial today!</p>
	                <footer align="right"><i> ~ishwar katwe 05-Aug-2014</i></footer>
	            </blockquote>
	            
	            <blockquote style="border-left: 5px solid #CA5252;">
	                <header><h3 class="title">Learn HTML5</h3></header>
	                <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo" class="img_item img-circle"/>
	                <p>Famous Web design scripting language learning made easy grap the tutorial today!</p>
	                <footer align="right"><i> ~ishwar katwe 05-Aug-2014</i></footer>
	            </blockquote>
	           <br>
	            <blockquote style="border-left: 5px solid #CA5252;">
	                <header><h3 class="title">Learn Android</h3></header>
	                <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo" class="img_item img-circle"/>
	                <p>Famous Web design scripting language</p>
	                <footer align="right"><i> ~ishwar katwe 05-Aug-2014</i></footer>
	            </blockquote>
	            <br>
	            <blockquote style="border-left: 5px solid #CA5252;">
	                <header><h3 class="title">Learn PHP Scripting</h3></header>
	                <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo" class="img_item img-circle"/>
	                <p>Famous Web design scripting language</p>
	                <footer align="right"><i> ~ishwar katwe 05-Aug-2014</i></footer>
	            </blockquote>
	        </section>
	    </div>
	    <div class="col-md-4">
	        <aside>
	            <blockquote style="border-left: 5px solid #CA5252;">
	                 <h3 class="title">Recent News</h3>
	                <ul class="list-group">
	                  <li class="list-group-item">Hello its Friday</li>
	                  <li class="list-group-item">Awsome Designing stuff using bootstrap</li>
	                  <li class="list-group-item">HTML5</li>
	                  <li class="list-group-item">CSS3</li>
	                  <li class="list-group-item">PHP</li>
	                </ul>
	           </blockquote>
	           
	        </aside>
	    </div>
	
	
	
	<footer align="center" class="col-md-12" style="
	    border-top: 2px brown solid;
	    margin: 5px;
	">
	<i style="
	    color: #FFF;
	">All Right Received © 2014</i>
	</footer>
	
	</div>
</body>	