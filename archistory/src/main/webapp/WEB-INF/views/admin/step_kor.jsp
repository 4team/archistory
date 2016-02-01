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
    
    <title>= Archistory(ADMIN) = StepMode - Create </title>
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
    	padding:0px;
    	text-align:center;
        width:33px;
        height:33px;
        float:left;
    }
    #moorder{
        padding:0px;
    	text-align:center;
        width:33px;
        height:33px;
        float:left;
    }
    #eventName{
        width:420px;
    }
    .fileDrop {
        width: 90%;
        height: 100px;
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
        width: 1px;
    }

    ::-webkit-scrollbar-track {
        -webkit-box-shadow: inset 0 0 1px rgba(0,0,0,0.3);
        border-radius: 1px;
    }

    ::-webkit-scrollbar-thumb {
        border-radius: 1px;
        -webkit-box-shadow: inset 0 0 1px rgba(0,0,0,0.5);
    }

    .glyphicon{
        display: inline;
        margin : 3px;
    }
    .gly{
        float:right;
        white-space:nowrap;
    }
    
 	 .blink_me{
        position:absolute;
        top:10px;
        left:100px;
        z-index:600;
    }
    
    #search-container{
    	font-size:9px;
        height:100px;
    }
    
     #search-container td{
     	width:120px;
     }
     
     #search-container table tr td img:hover{
     	border : 1px solid;
        border-color:#007ECD;
        box-shadow:0 0 8px #fff;
     }
     
     #search-container table{
     	margin-left: 10px;
     }
    
    #searchDiv{
    	display:none;
    	border: 1px solid white;
        border-radius: 10px;
    	padding:10px;
    	text-align:center;
    	background-color:#000;
    	color:#fff;
    	z-index:1200;
    	position:absolute;
    	right:150px;
    	top:100px;
		width:180px;
		height:400px;
		overflow-y: scroll; 
    }
    

    #eventTitle{
    	width:130px;
    	height:22px;
		overflow:hidden;
    	white-space:nowrap;
    	float:left;
    }
    
     #yClose{
    	color: white;
    }
    
     #sortable { 
	     list-style-type: none; 
	     margin: 0; 
	     padding: 0; 
	     width: 100%; 
     }
     
     #sortable li { 
	     margin: 0 3px 3px 3px; 
	     padding: 0.4em; 
	     font-size: 1em; 
	     height: 30px; 
     }
     
     .ui-state-highlight { 
     height: 1.5em; 
     line-height: 1.2em; }
     
     
		.sortable-number { 
		width: 10px;
		float: left;
		line-height: 1em;
		text-align: center;
		font-weight: bold; }
 
    
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

<!-- 메뉴 드래그드롭 하기 위함  -->
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


<body>


<div id="map"></div>

<div id="searchDiv">
	<button type="button" id="yClose" class="close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
	<div id="search-container"></div>
</div>

<!-- 모달 팝업(이벤트(스텝) 생성) -->
<form role="form" id="registerForm" method="post">
    <div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventCreateModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span>
                        <span class="sr-only">Close</span></button>
                    <h4 class="modal-title">이벤트 생성</h4>
                </div>
                <div class="modal-body">
                    <div id="createEventDiv" >

                       <label for="eventName">이름</label><br>
                        <input type="text" class="form-control" id="order" placeholder="순서" readonly="readonly" style="align:center">
                        <input type="text" class="form-control" id="eventName" placeholder="이벤트 이름을 입력하세요">
                        <button type="button" id="search" class="btn btn-info btn-xs" style="float : right; margin-right: 10px; margin-top: 5px;">검색</button><br>
                        <label for="eventinfo">설명</label><textarea class="form-control" id="eventinfo" rows="3" placeholder="이벤트 설명을 입력하세요."></textarea>
                        <label for="imgInput">이미지</label>
                        <div class="fileDrop"><h5 align="center";>마우스로 파일을 끌어오세요.</h5></div>                        
						<ul class="mailbox-attachments clearfix uploadedList" style="display:inline"></ul>
							
                        <label for="videoInput">동영상</label>
                        	Youtube Search <input type="text" id="query"><button type="button" id="youtubeSearch"  class="btn btn-info btn-xs" style="float : right; margin-right: 10px; margin-top: 5px;">Search</button>
                    	<ul id="youtubeList"></ul>
                        <!-- <div class="fileDrop"><h5 align="center">여기에 동영상을 끌어오세요</h5></div> -->
                        
                        <label for="camera">카메라</label>
                        <input type="checkbox" id="camera" data-toggle="toggle" data-size="mini" style="margin-right : 270px;"><br>

                        <input type="checkbox" id="qCheck" value="option1"><span style="margin-right:270px;">Question</span><br>
                     </div>
                        <div id="questionDiv">
                            <hr>
                            <h4 class="modal-title">QUESTION</h4>

                            <label for="type">문제 유형</label>
                            <select class="form-control" id="qType">
                                <option value="ox">O/X</option>
                                <option value="multiple">객관식</option>
                            </select><br>

                            <label for="qTitle">문제</label>
                            <textarea class="form-control" id="questionTitle" placeholder="문제를 입력하세요."></textarea><br>
                            <div id="selectBox">
                                <label for="s1">1번 선택지</label><input type="text" class="form-control" id="s1" placeholder="1번 보기를 입력하세요."><br>
                                <label for="s2">2번 선택지</label><input type="text" class="form-control" id="s2" placeholder="2번 보기를 입력하세요."><br>
                                <label for="s3">3번 선택지</label><input type="text" class="form-control" id="s3" placeholder="3번 보기를 입력하세요."><br>
                                <label for="s4">4번 선택지</label><input type="text" class="form-control" id="s4" placeholder="4번 보기를 입력하세요."><br>

                                <div id="multipleAnswerBox" class="checkbox">
                                    <label><input type="checkbox" name="optionsRadios" id="multipleAnswer1" value="1">1</label>
                                    <label><input type="checkbox" name="optionsRadios" id="multipleAnswer2" value="2">2</label>
                                    <label><input type="checkbox" name="optionsRadios" id="multipleAnswer3" value="3">3</label>
                                    <label><input type="checkbox" name="optionsRadios" id="multipleAnswer4" value="4">4</label>
                                </div>
                            </div>
                            <div id="oxAnswerbox" class="radio">
                                <label><input type="radio" name="optionsRadios" id="oxAnswer1" value="o" checked> O </label>
                                <label><input type="radio" name="optionsRadios" id="oxAnswer2" value="x" checked> X </label>
                            </div>

                            </div>
                            </div>

                            <div class="modal-footer">
                                <button type="submit" id="createEventBtn" class="btn btn-create">만들기</button>
                                <button type="submit" id="cancleEventBtn" class="btn btn-default" data-dismiss="modal">취소</button>
                            </div>

                            </div>
                            </div>
                            </div>
                            </form>

                        <!-- END 모달(event 및 문제 생성)  -->


