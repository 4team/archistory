<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>= Archistory =</title>
    
     <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min2.css" rel="stylesheet" type="text/css">

    <!-- Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="css/nivo-lightbox.css" rel="stylesheet" />
	<link href="css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
	<link href="css/animate.css" rel="stylesheet" />
    <!-- Squad theme CSS -->
    <link href="css/style2.css" rel="stylesheet">
	<link href="color/default.css" rel="stylesheet">
	
</head>

    <style>
        html, body {
            width: 100%; height: 100%; margin: 0; padding: 0; overflow: hidden;
            font-family: sans-serif; color: #edffff;
        }

        #main{
            width:100%;
            border:0px;
            height:100%;
        }
		
		#menu{
			z-index:100;
			position: absolute;
			/* top:5px;
			left:8px; */
			/* background-color:#303336; */
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
	        z-index:10000;
	    }
	
	    #loginH{
	        max-height:180px;
	    }
	
	    .radio{
	        text-align: center;
	    }
	    
	 	 #joinH{
	        max-height: 480px;
	    }
	
	    #joinBody{
	        top:50px;
	        width:400px;
	        z-index:10000;
	    }
    
          #myLocation{
            padding : 2px;
            border:1px solid;
            border-color:#444444;
            background-color: #303336;
            width:32px;
            height:32px;
            z-index: 330;
            top:5px;
            left:43px;
            position : absolute;
        }

	    #joinBody{
	        top:50px;
	        width:400px;
	        overflow: hidden;
	    }
    
      .glyphicon{
            display: inline;
            color:#FFFFFF;
            z-index:400;
            font-size: 24px;
        }
        .gly{
            float:right;
        }
        table{
            border-spacing: 50px;
        }
        table,th,td{
            border-collapse : collapse;
        }
        th{
            text-align: center;
        }
    
        #myLocation:hover{
            border-color:#aef;
            box-shadow: 0 0 8px #fff;
        }
		button{
		margin:auto;
		}
		
		.modal-content{
		z-index:10000;
		}
		
		.duplResult{
			padding :0px;
			margin:0px;
			text-align: center;
			width:350px;
			height:30px;
			font-size: 10px;
		}
		#upper-login{
		z-index:999;
		}
		.fa{
		position:absolute;
		}
		.fa-home{
		top:20px;
		left:22px;
		}
		.fa-map-marker{
		top:94px;
		left:25px;
		}
		.fa-question{
		top:170px;
		left:25px;
		}
		.fa-book{
		top:246px;
		left:22px;
		}
		.fa-download{
		top:320px;
		left:22px;
		}
		.gn-menu li:hover{
        	border : 1px solid;
        	border-color:#aef;
        	box-shadow:0 0 8px #fff;
        }
        .gn-menu-main{
        z-index:1;
        }
        
        span.glyphicon-menu-hamburger {
	   		font-size: 1.8em;
	   		margin:2px;
	   		margin-top:3px;
	   		color:#FFFFFF;
		}
    </style>
    
    <script src="/Cesium/js/jquery.js"></script>

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    <!-- Cesium -->
  	<link href="/Cesium/Build/Cesium/Widgets/widgets.css" rel="stylesheet"/>
	<script src="/Cesium/Build/Cesium/Cesium.js"></script>
<body>


<div class="menu">
			<ul id="gn-menu" class="gn-menu-main">
<li class="gn-trigger">
					<a class="gn-icon gn-icon-menu"><span class="glyphicon glyphicon-menu-hamburger"></span></a>
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">
								<li><i class="fa fa-home"></i><a href="/" class="gn-icon gn-icon-cog">Home</a></li>
								<li><i class="fa fa-map-marker"></i><a href="#about" class="gn-icon gn-icon-download" id="routeShow">Tour Route</a></li>
								
									<ul  id="myRouteList"></ul>
									
								<li><i class="fa fa-question"></i><a href="/sboard/usage" class="gn-icon gn-icon-help">Usage</a></li>
								<li><i class="fa fa-book"></i><a href="/sboard/list" class="gn-icon gn-icon-archive">Reviews</a></li>
								<li><i class="fa fa-download"></i><a href="#" class="gn-icon gn-icon-download">App Download</a></li>
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
</ul>
	</div>
	
	
