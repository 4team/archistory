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
    <title>= Archistory(USER) = NonStepMode </title>
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
    #eventInfo{
        position:absolute;

        margin-left:-250px;
        left:50%;
        width:500px;


        margin-top:50%;
        top:-250px;
        height:500px;

        z-index:300;
        overflow-y:scroll;
    }

    #title{
        text-align: center;
        font-size:16px;
        font-weight: bold;
    }
    #nextBtn{
        float:right;
    }

    #buttonContainer button{
        float : right;
        margin : 0px 0px 10px 5px;
    }

    #content{
        display:inline-block;
    }

    #movieShow{
        text-align: center;
        z-index:600;
        background-color: #000000;
    }
    /* 1월 29일 12:04분 이후 추가 시작 */
    #imageUl{
        text-align: center;
        text-decoration: none;
        list-style: none;
        margin:0px;
        padding:0px;
    }

    #imageUl img{
     margin: 10px;
     width:450px;
     height:300px;

    }


    ::-webkit-scrollbar {
        width: 1px;
    }

    ::-webkit-scrollbar-track {
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
        border-radius: 1px;
    }

    ::-webkit-scrollbar-thumb {
        border-radius: 1px;
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5);
    }

    #selectContainer{
        padding : 10px;
    }

    button{
        float:right;
    }

    #resultShow{
        text-align: center;
        z-index:700;
    }

    #myLocation{
        position:absolute;
        width:200px;
        height:60px;
        top:50px;
        left:50px;
        background-color: #FFF;
        z-index:1000;
    }
    

    #finishDiv{
        position:absolute;
        z-index:5000;
        background-color: #fff;
        width:100%;
        height:100%;
        display:none;
        text-align: center;
        font-size : 20px;
    }

    #finishDiv img{
        width:60%;
    }

    #finishContent{
        position:absolute;
        text-align: center;
        top:70%;
        left:50%;
        margin-left:-100px;
        z-index: 6000;
    }

    #finishClose{
        position:absolute;
        left:50%;
        right:0;
        margin-left:-20px;
        top:80%;
    }



    #questionImg img{
        width:570px;
    }
</style>

<script type="text/javascript" src="js/upload.js"></script>
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



<!-- 이벤트의 정보를 보여주는 모달 -->
<div class="modal fade" id="eventModal" aria-labelledby="editModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog">

        <div id="eventInfo" class="panel panel-primary">
            <div class="panel-heading">
                <div id="title"></div>
            </div>
            <div class="panel-body">

                <div id="buttonContainer"></div>
                <div id="imageUl"></div>
                <div id="content"></div>

                <button id="nextBtn" class="btn btn-primary">Next</button>
            </div>
        </div>

    </div>
</div>


<div class="modal fade" id="videoModal" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div id="movieShow"></div>
    </div>
</div>




<!-- 퀴즈의 정보를 보여주는 모달 -->
<div class="modal fade" id="questionModal" aria-labelledby="editModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog">

        <div id="questionDiv" class="panel panel-primary">
            <div class="panel-heading">
                QUIZ
            </div>
            <div class="panel-body">

                <div id="questionImg"></div>
                <div id="qustionContent"></div>
                <div id="selectContainer"></div>

                <button id="submitBtn" class="btn btn-primary" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="정답을 선택해주세요.">Submit</button>
            </div>
        </div>

    </div>
</div>

<!-- 퀴즈 푼 뒤의 결과를 보여주는 창 -->
<div class="modal fade" id="resultModal" aria-labelledby="editModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog">



        <div id="resultDiv" class="panel panel-primary">
            <div class="panel-heading">
                RESULT
            </div>
            <div class="panel-body">
                <div id="resultShow"></div>
                <button type="button" id="allClose" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>


    </div>
</div>


<div id="finishDiv">
    <img src="http://14.32.66.127:4000/img/Contentulations.jpg">
   <div id="finishContent">'${routename}' Finish!</div>
    <button type="button" id="finishClose" class="btn btn-default">OK</button>
</div>


<div id="map"></div>
<div id="myLocation"></div>


<script id="template" type="text/x-handlebars-template">
       <img src="{{fileName}}"/>
</script>
<script>
    var template = Handlebars.compile($("#template").html());
    var markers = [];
    var lat = 37.4946413;
    var lng = 127.0280075;
    var memberno = 47;
    var routeno = 430;
    var eventLi="";
    var eventno = 1;
    var events = [];
    var score = 0;

    //모달들 변수
    var eventModal = $("#eventModal");
    var questionModal = $("#questionModal");
    var resultModal = $("#resultModal");


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
    var num=-1;

    var eLat;
    var eLng;

    //이벤트 가져오기
    function getEventList(){
        console.log("getEventList가 호출되어 시작됨.");
        $.getJSON("http://14.32.66.127:4000/event/elist?routeno="+routeno,function(data){
            num++;

            var list = $(data);
            console.log(list);

            list.each(function(){
                var event = $(this);
                addMarker(event[0]);
                events.push(event[0]);
            });

        });
    };


    getEventList();


    //------------------------------ 유저 루트 참여 시작 ----------------------------------//

    $.ajax({
        type:'post',
        url:"http://14.32.66.127:4000/participate/join",
        headers: {
            "Content-Type":"application/json"},
        datatype: "json",
        data:JSON.stringify({routeno:routeno, memberno:memberno,score:score,stage:1}),
        success: function(data){
            console.log("=========Participate Join========");
            participateno = parseInt(data);
        }
    });

    //---------------------------------------------------------------------------------//



    var emT;
    var emPosition;
    function addMarker(event){
        var emarker = new daum.maps.Marker({
            title: event.title,
            position: new daum.maps.LatLng(event.lat,event.lng),
            clickable: true
        });
        console.log("addmarker들어옴");

        emarker.setMap(map);
        emarkers.push(emarker);

    };

/*    function showEvent(emT) {
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
    };*/

    //------------------------------- Geolocation -----------------------------------

    var myLat=0;
    var myLng=0;
    window.addEventListener('deviceorientation',getLocation);

    function getLocation(){
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {

            var lt = position.coords.latitude; // 위도
            var ln = position.coords.longitude; // 경도

            $("#myLocation").html("<h3>"+lt+"</h3><br><h3>"+ln+"</h3>");

            myLat = lt;
            myLng = ln;
            var locPosition = new daum.maps.LatLng(myLat, myLng); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition);
            console.log("내위도경도:" + myLat + "," + myLng);

            var routeLoc = new daum.maps.LatLng(lat, lng)
            // 지도 중심좌표를 루트로 변경
            map.setCenter(routeLoc);


            //내위치와 마커위치 미터단위로 계산하는 식
            function calDistance(eLat,eLng,myLat,myLng){
                var ret=0;
                var latA=111;
                var lngB=88.8;
                ret = Math.sqrt(
                                Math.pow((Math.abs(eLat-myLat)*latA),2)
                                +
                                Math.pow((Math.abs(eLng-myLng)*lngB),2)
                        )*1000;
                console.log(ret.toFixed(2));

                if(ret.toFixed(2)<3){
                    $("#eBox").modal('show');
                }
            }
        });
    };

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

        var iwContent =  '<div style="padding:3px;">My Location</div>', // 인포윈도우에 표시할 내용
                iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new daum.maps.InfoWindow({
            content : iwContent
        });

        // 인포윈도우를 마커위에 표시합니다
        infowindow.open(map, marker);

    }


    //-----------------------------------END Geolocation-----------------------------------------



</script>

</body>
</html>