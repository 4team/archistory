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
                        <input type="file" id="imgInput">
                        <div class="fileDrop"><h5 align="center";>마우스로 파일을 끌어오세요.</h5></div>                        
						<ul class="mailbox-attachments clearfix uploadedList" style="display:inline"></ul>
							
                        <label for="videoInput">동영상</label>
                        <input type="file" id="videoInput">
                        <div class="fileDrop"><h5 align="center";>여기에 동영상을 끌어오세요</h5></div>
                        
                        <label for="camera">카메라</label>
                        <input type="checkbox" id="camera" checked data-toggle="toggle" data-size="mini" style="margin-right : 270px;"><br>

                        <input type="checkbox" id="qCheck" value="option1"><span style="margin-right:270px;">Question</span><br>
                     </div>
                        <div id="questionDiv">
                            <hr>
                            <h4 class="modal-title">QUESTION</h4>

                            <label for="type">문제 유형</label>
                            <select class="form-control" id="qType">
                                <option>O/X</option>
                                <option>객관식</option>
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
                    
                    <!--<label for="videoInput">동영상</label><input type="file" id="movideoInput"><br>-->
                    <label for="camera">카메라</label><input type="checkbox" id="mocamera" checked data-toggle="toggle" data-size="mini" style="margin-right : 270px;"><br>

                    <input type="checkbox" id="moqCheck" value="option1"><span style="margin-right:270px;">Question</span><br>
                </div>
                <div id="moquestionDiv">
                    <hr>
                    <h4 class="modal-title">QUESTION</h4>

                    <label for="type">문제 유형</label>
                    <select class="form-control" id="moqType">
                        <option>O/X</option>
                        <option>객관식</option>
                    </select><br>

                    <label for="qTitle">문제</label>
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
   	루트 이름 : <input type="text" id="Rname">
    <hr>
    <div id="eventList">
        <ul>
        </ul>
    </div>
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

