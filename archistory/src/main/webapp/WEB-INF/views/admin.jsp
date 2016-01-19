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
    <title>= Archistory =</title>
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
		
		}
		#userJoinDiv{
			display:none;
		}
		#adminJoinDiv{

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
        
            #loginBody{
        top:150px;
        width:350px;
    }

    #loginH{
        max-height:180px;
    }

    .radio{
        text-align: center;
    }
    
        #joinH{
        max-height: 500px;
    }

    #joinBody{
        top:50px;
        width:400px;
    }
    
    #routeUl{
    	display:none;
    }
    
    </style>
    
    <script src="/Cesium/js/jquery.js"></script>

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
    <li role="presentation"><a role="menuitem" tabindex="-1" id="routeShow">My Route List</a></li>
    	<ul id="routeUl">
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
	<button type="button" id="myInfo" class="btn btn-primary btn-xs"><font face="verdana" size="2" >${name}님</font></button>
</div>

<div id="myRouteList">
<ul>
</ul>
</div>

<meta name="_csrf" content="${_csrf.token }"/>
<meta name="_csrf_header" content="${_csrf.headerName }"/>

<iframe id="main" src="/world.html"></iframe>

<script>


$("#mDrop").on("mouseover",function(){
    $(".dropdown-menu").show();
});

$("#main").on("mouseover",function(){
    $(".dropdown-menu").hide();
});
	
		var adminno = ${adminno};
	$("#myInfo").on("click",function(){
		console.log("ADMIN NO : " + adminno);
	});

	
	 var routeLi = "";
	    function addList(route) {
	        routeLi += "<li>" + route.routename + "<small data-routeno='"+route.routeno+"'>X</small></li>";
	        $("#routeUl").html(routeLi);
	    }

	    $.getJSON("http://192.168.0.36:8080/route/list?adminno="+adminno,function(data){
	        var list = $(data);
	        console.log(data);

	        list.each(function(idx,value){
	            var route = this;
	            addList(route);
	        });
	    });

	    function getMetaContentByName(name,content){
	    	var content = (content == null)?'content':content;
	    	return document.querySelector("meta[name='"+name+"']").getAttribute(content);
	    }
	    
	    $("#routeUl").on("click","small",function(event){
	        var select = $(this);
	        
	        $.ajax({
	            type:"post",
	            url: "http://192.168.0.36:8080/route/remove",
	            headers : {"Content-Type":"application/json","X-CSRF-TOKEN":getMetaContentByName('_csrf')},
	            dataType: "json",
	            data : JSON.stringify({routeno:select.attr("data-routeno")}),
	            success: function(data){
	                if(data=="result"){
	                 console.log("성공");
	                }
	                console.log("삭제되었다.");
	                }
	            });
	    });
	    
	    $("#routeShow").on("click",function(){
	    	$("#routeUl").show();
	    });
</script>

</body>
</html>