<div id="upper-login">
	<button type="button" id="loginBtn" class="btn btn-primary btn-xs"><font face="verdana" size="2" >Login</font></button>
	<button type="button" id="joinBtn" class="btn btn-primary btn-xs"><font face="verdana" size="2" >Join</font></button>
</div>







<!-- ★로그인 모달 -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="routeCreateModalLabel" aria-hidden="false" >
    <div class="modal-dialog" id="loginBody">

	

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="loginModalLabel">로그인</h4>
            </div>
           <form name="loginForm"  id="loginForm" action="/admin/login" method="post">
            <div class="modal-body" id="loginH">
                <div id="loginDiv">
                    <div class="radio">
                        <label>
                            <input type="radio" name="loginType" id="userLogin" value="user">
                            User
                        </label>
                        <label>
                            <input type="radio" name="loginType" id="adminLogin" value="admin" checked>
                            Admin
                        </label>
                    </div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <input type="text" class="form-control" name ="email" id="email" placeholder="Email"><br>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Password"><br>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" id="loginCancelBtn" class="btn btn-default" data-dismiss="modal">취소</button>
                <button type="submit" id="loginSubmitBtn" class="btn btn-primary">로그인</button>
            </div>
           </form>   
        </div>

            

    </div>
</div>


<!-- 모달 팝업(회원가입) 생성) -->
<div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="routeCreateModalLabel" aria-hidden="true" >
    <div class="modal-dialog" id="joinBody">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="joinModalLabel">회원가입</h4>
            </div>
            <div class="modal-body" id="joinH">
<div id="joinDiv">

	<div class="radio">
	  <label>
	    <input type="radio" name="joinType" id="user" value="user">
	   User
	  </label>
	   <label>
	    <input type="radio" name="joinType" id="admin" value="admin" checked>
	   Admin
	  </label>
	</div>
	
	<div id="userJoinDiv">
	    <input type="text" class="form-control" id="useremail" placeholder="Email"><br>
	    <input type="password" class="form-control" id="password1" placeholder="Password"><br>
	    <input type="password" class="form-control" id="password2" placeholder="Password (Again)"><br>   
    <div class="duplResult"></div>
	    <input type="text" class="form-control" id="username" placeholder="UserName"><br>
    </div>
    <div id="adminJoinDiv">
	    <input type="text" class="form-control" id="adminEmail" placeholder="Email"><br>
	    <input type="password" class="form-control" id="adminpassword1" placeholder="Password"><br>
	    <input type="password" class="form-control" id="adminpassword2" placeholder="Password (Again)"><br>
    <div class="duplResult"></div>
    	<input type="text" class="form-control" id="adminname" placeholder="UserName"><br>
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




<div id="main"></div>

<div id="myLocation"><span class="glyphicon glyphicon-map-marker"></span></div>

<!-- Cesium 초기화 및 이벤트를 위한 스크립트 -->
<script>
var viewer;


function turnAround(clock){

    (function(clock){
        var spinRate = 0.1;
        var currentTime = Date.now();
        var previousTime = currentTime-70;
        var delta = ( currentTime - previousTime ) / 1000;
        previousTime = currentTime;
        viewer.scene.camera.rotate(Cesium.Cartesian3.UNIT_Z, -spinRate * delta);
    })();
};


function stopAround() {
    viewer.clock.onTick.removeEventListener(turnAround);
};


(function worldMap() {
    viewer = new Cesium.Viewer('main', {
        navigationHelpButton: false,
        fullscreenButton: false,
        infoBox: false,
        baseLayerPicker: false,
        homeButton: false,
        sceneModePicker: false,
        animation: false,
        timeline: false
    });

    var cartographic = new Cesium.Cartographic();
    var cartesian = new Cesium.Cartesian3();
    var camera = viewer.scene.camera;
    var ellipsoid = viewer.scene.mapProjection.ellipsoid;


    var spinGlobe = viewer.clock.onTick.addEventListener(turnAround);
    spinGlobe;

    $("#main").on("click",function(){
        stopAround();
    });

    window.addEventListener("mousewheel", function () {
        ellipsoid.cartesianToCartographic(camera.positionWC, cartographic);
        var lat = Cesium.Math.toDegrees(cartographic.latitude).toFixed(7);
        var lng = Cesium.Math.toDegrees(cartographic.longitude).toFixed(7);
        var height = (cartographic.height * 0.001).toFixed(1);

        if (height < 10) {
            changePage(lat, lng, height);
        }
    });

})();

