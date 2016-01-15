<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>= Archistory(ADMIN) =</title>
</head>

<style>
    html, body, #cesiumContainer {
        width: 100%; height: 100%; margin: 0; padding: 0; overflow: hidden;
        font-family: sans-serif; color: #edffff;
    }

    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
    }
    #main{
        width:100%;
        border:0px;
        height:100%;
    }

    #menu{

        z-index:100;
        position: absolute;
        top:5px;
        left:8px;
        background-color:#303336;
    }

    #menu:hover{
        border : 1px solid;
        border-color:#aef;
        box-shadow:0 0 8px #fff;
    }

    #upper-login{
        padding:5px;
        position:absolute;
        z-index:100;
        right: 10px;
        top:5px;
    }

    #joinBtn{
        margin-left: 5px;
    }

    span.glyphicon-menu-hamburger {
        font-size: 1.8em;
        margin:2px;
        margin-top:3px;
        color:#FFFFFF;
    }

    #joinDiv{
        display:none;
    }
    #userJoinDiv{
        display:none;
    }
    #adminJoinDiv{
        display:none;
    }

    #joinDiv{
        padding:10px;
    }

    .modal-body{
        height:400px;
        overflow-y: auto;
    }

    .modal-title{
        text-align: center;
    }

    #myRouteList{
        display:none;
        position:absolute;
        padding: 10px;
        z-index:400;
        border : 1px solid black;
        border-radius : 10px;
        background-color : #FFF;
        top:50px;
        left:10px;
        width:200px;
        height:400px;
        overflow-y:scroll;
    }
    li{
        list-style: none;
        margin-bottom: 15px;
    }

    small{
        float:right;
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

    .routeListUl{
        display:none;
        margin:0px;
        padding:0px;
    }
</style>

<script src="Cesium/js/jquery.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<body>

<div id="menu">

    <div class="dropdown">
        <a id="mDrop" data-target="#" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
            <span class="glyphicon glyphicon-menu-hamburger"></span>
        </a>

        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
            <li role="presentation"><a role="menuitem" tabindex="-1" href="/">Home</a></li>
            <li role="presentation" id="myRouteListLi"><a role="menuitem" tabindex="-1" data-toggle="dropdown">My Route List<span class="caret"></span></a></li>
            <ul class="routeListUl">
                <li role="presentation" class="divider"></li>
            </ul>
            <li role="presentation" class="divider"></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="/sboard/usage">Usage</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="/sboard/list">Reviews</a></li>
            <li role="presentation" class="divider"></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">App Download</a></li>
        </ul>
    </div>
</div>

<div id="upper-login">
    <button type="button" id="loginBtn" class="btn btn-primary btn-xs"><font face="verdana" size="2" >Login</font></button>
    <button type="button" id="joinBtn" class="btn btn-primary btn-xs"><font face="verdana" size="2" >Join</font></button>
</div>

<div id="myRouteList">
    <ul>
    </ul>
</div>


<!-- 모달 팝업(이벤트(스텝) 생성) -->
<div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="routeCreateModalLabel" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="joinModalLabel">회원가입</h4>
            </div>
            <div class="modal-body">
                <div id="joinDiv">

                    <div class="radio">
                        <label>
                            <input type="radio" name="joinType" id="user" value="user" checked>
                            User
                        </label>
                        <label>
                            <input type="radio" name="joinType" id="admin" value="admin" checked>
                            Admin
                        </label>
                    </div>

                    <div id="userJoinDiv">
                        <input type="text" class="form-control" id="username" placeholder="UserName"><br>
                        <input type="text" class="form-control" id="email" placeholder="Email"><br>
                        <input type="text" class="form-control" id="password1" placeholder="Password"><br>
                        <input type="text" class="form-control" id="password2" placeholder="Password Again"><br>
                    </div>
                    <div id="adminJoinDiv">
                        <input type="text" class="form-control" id="adminname" placeholder="UserName"><br>
                        <input type="text" class="form-control" id="adminEmail" placeholder="Email"><br>
                        <input type="text" class="form-control" id="adminpassword1" placeholder="Password"><br>
                        <input type="text" class="form-control" id="adminpassword2" placeholder="Password (Again)"><br>
                        <input type="text" class="form-control" id="phone" placeholder="Phone Number"><br>
                        <input type="text" class="form-control" id="nation" placeholder="Nation"><br>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" id="eventCreateCancelBtn" class="btn btn-default" data-dismiss="modal">취소</button>
                <button type="button" id="eventCreateBtn" class="btn btn-primary">회원가입</button>
            </div>
        </div>
    </div>
</div>



<iframe id="main" src="world.html"></iframe>

<script>


    $("#mDrop").on("mouseover",function(){
        $(".dropdown-menu").show();
        console.log("마우스오버");
    });

    $("#main").on("mouseover",function(){
        $(".dropdown-menu").hide();
        console.log("마우스아웃");
    });


    $("#myRouteListLi").on("click",function(){
        $(".routeListUl").toggle();
    });


    $("#loginBtn").on("click",function(){
        alert("로그인하는 DIV가 뜨도록 구현.");
    });

    $("#joinBtn").on("click",function(){
        $("#joinModal").modal('show');
    });

    var routeLi = "";
    function addList(route) {
        routeLi += "<li>" + route.routename + "<small data-routeno='"+route.routeno+"'>X</small></li>";
        $("#myRouteList").html(routeLi);
    }

    $.getJSON("http://192.168.0.36:8080/route/list",function(data){
        var list = $(data);
        console.log(data);

        list.each(function(idx,value){
            var route = this;
            addList(route);
        });
    });

    $("#myRouteList").on("click","small",function(event){
        var select = $(this);
        alert("X를 클릭함. routeNo : "+select.attr("data-routeno"));
    });
</script>

</body>
</html>