<!--  수정 모달  -->
<div class="modal fade" id="modiModal" tabindex="-1" role="dialog" aria-labelledby="eventCreateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span></button>
                <h4 class="modal-title">이벤트 수정</h4>
            </div>
            <div class="modal-body">
                <div id="modiEventDiv">
                    <input type="hidden" id="moeventno" value="">
                    <label for="eventName">이름</label><input type="text" class="form-control" id="moeventName" placeholder="이벤트 이름을 입력하세요">
                    <input type="text" class="form-control" id="moorder" placeholder="순서" readonly="readonly" style="align:center"><br>
                    <button type="button" id="mosearch" class="btn btn-info btn-xs" style="float : right; margin-right: 10px; margin-top: 5px;">검색</button><br>
                    <label for="eventinfo">설명</label><textarea class="form-control" id="moeventinfo" rows="3" placeholder="이벤트 설명을 입력하세요."></textarea>
                    <label for="imgInput">이미지</label>
                    <input type="file" id="moimgInput"><br>
                    <div class="fileDrop"><h5 align="center";>마우스로 파일을 끌어오세요.</h5></div>    
                    <ul class="mailbox-attachments clearfix uploadedList" style="display:inline"></ul>
                    
                    <label for="videoInput">동영상</label><br>
                    	Youtube Search <input type="text" id="mquery"><button type="button" id="msearch"  class="btn btn-info btn-xs" style="float : right; margin-right: 10px; margin-top: 5px;">Search</button>
                    <ul id="myoutubeList"></ul>
                    <label for="camera">카메라</label><input type="checkbox" id="mocamera" checked data-toggle="toggle" data-size="mini" style="margin-right : 270px;"><br>

                    <input type="checkbox" id="moqCheck" value="option1"><span style="margin-right:270px;">Question</span><br>
                </div>
                <div id="moquestionDiv">
                    <hr>
                    <h4 class="modal-title">QUESTION</h4>

                    <label for="type">문제 유형</label>
                    <select class="form-control" id="moqType">
                        <option value="ox">O/X</option>
                        <option value="multiple">객관식</option>
                    </select><br>

                    <label for="qTitle">문제</label>
                    <input type="hidden" id="qno">
                    <textarea class="form-control" id="moquestionTitle" placeholder="문제를 입력하세요."></textarea><br>
                    <div id="moselectBox">
                        <label for="s1">1번 선택지</label><input type="text" class="form-control" id="mos1" placeholder="1번 보기를 입력하세요."><br>
                        <label for="s2">2번 선택지</label><input type="text" class="form-control" id="mos2" placeholder="2번 보기를 입력하세요."><br>
                        <label for="s3">3번 선택지</label><input type="text" class="form-control" id="mos3" placeholder="3번 보기를 입력하세요."><br>
                        <label for="s4">4번 선택지</label><input type="text" class="form-control" id="mos4" placeholder="4번 보기를 입력하세요."><br>

                        <div id="momultipleAnswer" class="checkbox">
                            <label><input type="checkbox" name="optionsRadios" id="momultipleAnswer1" value="1">1</label>
                            <label><input type="checkbox" name="optionsRadios" id="momultipleAnswer2" value="2">2</label>
                            <label><input type="checkbox" name="optionsRadios" id="momultipleAnswer3" value="3">3</label>
                            <label><input type="checkbox" name="optionsRadios" id="momultipleAnswer4" value="4">4</label>
                        </div>
                    </div>
                    <div id="mooxAnswerbox" class="radio">
                        <label><input type="radio" name="optionsRadios" id="mooxAnswer1" value="o" checked> O </label>
                        <label><input type="radio" name="optionsRadios" id="mooxAnswer2" value="x" checked> X </label>
                    </div>

                </div>
            </div>

            <div class="modal-footer">
                <button type="button" id="modifyEventBtn" class="btn btn-create">수정하기</button>
                <button type="button" id="mocancleEventBtn" class="btn btn-default" data-dismiss="modal">취소</button>
            </div>

        </div>
    </div>
</div>

<!-- END 수정모달  -->


<div id="list">
   	루트 이름 : <input type="text" id="Rname" placeholder="">
    <hr>
        <ul id="sortable">
        </ul>
    <div id="listBottom">
        <button type="button" id="commitList" class= "btn btn-default" >완료</button>
    </div>
