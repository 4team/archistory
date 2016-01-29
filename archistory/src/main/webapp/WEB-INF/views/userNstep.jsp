<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    
    <title>= Archistory(USER) = StepMode </title>
    
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <!-- Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="css/nivo-lightbox.css" rel="stylesheet" />
	<link href="css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
	<link href="css/animate.css" rel="stylesheet" />
    <!-- Squad theme CSS -->
    <link href="css/style2.css" rel="stylesheet">
	<link href="color/default.css" rel="stylesheet">
	
</head>
<style>
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
    }
    #map{
        width: 100%;
        height: 100%;
    }
    ul li{
        list-style: none;
    }
    #eBox{
    display:none;
    position:absolute;
    overflow-y:scroll;
    }
    .modal-dialog{
    position:absolute;
    z-index:999;
    }
    #totheMap{
    float:left;
    }
    h2{
    text-align:center;
    }
    #content{
    overflow:auto;
    height:30%;
    }
</style>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=66fca768fabb8a1e238c3ac76f9c9499"></script>

<!-- Core JavaScript Files -->
	 <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min2.js"></script>
    <script src="js/jquery.easing.min.js"></script>	
	<script src="js/classie.js"></script>
	<script src="js/gnmenu.js"></script>
	<script src="js/jquery.scrollTo.js"></script>
	<script src="js/nivo-lightbox.min.js"></script>
	<script src="js/stellar.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="js/custom.js"></script>
    
<body>

<div id="map"></div>

<div class="modal fade" id="eBox" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" >
            <div class="modal-header">            
					<h2>EVENT</h2>
            </div>
            
            <div class="modal-body">            
                 <p id="tAnde"></p>
            </div>
            
            <div class="modal-footer">            
                <a class="btn btn-skin" id="totheMap">to the MAP</a>
                        <a class="btn btn-skin">NEXT</a>                            
            </div>
            
        </div>
    </div>
</div>
            
<script>
var markers = [];
var lat = ${lat};
var lng = ${lng};
var routeno = ${routeno};
var eventLi="";
var routename = ${routename};
var eventno = 1;
var events = [];

var mapContainer = document.getElementById('map'),
		mapOption = { 
		    center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
		    level: 3
		    };
var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커 이미지 생성
var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
var imageSize = new daum.maps.Size(24, 35);
var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);


var emarkers = [];
var emarker;
//이벤트 가져오기
function getEventList(){
	console.log("getEventList가 호출되어 시작됨.");
    $.getJSON("http://14.32.66.127:4000/event/elist?routeno="+routeno,function(data){
        var list = $(data);
        eventLi="";
        console.log(list);
        
        Math.min.apply(null, list);
        console.log(Math.min.apply(null, list));
        
        list.each(function(idx,value){
	        var event= this;
	        console.log("list.each들어옴");
	        addMarker(event);		
			
	    });
    });
    };
getEventList();


var emT;
var emPosition;
function addMarker(event){
	emarker = new daum.maps.Marker({
				      title: event.eventno,
				      position: new daum.maps.LatLng(event.lat,event.lng),
				      clickable: true
					});			        		
			        	console.log("addmarker들어옴");
			        	
			        	emarker.setMap(map);
			        	emarkers.push(emarker);		
			        	emPosition = emarker.getPosition();
			        	
			        	emT = emarker.getTitle();
			    		showEvent(emT);

			    		var title2 = emarker.getTitle();
			    		
 daum.maps.event.addListener(emarker, 'click', function(title2) {
    console.log(title2);
    $("#eBox").modal('show');
    
});
 
 			    		
};
			        				        	
function showEvent(emT) {
	console.log("showEvent 들어옴");
	$.getJSON("http://14.32.66.127:4000/event/view?eventno="+emT,function(data){
        var list = $(data);
        eventLi="";
        console.log(list);      
        console.log(list.attr("title"));
        
       eventLi += "<div class='form-group'>"+
       "<label for='title'>"+list.attr("title")+"</label>"+
       "<p class='form-control' id='content'>"+list.attr("content")+"</p>"+
                "</div>"
       $("#tAnde").html(eventLi);
   });
};

//------------------------------- Geolocation -----------------------------------

var lt;
var ln;

//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
         lt = position.coords.latitude; // 위도
         ln = position.coords.longitude; // 경도
        
        var locPosition = new daum.maps.LatLng(lt, ln), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">나 여기있징</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            console.log("내위도경도:" + lt + "," + ln);
            
          //내 위치와 마커위치 일정거리 이하되면 이벤트문제창뜨게
    		/* var meAb = (mPosition.Ab)-(emPosition.Ab);
    		var mezb = (mPosition.zb)-(emPosition.zb);
    		var distance = Math.sqrt(Math.pow((meAb),2)+Math.pow((mezb),2));
    		console.log(distance);
    		
                if(distance<0.0013){
                	 $("#eBox").modal('show');
                } */

      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
    console.log("geolocation 사용불가");
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
var marker;
var mPosition;
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    marker = new daum.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    mPosition = marker.getPosition();
    
    var iwContent =  '<div style="padding:3px; text-align:center; text-weight:bold;">나의 현재 위치</div>', // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new daum.maps.InfoWindow({
        content : iwContent
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    console.log("lt:" + lt);
    
    
var routeLoc = new daum.maps.LatLng(lat, lng)
    // 지도 중심좌표를 루트로 변경
    map.setCenter(routeLoc);   
}
//-----------------------------------END Geolocation-----------------------------------------

</script>

</body>
</html>