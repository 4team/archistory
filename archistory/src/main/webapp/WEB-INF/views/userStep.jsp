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



// 마커를 생성하고 지도위에 표시하는 함수입니다
function addMarker(event) {
    
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
    	title:event.title,
        position: position
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
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

        myLat = lat;
        myLng = lng;
    });
    return;
};


</script>

</body>
</html>