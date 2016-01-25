<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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
<!-- ÷������ �뵵 -->
<script type="text/javascript" src="/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=66fca768fabb8a1e238c3ac76f9c9499"></script>
<!-- on/off toggle �̿��ϱ� ���� -->
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.0/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.0/js/bootstrap-toggle.min.js"></script>


<body>

<div id="map"></div>


<!--  �̺�Ʈ ���� ��� (���� ����) -->
<form role="form" id="registerForm" method="post">
<div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventCreateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">��</span>
                    <span class="sr-only">Close</span></button>
                <h4 class="modal-title">�̺�Ʈ ����</h4>
            </div>
            <div class="modal-body">
                <div id="createEventDiv" >

                    <label for="eventName">�̸�</label><input type="text" class="form-control" id="eventName" placeholder="�̺�Ʈ �̸��� �Է��ϼ���">
                    <button type="button" id="search" class="btn btn-info btn-xs" style="float : right; margin-right: 10px; margin-top: 5px;">�˻�</button><br>
                    <label for="eventinfo">����</label><textarea class="form-control" id="eventinfo" rows="3" placeholder="�̺�Ʈ ������ �Է��ϼ���."></textarea>
                    <label for="imgInput">�̹���</label><input type="file" id="imgInput">
                    <div class="fileDrop"><h5 align="center";>���콺�� ������ ���������.</h5></div>
                    <ul class="mailbox-attachments clearfix uploadedList" style="display:inline"></ul>

                    <!--                        <label for="videoInput">������</label>
                                            <input type="file" id="videoInput">
                                            <div class="fileDrop"><h5 align="center";>���⿡ �������� ���������</h5></div>-->
                    <label for="camera">ī�޶�</label><input type="checkbox" id="camera" checked data-toggle="toggle" data-size="mini" style="margin-right : 270px;"><br>

                    <input type="checkbox" id="qCheck" value="option1"><span style="margin-right:270px;">Question</span><br>
                </div>
                <div id="questionDiv">
                    <hr>
                    <h4 class="modal-title">QUESTION</h4>

                    <label for="type">���� ����</label>
                    <select class="form-control" id="qType">
                        <option>O/X</option>
                        <option>������</option>
                    </select><br>

                    <label for="qTitle">����</label>
                    <textarea class="form-control" id="questionTitle" placeholder="������ �Է��ϼ���."></textarea><br>
                    <div id="selectBox">
                        <label for="s1">1�� ������</label><input type="text" class="form-control" id="s1" placeholder="1�� ���⸦ �Է��ϼ���."><br>
                        <label for="s2">2�� ������</label><input type="text" class="form-control" id="s2" placeholder="2�� ���⸦ �Է��ϼ���."><br>
                        <label for="s3">3�� ������</label><input type="text" class="form-control" id="s3" placeholder="3�� ���⸦ �Է��ϼ���."><br>
                        <label for="s4">4�� ������</label><input type="text" class="form-control" id="s4" placeholder="4�� ���⸦ �Է��ϼ���."><br>

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
                <button type="button" id="createEventBtn" class="btn btn-create">�����</button>
                <button type="button" id="cancleEventBtn" class="btn btn-default" data-dismiss="modal">���</button>
            </div>

        </div>
    </div>
</div>
</form>
<!-- END ���(event �� ���� ����)  -->


<!--  ���� ���  -->
<div class="modal fade" id="modiModal" tabindex="-1" role="dialog" aria-labelledby="eventCreateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">��</span>
                    <span class="sr-only">Close</span></button>
                <h4 class="modal-title">�̺�Ʈ ����</h4>
            </div>
            <div class="modal-body">
                <div id="modiEventDiv">
                    <input type="hidden" id="moeventno" value="">
                    <label for="eventName">�̸�</label><input type="text" class="form-control" id="moeventName" placeholder="�̺�Ʈ �̸��� �Է��ϼ���">
                    <button type="button" id="mosearch" class="btn btn-info btn-xs" style="float : right; margin-right: 10px; margin-top: 5px;">�˻�</button><br>
                    <label for="eventinfo">����</label><textarea class="form-control" id="moeventinfo" rows="3" placeholder="�̺�Ʈ ������ �Է��ϼ���."></textarea>
                    <label for="imgInput">�̹���</label><input type="file" id="moimgInput"><br>
                    <div class="fileDrop"><h5 align="center";>���콺�� ������ ���������.</h5></div>
                    <ul class="mailbox-attachments clearfix uploadedList" style="display:inline"></ul>

                    <!--<label for="videoInput">������</label><input type="file" id="movideoInput"><br>-->
                    <label for="camera">ī�޶�</label><input type="checkbox" id="mocamera" checked data-toggle="toggle" data-size="mini" style="margin-right : 270px;"><br>

                    <input type="checkbox" id="moqCheck" value="option1"><span style="margin-right:270px;">Question</span><br>
                </div>
                <div id="moquestionDiv">
                    <hr>
                    <h4 class="modal-title">QUESTION</h4>

                    <label for="type">���� ����</label>
                    <select class="form-control" id="moqType">
                        <option>O/X</option>
                        <option>������</option>
                    </select><br>

                    <label for="qTitle">����</label>
                    <textarea class="form-control" id="moquestionTitle" placeholder="������ �Է��ϼ���."></textarea><br>
                    <div id="moselectBox">
                        <label for="s1">1�� ������</label><input type="text" class="form-control" id="mos1" placeholder="1�� ���⸦ �Է��ϼ���."><br>
                        <label for="s2">2�� ������</label><input type="text" class="form-control" id="mos2" placeholder="2�� ���⸦ �Է��ϼ���."><br>
                        <label for="s3">3�� ������</label><input type="text" class="form-control" id="mos3" placeholder="3�� ���⸦ �Է��ϼ���."><br>
                        <label for="s4">4�� ������</label><input type="text" class="form-control" id="mos4" placeholder="4�� ���⸦ �Է��ϼ���."><br>

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
                <button type="button" id="modifyEventBtn" class="btn btn-create">�����ϱ�</button>
                <button type="button" id="mocancleEventBtn" class="btn btn-default" data-dismiss="modal">���</button>
            </div>

        </div>
    </div>