</div>

<!-- 모달(루트 등록 완료)-->
<div class="modal fade" id="finishModal" tabindex="-1" role="dialog" aria-labelledby="finishModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" >
            <div class="modal-header">
            </div>
            <div class="modal-body">
                <h4 class="modal-title" id="routeFinish"></h4>
            </div>
            <div class="modal-footer">
                <button type="button" id="okBtn" class="btn btn-default">OK</button>
            </div>
        </div>
    </div>
</div>

<span class="blink_me">${routename}</span>


<!-- Youtube검색하기 위함 -->
<script src="/js/auth.js"></script>
<script src="/js/search.js"></script>
<script src="https://apis.google.com/js/client.js?onload=googleApiClientReady"></script>

<script>
    var markers = null;
    
    var maplat = ${lat};
    var maplng = ${lng};
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                  center: new daum.maps.LatLng(maplat, maplng),
                level: 2 // 지도의 확대 레벨
            };
    var map = new daum.maps.Map(mapContainer, mapOption);

 
    var routeno = ${routeno};
    var eventLi="";
    var routename = ${routename};
    var eventno = 1;
    
    // 1월 27일 9시11시에 은혜가 추가한 변수
    
    var youtubeId = "";
    var events = [];
    
   	
   	
	// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
	var linePath = [];	
	
    //Daum Map marker와 관련된 것들.
    
     // 마커 이미지 생성성
        var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
        var imageSize = new daum.maps.Size(24, 35);

        var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
        
	//{font-family:'Nanum Gothic', sans-serif;}
    function addMarker(event){
    	
    	linePath.push(new daum.maps.LatLng(event.lat,event.lng));
		console.log(event.eorder);
    	if(event.eorder=='1'){
			markerImage = new daum.maps.MarkerImage("/img/start-marker.png",new daum.maps.Size(48, 48));
		}else if(event.eorder==(eventno-1)){
			markerImage = new daum.maps.MarkerImage("/img/finish-marker.png",new daum.maps.Size(40, 40));
		}else{
			markerImage = new daum.maps.MarkerImage(imageSrc, new daum.maps.Size(24, 35));
		}
        
			var marker = new daum.maps.Marker({
            title: '<div class="title">' + event.title+'<font class="text"> [' + event.eventno +']</div> <br>'+event.content + '</font><br><br>',
            position: new daum.maps.LatLng(event.lat,event.lng),
            image:markerImage
        });

        marker.setMap(map);
        markers.push(marker);

        daum.maps.event.addListener(marker, 'mouseover', function () {
            // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
            showInfo(marker);
        });


        daum.maps.event.addListener(marker, 'click', function(event) {
            // 마커 위에 인포윈도우를 표시합니다
            var position = marker.getPosition();
           /*  var roadviewClient = new daum.maps.RoadviewClient();

            var panoId = roadviewClient.getNearestPanoId(position, 50, function(panoId) {
                roadview.setPanoId(panoId, position);
            });

            roadview.setPanoId(panoId, position); */
        });
    	
    }
    
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



    $("#Rname").val(routename);	
    
    (function blink() {
        $('.blink_me').fadeOut(500).fadeIn(500, blink);
    })();


/*     <!-- 이벤트 리스트 불러오기--> */
	var polyline = new daum.maps.Polyline({
   	    path: linePath, // 선을 구성하는 좌표배열 입니다
   	    strokeWeight: 5, // 선의 두께 입니다
   	    strokeColor: '#FFAE00', // 선의 색깔입니다
   	    strokeOpacity: 0.5, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
   	    strokeStyle: 'solid' // 선의 스타일입니다
   	});

    function getEventList(callback){
    	console.log("getEventList가 호출되어 시작됨.");
		eventno=1;
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
		
		linePath = [];	
		
	   
		
        $.getJSON("http://14.32.66.127:4000/event/elist?routeno="+routeno,function(data){
            var list = $(data);
            eventLi="";
			list.each(function(){
                eventno++;
			});

			list.each(function(idx,value){
                var event= this;
                addList(idx,event);
                addMarker(event);
                
                var title = event.title;
                var key = idx;
                var numname = new Array(); 
                
                console.log("key:"+key+"title:"+title);
               
                  console.log(numname.toString());    
            });
            
            console.log(numname.toString());    
            
        	// 지도에 표시할 선을 생성합니다
        	polyline = new daum.maps.Polyline({
        	    strokeWeight: 5, // 선의 두께 입니다
        	    strokeColor: '#FFAE00', // 선의 색깔입니다
        	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        	    strokeStyle: 'solid' // 선의 스타일입니다
        	});
        	
        	polyline.setMap(map);
        	console.log(linePath);
        	
        });
            callback();

    }
    
    	
    getEventList(function(){
    	console.log("getEventList의 콜백에 들어옴.");
    	
    	// 지도에 표시할 선을 생성합니다
    polyline = new daum.maps.Polyline({
   	    path: linePath, // 선을 구성하는 좌표배열 입니다
   	    strokeWeight: 5, // 선의 두께 입니다
   	    strokeColor: '#FFAE00', // 선의 색깔입니다
   	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
   	    strokeStyle: 'solid' // 선의 스타일입니다
   	});

    	polyline.setMap(map);
    	console.log(linePath);
    	
    });


