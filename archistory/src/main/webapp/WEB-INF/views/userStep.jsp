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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
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
    .eBox{
    position:absolute;
    width:50%;
    height:50%;
    }
</style>

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
	
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=66fca768fabb8a1e238c3ac76f9c9499"></script>
	
<body>

<div id="map"></div>


            <div class="eBox" id="eBox">
            <a href="#" class="nivo-lightbox-close" id="closeList" title="Close"></a>
                <form id="contact-form">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                           <div class="section-heading">
					<h2>Get in touch</h2>
					</div>
                        </div>                        
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">
                                Message</label>
                            <textarea name="message" id="message" class="form-control" rows="9" cols="25" required="required"
                                placeholder="Message"></textarea>
                        </div>
                    </div>
                    <div class="col-md-12">
                         <button type="submit" class="btn btn-skin pull-right" id="btnContactUs">
                            to the MAP</button>
                        <button type="submit" class="btn btn-skin pull-right" id="btnContactUs">
                            NEXT</button>
                    </div>
                </div>
                </form>
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

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커 이미지 생성
var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
var imageSize = new daum.maps.Size(24, 35);

var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);


var eMarker;

function addMarker(event){

eMarker = new daum.maps.Marker({
    title: "<div class='title'>" + event.title +"<font class='text'> [" + event.eventno +"]</div> <br>"+event.content + "</font><br><br>",
    position: new daum.maps.LatLng(event.lat,event.lng)
});
console.log("addmarker들어옴");
eMarker.setMap(map);
markers.push(eMarker);
};


function getEventList(){
	console.log("getEventList가 호출되어 시작됨.");
	
    $.getJSON("http://14.32.66.127:4000/event/elist?routeno="+routeno,function(data){
        var list = $(data);
        eventLi="";
        console.log(data);
        
        list.each(function(idx,value){
            var event= this;
            addMarker(event);
        });
    });
}

getEventList();


//------------------------------- Geolocation -----------------------------------

//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lt = position.coords.latitude, // 위도
            ln = position.coords.longitude; // 경도
        
        var locPosition = new daum.maps.LatLng(lt, ln), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">나 요기똥</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            console.log("내위도경도:" + lt + "," + ln);
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
    console.log("geolocation 사용불가");
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new daum.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new daum.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
}    


</script>

</body>
</html>