</div>

<!-- END �������  -->


<div id="list">
    ��Ʈ �̸� :<input type="text" id="Rname" placeholder="">
    <hr>
    <div id="eventList">
        <ul>
        </ul>
    </div>
    <div id="listBottom">
        <button type="button" id="commitList" class= "btn btn-default" >�Ϸ�</button>
    </div>
</div>


<!-- ���(��Ʈ ��� �Ϸ�)-->
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

<span class="blink_me"></span>

<script>
    var getParameter = function (param) {

        var returnValue;
        var url = location.href;
        var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
        for (var i = 0; i < parameters.length; i++) {
            var varName = parameters[i].split('=')[0];
            if (varName.toUpperCase() == param.toUpperCase()) {
                returnValue = parameters[i].split('=')[1];
                return decodeURIComponent(returnValue);
            }
        }
    };

    var mapContainer = document.getElementById('map'), // ������ ǥ���� div
            mapOption = {
                center: new daum.maps.LatLng(getParameter('lat'), getParameter('lng')), // ������ �߽���ǥ
                //center: new daum.maps.LatLng(37.8861692, 127.7393315),
                level: 2 // ������ Ȯ�� ����
            };
    var map = new daum.maps.Map(mapContainer, mapOption);

    //var lat= 0;
    //var lng =0;
    var routeno = getParameter('routeno');
    var routename = getParameter('routename');
    var eventLi="";


    $(".blink_me").html("["+routename+"] ��Ʈ ������...");

    (function blink() {
        $('.blink_me').fadeOut(500).fadeIn(500, blink);
    })();

    getEventList();


    <!-- �̺�Ʈ ����Ʈ �ҷ�����-->

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
    <!-- �̺�Ʈ ����Ʈ - ����Ʈ �߰� -->
    function addList(event){

        eventLi+="<li>" +event.title+ "<div class='gly'><span class='glyphicon glyphicon-pencil' id='modi' value='"+event.eventno+"'></span>" +
                "<span class='glyphicon glyphicon-remove' id='del' value='"+event.eventno+"'></span></div></li>";

        $("#eventList").html(eventLi);
        $("#Rname").val(routename);

    }

    <!-- �̺�Ʈ ����Ʈ ������ư -->
    $("#eventList").on("click","#del",function(event){
        var select = $(this);
        removeEvent(select.attr("value"),function(){
        });
        alert(select.attr("value")+"�����Ǿ����ϴ�.");
    });

    <!-- �̺�Ʈ ����Ʈ ���� ��ư -->
    $("#eventList").on("click","#modi",function(event){
        var select = $(this);
        viewEvent(select.attr("value"));
        $("#modiModal").modal('show');
    });


    <!-- �̺�Ʈ ���� ��ư Ŭ��-->
    var attach = new Array();
    var attach2;


    $("#createEventBtn").on("click",function(){

        var title = $("#eventName").val();
        var content = $("#eventinfo").val();
        attach2 = attach.join();

        if(title=="" || content==""){
            alert("�̺�Ʈ �̸��� ������ �Է����ּ���!");
            return;
        }

        createEvent(routeno, title, content, attach2, lat, lng,  function () {
            console.log("attach2:" + attach2);
            clearEventDiv();
            attach = [];
            

        });

        $("#eventModal").modal('hide');

    });

    <!-- �̺�Ʈ ���� ��ư Ŭ��-->

    $("#modifyEventBtn").on("click",function(){
        var title = $("#moeventName").val();
        var content = $("#moeventinfo").val();
        var eventno = $("#moeventno").val();
        attach2 = attach.join();

        console.log(attach2);

        if(title=="" || content==""){
            alert("�̺�Ʈ �̸��� ������ �Է����ּ���!");
            return;
        }

        modifyEvent(eventno,title,content,attach2,lat,lng,function(){
        });

        $("#modiModal").modal('hide');

    });

    <!-- �̺�Ʈ ���� ��� -->
    function createEvent(routeno,title,content,attach2,lat,lng,callback){

        console.log(routeno,title,content,attach2,lat,lng);

        $.ajax({
            type:'post',
            url:"http://14.32.66.127:4000/event/attachCreate",
            headers: {
                "Content-Type":"application/json"},
            datatype: "json",
            data:JSON.stringify({routeno:routeno,title:title,content:content,efiles:attach2,lat:lat,lng:lng}),
            success: function(data){
                getEventList();
                console.log("data:"+data);
            }
        });
        callback();
    };

    <!-- �̺�Ʈ ���� â ���� ���-->
    function clearEventDiv(){
        $("#eventName").val("");
        $("#eventinfo").val("");
        $(".uploadedList").html("");
        attach=[];
    }


    <!-- �̺�Ʈ �б� ��� -->
    function viewEvent(eventno){
        $(".uploadedList").html("");
        var template2 = Handlebars.compile($("#template").html());

        $.getJSON("http://14.32.66.127:4000/event/view?eventno="+eventno,function(data){


            console.log("�̺�Ʈ �ѹ�:"+eventno+"�о����");

            var vo = $(data);
            console.log(vo);

            $("#moeventName").val(vo.attr("title"));
            $("#moeventinfo").val(vo.attr("content"));
            $("#moeventno").val(eventno);
        });

        $.getJSON("http://14.32.66.127:4000/event/getAttach/" + eventno, function(list) {
            console.log("�信�� �����̽� ���Դ�");
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

    <!-- �̺�Ʈ ���� ��� -->
    function removeEvent(eventno,callback){
        console.log("�̺�Ʈ ����"+eventno);

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

    <!-- �̺�Ʈ ���� ��� -->
    function modifyEvent(eventno,title,content,attach2,lat,lng,callback){

        console.log("�̺�Ʈ ����"+eventno);

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




    <!--map Ŭ���ϸ�-->
    daum.maps.event.addListener(map,'click',function(mouseEvent){
        clearEventDiv();
        lat= mouseEvent.latLng.Ab;
        lng = mouseEvent.latLng.zb;

        console.log("���� ������ ������ �浵 : ",lat,lng);

        $("#eventModal").modal('show');

        $("#cancleEventBtn").on("click",function(){
            console.log("�̺�Ʈ ���� ���");

        });
        $("#mocancleEventBtn").on("click",function(){
            console.log("�̺�Ʈ ���� ���");

        });

    });


    <!-- �̺�Ʈ ���� ���(���λ���)-->

    $("#search").on("click",function(){
        console.log("��ȭ�� api�� �̿��� �˻��Ͽ����ϴ�.");
    });


    $("#camera").change("toggle",function(){
        if(this.checked==true){
            console.log("ī�޶� �����.");
        }else{
            console.log("ī�޶� ������.");
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
        if(this.value=="������"){
            $("#oxAnswerbox").hide();
            $("#selectBox").show();
            //$("#multipleAnswerBox").show();

        }else{
            $("#selectBox").hide();
            //$("#multipleAnswerBox").hide();
            $("#oxAnswerbox").show();

        }
    });

    <!-- END �̺�Ʈ ���� ���-->

    <!-- �������(���λ���) -->

    $("#mosearch").on("click",function(){
        console.log("��ȭ�� api�� �̿��� �˻��Ͽ����ϴ�.");
    });


    $("#mocamera").change("toggle",function(){
        if(this.checked==true){
            console.log("ī�޶� �����.");
        }else{
            console.log("ī�޶� ������.");
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
        if(this.value=="������"){
            $("#mooxAnswerbox").hide();
            $("#moselectBox").show();
            //$("#multipleAnswerBox").show();

        }else{
            $("#moselectBox").hide();
            //$("#multipleAnswerBox").hide();
            $("#mooxAnswerbox").show();

        }
    });

    <!-- END ������� ���λ��� -->


    <!-- �̺�Ʈ ����Ʈ �Ϸ� Ŭ��-->
    $("#commitList").on("click",function(){
        $("#finishModal").modal('show');

        var modiRoutename = $("#Rname").val();

        modifyName(routeno,modiRoutename);


        var routemsg = modiRoutename+ " ��Ʈ ����� �Ϸ�Ǿ����ϴ�";
        $("#routeFinish").html(routemsg);
        //��Ʈ �̸� ���� ajax

    });

    function modifyName(routeno,routename){

        $.ajax({
            type:'post',
            url:"http://14.32.66.127:4000/route/modify",
            headers:{
                "Content-Type":"application/json"},
            datatype:"json",
            data:JSON.stringify({routeno:routeno,routename:routename}),
            success: function(data){
                getEventList();
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



<!-- -----����÷�α��-------  -->
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
            console.log(file);

            var formData = new FormData();
            formData.append("file", file);

            uploadImg(formData);
        }


        function uploadImg(formData){
            $.ajax({
                url: 'http://14.32.66.127:4000/uploadAjax',
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
        console.log("���� �� ���� ����ġ : "+attach);


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
        console.log("str����?????:" + str);
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
<!-------- ����÷�α�� �� -------->

</body>
</html>