/*     <!-- 이벤트 리스트 - 리스트 추가 --> */
    function addList(idx,event){
        eventLi+="<li class='ui-state-default'><div class='ui-state-default sortable-number'>"+idx+"</div>"+event.title+"<div class='gly'><span class='glyphicon glyphicon-pencil' id='modi' value='"+event.eventno+"'></span><span class='glyphicon glyphicon-remove' id='del'  value='"+event.eventno+"'></div></span></li>";
        
        
        /* eventLi+="<li class='ui-state-default'><span class='ui-icon ui-icon-arrowthick-2-n-s'></span><div id='eventTitle'>" +event.title+ "</div><div class='gly'><span class='glyphicon glyphicon-pencil' id='modi' value='"+event.eventno+"'></span><span class='glyphicon glyphicon-remove' id='del'  value='"+event.eventno+"'></span></div></li>"; */
        $("#sortable").html(eventLi);
        
        
       /* 
        var title = event.title;
        var key = idx;
        console.log("key:"+key+"title:"+title);
        
        
        numname.put = function(key, title) {
            var key = numname.getKey(key);
            numname.value[key] = title;
          };
          
          console.log("map:"+map); */
    }
    


	    $(function() {
	        $( "#sortable" ).sortable({
	        	placeholder: "ui-state-highlight",
	            helper: 'clone',
	           /*  sort: function(e, ui) {
	                $(ui.placeholder).html(Number($("#sortable > li:visible").index(ui.placeholder)) + 1);
	            }, */
	            update: function(event, ui) {
	                var $lis = $(this).children('li');
	                $lis.each(function() {
	                    var $li = $(this);
	                    var newVal = $(this).index();
	                    $(this).children('.sortable-number').html(newVal);
	                   // $(this).children('#item_display_order').val(newVal);
	                });
	            }   	
	        }); //드래그 드롭으로 위치 변경
	       $( "#sortable" ).disableSelection();
	        console.log()
	    });

    //이벤트 리스트 삭제버튼
    $("#sortable").on("click","#del",function(event){
        var select = $(this);
        removeQuestion(select.attr("value"));
        removeEvent(select.attr("value"),function(){
        });


        alert(select.attr("value")+"삭제되었습니다.");
    });

    //이벤트 리스트 수정 버튼
    $("#sortable").on("click","#modi",function(event){
        var select = $(this);

        viewEvent(select.attr("value"));
        clearEventDiv();
        clearMoEventdiv();
        clearQuestionDiv();

        $("#modiModal").modal('show');

    });


  /*   <!-- 이벤트 생성 버튼 클릭--> */
	
    var attach = new Array();
	var attach2;
	var qJson;
	
    $("#createEventBtn").on("click",function(){
        var eorder = $("#order").val();
        var title = $("#eventName").val();
        var content = $("#eventinfo").val();
        camera = $("#camera").val();
        attach2 = attach.join();

        if(title=="" || content==""){
            alert("이벤트 이름과 설명을 입력해주세요!");
            return;
        }

        createEvent(routeno, eorder, title, content, attach2, lat, lng, camera,youtubeId, function(){
            console.log("attach2:" + attach2);
            clearEventDiv();
        	attach = [];
        	eventno++;
        	
        	//은혜추가.
        	youtubeId ="";

        });

        $("#eventModal").modal('hide');
        clearEventDiv();
        clearMoEventdiv();
       
    });

    function makeQuestion(data){
        var qfilter = new Array();
        qfilter[0]="eventno";
        qfilter[1]="question";
        qfilter[2]="answer";
        qfilter[3]="point";
        qfilter[4]="qtype";
        qfilter[5]="choice1";
        qfilter[6]="choice2";
        qfilter[7]="choice3";
        qfilter[8]="choice4";

        var qObject = new Object();

        qObject.eventno = data;
        qObject.question = $("#questionTitle").val();
        qObject.point = 500;
        qObject.qtype = $("#qType").val();
        qObject.choice1 = $("#s1").val();
        qObject.choice2 = $("#s2").val();
        qObject.choice3 = $("#s3").val();
        qObject.choice4 = $("#s4").val();

        for(var i=1;i<5;i++) {

            var id = "#multipleAnswer";
            var multi = id+i;
            var oxid ="#oxAnswer";
            var ox =oxid+i;

            if ($(multi).is(":checked")) {
                qObject.answer = $(multi).val();
            }

            if($(ox).is(":checked")){
                qObject.answer = $(ox).val();
            }
        }

        qJson = JSON.stringify(qObject,qfilter,"\t");

        //console.log(qJson)

    }
    
    function createQuestion(qJson){

        console.log("문제 생성 :"+qJson);

        $.ajax({
            type:"post",
            url:"http://14.32.66.127:4000/question/register",
            headers:{
                "Content-Type":"application/json"
            },
            datatype : "json",
            data: qJson,
            success:function(data){
                console.log("data:"+data);
            }
        });


    }

    /*     <!-- 이벤트 생성 기능 --> */
    function createEvent(routeno,eorder,title,content,attach2,lat,lng,camera,youtubeId,callback){
    	
        console.log(routeno,eorder,title,content,attach2,lat,lng,camera,youtubeId);

        $.ajax({
            type:'post',
            url:"http://14.32.66.127:4000/event/attachCreate",
            headers: {
                "Content-Type":"application/json"},
            datatype: "json",
            data:JSON.stringify({routeno:routeno, eorder:eorder,title:title,content:content,efiles:attach2,lat:lat,lng:lng,camera:camera,youtube:youtubeId}),
            success: function(data){
        		polyline.setMap(null);
                console.log("<이벤트 생성!> eventno 가져옴:"+data);
          		
                getEventList(function(){
                    console.log("이벤트 완료 _이벤트 리스트 가져옴");
                });
                
                makeQuestion(data);

                var json = JSON.parse(qJson);
                console.log("question : "+json.question);

                if(!json.question){
                    console.log("이벤트 생성중 - 문제없음.");
                }
                else{
                    console.log("이벤트 생성중 - 문제있음.")
                    createQuestion(qJson);
                }

            }
        });
        callback();
    };

 

