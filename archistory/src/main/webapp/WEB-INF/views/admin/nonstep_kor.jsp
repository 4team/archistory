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
    <title>= Archistory(ADMIN) = NonStepMode - Create </title>
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
<!-- 첨부파일 용도 -->
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


<!--  이벤트 생성 모달 (문제 생성) -->
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

                        <label for="eventName">이름</label><input type="text" class="form-control" id="eventName" placeholder="이벤트 이름을 입력하세요">
                        <button type="button" id="search" class="btn btn-info btn-xs" style="float : right; margin-right: 10px; margin-top: 5px;">검색</button><br>
                        <label for="eventinfo">설명</label><textarea class="form-control" id="eventinfo" rows="3" placeholder="이벤트 설명을 입력하세요."></textarea>
                        <label for="imgInput">이미지</label><input type="file" id="imgInput">
                        <div class="fileDrop"><h5 align="center">마우스로 파일을 끌어오세요.</h5></div>
                        <ul class="mailbox-attachments clearfix uploadedList" style="display:inline"></ul>

                        <!--                        <label for="videoInput">동영상</label>
                                                <input type="file" id="videoInput">
                                                <div class="fileDrop"><h5 align="center";>여기에 동영상을 끌어오세요</h5></div>-->
                        <label for="camera">카메라</label><input type="checkbox" id="camera" checked data-toggle="toggle" data-size="mini" style="margin-right : 270px;"><br>

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
                    <button type="button" id="createEventBtn" class="btn btn-create">만들기</button>
                    <button type="button" id="cancleEventBtn" class="btn btn-default" data-dismiss="modal">취소</button>
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
                    <button type="button" id="mosearch" class="btn btn-info btn-xs" style="float : right; margin-right: 10px; margin-top: 5px;">검색</button><br>
                    <label for="eventinfo">설명</label><textarea class="form-control" id="moeventinfo" rows="3" placeholder="이벤트 설명을 입력하세요."></textarea>
                    <label for="imgInput">이미지</label><input type="file" id="moimgInput"><br>
                    <div class="fileDrop"><h5 align="center">마우스로 파일을 끌어오세요.</h5></div>
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
                        <option value="ox">O/X</option>
                        <option value="multiple">객관식</option>
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
    루트 이름 :<input type="text" id="Rname" placeholder="">
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

    var maplat = ${lat};
    var maplng = ${lng};
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new daum.maps.LatLng(maplat, maplng), // 지도의 중심좌표
                //center: new daum.maps.LatLng(37.8861692, 127.7393315),
                level: 2 // 지도의 확대 레벨
            };
    var map = new daum.maps.Map(mapContainer, mapOption);

    //var lat= 0;
    //var lng =0;
    var routeno = ${routeno};
    var eventLi="";
    var routename = ${routename};


    $("#Rname").val(routename);


    (function blink() {
        $('.blink_me').fadeOut(500).fadeIn(500, blink);
    })();

    getEventList();


    //이벤트 리스트 불러오기

    function getEventList(){
        $.getJSON("http://14.32.66.127:4000/event/elist?routeno="+routeno,function(data){

            var list = $(data);
            console.log(list);
            eventLi="";

            list.each(function(idx,value){
                var event= this;
                addList(event);
            });
        });

    }
    //이벤트 리스트 - 리스트 추가
    function addList(event){

        eventLi+="<li>" +event.title+ "<div class='gly'><span class='glyphicon glyphicon-pencil' id='modi' value='"+event.eventno+"'></span>" +
                "<span class='glyphicon glyphicon-remove' id='del' value='"+event.eventno+"'></span></div></li>";

        $("#eventList").html(eventLi);


    }

    //이벤트 리스트 삭제버튼
    $("#eventList").on("click","#del",function(event){
        var select = $(this);
        removeEvent(select.attr("value"),function(){
        });
        alert(select.attr("value")+"삭제되었습니다.");
    });

    //이벤트 리스트 수정 버튼
    $("#eventList").on("click","#modi",function(event){
        var select = $(this);
        viewEvent(select.attr("value"));
        clearEventDiv();
        $("#modiModal").modal('show');

    });


    // 이벤트 생성 버튼 클릭
    var attach = new Array();
    var attach2;
    var qJson;

    $("#createEventBtn").on("click",function(){

        var title = $("#eventName").val();
        var content = $("#eventinfo").val();
        attach2 = attach.join();

        if(title=="" || content==""){
            alert("이벤트 이름과 설명을 입력해주세요!");
            return;
        }

        createEvent(routeno, title, content, attach2, lat, lng,  function () {
            console.log("attach2:" + attach2);
            clearEventDiv();
            attach = [];
        });

        $("#eventModal").modal('hide');

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

    function clearQuestionDiv(){

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



    //이벤트 생성 기능
    function createEvent(routeno,title,content,attach2,lat,lng,callback){


        console.log("이벤트 생성:",routeno,title,content,attach2,lat,lng);

        $.ajax({
            type:'post',
            url:"http://14.32.66.127:4000/event/attachCreate",
            headers: {
                "Content-Type":"application/json"},
            datatype: "json",
            data:JSON.stringify({routeno:routeno,title:title,content:content,efiles:attach2,lat:lat,lng:lng}),
            success: function(data){
                getEventList();
                console.log("eventno:"+data);
                makeQuestion(data);

                var json = JSON.parse(qJson);
                console.log("question : "+json.question);
                if(!json.question){
                    console.log("문제없음.");
                }
                else{
                    console.log("문제있음.")
                    createQuestion(qJson);
                }
            }
        });
        callback();
    };

    //이벤트 생성 창 비우기 기능
    function clearEventDiv(){
        $("#eventName").val("");
        $("#eventinfo").val("");
        $(".uploadedList").html("");
       
        $("#qCheck").attr('checked', false) ;
        $("#questionDiv").hide();

        attach=[];
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
    	
    	$("#mooxAnswer1").attr("checked",false);
    	$("#mooxAnswer2").attr("checked",false);

    }



    //이벤트 수정 버튼 클릭

    $("#modifyEventBtn").on("click",function(){
        var title = $("#moeventName").val();
        var content = $("#moeventinfo").val();
        var eventno = $("#moeventno").val();
        attach2 = attach.join();

        console.log(attach2);

        if(title=="" || content==""){
            alert("이벤트 이름과 설명을 입력해주세요!");
            return;
        }

        modifyEvent(eventno,title,content,attach2,lat,lng,function(){
            console.log("attach2:" + attach2);
            clearEventDiv();
            attach = [];
        });
        
        

        
        $("#modiModal").modal('hide');

    });


    //이벤트 읽기 기능
    function viewEvent(eventno){
        $(".uploadedList").html("");
        var template2 = Handlebars.compile($("#template").html());

        $.getJSON("http://14.32.66.127:4000/event/view?eventno="+eventno,function(data){


            console.log("이벤트 넘버:"+eventno+"읽어오기");

            var vo = $(data);
            console.log(vo);

            $("#moeventName").val(vo.attr("title"));
            $("#moeventinfo").val(vo.attr("content"));
            $("#moeventno").val(eventno);
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

        $.getJSON("http://14.32.66.127:4000/question/view?eventno="+eventno,function(data){


            console.log("문제 넘버:"+eventno+"읽어오기");

            var vo = $(data);
            console.log(vo);

            if(!vo){
            	console.log("문제 없음.");
            	$("#moqCheck").attr("checked","false");
            	$("#moquestionDiv").hide();
            	
            }else{
            	$("#moqCheck").attr("checked","true");
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
	                        $(answerId).attr("checked","true");
	                    }
	                }
	            }
	
	            if('o'==vo.attr("answer")){
	                $("#mooxAnswer1").attr("checked","true");
	                $("#moselectBox").hide();
	                $("#mooxAnswerbox").show();
	            }
            }

        });
    }

    //이벤트 삭제 기능
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

    //이벤트 수정 기능
    function modifyEvent(eventno,title,content,attach2,lat,lng,callback){

        console.log("이벤트 수정"+eventno);

        $.ajax({
            type:'post',
            url:"http://14.32.66.127:4000/event/attachModify",
            headers:{
                "Content-Type" :"application/json"	},
            datatype : "json",
            data: JSON.stringify({eventno:eventno,title:title,content:content,efiles:attach2,lat:lat,lng:lng}),
            success: function(data){
                getEventList();
                console.log(data);
            }
        });
        callback();
    }




    // map 클릭하면
    daum.maps.event.addListener(map,'click',function(mouseEvent){
        clearEventDiv();
        clearMoEventdiv();
        clearQuestionDiv();
        lat= mouseEvent.latLng.Ab;
        lng = mouseEvent.latLng.zb;

        console.log("내가 선택한 위도와 경도 : ",lat,lng);

        $("#eventModal").modal('show');

        $("#cancleEventBtn").on("click",function(){
            console.log("이벤트 생성 취소");

        });
        $("#mocancleEventBtn").on("click",function(){
            console.log("이벤트 수정 취소");

        });

    });


    //이벤트 생성 모달(세부사항)

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
        if(this.value=="multiple"){
            $("#oxAnswerbox").hide();
            $("#selectBox").show();
            //$("#multipleAnswerBox").show();

        }else{
            $("#selectBox").hide();
            //$("#multipleAnswerBox").hide();
            $("#oxAnswerbox").show();

        }
    });

    // END 이벤트 생성 모달

    // 수정모달(세부사항)

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

    //END 수정모달 세부사항


    // 이벤트 리스트 완료 클릭
    $("#commitList").on("click",function(){
        $("#finishModal").modal('show');

        var modiRoutename = $("#Rname").val();
        var routemsg = routename + " 루트 등록이 완료되었습니다";

        console.log(modiRoutename, routename,routeno);

        if( modiRoutename != routename){
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
