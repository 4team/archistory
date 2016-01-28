<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<?php
    header('X-Frame-Options: GOFORIT'); 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>= Archistory(USER) = StepMode </title>
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
    #myLocation{
	    position:absolute;
    	width:300px;
    	height:100px;
    	z-index:500;
    	top:100px;
    	left:100px;
    	background-color: #FFF;
    }

</style>

<script type="text/javascript" src="/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=66fca768fabb8a1e238c3ac76f9c9499"></script>
<!-- on/off toggle 이용하기 위함 -->
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.0/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.0/js/bootstrap-toggle.min.js"></script>
<body>

<div id="myLocation"></div>

<div id="map"></div>

<script>
var lat = ${lat};
var lng = ${lng};


var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다



// 마커를 생성하고 지도위에 표시하는 함수입니다.
function addMarker(event) {
    
    // 마커를 생성합니다
		var marker = new daum.maps.Marker({
           title: '<div class="title">' + event.title+'<font class="text"> [' + event.eventno +']</div> <br>'+event.content + '</font><br><br>',
           position: new daum.maps.LatLng(event.lat,event.lng)
        });

        marker.setMap(map);
        markers.push(marker);

        daum.maps.event.addListener(marker, 'mouseover', function () {
            // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
            showInfo(marker);
        });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
}


// 인포윈도우와 관련된 함수.
   		// InfoWindow와 관련된 부분
   function showInfo(marker){
        // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
        var iwContent = '<div style="padding:5px;">'+ marker.wd +'</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

        // 인포윈도우를 생성합니다
        var infowindow = new daum.maps.InfoWindow({
            content: iwContent
        });

        infowindow.open(map, marker);

        daum.maps.event.addListener(marker, 'mouseout', function() {
            infowindow.close();
        });
    }



// 나의 위치를 읽어온다.

var myLat = 0;
var myLng = 0;

window.addEventListener('deviceorientation',getLocation);

function getLocation(){

    navigator.geolocation.getCurrentPosition(function(position){
        var lat = position.coords.latitude;
        var lng = position.coords.longitude;

        console.log('My latitude: ', lat);
        console.log('My longitude: ', lng);

        
        $("#myLocation").html("<h3>"+lat+"</h3><br><h3>"+lng+"</h3>");
        myLat = lat;
        myLng = lng;
    });
    return;
};



var eventEA = 0;
var markers = null;


// 해당 루트에 있는 이벤트를 불러온다.

    function getEventList(callback){
    	console.log("getEventList가 호출되어 시작됨.");
		eventEA = 1;
		console.log("=====================");
		console.log(markers);
		
    	if(markers != null){
    		console.log("IF문에 걸렸다! 즉 원래 존재하는 마커가 있는 상태였다.",markers.length);
    		for(var i = 0 ; i < markers.length; i++){
    			console.log(markers[i]);
				markers[i].setMap(null);
    		}
    	}
    	
		markers = [];

		
        $.getJSON("http://14.32.66.127:4000/event/elist?routeno="+routeno,function(data){
            var list = $(data);
            
			list.each(function(){
                eventEA++;
			});

			list.each(function(idx,value){
                var event= this;
                addMarker(event);
            });
/*             
        	// 지도에 표시할 선을 생성합니다
        	polyline = new daum.maps.Polyline({
        	    path: linePath, // 선을 구성하는 좌표배열 입니다
        	    strokeWeight: 5, // 선의 두께 입니다
        	    strokeColor: '#FFAE00', // 선의 색깔입니다
        	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        	    strokeStyle: 'solid' // 선의 스타일입니다
        	});
        	
        	polyline.setMap(map);
        	console.log(linePath); */
        	
        });
            callback();

    }



    getEventList(function(){
    	console.log("getEventList의 콜백에 들어옴.");
    	
/*     	// 지도에 표시할 선을 생성합니다
    polyline = new daum.maps.Polyline({
   	    path: linePath, // 선을 구성하는 좌표배열 입니다
   	    strokeWeight: 5, // 선의 두께 입니다
   	    strokeColor: '#FFAE00', // 선의 색깔입니다
   	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
   	    strokeStyle: 'solid' // 선의 스타일입니다
   	});

    	polyline.setMap(map);
    	console.log(linePath); */
    	
    });


</script>

</body>
</html>