/*     <!-- 이벤트 생성 창 비우기 기능--> */
    function clearEventDiv(){
        $("#eventName").val("");
        $("#eventinfo").val("");
        $(".uploadedList").html("");
        $("#qCheck").attr('checked', false) ;
        $("#questionDiv").hide();
        $("#camera").val(false);
        $("#camera").parent().attr("class","toggle btn btn-xs btn-default off"); //기본값 설정 - 카메라 없음
        attach=[];
    }
    
    //이벤트 생성- 문제 창 비우기 기능
    function clearQuestionDiv(){

        $("#qCheck").attr("checked",false);
        $("#questionTitle").val("");
        $("#qType").val("");
        $("#s1").val("");
        $("#s2").val("");
        $("#s3").val("");
        $("#s4").val("");

        for(var i=1;i<5;i++) {

            var id = "#multipleAnswer";
            var multi = id+i;
            var oxid ="#oxAnswer";
            var ox =oxid+i;

            if ($(multi).is(":checked")) {
                $(multi).attr("checked",false);
            }

            if($(ox).is(":checked")){
                $(ox).attr("checked",false);
            }
        }
    }


  //수정 창 비우기 기능
    function clearMoEventdiv(){

        for(var i=1;i<5;i++){
            var id = "#mos";
            var idi= id + i;
            var answer = "#momultipleAnswer";
            var answeri = answer+i;
            $(idi).val("");
            $(answeri).attr("checked",false);
        }
        
        $("#moquestionTitle").val("");
        $("#moqType").val("");
        $("#mooxAnswer1").attr("checked",false);
        $("#mooxAnswer2").attr("checked",false);
        $("#moqCheck").attr("checked",false);
        $("#mocamera").val(false);
        $("#mocamera").parent().attr("class","toggle btn btn-xs btn-default off"); //기본값 설정 - 카메라 없음
        $("#moquestionDiv").hide();

    }
  