<script>
    var markers = [];
    
    var maplat = ${lat};
    var maplng = ${lng};
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                  center: new daum.maps.LatLng(maplat, maplng),
                level: 2 // 지도의 확대 레벨
            };
    var map = new daum.maps.Map(mapContainer, mapOption);

    //var lat= 0;
    //var lng =0;
    var routeno = ${routeno};
    var eventLi="";
    var routename = ${routename};
    var eventno = 1;
    
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


        daum.maps.event.addListener(marker, 'click', function(event) {
            // 마커 위에 인포윈도우를 표시합니다
            var position = marker.getPosition();
            var roadviewClient = new daum.maps.RoadviewClient();

            var panoId = roadviewClient.getNearestPanoId(position, 50, function(panoId) {
                roadview.setPanoId(panoId, position);
            });

            roadview.setPanoId(panoId, position);
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

    function getEventList(callback){
    	console.log("getEventList가 호출되어 시작됨.");
		eventno=1;
		
        $.getJSON("http://14.32.66.127:4000/event/elist?routeno="+routeno,function(data){
            var list = $(data);
            eventLi="";

            list.each(function(idx,value){
                var event= this;
                addList(event);
                addMarker(event);
                eventno++;
                console.log("ORDER : ",eventno);
            });
            callback();
        });
       

    }
    
    
    
    getEventList(function(){
    	console.log("getEventList의 콜백에 들어옴.");
    	
    	// 지도에 표시할 선을 생성합니다
    	var polyline = new daum.maps.Polyline({
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
    function addList(event){
        eventLi+="<li>" +event.title+ "<div class='gly'><span class='glyphicon glyphicon-pencil' id='modi' value='"+event.eventno+"'></span>" +
                "<span class='glyphicon glyphicon-remove' id='del'  value='"+event.eventno+"'></span></div></li>";

        $("#eventList").html(eventLi);

    }


  /*   <!-- 이벤트 리스트 삭제버튼 --> */
    $("#eventList").on("click","#del",function(event){
        var select = $(this);
        removeEvent(select.attr("value"),function(){
        });
        alert(select.attr("value")+"삭제되었습니다.");
    });

/*     <!-- 이벤트 리스트 수정 버튼 --> */
    $("#eventList").on("click","#modi",function(event){
        var select = $(this);
        clearEventDiv();
        viewEvent(select.attr("value"));
        $("#modiModal").modal('show');
    });


  /*   <!-- 이벤트 생성 버튼 클릭--> */
	
    var attach = new Array();
	var attach2;
	
    $("#createEventBtn").on("click",function(){
        var eorder = $("#order").val();
        var title = $("#eventName").val();
        var content = $("#eventinfo").val();
        attach2 = attach.join();

        if(title=="" || content==""){
            alert("이벤트 이름과 설명을 입력해주세요!");
            return;
        }

        createEvent(routeno, eorder, title, content, attach2, lat, lng, function(){
            console.log("attach2:" + attach2);
            clearEventDiv();
        	attach = [];
        	eventno++;
        });

        $("#eventModal").modal('hide');
    });

/*     <!-- 이벤트 수정 버튼 클릭--> */

    $("#modifyEventBtn").on("click",function(){
        var title = $("#moeventName").val();
        var content = $("#moeventinfo").val();
        var eventno = $("#moeventno").val();
        var eorder = $("#moorder").val();
        attach2 = attach.join();
        
        console.log(attach2);
        
        if(title=="" || content==""){
            alert("이벤트 이름과 설명을 입력해주세요!");
            return;
        }

        modifyEvent(eventno,eorder,title,content,attach2,lat,lng,function(){

        });

        $("#modiModal").modal('hide');

    });


/*     <!-- 이벤트 생성 기능 --> */
    function createEvent(routeno,eorder,title,content,attach2,lat,lng,callback){
    	
        console.log(routeno,eorder,title,content,attach2,lat,lng);

        $.ajax({
            type:'post',
            url:"http://14.32.66.127:4000/event/attachCreate",
            headers: {
                "Content-Type":"application/json"},
            datatype: "json",
            data:JSON.stringify({routeno:routeno, eorder:eorder,title:title,content:content,efiles:attach2,lat:lat,lng:lng}),
            success: function(data){
                getEventList();
                console.log("data:"+data);
            }
        });
        callback();
    };


/*     <!-- 이벤트 생성 창 비우기 기능--> */
    function clearEventDiv(){
        $("#eventName").val("");
        $("#eventinfo").val("");
        $(".uploadedList").html("");
        attach=[];
    }

/*     <!-- 이벤트 읽기 기능 --> */
    function viewEvent(eventno){
    	$(".uploadedList").html("");
	  var template2 = Handlebars.compile($("#template").html());
         
        $.getJSON("http://14.32.66.127:4000/event/view?eventno="+eventno,function(data){

            console.log("이벤트 넘버:"+eventno+"읽어오기");

            var vo = $(data);
			
            $("#moeventName").val(vo.attr("title"));
            $("#moeventinfo").val(vo.attr("content"));
            $("#moorder").val(vo.attr("eorder"));
        });
        
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

    });
        
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
                getEventList();
                console.log("data:"+data);
            }

        });
        callback();

    }

    /* <!-- 이벤트 수정 기능 --> */
    function modifyEvent(eventno,eorder,title,content,attach2,lat,lng,callback){

        console.log("이벤트 수정"+eventno);

        $.ajax({
            type:'post',
            url:"http://14.32.66.127:4000/event/attachModify",
            headers:{
                "Content-Type" :"application/json"	},
            datatype : "json",
            data: JSON.stringify({eventno:eventno,eorder:eorder,title:title,content:content,efiles:attach2,lat:lat,lng:lng}),
            success: function(data){
                getEventList();
                console.log(data);
            }
        });
        callback();
    }


 /*    <!--map 클릭하면--> */
    daum.maps.event.addListener(map,'click',function(mouseEvent){
        clearEventDiv();
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
            console.log("카메라 사용함.");
        }else{
            console.log("카메라 사용안함.");
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
        if(this.value=="객관식"){
            $("#oxAnswerbox").hide();
            $("#selectBox").show();
            //$("#multipleAnswerBox").show();

        }else{
            $("#selectBox").hide();
            //$("#multipleAnswerBox").hide();
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
            console.log("카메라 사용함.");
        }else{
            console.log("카메라 사용안함.");
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
        if(this.value=="객관식"){
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
   
    $("#commitList").on("click",function(){
        $("#finishModal").modal('show');

        var routemsg = routename + " 루트 등록이 완료되었습니다";
        $("#routeFinish").html(routemsg);
    });

    $("#okBtn").on("click",function(){
        $("#finishModal").modal('hide');
        self.location = "/admin/login_success";

    });

</script>

<script id="template" type="text/x-handlebars-template">
    <li>
<div class='img'>
<a href="{{getLink}}"><img src="{{imgsrc}}"/></a>
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
	                            +"<a href='http://14.32.66.127:4000/displayFile?fileName="+getImageLink(data)+"'><img src='http://14.32.66.127:4000/displayFile?fileName="+data+"'/></a>"
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
</script>
<!-------- 파일첨부기능 끝 -------->


</body>
</html>