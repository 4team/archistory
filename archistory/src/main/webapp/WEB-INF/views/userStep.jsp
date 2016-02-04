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
     width:380px;
     height:auto;
	 box-shadow: 5px 5px 5px 0px lightgray;
	 margin:auto;
	 border-radius: 7px;
	 margin:0px 0px 10px 0px;
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
    .modal-content{
    z-index:7000;
    }
    .modal-footer{
    float:bottom;
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

        <div id="eventInfo" class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="title"></h3>
            </div>
            <div class="modal-body">

                <div id="buttonContainer"></div><br><br>
                <div id="imageUl"></div><br>
                <h5 id="content" style="text-align:center; font-weight:bold;"></h5>
</div>
<div class="modal-footer">
                <button type="button" id="nextBtn" class="btn btn-primary">Next</button>
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


<div class="modal fade" id="moveNext" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="top:100px;" >
        <div class="panel panel-info">
            <div class="panel-heading">
                <div>Move Next!</div>
            </div>
        </div>
    </div>
</div>

<div id="finishDiv">
    <img src="http://14.32.66.127:4000/img/Contentulations.jpg">
   <div id="finishContent">'${routename}' Finish!</div>
    <button type="button" id="finishClose" class="btn btn-default">OK</button>
</div>

<div id="myLocation"></div>
<div id="map"></div>


<script id="template" type="text/x-handlebars-template">
       <img src="{{fileName}}"/>
</script>
<script>

    var template = Handlebars.compile($("#template").html());
    //이 화면을 실행할 때 넘어오는 파라미터 초기화.
    var routeno = ${routeno};
    var memberno = ${memberno};
    var lat = ${lat};
    var lng = ${lng};
    var score = 0;

    var myLat = 0;
    var myLng = 0;

    //이벤트와 관련된 변수들
    var eventEA = 0;
    var nowEventNo = null;
    var nowOrder = 1;

    var eventGroup = [];
    var eventVO = null;
    var questionVO = null;

    var participateno = 0;

    //모달들 변수
    var eventModal = $("#eventModal");
    var questionModal = $("#questionModal");
    var resultModal = $("#resultModal");

    //맵과 관련된 부분. 초기화.
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
    var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다





var customOverlay;
    // 마커를 생성하고 지도위에 표시하는 함수입니다.
    function addMarker(event) {
        // 커스텀 오버레이 추가 (여기로 이동하세요 띄우기)
        var content = '<div id="introduction" data-toggle="tooltip" data-placement="top" title="Move to Here!"></div>';

        // 커스텀 오버레이가 표시될 위치입니다
        var position = new daum.maps.LatLng(event.lat, event.lng);

        // 커스텀 오버레이를 생성합니다
        customOverlay = new daum.maps.CustomOverlay({
            position: position,
            content: content,
            xAnchor: 0.3,
            yAnchor: 0.91
        });

        // 커스텀 오버레이를 지도에 표시합니다
        customOverlay.setMap(map);
        $('#introduction').tooltip('show');


    }

    
    //------------------------------------------유저 루트 참여 시작 -------------------------------------//


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

    //-------------------------------------------------------------------------------------------------//
    


    // 나의 위치를 읽어온다.
    console.log("getLocation 호출");
    window.addEventListener('deviceorientation',getLocation);


    function getEvent() {
        function getEventByOrder(eventOrder, callback) {
            console.log("=====현재 이벤트순서로 이벤트 불러오기 호출=====");
            $.getJSON("http://14.32.66.127:4000/event/getByOrder?routeno=" + routeno + "&order=" + eventOrder, function (data) {
                eventVO = data;
                if(eventVO == null){
                    console.log("=================[모든 이벤트를 완료]==================");
                    
                    $("#finishDiv").show();

                    $.ajax({
                        type:'post',
                        url:"http://14.32.66.127:4000/participate/finish",
                        headers: {"Content-Type":"application/json"},
                        datatype: "json",
                        data:JSON.stringify({participateno:participateno,score:score}),
                        success: function(data){
                            console.log("=========Participate Finish========");
                            console.log(data);
                        },
                        error:function(data){
                            console.log("=========Participate Finish========");
                            console.log(data);
                        }

                    });

                    return;
                }
                nowEventNo = eventVO.eventno;
                callback(eventVO);

            });
        }

        getEventByOrder(nowOrder, function (eventVO) {
        	if(customOverlay != null){
	        	customOverlay.setMap(null);
        	}
            
        	if(eventVO == null){
                alert("모든 이벤트의 끝");
                return;
            }
            console.log("==== getEventByOrder의 콜백에 들어옴 ====");
            $("#title").html(eventVO.title);

            addMarker(eventVO);

            var youtubeStr = eventVO.youtube.split("THUMBNAIL");
            console.log("============유투브 가져오기=============");
            console.log(eventVO.camera);
            console.log(eventVO.youtube);
            console.log(eventVO.youtube=="");

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
                if(data!="") {
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

           eventModal.modal("show");
        });

    };


    getEvent();



    // 해당 루트에 있는 이벤트를 불러온다.

    function getEventList(callback){
        console.log("getEventList [호출]");
        eventEA = 0;

        $.getJSON("http://14.32.66.127:4000/event/elist?routeno="+routeno,function(data){
            var list = $(data);

            list.each(function(){
                eventGroup.push($(this));
                console.log(eventGroup);
                eventEA++;
            });
            callback();
        });
    }




    // 해당 루트에 해당하는 모든 이벤트를 가져온다.
    getEventList(function(){
        console.log("getEventList [콜백]");
    });

var myMarker = null;

    function getLocation(){
        console.log("[ 지오로케이션 실행 ]");
        navigator.geolocation.getCurrentPosition(function(position){

            var lat = position.coords.latitude;
            var lng = position.coords.longitude;

            console.log('My latitude: ', lat);
            console.log('My longitude: ', lng);

            myLat = lat;
            myLng = lng;




            //사라지는 조건식 쓰기 myLat, myLng  EventVO
            var ret = Math.sqrt(Math.pow((Math.abs(eventVO.lat-myLat)*111),2)+Math.pow((Math.abs(eventVO.lng-myLng)*88.8),2))*1000;

            $("#myLocation").html("<h3>"+lat+"</h3><h3>"+lng+"</h3><h3>"+ret.toFixed(2)+"</h3>");
//            if(ret.toFixed(2) < 100){
//                customOverlay.setMap(null);
//                eventModal.modal("show");
//            }


            // 마커를 생성합니다
            myMarker = new daum.maps.Marker({
                position:new daum.maps.LatLng(lat,lng),
                map:map
            });


        });

        //여기에 내 현재 위치를 받아서 현재 order에 해당하는 lat, lng를 비교해서 어떤 값 범위 이하이면 eventModal을 보여주면 될 것 같다.
        console.log("===== 현재 ORDER에 해당하는 EventVO의 위도, 경도 =====");
        console.log(eventVO);

        return;
    };




    function videoClick(){
        $("#videoModal").modal("show");
    };


    $("#nextBtn").on("click",function(event){
        event.preventDefault();
        console.log("NEXT - 문제 출력");

        $.getJSON("http://14.32.66.127:4000/question/view?eventno="+nowEventNo,function(data){

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
                        $("#questionImg").html(html+"<br><br>");
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
                $("#moveNext").modal("show");
                nowOrder++;


                $.ajax({
                    type:'post',
                    url:"http://14.32.66.127:4000/participate/next",
                    headers: {"Content-Type":"application/json"},
                    datatype: "json",
                    data:JSON.stringify({participateno:participateno,routeno:routeno, memberno:memberno,score:score,stage:nowOrder}),
                    success: function(data){
                        console.log("=========Participate Next========");
                        console.log(data);
                    },
                    error:function(data){
                        console.log("=========Participate Next========");
                        console.log(data);
                    }

                });

                getEvent();
                return;
            }

        });

    });


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
                    score += questionVO.point;
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
                data:{memberno:memberno,questionno:questionVO.questionno,result:false},
                success:function(data){
                    console.log("문제를 풀고 받은 결과",data);
                }
            });
        }


        questionModal.modal("hide");
        resultModal.modal("show");

    });

    $("#allClose").on("click",function(event){
        event.preventDefault();
//        eventModal.modal("hide");
        $("#moveNext").modal("show");
        nowOrder++;

        $.ajax({
            type:'post',
            url:"http://14.32.66.127:4000/participate/next",
            headers: {"Content-Type":"application/json"},
            datatype: "json",
            data:JSON.stringify({participateno:participateno,routeno:routeno, memberno:memberno,score:score,stage:nowOrder}),
            success: function(data){
                console.log("=========Participate Next========");
                console.log(data);
            },
            error:function(data){
                console.log("=========Participate Next========");
                console.log(data);
            }

        });

        getEvent();
    });

    function clearAll(){
        $("#movieShow").html("");
    }
    

    $("#finishClose").on("click",function(event){
        if(memberno!=0) {
            console.log("GUEST가 아닙니다. 랭킹을 띄워준다.");
            $("#finishDiv").html("<h1>랭킹</h1>");
            
            $.getJSON("http://14.32.66.127:4000/participate/ranking?routeno="+routeno,function(data){
            	
            	console.log(data);
            	
            });
            
        }else{
            console.log("GUEST이다. 첫 페이지로 넘어간다.");
            self.location = "/user";
        }
    });

</script>

</body>
</html>