/*     <!-- 이벤트 읽기 기능 --> */
    function viewEvent(eventno){
    	$(".uploadedList").html("");
    	$("#myoutubeList").html("");
    	$("#youtubeList").html("");
    	
	  var template2 = Handlebars.compile($("#template").html());
         
        $.getJSON("http://14.32.66.127:4000/event/view?eventno="+eventno,function(data){

            console.log("이벤트 넘버:"+eventno+"읽어오기");

            var vo = $(data);
            console.log(vo);
            
            $("#moeventName").val(vo.attr("title"));
            $("#moeventinfo").val(vo.attr("content"));
            $("#moorder").val(vo.attr("eorder"));
            $("#moeventno").val(eventno);
            
            var youtubeStr = vo.attr("youtube");
            
            if(youtubeStr){
	            var arrayU = youtubeStr.split("THUMBNAIL");
	            youtubeId = youtubeStr;
	            
	            $("#myoutubeList").html("<li><img src='"+arrayU[1]+"'><small>X</small></li>");
            }
            
            
            console.log("camera 유무:"+vo.attr("camera"));
            $("#mocamera").parent().attr("class","toggle btn btn-xs btn-default off"); //카메라 없으면 
            
            if( vo.attr("camera") == true){
            	console.log("카메라 있음.")
            	$("#mocamera").parent().attr("class","toggle btn btn-xs btn-primary"); //카메라 있으면 
            	$("#mocamera").val(true);
            }
            
        }); //end event view
        
        $.getJSON("http://14.32.66.127:4000/event/getAttach/" + eventno, function(list) {
	   		 console.log("뷰에서 겟제이슨 들어왔다");
	   		 console.log(list);
	   		 var array = list[0].split(',');
	   		 console.log(array);
	   		 
	   		var length = array.length;
	   		
	   		 for(var i = 0; i < length; i++){
	   			 
	   			var name = array[i];
	   			attach.push(name);
	   			  var fileInfo = getFileInfo(name);
	                 var html = template2(fileInfo);
	   			  
	   			  $(".uploadedList").append(html);
	   		 }

   		 });//end getAttach
        
        $.getJSON("http://14.32.66.127:4000/question/view?eventno="+eventno,function(data){

            var vo = $(data);

            var qno = vo.attr("questionno");
            console.log("문제 넘버:"+qno+"읽어오기");
            console.log(vo);
            $("#qno").val(qno);


            if(typeof qno == "undefined"){
                console.log("이벤트 VIEW - 문제 없음.");
                $("#qno").val("no_Question");
                $("#moqCheck").attr("checked",false);
                $("#moquestionDiv").hide();
            }

            else{
                $("#moqCheck").attr("checked",true);
                $("#moquestionDiv").show();
                $("#moquestionTitle").val(vo.attr("question"));
                $("#moqType").val(vo.attr("qtype"));

                if(vo.attr("qtype")=="multiple"){

                    $("#mooxAnswerbox").hide();
                    $("#moselectBox").show();


                    for (var i=1; i<5; i++){
                        var id="#mos";
                        var multi = id+i;
                        var choice="choice";
                        var multi2 = choice+i;
                        $(multi).val(vo.attr(multi2));

                        console.log("answer:"+vo.attr("answer"));

                        if(i==vo.attr("answer")){
                            var answerId = "#momultipleAnswer"+i;
                            $(answerId).attr("checked",true);
                        }
                    }
                } //multiple 일때

                if('o'==vo.attr("answer")){
                    $("#mooxAnswer1").attr("checked",true);
                    $("#moselectBox").hide();
                    $("#mooxAnswerbox").show();
                } //ox중 o일때

                if('x'==vo.attr("answer")){
                    $("#mooxAnswer2").attr("checked",true);
                    $("#moselectBox").hide();
                    $("#mooxAnswerbox").show();
                }


            }//end else

        }); //end question view 
        
        
    }

    /* <!-- 이벤트 삭제 기능 --> */
    function removeEvent(eventno,callback){
        console.log("이벤트 삭제"+eventno);

        $.ajax({
            type:'post',
            url:"http://14.32.66.127:4000/event/remove",
            headers:{
                "Content-Type":"application/json"},
            datatype: "json",
            data:JSON.stringify({eventno:eventno}),
            success:function(data){
        		polyline.setMap(null);
                getEventList();
                console.log("이벤트 삭제 처리 결과 :"+data);
            }
        });
        callback();
    }
    
    //이벤트 문제 삭제 기능
    function removeQuestion(eventno){
        console.log("문제 삭제"+eventno);

        $.ajax({
            type:'post',
            url:"http://14.32.66.127:4000/question/remove",
            headers:{
                "Content-Type":"application/json"
            },
            datatype:"json",
            data:JSON.stringify({eventno:eventno}),
            success:function(data){
                console.log("문제 처리 결과 :"+data);
            }

        });
    }

    
    var modiJson;

    function modiQuestion(eventno){
        var qfilter = new Array();
        qfilter[0]="eventno";
        qfilter[1]="question";
        qfilter[2]="answer";
        qfilter[3]="point";
        qfilter[4]="qtype";
        qfilter[5]="choice1";
        qfilter[6]="choice2";
        qfilter[7]="choice3";
        qfilter[8]="choice4";

        var qObject = new Object();

        qObject.eventno = eventno;
        qObject.question = $("#moquestionTitle").val();
        qObject.point = 500;
        qObject.qtype = $("#moqType").val();
        qObject.choice1 = $("#mos1").val();
        qObject.choice2 = $("#mos2").val();
        qObject.choice3 = $("#mos3").val();
        qObject.choice4 = $("#mos4").val();

        for(var i=1;i<5;i++) {

            var id = "#momultipleAnswer";
            var multi = id+i;
            var oxid ="#mooxAnswer";
            var ox =oxid+i;

            if ($(multi).is(":checked")) {
                qObject.answer = $(multi).val();
            }

            if($(ox).is(":checked")){
                qObject.answer = $(ox).val();
            }
        }

        modiJson = JSON.stringify(qObject,qfilter,"\t");

        //console.log(qJson)

    }
   
    
    /*     <!-- 이벤트 수정 버튼 클릭--> */

    $("#modifyEventBtn").on("click",function(){
        var title = $("#moeventName").val();
        var content = $("#moeventinfo").val();
        var eventno = $("#moeventno").val();
        var eorder = $("#moorder").val();
        var camera = $("#mocamera").val();
        attach2 = attach.join();
        
        console.log(attach2);

        if(title=="" || content==""){
            alert("이벤트 이름과 설명을 입력해주세요!");
            return;
        }

        console.log("eventno:"+eventno);

        modiQuestion(eventno);

        var json = JSON.parse(modiJson);
        console.log("question : "+json.question);

        if(!json.question){
            console.log("<이벤트 수정중> - 문제 NO/NO");
        }
        else if($("#qno").val()== "no_Question"){
            console.log("<이벤트 수정중> - 문제NO/YES");
            createQuestion(modiJson);
        }
        else{
            console.log("<이벤트 수정중> - 문제YES/YES");
            modifyQuestion(modiJson);
        }

        modifyEvent(eventno,eorder,title,content,attach2,camera,youtubeId,function(){
        	 //clearEventDiv();
             //attach = [];
        });
        
        $("#modiModal").modal('hide');
        clearMoEventdiv();


    });


    /* <!-- 이벤트 수정 기능 --> */
    function modifyEvent(eventno,eorder,title,content,attach2,camera,youtubeId,callback){

        console.log("이벤트 수정"+eventno);

        $.ajax({
            type:'post',
            url:"http://14.32.66.127:4000/event/attachModify",
            headers:{
                "Content-Type" :"application/json"	},
            datatype : "json",
            data: JSON.stringify({eventno:eventno,eorder:eorder,title:title,content:content,efiles:attach2,camera:camera,youtube:youtubeId}),
            success: function(data){
        		polyline.setMap(null);
                getEventList();
                console.log("이벤트 수정 결과 :"+data);
            }
        });
        callback();
    }

  //문제 수정 기능
    function modifyQuestion(modiJson){
        console.log("문제 수정 시도!")
        console.log(modiJson);

        $.ajax({
            type:'post',
            url:"http://14.32.66.127:4000/question/modify",
            headers:{
                "Content-Type" :"application/json"	},
            datatype : "json",
            data: modiJson,
            success: function(data){
                console.log("문제 수정 처리 결과 :"+data);
            }
        });

    }
    

 /*    <!--map 클릭하면--> */
    daum.maps.event.addListener(map,'click',function(mouseEvent){
        clearEventDiv();
        clearMoEventdiv();
        clearQuestionDiv();
        $("#youtubeList").html("");
        
        lat= mouseEvent.latLng.Ab;
        lng = mouseEvent.latLng.zb;
        $("#order").val(eventno);

        console.log("내가 선택한 위도와 경도 : ",lat,lng);

        $("#eventModal").modal('show');

        $("#cancleEventBtn").on("click",function(){
            console.log("이벤트 생성 취소");

        });
        $("#mocancleEventBtn").on("click",function(){
            console.log("이벤트 수정 취소");

        });

    });
