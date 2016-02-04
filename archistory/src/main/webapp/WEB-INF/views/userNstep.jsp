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


    <!-- Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="css/nivo-lightbox.css" rel="stylesheet" />
	<link href="css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
	<link href="css/animate.css" rel="stylesheet" />
    <!-- Squad theme CSS -->
    <link href="css/style2.css" rel="stylesheet">
	<link href="color/default.css" rel="stylesheet">
	
	
	<!-- Core JavaScript Files -->
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.easing.min.js"></script>	
	<script src="js/classie.js"></script>
	<script src="js/gnmenu.js"></script>
	<script src="js/jquery.scrollTo.js"></script>
	<script src="js/nivo-lightbox.min.js"></script>
	<script src="js/stellar.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="js/custom.js"></script>

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
    <img class="img-responsive" src="{{fileName}}"/>
</script>
<script>
    var template = Handlebars.compile($("#template").html());
    var markers = [];
    var lat = ${lat};
    var lng = ${lng};
    var memberno = ${memberno};
    var routeno = ${routeno};
    var eventLi="";
    var eventno = 1;
    var events = [];
    var score = 0;
    var showModal = false;

    //모달들 변수
    var eventModal = $("#eventModal");
    var questionModal = $("#questionModal");
    var resultModal = $("#resultModal");


    var mapContainer = document.getElementById('map'),
            mapOption = {
                center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
                level: 1
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
    function getEventList(callback){
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
        callback();
    };


    getEventList(function(){
        console.log("========== [ Events Array ] =========");
        console.log(events);
    });


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
console.log(showModal);
            var routeLoc = new daum.maps.LatLng(lat, lng)
            // 지도 중심좌표를 루트로 변경
            map.setCenter(routeLoc);


            //내위치와 마커위치 미터단위로 계산하는 식
            function calDistance(eLat,eLng,myLat,myLng,callback){
                var ret = 0;
                var latA=111;
                var lngB=88.8;
                ret = Math.sqrt(
                                Math.pow((Math.abs(eLat-myLat)*latA),2)
                                +
                                Math.pow((Math.abs(eLng-myLng)*lngB),2)
                        )*1000;

                console.log(ret);
                $("#myLocation").html("<h3>"+lt+"</h3><br><h3>"+ln+"</h3><br><h3>"+ret+"</h3>");
                if(ret.toFixed(2) < 10){
                    callback();
                    return;
                }
            }

            // 이벤트 모달이 보여지고 있지 않을 시에만 거리를 검사해서 조건에 만족하는 이벤트 정보를 모달에 넣어 띄워준다.
            if(showModal == false) {


                $(events).each(function () {
                    var event = $(this)[0];
                    eventVO = event;

                    console.log("루트를 돌면서 이벤트 찍어보기");


                    calDistance(event.lat, event.lng, myLat, myLng, function () {
                        console.log("---콜백에 들어온 이벤트가 생김---");
                        showModal = true;
                        console.log(eventVO);
                        $("#title").html(eventVO.title);

                        var youtubeStr = "";
                        if (eventVO.youtube != null) {
                            youtubeStr = eventVO.youtube.split("THUMBNAIL");
                        }

                        console.log("============유투브 가져오기=============");


                        //카메라 있고 영상없는 경우
                        if (eventVO.camera == true && eventVO.youtube == "") {
                            $("#buttonContainer").html("<button id='camera'><span class='glyphicon glyphicon-camera' aria-hidden='true' ></span></button>");

                            //카메라 있고 영상 있는 경우
                        } else if (eventVO.camera == true && eventVO.youtube != "") {
                            $("#buttonContainer").html("<button onclick='videoClick()'><span class='glyphicon glyphicon-facetime-video' aria-hidden='true'></span></button><button id='camera'><span class='glyphicon glyphicon-camera' aria-hidden='true'></span></button>");
                            $("#movieShow").html("<embed  src='http://www.youtube.com/v/" + youtubeStr[0] + "' type='application/x-shockwave-flash' allowscriptaccess='always' allowfullscreen='true'></embed>");

                            //카메라 없고 영상 있는 경우
                        } else if (eventVO.camera == false && eventVO.youtube != "") {
                            $("#buttonContainer").html("<button onclick='videoClick()'><span class='glyphicon glyphicon-facetime-video' aria-hidden='true'></span></button>");
                            $("#movieShow").html("<embed  src='http://www.youtube.com/v/" + youtubeStr[0] + "' type='application/x-shockwave-flash' allowscriptaccess='always' allowfullscreen='true'></embed>");

                            //둘 다 없는 경우
                        } else {
                            $("#buttonContainer").html("");
                        }

                        $.getJSON("http://14.32.66.127:4000/event/getAttach/" + eventVO.eventno, function (data) {
                            $("#imageUl").html("");
                            console.log("==== 첨부한 사진을 불러온다 ====");
                            console.log(data);
                            if (data != "") {
                                var array = data[0].split(',');
                                var length = array.length;
                                for (var i = 0; i < length; i++) {
                                    var name = array[i];
                                    var fileinfo = getFileInfo(name);
                                    var html = template(fileinfo);
                                    $("#imageUl").append(html);
                                }
                            }
                        });


                        $("#content").html(eventVO.content);

                        // 이부분에 내 위치값과 이벤트의 위치값 비교하는 IF문을 넣어줍시다.
                        eventModal.modal('show');

                    	return;
                    });
                    
                    if(showModal == true){
                    	console.log("모달창이 띄워져 For each문 나가기.");
                        return false;
                    }
                    
                });
            }

        });
    };



    //----------------- Next Button 눌렀을 시 ----------------------------//
    $("#nextBtn").on("click",function(event){
        event.preventDefault();
        console.log("NEXT - 문제 출력");

        $.getJSON("http://14.32.66.127:4000/question/view?eventno="+eventVO.eventno,function(data){

            if(data) {
                var questionStr = "";
                console.log("Question이 있어서 불러왔다.", data);
                questionVO = $(data)[0];

                $.getJSON("http://14.32.66.127:4000/question/getAttach/" + questionVO.questionno, function (data) {
                    console.log("문제에 있는 이미지를 불러온다.");
                    console.log(data[0]);
                    if (data[0]) {
                        console.log("======이미지가 존재한다======");
                        var fileinfo = getFileInfo(data[0]);
                        var html = template(fileinfo);
                        $("#questionImg").append(html+"<br><br>");
                    }
                });

                questionStr += "<pre>"+data.question+"</pre>";

                $("#qustionContent").html(questionStr);

                var selector = "";
                if(data.qtype == "ox"){
                    selector +="<div class='radio'><label><input type='radio' value='o' name='answer'> O </label></div><div class='radio'><label><input type='radio' value='x' name='answer'> X </label></div>";
                }else{
                    selector += "<div class='checkbox'><label><input type='checkbox' value='1' name='answer'>"+data.choice1+"</label></div>";
                    selector += "<div class='checkbox'><label><input type='checkbox' value='2' name='answer'>"+data.choice2+"</label></div>";
                    selector += "<div class='checkbox'><label><input type='checkbox' value='3' name='answer'>"+data.choice3+"</label></div>";
                    selector += "<div class='checkbox'><label><input type='checkbox' value='4' name='answer'>"+data.choice4+"</label></div>";
                }

                $("#selectContainer").html(selector);

                questionModal.modal("show");
            }else{
                console.log("Question이 없다.");
                eventModal.modal("hide");
                showModal = false;

                $.ajax({
                    type:'post',
                    url:"http://14.32.66.127:4000/participate/next",
                    headers: {"Content-Type":"application/json"},
                    datatype: "json",
                    data:JSON.stringify({participateno:participateno,routeno:routeno, memberno:memberno,score:score,stage:1}),
                    success: function(data){
                        console.log("=========Participate Next========");
                        console.log(data);
                    },
                    error:function(data){
                        console.log("=========Participate Next========");
                        console.log(data);
                    }

                });
                return;
            }

        });

    });





    //----------------------------------문제를 풀어 버튼을 눌렀을 시 -----------------------------------------------//
    
    $("#submitBtn").on("click",function(event){

        event.preventDefault();
        var answer;
        if(questionVO.qtype=='ox'){
            answer = $(":radio[name='answer']:checked").val();
        }else{
            answer = $(":checkbox[name='answer']:checked").val();
        }

        console.log(answer);

        if(answer == null || answer == undefined){
            $('#submitBtn').popover('show');
            return;
        }

        if(questionVO.answer == answer){
            console.log("정답입니다.");
            $("#resultShow").html("<h3>정답입니다.</h3>");

            $.ajax({
                type:"post",
                url:"http://14.32.66.127:4000/question/solve",
                headers:{ "Content-Type":"application/json"},
                datatype:"json",
                data:JSON.stringify({memberno:memberno,questionno:questionVO.questionno,result:true}),
                success:function(data){
                    console.log("문제를 풀고 받은 결과",data);
                }
            });

        }else{
            console.log("틀렸습니다.");
            $("#resultShow").html("<h3>틀렸습니다.</h3>");

            $.ajax({
                type:"post",
                url:"http://14.32.66.127:4000/question/solve",
                headers:{ "Content-Type":"application/json"},
                datatype:"json",
                data:JSON.stringify({memberno:memberno,questionno:questionVO.questionno,result:false}),
                success:function(data){
                    console.log("문제를 풀고 받은 결과",data);
                }
            });
        }


        questionModal.modal("hide");
        resultModal.modal("show");

    });
    
    
    //================================= All Close 버튼을 누를 시 =========================================//
    $("#allClose").on("click",function(event){
        event.preventDefault();
        eventModal.modal("hide");
        showModal = false;

        $.ajax({
            type:'post',
            url:"http://14.32.66.127:4000/participate/next",
            headers: {"Content-Type":"application/json"},
            datatype: "json",
            data:JSON.stringify({participateno:participateno,routeno:routeno, memberno:memberno,score:score,stage:1}),
            success: function(data){
                console.log("=========Participate Next========");
                console.log(data);
            },
            error:function(data){
                console.log("=========Participate Next========");
                console.log(data);
            }

        });

    });


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