function changePage(lat, lng, height) {
    self.location="close.html?lat="+lat+"&lng="+lng;
}


$("#myLocation").on("click",function(){

    stopAround();
    //초기 위치 읽어내서 지구를 이동시킨다.
    navigator.geolocation.getCurrentPosition(success, error);

    function success(position) {
    	 stopAround();
        viewer.camera.flyTo({
            destination: Cesium.Cartesian3.fromDegrees(
                    position.coords.longitude,
                    position.coords.latitude,
                    600000
            )
        });
    };

    function error(err) {
        console.log(err.code + err.message);
    };

});

function addMarker(route){
    var entity = viewer.entities.add({
        name: route.routename,
        position: Cesium.Cartesian3.fromDegrees(route.lng, route.lat),
        billboard : {
            image : '/Cesium/marker.png',
            width : 64,
            height : 64
        },
        label : {
            text : route.routename,
            font : '12pt verdana',
            style: Cesium.LabelStyle.FILL_AND_OUTLINE,
            outlineWidth : 2,
            verticalOrigin : Cesium.VerticalOrigin.TOP,
            pixelOffset : new Cesium.Cartesian2(0, 32)
        }
    });
    var ellipse = entity.ellipse;
}



$.getJSON("http://192.168.0.36:8080/route/listAll",function(data){
    var list = $(data);
    list.each(function(idx,value){
        var route = this;
        addMarker(route);
    });
});

</script>

<!-- 클릭 메뉴들과 관련된 스크립트 -->
<script>
$("#mDrop").on("mouseover",function(){
    $(".dropdown-menu").show();
});

$("#main").on("mouseover",function(){
    $(".dropdown-menu").hide();
});

$("#loginBtn").on("click",function(){
    $("#loginModal").modal('show');
});

	
	$("#joinBtn").on("click",function(){
		$("#joinModal").modal('show');
	});

    // 15일 5:29분부터 추가..
    $("#user").on("click",function(){
        $("#adminJoinDiv").hide();
        $("#userJoinDiv").show();
    });
    $("#admin").on("click",function(){
        $("#adminJoinDiv").show();
        $("#userJoinDiv").hide();
    });

    
    // 로그인타입에 따른 폼 액션 바꾸기
    $("#userLogin").on("click",function(){
        $("#loginForm")[0].action = "/user/login_process";
        console.log($("#loginForm")[0]);
    });
    
    $("#adminLogin").on("click",function(){
        $("#loginForm")[0].action = "/admin/login";
        
        console.log($("#loginForm")[0]);
    });
    
    $("#adminpassword2").keyup(function(){
    	
    	var p1 = $("#adminpassword1").val();
    	var p2 = $("#adminpassword2").val();
	   	console.log("어드민 패스워드 타이핑중");
	   	var resultDiv = $(".duplResult");
    	
	    if(p1 != p2){
	    	resultDiv.html("<ul><li>비밀번호가 다릅니다.</li></ul>");
	    }else{
	    	resultDiv.html("");
	    }
    });
    
		$("#password2").keyup(function(){
    	
    	var p1 = $("#password1").val();
    	var p2 = $("#password2").val();
	   	console.log("유저 패스워드 타이핑중");
	   	var resultDiv = $(".duplResult");
    	
	    if(p1 != p2){
	    	resultDiv.html("<ul><li>비밀번호가 다릅니다.</li></ul>");
	    }else{
	    	resultDiv.html("");
	    }
    });
</script>
<script src="/Cesium/js/map.js"></script>


 <!-- Core JavaScript Files -->

	<script src="/js/gnmenu.js"></script>
	<script src="/js/jquery.scrollTo.js"></script>
	<script src="/js/custom.js"></script>
	<script src="/js/classie.js"></script>
    
    
</body>
</html>