/*     <!-- 이벤트 생성 모달(세부사항)--> */

    $("#search").on("click",function(){
        console.log("문화재 api를 이용해 검색하였습니다.");
    });


    $("#camera").change("toggle",function(){
    	if(this.checked==true){
            console.log("카메라 ON");
            $("#camera").val(true);
        }else{
            console.log("카메라 OFF");
            $("#camera").val(false);
        }
    });


    $("#qCheck").on("click",function(){
        if(this.checked==true){
            $("#questionDiv").show();
        }else{
            $("#questionDiv").hide();
        }
    });


    $("#qType").on("change",function(){
        if(this.value=="multiple"){
            $("#oxAnswerbox").hide();
            $("#selectBox").show();
        }else{
            $("#selectBox").hide();
            $("#oxAnswerbox").show();

        }
    });

/*     <!-- END 이벤트 생성 모달-->

    <!-- 수정모달(세부사항) --> */

    $("#mosearch").on("click",function(){
        console.log("문화재 api를 이용해 검색하였습니다.");
    });


    $("#mocamera").change("toggle",function(){
        if(this.checked==true){
            $("#mocamera").val(true);
            console.log("카메라 ON");
        }else{
            $("#mocamera").val(false);
            console.log("카메라 OFF");
        }

    });

    $("#moqCheck").on("click",function(){
        if(this.checked==true){
            $("#moquestionDiv").show();
        }else{
            $("#moquestionDiv").hide();
        }
    });


    $("#moqType").on("change",function(){
        if(this.value=="multiple"){
            $("#mooxAnswerbox").hide();
            $("#moselectBox").show();
            //$("#multipleAnswerBox").show();

        }else{
            $("#moselectBox").hide();
            //$("#multipleAnswerBox").hide();
            $("#mooxAnswerbox").show();

        }
    });

    /* <!-------------------------------------------- END 수정모달 세부사항 -------------------------------------------------- ->*/
   /*  <!-- 이벤트 리스트 완료 클릭--> */
   
    // 이벤트 리스트 완료 클릭
    $("#commitList").on("click",function(){
        $("#finishModal").modal('show');

        var modiRoutename = $("#Rname").val();
        var routemsg = routename + " 루트 등록이 완료되었습니다";

        console.log(modiRoutename, routename,routeno);

        if( modiRoutename != routename){
        	 console.log("루트 이름 수정 완료!"+modiRoutename);
             modifyName(routeno,modiRoutename);
             routemsg = modiRoutename+ " 루트 등록이 완료되었습니다";
        }

        $("#routeFinish").html(routemsg);


    });

    //루트 이름 수정

    function modifyName(routeno,modiRoutename){

        $.ajax({
            type:'post',
            url:"http://14.32.66.127:4000/route/modify",
            headers:{
                "Content-Type":"application/json"},
            datatype:"json",
            data:JSON.stringify({routeno:routeno,routename:modiRoutename}),
            success: function(data){
                console.log("data:"+data);
            }
        });

    }

    $("#okBtn").on("click",function(){
        $("#finishModal").modal('hide');
        self.location = "/admin/login_success";
    });

</script>

<script id="template" type="text/x-handlebars-template">
    <li>
<div class='img'>
<img src="{{imgsrc}}"/>
<small data-src="{{fullName}}"><div class='x'>X</div></small><input type='hidden' name='files' value="{{fileName}}">
</div>
    </li>
</script>


