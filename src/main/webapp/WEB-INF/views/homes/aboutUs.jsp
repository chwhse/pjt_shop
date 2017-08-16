<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header_head.jsp"%> 
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css4AboutUs.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script><!-- jQuery Lib -->

<!--  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=ko"></script> -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWPyOo5FncWYZOWaGvPsYLFwExbhNGBbw" type="text/javascript"></script><!-- 구글맵  -->

<script> 
 function initialize() { 
    var myLatlng = new google.maps.LatLng(35.823947, 128.525187); // y, x좌표값
    var mapOptions = { 
          zoom: 15, 
          center: myLatlng, 
          mapTypeId: google.maps.MapTypeId.ROADMAP 
    } 
   
    var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
    var marker = new google.maps.Marker({ 
              position: myLatlng, 
              map: map, 
              title: "카페 아토" 
    }); 
    var infowindow = new google.maps.InfoWindow( 
            { 
              content: "<h1>카페 아토</h1>", 
              maxWidth: 300 
            } 
    ); 
   
    google.maps.event.addListener(marker, 'click', function() { 
    infowindow.open(map, marker); 
    });
 } 
</script>
</head>
<%@ include file="../include/header.jsp"%>
<body onload="initialize()">
<div class="container">
	<div class="page-post row">
	<h2 class="page-post-title">About Us</h2>
        <p>Cafe Atto is..</p>				
	<hr>
		<div class="col-sm-12 col-md-10 col-md-offset-1">
			<p class="lead"> Welcome to Atto Cafe.</p>
			<p>어서오세요. 저희 카페 아토에서는 신선한 원두로 내린 맛있는 커피와 디저트를 판매합니다. 원두는 코스타리카, 콜롬비아, 예가체프 블렌딩이며 와플과 허니브레드와 함께 즐기시면 더욱 더 좋습니다.</p>
                <div class="well ">
                    	<div class='csslider1 autoplay '>
							<input name="cs_anchor1" id='cs_slide1_0' type="radio" class='cs_anchor slide' >
							<input name="cs_anchor1" id='cs_slide1_1' type="radio" class='cs_anchor slide' >
							<input name="cs_anchor1" id='cs_slide1_2' type="radio" class='cs_anchor slide' >
							<input name="cs_anchor1" id='cs_play1' type="radio" class='cs_anchor' checked>
							<input name="cs_anchor1" id='cs_pause1' type="radio" class='cs_anchor' >
							<ul>
								<div style="width: 100%; visibility: hidden; font-size: 0px; line-height: 0;">
									<img src="http://cssslider.com/sliders/pen/images/buns.jpg" style="width: 100%;">
								</div>
								<li class='num0 img'>
									 <img src="${pageContext.request.contextPath}/resources/images/coffee.jpg"  alt='' title='' />  
								</li>
								<li class='num1 img'>
									<img src="${pageContext.request.contextPath}/resources/images/waffle.jpg"  alt='' title='' />  
								</li>
								<li class='num2 img'>
									 <img src="${pageContext.request.contextPath}/resources/images/bingsoo.jpg"  alt='' title='' /> 
								</li>
							
							</ul>
							<div class='cs_description'>
								<label class='num0'>
									<span class="cs_title"><span class="cs_wrapper">Coffee</span></span>
								</label>
								<label class='num1'>
									<span class="cs_title"><span class="cs_wrapper">Waffle</span></span>
								</label>
								<label class='num2'>
									<span class="cs_title"><span class="cs_wrapper">Dessert</span></span>
								</label>
							</div>
							
							<div class='cs_arrowprev'>
								<label class='num0' for='cs_slide1_0'></label>
								<label class='num1' for='cs_slide1_1'></label>
								<label class='num2' for='cs_slide1_2'></label>
							</div>
							<div class='cs_arrownext'>
								<label class='num0' for='cs_slide1_0'></label>
								<label class='num1' for='cs_slide1_1'></label>
								<label class='num2' for='cs_slide1_2'></label>
							</div>
						</div>
						<!-- End cssSlider.com -->
                </div>
			<p>마가렛 양의 요청으로 현 페이지를 한글로 쓰고 있습니다. 하지만 무슨 이야기를 풀어내야 할 지 모르겠어요. 아무튼 카페 아토 짱짱이구요. 아메리카노 한 잔 드시면 딴데 이제 못가요. 앞으로도 사랑해주시길 !_!</p>
			<blockquote>
			<p>저희 카페는 아리따운 사장님과 4명의 알바생이 있습니다. 저를 보고 싶다면 주말에 찾아 오시길.</p>
			<footer>Cafe Atto <cite title="Source Title">카페 아토</cite></footer>
			</blockquote>
			
			<p> 빙수도 맛있어요.</p>
			
			<blockquote>
			<p> 운영시간 : 오전 9시 ~ 자정 12시 </p>
			<p> 주소 : 대구광역시 달서구 조암남로 14안길 12-2, 1층 (월성동)</p>
			<p> 전화번호 : 010-8564-6150 </p>
			
			</blockquote>
		
                <div class="image-block">
                   <div id="map_canvas" style="width:600px; height:400px;"></div> 
   
                </div>
		
			<p>&nbsp;  월성 CGV 뒷편에 위치</p>
    	</div>
	</div>
</div> <!-- /container -->
</body>
<%@ include file="../include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>

</html>