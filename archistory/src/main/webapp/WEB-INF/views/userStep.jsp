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
        z-index:3000;
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

                <button id="nextBtn">Next</button>
            </div>
        </div>

    </div>
</div>


<div class="modal fade" id="videoModal" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div id="movieShow"></div>
    </div>
</div>

<div id="map"></div>


<script id="template" type="text/x-handlebars-template">
       <img src="{{fileName}}"/>
</script>
<script>
    var template = Handlebars.compile($("#template").html());
    var routeno = 406;
    var lat = 37.3582327;
    var lng = 126.5113589;

    var eventEA = 0;
    var nowOrder = 1;

    var eventGroup = null;

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
            title: "<div class='panel panel-primary'><div class='panel-heading'>"+event.title+"</div><div class='panel-body'>" + event.content+"</div></div>",
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



    function showCustomOverlay(event){

        var content = "<div class='panel panel-primary'><div class='panel-heading'>"+event.title+"</div><div class='panel-body'>" + event.content+"</div></div>";

        var position =  new daum.maps.LatLng(event.lat, event.lng);

        var customOverlay = new daum.maps.CustomOverlay({
            position: position,
            content: content,
            xAnchor: 0.3,
            yAnchor: 0.91
        });

        customOverlay.setMap(map);

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



    // 해당 루트에 있는 이벤트를 불러온다.

    function getEventList(callback){
        console.log("getEventList가 호출되어 시작됨.");
        eventEA = 0;

        $.getJSON("http://14.32.66.127:4000/event/elist?routeno="+routeno,function(data){
            var list = $(data);
            console.log(list);
            list.each(function(){
                $(this).push(eventGroup);
                eventEA++;
            });
            callback();
        });
    }


    // 해당 루트에 해당하는 모든 이벤트를 가져온다.
    getEventList(function(){
        console.log("getEventList의 콜백에 들어옴.");
        console.log("이 루트의 이벤트 총 갯수는 : ",eventEA);
        console.log("==============EventGroup==============");
        console.log(eventGroup);
    });



    function getEventByOrder(eventOrder,callback){
        console.log("=====현재 이벤트순서로 이벤트 불러오기 호출=====");
        $.getJSON("http://14.32.66.127:4000/event/getByOrder?routeno="+routeno+"&order="+eventOrder,function(data){

           console.log("현재 이벤트 순서에 해당하는 EventVO는?");
           var eventVO = $(data);
           console.log(eventVO);
           callback(eventVO[0]);

        });
    }

    getEventByOrder(nowOrder,function(eventVO){
        console.log("==== getEventByOrder의 콜백에 들어옴 ====");
        $("#title").html(eventVO.title);

        var youtubeStr = eventVO.youtube.split("THUMBNAIL");

        //카메라 있고 영상없는 경우
        if(eventVO.camera==true && eventVO.youtube==""){
            $("#buttonContainer").html("<button id='camera'><span class='glyphicon glyphicon-camera' aria-hidden='true' ></span></button>");

        //카메라 있고 영상 있는 경우
        }else if(eventVO.camera==true && eventVO.youtube!=""){
            $("#buttonContainer").html("<button onclick='videoClick()'><span class='glyphicon glyphicon-facetime-video' aria-hidden='true'></span></button><button id='camera'><span class='glyphicon glyphicon-camera' aria-hidden='true'></span></button>");
            $("#movieShow").html("<embed  src='http://www.youtube.com/v/"+ youtubeStr[0] +"' type='application/x-shockwave-flash' allowscriptaccess='always' allowfullscreen='true'></embed>");
        //카메라 없고 영상 있는 경우
        }else if(eventVO.camera==false && eventVO.youtube!=""){
            $("#buttonContainer").html("<button onclick='videoClick()'><span class='glyphicon glyphicon-facetime-video' aria-hidden='true'></span></button>");

        //둘 다 없는 경우
        }else{
            $("#buttonContainer").html("");
        }

        $.getJSON("http://14.32.66.127:4000/event/getAttach/"+eventVO.eventno,function(data){
            console.log("==== 첨부한 사진을 불러온다 ====");
            console.log(data);
            var array = data[0].split(',');
            var length = array.length;
            for(var i = 0; i < length; i++){
                var name = array[i];
                var fileinfo = getFileInfo(name);
                var html = template(fileinfo);
                $("#imageUl").append(html);
            }
        });


        $("#content").html(eventVO.content);


        $("#eventModal").modal("show");
    });


    function videoClick(){
        $("#videoModal").modal("show");
    };


    $("#nextBtn").on("click",function(event){
        console.log("NEXT - 문제 출력");

    });


</script>

</body>
</html>