<!-- -----파일첨부기능-------  -->
<script>
    var template = Handlebars.compile($("#template").html());

    $(".fileDrop").on("dragenter dragover", function(event){
        event.preventDefault();
    });
    
    $(".fileDrop").on("drop", function(event){
        event.preventDefault();

        var files = event.originalEvent.dataTransfer.files;
        console.log(files);
        var num = files.length;

		
		for(var i = 0 ; i < num; i++){
	        var file = files[i];
	        var filename = file.name;
	        
	        var filetypeArr = filename.split('.');
	        var arrNum = filetypeArr.length;
	        console.log(arrNum);
	        console.log(filetypeArr[arrNum-1]);
	        
	        var formData = new FormData();

	        formData.append("file", file);
	        formData.append("routeno",routeno);
	        
	        if(filetypeArr[arrNum-1]=="jpg" || filetypeArr[arrNum-1]=="gif" || filetypeArr[arrNum-1]=="bmp" || filetypeArr[arrNum-1]=="png"){
	       		
	        	uploadImg(formData,'http://14.32.66.127:4000/uploadAjax');	        
	       		
	        }else if(filetypeArr[arrNum-1] == "avi" || filetypeArr[arrNum-1] == "mpeg" || filetypeArr[arrNum-1] == "wmv" || filetypeArr[arrNum-1] == "mp4"){
	        	
	        	uploadImg(formData,'http://14.32.66.127:4000/evenMovieUpload');
	        	
	        }
	        
	        
		}
		
	
		function uploadImg(formData,url){
	        $.ajax({
	            url: url,
	            data: formData,
	            dataType:'text',
	            processData: false,
	            contentType: false,
	            type: 'POST',
	            success: function(data){
	
	                var fileInfo = getFileInfo(data);
	                var html = template(fileInfo);
	
	                var str ="";
	
	                console.log(data);
	                //console.log(checkImageType(data));
	                //console.log("ddddd",$(".uploadedList"));
	
	                //attach.push(checkImageType(data).input.substring(checkImageType(data).input.length-15,checkImageType(data).input.length));
	                attach.push(data);
	                console.log("attach:" + attach);
	                
	                if(checkImageType(data)){
	                    str ="<div class='img'>"
	                            +"<img src='http://14.32.66.127:4000/displayFile?fileName="+data+"'/>"
	                            +"<small data-src='"+data+"'><div class='x'>X</div></small><input type='hidden' name='files' value='"+data+"'>"
	                            +"</div>";
	
	                }else{
	                    str = "<div class='img'>"
	                            +"<a href='http://14.32.66.127:4000/displayFile?fileName="+data+"'>"+ getOriginalName(data)+"</a>"
	                            +"<small data-src='"+data+"'><div class='x'>X</div></small><input type='hidden' name='files' value='"+data+"'>"
	                            +"</div>";
	                }
	                $(".uploadedList").append(str);
	
	            }
	        });
		}
	
        
	
    });

    $(".uploadedList").on("click", "small", function(event){

        var that = $(this);
        console.log("delete click");
        
        var index = $.inArray($(this).attr("data-src"), attach);
        attach.splice(index, 1);
        console.log("삭제 한 뒤의 어테치 : "+attach);

        
        $.ajax({
            url:"http://14.32.66.127:4000/sboard/deleteFile",
            type:"post",
            data: {fileName:$(this).attr("data-src")},
            dataType:"text",
            success:function(result){
                if(result == 'deleted'){
                    that.parent("div").remove();
                }
            }
        });
                
    });


    $("#registerForm").submit(function(event){
        event.preventDefault();

        var that = $(this);

        var str ="";
        $(".uploadedList .delbtn").each(function(index){
            str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
        });

        that.append(str);
		console.log("str값은?????:" + str); 
        //that.get(0).submit();
    });


    function getOriginalName(fileName){

        if(checkImageType(fileName)){
            return;
        }
        var idx = fileName.indexOf("_") + 1 ;
        return fileName.substr(idx);

    }


    function getImageLink(fileName){

        if(!checkImageType(fileName)){
            return;
        }
        var front = fileName.substr(0,12);
        var end = fileName.substr(14);

        return front + end;

    }

    function checkImageType(fileName){
        var pattern = /jpg|gif|png|jpeg/i;
        return fileName.match(pattern);

    }


    /*유투브 검색 */
       $("#youtubeSearch").on("click",function(event){
       	event.preventDefault();
       	$("#searchDiv").show();
       	
       	  console.log('Search Started');
       	  var apiKey = 'AIzaSyARCn5THIU3dV2UZFgO9c8UMIIiVfISFgE';
       	  var q = $('#query').val();
       	console.log(q);

       	  gapi.client.setApiKey(apiKey);
       	  gapi.client.load('youtube', 'v3', function() {
       	    isLoad = true;
       	  });
       	  console.log('Search Request');

       	  request = gapi.client.youtube.search.list({
       	    q: q,
       	    part: 'id, snippet',
       	    type: 'video',
       	    maxResults:20
       	  });


       	  request.execute(function(response) {
       	    var str = JSON.stringify(response.result);
       	    var movie = $(response.result.items);
       	    console.log(movie);
       	    
   	    	var result = "<table>";
       	    
       	    movie.each(function(index){
   	    	    result += "<tr><td><img data-src='"+this.id.videoId+"' src='"+this.snippet.thumbnails.default.url+"'><br>"+this.snippet.title+"</td></tr>";
       	    });
       	    result += "</table>";
       	    $('#search-container').html(result);
       	  });
       	  
       	  $('#query').val("");
       });
       
       
       
       // 유투브 수정!!
       
         $("#msearch").on("click",function(event){
       	  
       	  console.log("왜 안눌려.");
       	event.preventDefault();
       	$("#searchDiv").show();
       	
       	  console.log('Search Started');
       	  var apiKey = 'AIzaSyARCn5THIU3dV2UZFgO9c8UMIIiVfISFgE';
       	  var q = $('#mquery').val();
       	console.log(q);

       	  gapi.client.setApiKey(apiKey);
       	  gapi.client.load('youtube', 'v3', function() {
       	    isLoad = true;
       	  });
       	  console.log('Search Request');

       	  request = gapi.client.youtube.search.list({
       	    q: q,
       	    part: 'id, snippet',
       	    type: 'video',
       	    maxResults:20
       	  });


       	  request.execute(function(response) {
       	    var str = JSON.stringify(response.result);
       	    var movie = $(response.result.items);
       	    console.log(movie);
       	    
   	    	var result = "<table>";
       	    
       	    movie.each(function(index){
   	    	    result += "<tr><td><img data-src='"+this.id.videoId+"' src='"+this.snippet.thumbnails.default.url+"'><br>"+this.snippet.title+"</td></tr>";
       	    });
       	    result += "</table>";
       	    $('#search-container').html(result);
       	  });
       	  
       	  $('#mquery').val("");
       });
       
       $("#search-container").on('click','img',function(event){
       	youtubeId = $(this).attr("data-src");
       	var thumbnail = $(this).attr("src");
       	
       	console.log("가져온 유투브 아이디 : ",youtubeId);
       	console.log("가져온 유투브 썸네일 주소 : ",thumbnail);
       	youtubeId+="THUMBNAIL"+thumbnail;
       	
       	console.log("결과적인 youtubeId값 : ", youtubeId);
       	
       	var array = youtubeId.split("THUMBNAIL");
       	console.log(array);
       	$("#searchDiv").hide();
       	

           $("#youtubeList").html("<li><img src='"+thumbnail+"'><small>X</small></li>");
           $("#myoutubeList").html("<li><img src='"+thumbnail+"'><small>X</small></li>");
           
       });
       
       $("#yClose").on("click",function(){
       	$("#searchDiv").hide();
       });
       
</script>
<!-------- 파일첨부기능 끝 -------->


</body>
</html>