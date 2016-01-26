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
    .modal-title{
        text-align : center;
    }
    .modal-dialog{
        max-width:500px;

    }
    #questionDiv{
        display: none;
    }
    #selectBox{
        display: none;
    }

    #moquestionDiv{
        display: none;
    }
    #moselectBox{
        display: none;
    }
    #listModal1{
        margin-top:50px;
        margin-left:20px;
    }
    #list{
        position : absolute;
        padding : 10px;
        z-index: 400;
        boarder: 1px solid black;
        boarder-radius : 10px;
        background-color:  #FFF;
        top: 80px;
        left : 15px;
        width : 200px;
        height:400px;
        overflow-y:scroll;

    }

    #listBottom{
        margin-bottom: 5px;
        float: right;
    }
    #order{
        width:33px;
        height:33px;
        float:left;
    }
    #moorder{
        width:33px;
        height:33px;
        float:left;
    }
    #eventName{
        width:420px;
    }
    .fileDrop {
        width: 60%;
        height: 60px;
        border: 2px dotted black;
        border-radius: 10px;
        background-color: powderblue;
        margin-top:10px;
        margin-bottom:10px;
    }
    li{
        list-style: none;
        margin-bottom: 15px;
    }

    small{
        float:right;
        font-size:smaller;
    }
	.img{
	 margin-bottom:10px;
	float:left;
	}
	.x{
	text-align:right;
	}
    ::-webkit-scrollbar {
        width: 10px;
    }

    ::-webkit-scrollbar-track {
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
        border-radius: 10px;
    }

    ::-webkit-scrollbar-thumb {
        border-radius: 10px;
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5);
    }

    .glyphicon{
        display: inline;
        margin : 3px;
    }
    .gly{
        float:right;
    }
    
 	 .blink_me{
        position:absolute;
        top:10px;
        left:100px;
        z-index:600;
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

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 2 // 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


// 마커 하나를 지도위에 표시합니다 
addMarker(new daum.maps.LatLng(vo.attr("lat"), vo.attr("lng")));

// 마커를 생성하고 지도위에 표시하는 함수입니다
function addMarker(position) {
    
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        position: position
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
}

</script>

</body>
</html>