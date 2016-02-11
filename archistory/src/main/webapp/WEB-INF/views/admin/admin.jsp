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
    <title>= Archistory(ADMIN) =</title>
    
      <!-- Bootstrap Core CSS -->
    <link href="/css/bootstrap.min2.css" rel="stylesheet" type="text/css">

    <!-- Fonts -->
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="/css/nivo-lightbox.css" rel="stylesheet" />
	<link href="/css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
	<link href="/css/animate.css" rel="stylesheet" />
    <!-- Squad theme CSS -->
    <link href="/css/style2.css" rel="stylesheet">
	<link href="/color/default.css" rel="stylesheet">
	
</head>

    <style>
        html, body, #cesiumContainer {
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
/* 			top:5px;
			left:8px;
			background-color:#303336; */
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
        .modal-dialog{
        			z-index:9999;
        }
        
         #myRouteList{
         	display:none;
            position:absolute;
            padding: 10px;
            z-index:9400;
            border : 1px solid black;
            border-radius : 10px;
            background-color : #FFF;
            top:110px;
            left:200px;
            width:200px;
            height:400px;
            overflow-y:scroll;
        }
        
  
        li{
            list-style: none;
            padding-top: 5px;
            padding-bottom:5px;
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
    
        #myLocation{
            padding : 2px;
            border:1px solid;
            border-color:#444444;
            background-color: #303336;
            width:32px;
            height:32px;
            z-index: 9330;
            top:5px;
            left:43px;
            position : absolute;
        }

    #joinBody{
        top:50px;
        width:400px;
    }
    
    #routeUl{
    	display:none;
    }
    
     #positionGly{
            display: inline;
            color:#FFFFFF;
            z-index:400;
            font-size: 24px;
        }
        .gly{
            float:right;
        }
        
        #member{
         margin: 10px;
        }
        
        #modi{
         margin: 10px;
        }
        
        #del{
         margin: 10px;
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
        #routeCreate{
	        display:none;
	        position:absolute;
	        z-index:500;
   		 }
   		 
	   	#adminInfo{
	   		position:absolute;
	   		border-radius : 10px;
	   		padding:2px;
	   		text-align:center;
	   		border:1px solid;
	   		display:none;
	   		top:30px;
	   		right:3px;
	   		text-align:left;
	   		z-index:400;
	   		width:100px;
	   		height:70px;
	   		background-color: #303336;
	   	}
	   	
	   	#adminInfo:hover{
	   		margin-top:1px;
	   		margin-right:1px;
        	border : 1px solid;
        	border-color:#aef;
        	box-shadow:0 0 8px #fff;
        }
        
        #adminInfo li{
        	text-align:center;
        }
        
        #adminInfo a{
        	color:#2169C1;
        }
        
       #adminInfo a:hover{
       		text-decoration:none;
        	color:#aef;
        }
        
       #memberlist{
        text-align : center;
        }
       
       #profile{
       	border-spacing: 1px 10px;
       	border-collapse: separate;
       }
       
        #profile td{
        text-align : right;
        margin-right : 10px;
       
        }
        
        a{
        text-decoration : none;
        }
        
        #imgDiv img{
        width:200px;
        height:200px;
        display:block;
        }
        
        iframe{
        width:0px;
        height:0px;
        border:0px;
        }
       	.fa{
			margin:5px;
			position:relative;
			font-size: 1.5em;
		}
		.gn-menu li:hover{
        	border : 1px solid;
        	border-color:#aef;
        	box-shadow:0 0 8px #fff;
        }
        .gn-menu-main{
        z-index:1;
        }
        
       #hamb{
/*        padding-top:-10px;
       		padding-left:-15px;
	   		margin-left:0px;
	   		margin:2px;
	   		margin-top:3px;
 */				
					margin-top: 3px;
		margin-left: -25px;
			text-decoration:none;
	   		font-size: 2em;
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
									<ul  id="myRouteList"></ul>
					<a id="hamb" class="glyphicon glyphicon-menu-hamburger gn-icon-menu"></a>
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">
								<li><i class="fa fa-home"></i><a href="/admin/login_success" class="gn-icon gn-icon-cog">Home</a></li>
								<li><i class="fa fa-map-marker"></i><a class="gn-icon gn-icon-download" id="routeShow">My Route List</a></li>
								
									
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
	<button type="button" id="myInfo" data-src="${adminno}" class="btn btn-primary btn-xs"><font face="verdana" size="2" >${name}님</font></button>
	<ul id="adminInfo">
  	 	<li><a id="myProfile">My Info</a></li>
    	<li><a href="/admin/logout">Logout</a></li>
    </ul>
</div>


<!--  myProfile modal -->

<div class="modal fade" id="myProfileModal" tabindex="-1" role="dialog" aria-labelledby="myProfileModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span></button>
                <h4 class="modal-title">My Profile</h4>
            </div>
            <div class="modal-body">
            	<div id="imgDiv" style="margin-left:210px;">
				     
			    </div>   
                
                   <table id="profile" align="center">
	                    <tr><td>NAME &nbsp :&nbsp </td><td><input type='text' class='form-control' id="proName" placeholder='Name' ></td></tr>
			            <tr><td>PHONE &nbsp :&nbsp </td><td><input type='tel' class='form-control' id="proPhone" placeholder='Phone'></td></tr>
			            <tr><td>COUNTRY &nbsp:&nbsp </td><td><input type='text' class='form-control' id="proCountry" placeholder='Country'></td></tr>
			            <tr><td>E-MAIL &nbsp:&nbsp </td><td><input type='email' class='form-control' id="proEmail" placeholder='Email' readonly></td></tr>
			            <tr><td>PASSWORD&nbsp:&nbsp </td><td><input type='password' class='form-control' id="proPassword" placeholder='Password'></td></tr>
			            <tr><td>PASSWORD&nbsp:&nbsp<br>&nbsp(AGAIN)&nbsp</td><td><input type='password' class='form-control' id="proPassword1" placeholder='Password(Again)'></td></tr>
 
                </table>
               	 
               
            </div>
            <div class="modal-footer">
            	<div style="float:left"><a style="color:blue;" id="delAccount">Delete your account</a></div>
                <button type="button" id="proModifyBtn" class="btn btn-create">SAVE</button>
                <button type="button" id="proCancleBtn" class="btn btn-default" data-dismiss="modal">CANCLE</button>
            </div>
        </div>
    </div>
</div>

<!--  myProfile img modal -->


<div class="modal fade" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="imgModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="height:200px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span></button>
                <h4 class="modal-title">Modify Image</h4>
            </div>
            <div class="modal-body" style="height:80px;">
           		<form id='form1' action='imgUpload' method='post' enctype='multipart/form-data' target="zeroFrame">
           			<input type='file' name='file'>
           		<iframe name="zeroFrame"></iframe>
            </div>
            <div class="modal-footer">
	                <button type="button" id="cancleImgBtn" class="btn btn-default" data-dismiss="modal">CANCLE</button>
           			<input type='submit' class="btn btn-primary" value="SAVE">
           		</form>
            </div>
        </div>
    </div>
</div>



<!--  myProfile DELETE modal -->

<div class="modal fade" id="delAdminModal" tabindex="-1" role="dialog" aria-labelledby="delAdminModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="height:200px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span></button>
                <h4 class="modal-title">ADMIN DELETE</h4>
            </div>
            <div class="modal-body" style="height:80px;">
               <ul id="adminName">
               </ul>
            </div>
            <div class="modal-footer">
                <button type="button" id="delAdminBtn" class="btn btn-create">OK</button>
                <button type="button" id="delCancleBtn" class="btn btn-default" data-dismiss="modal">CANCLE</button>
            </div>
        </div>
    </div>
</div>


<!-- route modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="false">
    <div class="modal-dialog">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span></button>
                <h4 class="modal-title">My route</h4>
            </div>
            <div class="modal-body">
            
                <h5 class="modal-title" id="routelist">
                    <ul></ul>
                </h5>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>

<!-- remove route modal-->
<div class="modal fade" id="removeRouteModal" tabindex="-1" role="dialog" aria-labelledby="removeRouteLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" >
            <div class="modal-header">
                <h4 class="modal-title">루트 삭제</h4>
            </div>
            <div class="modal-body">
                <h5 class="modal-title" id="removeroute">
                    <ul></ul>
                </h5>
            </div>
            <div class="modal-footer">
                <button type="button" id="removeRouteBtn" class="btn btn-create">삭제하기</button>
                <button type="button" id="cancleBtn" class="btn btn-default" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<!-- member list modal-->

<div class="modal fade" id="memberListModal" tabindex="-1" role="dialog" aria-labelledby="memberListModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span></button>
                <h4 class="modal-title">루트 멤버 리스트</h4>
            </div>
            <div class="modal-body">
               
               	 <h6 class="modal-title" id="memberlist">
                    <ul>
                    </ul>
                </h6>
               
            </div>
            <div class="modal-footer">
                <button type="button" id="regiMemberBtn" class="btn btn-create">추가</button>
                <button type="button" id="cancleBtn" class="btn btn-default" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<!-- member route modal-->

<div class="modal fade" id="memberModal" tabindex="-1" role="dialog" aria-labelledby="memberModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span></button>
                <h4 class="modal-title">루트 멤버 등록</h4>
            </div>
            <div class="modal-body">
                <table>
                    <tr>
                        <th>번호</th>
                        <th>이름</th>
                        <th>이메일</th>
                        <th>비밀번호</th>
                    </tr>
                    <tr id="tr1">
	                    <td><input type='text' class='form-control' id="number1" placeholder='Number' ></td>
			            <td><input type='text' class='form-control' id="name1" placeholder='Name'></td>
			            <td><input type='email' class='form-control' id="email1" placeholder='email'></td>
			            <td><input type='password' class='form-control' id="password1" placeholder='password'></td>
		            </tr>
                </table>
                <table id="memTable">

                </table>
                <span class='glyphicon glyphicon-plus' id="plus"></span>
                <span class='glyphicon glyphicon-minus' id="minus"></span>

            </div>
            <div class="modal-footer">
                <button type="button" id="registerBtn" class="btn btn-create">등록</button>
                <button type="button" id="regiCancleBtn" class="btn btn-default" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<!-- member view modal-->

<div class="modal fade" id="modiMemberModal" tabindex="-1" role="dialog" aria-labelledby="modiMemberModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span></button>
                <h4 class="modal-title">멤버 수정  </h4>
            </div>
            <div class="modal-body">
               
               	 <table>
                    <tr>
                        <th>번호</th>
                        <th>이름</th>
                        <th>이메일</th>
                        <th>비밀번호</th>
                    </tr>
                    <tr>
	                    <td><input type='text' class='form-control' id="modinumber"></td>
			            <td><input type='text' class='form-control' id="modiname"></td>
			            <td><input type='email' class='form-control' id="modiemail"></td>
			            <td><input type='password' class='form-control' id="modipassword"></td>
		            </tr>
                </table>
               
            </div>
            <div class="modal-footer">
                <button type="button" id="modiMemberBtn" class="btn btn-create">수정 </button>
                <button type="button" id="modiCancleBtn" class="btn btn-default" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<button type="button" id="routeCreate" class="btn btn-default">루트생성하기</button>

<meta name="_csrf" content="${_csrf.token }"/>
<meta name="_csrf_header" content="${_csrf.headerName }"/>

<div id="main"></div>


<div id="myLocation"><span id="positionGly" class="glyphicon glyphicon-map-marker"></span></div>

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

var adminno = ${adminno};

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

    viewer.scene.skyBox.destroy();
    viewer.scene.skyBox = undefined;
    viewer.scene.sun.destroy();
    viewer.scene.sun = undefined;
    viewer.scene.moon.destroy();
    viewer.scene.moon = undefined;
    viewer.scene.skyAtmosphere.destroy();
    viewer.scene.skyAtmosphere = undefined;
    viewer.scene.backgroundColor = new Cesium.Color(1,0.7,0.7,0.0);
    
    var cartographic = new Cesium.Cartographic();
    var cartesian = new Cesium.Cartesian3();
    var camera = viewer.scene.camera;
    var ellipsoid = viewer.scene.mapProjection.ellipsoid;

    
    
    var spinGlobe = viewer.clock.onTick.addEventListener(turnAround);
    spinGlobe;

    $("#main").on("click",function(){
    	$("#routeCreate").hide();
        stopAround();
    });

    viewer.canvas.addEventListener("contextmenu", function (event) {
    	ellipsoid.cartesianToCartographic(camera.positionWC, cartographic);
        var mousePosition = new Cesium.Cartesian2(event.clientX, event.clientY);
        var cartesian = viewer.camera.pickEllipsoid(mousePosition, ellipsoid);

        var adminno = ${adminno};
         var lat = Cesium.Math.toDegrees(cartographic.latitude).toFixed(7);
         var lng = Cesium.Math.toDegrees(cartographic.longitude).toFixed(7);
         var height = (cartographic.height * 0.001).toFixed(1);
         
         console.log(adminno,lat,lng,height);
         console.log(event);
         
        var bnt = $("#routeCreate");
        bnt.css("left",event.clientX);
        bnt.css("top",event.clientY)
        bnt.show();

        bnt.on("click",function(){
             changePage(adminno,lat,lng,height);
        });
     });

})();



function changePage(adminno,lat, lng, height) {
	
    console.log("화면 전환 : ",adminno, ' ', lat, ' ', lng, ' ', height);
    var formData = {adminno:adminno,lat:lat,lng:lng,height:height};
    
    $.post("http://14.32.66.127:4000/admin/close",formData,function(data){document.write(data)});
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


$.getJSON("http://14.32.66.127:4000/route/list?adminno="+adminno,function(data){
    var list = $(data);
    list.each(function(idx,value){
        var route = this;
        addMarker(route);
    });
});


	//admin profile 
	
	var username;
	
	$("#myProfile").on("click",function(){
		
			viewProfile();
			$("#adminInfo").hide();
		   $("#myProfileModal").modal('show');
	});

	

	function viewProfile(){
		$.getJSON("http://14.32.66.127:4000/admin/view?adminno="+adminno,function(data){
		    var admin = $(data);
		    
		    console.log(admin);
		  
		    $("#proName").val(admin.attr("username"));
			$("#proPhone").val(admin.attr("phone"));
			$("#proCountry").val(admin.attr("nation"));
			$("#proEmail").val(admin.attr("email"));
			$("#proPassword").val(admin.attr("password"));
			$("#proPassword1").val(admin.attr("password"));
			
		   var dbimg = admin.attr("img");
		   console.log(dbimg);
			
		   if(dbimg==null){  
			   var imgTag=" <img class='img-circle' id='foto' src ='/img/profile.png'>";
				$("#imgDiv").html(imgTag); 
		   }else{
		   
			   var imgAddr="http://14.32.66.127:4000/admin/displayFile?fileName="+dbimg;
			   var imgTag1="<img class='img-circle' id='foto' src ='"+imgAddr+"'>";
				$("#imgDiv").html(imgTag1); 
		   }
		   
		   username = $("#proName").val();
		});
	
	}
	
	
	$("#imgDiv").on("click",function(){
		console.log("이미지 클림됨.");
		$("#imgModal").modal('show');	
		
	});
	

	
	function closeRegiImg(imgName){
		console.log("이미지 등록 성공"+imgName);
		
		var dbImg="/"+imgName
		console.log(dbImg);
		
		regiAdminImg(adminno,dbImg);
		
		var imgAddr="http://14.32.66.127:4000/admin/displayFile?fileName="+dbImg
		
		var imgTag="<img class='img-circle' id='foto' src ='"+imgAddr+"'>";
		
		$("#imgDiv").html(imgTag); 
	 

	 $("#imgModal").modal('hide');

		document.getElementById("form1").reset();
	
	}
	
	function regiAdminImg(adminno,dbImg){
		
		 $.ajax({
			  type:'post',
			  url:"http://14.32.66.127:4000/admin/modiImg",
			  headers : {
				"Content-Type" : "application/json"  
			  },
			  datatype:"json",
			  data:JSON.stringify({adminno:adminno,img:dbImg}),
			  success: function(data){
				  console.log("admin 이미지 등록처리 결과 :"+ data);
			  }				   
		   });
	}
	
	
	
	$("#proModifyBtn").on("click",function(){
		
		    var username= $("#proName").val();
		    var phone=$("#proPhone").val();
		    var nation=$("#proCountry").val();
		    var password=$("#proPassword").val();
		    var password1=$("#proPassword1").val();
		    
		    if( password != password1){
		    	alert("패스워드가 동일하지 않습니다.");
		    	return;
		    }
		    
		    
		    $.ajax({
				  type:'post',
				  url:"http://14.32.66.127:4000/admin/modify",
				  headers : {
					"Content-Type" : "application/json"  
				  },
				  datatype:"json",
				  data:JSON.stringify({adminno:adminno,username:username,phone:phone,nation:nation,password:password}),
				  success: function(data){
					  console.log("admin 수정 처리 결과 :"+ data);
					  $("#myProfileModal").modal('hide');
				  }				   
			   });
		    
		    
		
	});	

	$("#delAccount").on("click",function(){
		$("#myProfileModal").modal('hide');
		$("#delAdminModal").modal('show');
		
		var msg = "<li>"+username+"님 탈퇴하시겠습니까?</li>";
		
		$("#adminName").html(msg);
		
	});
	
	
	$("#delAdminBtn").on("click",function(){
		
		console.log("admin no:"+adminno);
		 
		   $.ajax({
			  type:'post',
			  url:"http://14.32.66.127:4000/admin/remove",
			  headers : {
				"Content-Type" : "application/json"  
			  },
			  datatype:"json",
			  data:JSON.stringify({adminno:adminno}),
			  success: function(data){
				  console.log("admin 삭제 처리 결과 :"+ data);
				  $("#delAdminModal").modal('hide');
				  location.href="/admin/logout";
			  }				   
		   });
		
	});

</script>

<script>
 $("#mDrop").on("mouseover",function(){
    $(".dropdown-menu").show();
});

$("#main").on("mouseover",function(){
    $(".dropdown-menu").hide();
	 $("#myRouteList").hide();
});  
	
	
	//admin myinfo page
	$("#myInfo").on("click",function(){
		$("#adminInfo").toggle();
	});
	

	//route list 보이기 
	
		var routeLi = "";
	
	    function addList(route) {
	        routeLi += "<li data-lat='"+route.lat+"' data-lng='"+route.lng+"' data-routename='"+route.routename+"' data-routeno='"+route.routeno+"'>" + route.routename + "</li>";
	        $("#myRouteList").html(routeLi);
	    }

	    function getAllRouteList(){
		    $.getJSON("http://14.32.66.127:4000/route/list?adminno="+adminno,function(data){
		        var list = $(data);
	
				routeLi = "";
		        list.each(function(idx,value){
		            var route = this;
		            addList(route);
		        });
		    });
	    }
	    
	    getAllRouteList(); //루트 리스트 보이게 
	    
	    function getMetaContentByName(name,content){
	    	var content = (content == null)?'content':content;
	    	return document.querySelector("meta[name='"+name+"']").getAttribute(content);
	    }
	    
	    $("#routeShow").on("click",function(){
	    	 $("#myRouteList").toggle();
	    	 
	    });

	    var routeno;
	    
	  //routelist 에서   route 이름 클릭하면 -> 루트 수정, 멤버 등록, 루트 삭제 모달 창 뜸.    
	    $("#myRouteList").on("click","li",function(event){
		       var select = $(this);
		    	 $("#myRouteList").hide();
		       routeno = parseInt(select.attr("data-routeno"));
		       
		       $("#editModal").modal('show');
		       editRoute(select);
		    });

		    
		/*     $("#routeList").on("click",function(){
		    	 $("#myRouteList").show();
		    	 
		    }); */
		    
		   
		 function editRoute(select){
		        var editRoute ="<li>" + select.attr("data-routename")+ "<div class='gly'><span class='glyphicon glyphicon-user' id='member' value='"+select.attr("data-routeno")+"'></span>" +
		                "<span class='glyphicon glyphicon-pencil' id='modi' value='"+select.attr("data-routeno")+"'></span>" +
		                "<span class='glyphicon glyphicon-remove' id='del' value='"+select.attr("data-routeno")+"'></span></div></li>";

		        $("#routelist").html(editRoute);
		    }
	

		    //루트 수정 페이지로 이동

		    $("#routelist").on("click","#modi",function(){

		        var icon= $(this);
		        console.log(icon.attr("value"));
		        viewRoute(icon.attr("value"));

		    });


		    function viewRoute(routeno){
		            $.getJSON("http://14.32.66.127:4000/route/view?routeno="+routeno,function(data){

		                var vo = $(data);

		                if(vo.attr("step")==true){
		                    var $form = $('<form></form>');
		                    $form.attr('action', '/admin/step_kor');
		                    $form.attr('method', 'post');
		                    $form.appendTo('body');
		                    
		                    var a1 = $('<input type="hidden" value="'+ routeno +'" name="routeno">');
		                    var a2 = $('<input type="hidden" value="'+ vo.attr("lat") +'" name="lat">');
		                    var a3 = $('<input type="hidden" value="'+ vo.attr("lng") +'" name="lng">');
		                    
		                    $form.append(a1).append(a2).append(a3);
		                    $form.submit();
		                	
		                 }else{
		                	 
		                	 var $form = $('<form></form>');
		                     $form.attr('action', '/admin/nonstep_kor');
		                     $form.attr('method', 'post');
		                     $form.appendTo('body');
		                     
		                     var a1 = $('<input type="hidden" value="'+ routeno +'" name="routeno">');
		                     var a2 = $('<input type="hidden" value="'+ vo.attr("lat") +'" name="lat">');
		                     var a3 = $('<input type="hidden" value="'+ vo.attr("lng") +'" name="lng">');
		                     
		                     $form.append(a1).append(a2).append(a3);
		                     $form.submit();
		                 }
		            });
		    }

		var route;
		
		   //루트 삭제로 이동
		    $("#routelist").on("click","#del",function(){
		        route= $(this);
		        $("#removeRouteModal").modal('show');
		        var msg = route.attr("value")+"를 삭제하시겠습니까?";
		        $("#removeroute").html(msg);

		    });
		   
		    $("#removeRouteBtn").on("click",function(){
	            removeRoute(route.attr("value"),function(){
	            });

	            $("#removeRouteModal").modal('hide');
	            $("#editModal").modal('hide');
	        });


		    function removeRoute(routeno,callback){

		        console.log("루트 삭제" + routeno);

		        $.ajax({
		            type:"post",
		            url: "http://14.32.66.127:4000/route/remove",
		            headers : {"Access-Control-Allow-Origin":"*","Content-Type":"application/json","X-CSRF-TOKEN":getMetaContentByName('_csrf')},
		            dataType: "json",
		            data : JSON.stringify({routeno:routeno}),
		            success: function(data,status){
		            	console.log("Success 안에서 받은 데이터 : "+data);
		            	console.log(status);
		            },
		            error:function(request,status,error){
		            	getAllRouteList();
		            }
		    	});
		        getAllRouteList();
		    }
		    
		    
		    
 //루트 클릭 시, 멤버 버튼 누름 -> 멤버 리스트 모달 창 
		    
		    $("#routelist").on("click","#member",function(){
		         var icon= $(this);
		         contents=" ";
		         $("#memTable").html(contents);
		         
		         console.log(icon.attr("value"));
		        $("#memberListModal").modal('show');	
		        getMemberList();
		        $("#editModal").modal('hide');

		    });
			 
		    
	        //<!-- member list 출력 -->

	        var memberLi="";

	        function memberList(data) {
	        	console.log("멤버 있음.");
	        	
	            memberLi +="<li>"+data.userName+ "<div class='gly'>"+
	            "<span class='glyphicon glyphicon-pencil' id='modi'value='"+data.memberno+"'></span>" +
	            "<span class='glyphicon glyphicon-remove' id='del' value='"+data.memberno+"'></span></div></li>";

	            $("#memberlist").html(memberLi);

	        }

	        function getMemberList(){
	            $.getJSON("http://14.32.66.127:4000/member/list?routeno="+routeno,function(data){
	            	memberLi = "";
	            	var list = $(data);
	            	console.log(list);
	            	
	            	if(list.length==0){ //멤버 없으면             		
		                var msg = "<li> 멤버를 추가해 주세요.</li>"
		                            +"<li><span class='glyphicon glyphicon-plus' id='memPlus'></span></li>";
		                $("#memberlist").html(msg);
	            	} 

	                list.each(function(idx,value){ //멤버 있으면 
		                var member = this;
	                	memberList(member);
	                });
	            });
	         
	        }
	        
	        
	  //멤버 추가 모달창 
	        
	        $("#memberlist").on("click","#memPlus",function(){
	        	$("#memberModal").modal('show');
	        	console.log("routeno :" + routeno);

		    });
	        
	        $("#regiMemberBtn").on("click",function(){
	        	$("#memberModal").modal('show');
	        	console.log("routeno :" + routeno);
	        });
	        
	        
		    var contents=" ";
		    var i=1;
		    var j=1;
		    var memberJson;
		    
		//멤버 추가 모달 창 - 멤버 테이블  추가 
		    $("#plus").on("click",function(){
	    		    
		    	++i;
		                
		    	contents= "<tr id='tr"+i+"'>"
		            +"<td><input type='text' class='form-control' id='number"+i+"' placeholder='Number'></td>"
		            +"<td><input type='text' class='form-control' id='name"+i+"' placeholder='Name'></td>"
		            +"<td><input type='email' class='form-control' id='email"+i+"' placeholder='email'></td>"
		            +"<td><input type='password' class='form-control' id='password"+i+"'  placeholder='password'></td></tr>"
		          
		            $("#memTable").append(contents);
		            
		    	console.log("i:"+i);

		    });
		    
  		  $("#minus").on("click",function(){
  			
  			  console.log("i:"+i);
  			  
  			  if(i>1){
	  			  var trId="#tr"
	  			  $(trId+i).remove();
	  			  i--;
  			  }

		    });
	
		    
		    function repeat(){
		    	
		    	   var memberfilter = new Array();
				   memberfilter[0] = "userNo";
				   memberfilter[1] = "userName";
				   memberfilter[2] = "email";
				   memberfilter[3] = "mPassword";
		    	 
		    	   var number = "#number"+j;
		    	   var name ="#name"+j;
		    	   var email ="#email"+j;
		    	   var password ="#password"+j;
		    	   var member = new Object();
		    	
		    	   member.userNo = $(number).val();
				   member.userName = $(name).val();
				   member.email=$(email).val();
				   member.mPassword=$(password).val();
				   
				   memberJson = JSON.stringify(member, memberfilter, "\t");

		    }
		    
		    function regiMember(memberJson,routeno,callback){
				 
				 console.log(memberJson);
			 
				   $.ajax({
					  type:'post',
					  url:"http://14.32.66.127:4000/member/register",
					  headers : {
						"Content-Type" : "application/json"  
					  },
					  datatype:"json",
					  data:memberJson,
					  success: function(data){
						  console.log("멤버등록완료")
						  console.log("memberno :"+ data);
						  regiInvite(routeno,data);  
					  }				   
				   });
					   callback();
		   };
		   
		   function regiInvite(routeno,memberno){
			   console.log("-----invite등록 시도--------")
			   console.log("routeno/memberno:",routeno,memberno);
			   
			   $.ajax({
					  type:"post",
					  url:"http://14.32.66.127:4000/member/inviregister",
					  headers : {
						"Content-Type" : "application/json"  
					  },
					  datatype:"json",
					  data:JSON.stringify({routeno:routeno,memberno:memberno}),
					  success: function(data){
						  console.log("invite 등록 처리 :"+data);
						  console.log("==invite 등록완료!!==");
						  getMemberList();
					  }				   
				   });
			   
		   }

		  
		    
		    function emptyMember(){
				   $("#number1").val("");
				   $("#name1").val("");
				   $("#email1").val("");
				   $("#password1").val("");
			}
			   
		    
		    $("#registerBtn").on("click",function(){
		    	
		    	console.log("routeno :"+routeno);
		    	
	    		 for(var k=1;k<i+1;k++){
	    			 repeat();
	    			 
	    			 var mem = JSON.parse(memberJson);
				    	console.log(mem.userNo);
				    	if(!mem.userNo||!mem.userName||!mem.email||!mem.mPassword){
				    		
				    		alert("멤버 번호를 입력하세요!");
				    		return;
				    	}
				    	
	    			 regiMember(memberJson,routeno, function(){	    	
				    	  console.log("멤버등록 시도");		    	   
				      });
	    			 j++;
	    		 }

			       $("#memberModal").modal('hide');	
	    		   alert("멤버등록이 완료되었습니다.")
	    		   emptyMember();
	    		   getMemberList();
	    		   i=1;
	    		   j=1;
	    		   console.log("i:"+i+"j:"+j);
			    });
		    
		    
		    $("#regiCancleBtn").on("click",function(){
		    	i=1;
		    	j=1;
		    	console.log("멤버등록 취소");
		    	console.log("i:"+i+"j:"+j);
		    	 emptyMember();
		    	 getMemberList();
		    	
		    });
		    
	    
	
		    //멤버 삭제 
		    
		    $("#memberlist").on("click","#del",function(){
	        	var select = $(this);
	        	var memberno = select.attr("value");
	        	console.log("멤버삭제 "+memberno);
	        	
	        	inviRemove(routeno,memberno);
	        	//memberRemove(memberno);
	        	
	        	//getMemberList();

		    });
	        
		     
	        function inviRemove(routeno,memberno){
	        	
	        	  console.log("invite 삭제",routeno,memberno);

	        	  $.ajax({
					  type:'post',
					  url:"http://14.32.66.127:4000/member/inviteremove",
					  headers : {
						"Content-Type" : "application/json"  
					  },
					  datatype:"json",
					  data:JSON.stringify({routeno:routeno,memberno:memberno}),
					  success: function(data){
			            	console.log("memberno:"+memberno+"invite 삭제 완료" +data);
			            	memberRemove(memberno);
					  }				   
				   });
			    }
	    
	     
	        function memberRemove(memberno){
	        	console.log("member 삭제", memberno);
	        	
	        	 $.ajax({
					  type:'post',
					  url:"http://14.32.66.127:4000/member/remove",
					  headers : {
						"Content-Type" : "application/json"  
					  },
					  datatype:"json",
					  data:JSON.stringify({memberno:memberno}),
					  success: function(data){
			            	console.log("memberno:"+memberno+"member 삭제 완료 "+data);
			            	getMemberList();

					  }				   
				   });

	        }

	        
	        
 // <!-- 멤버 수정 -->
	        
	        
	 var memNumber;       
	     
	        $("#memberlist").on("click","#modi",function(){
	        	var select = $(this);
	        	memNumber = select.attr("value");
	        	console.log("멤버수정 "+memNumber);
	        	
	        	$("#modiMemberModal").modal('show');
	        	viewMember(memNumber);
		    });
	     

	     function viewMember(memNumber){
	    	 $.getJSON("http://14.32.66.127:4000/member/view?memberno="+memNumber,function(data){
	    		 
	    		 var member = $(data);
	    		 
	    		 console.log(member);

	    		 $("#modinumber").val(member.attr("userNo"));
	    		 $("#modiname").val(member.attr("userName"));
	    		 $("#modiemail").val(member.attr("email"));
	    		 $("#modipassword").val(member.attr("mPassword"));
	    		 
	    	 });
	    	 
	     }
	     
	     
         $("#modiMemberBtn").on("click",function(){
        	 
        	 console.log("멤버수정 시도!")
        	 
        	var userNo = $("#modinumber").val();
        	var userName = $("#modiname").val(); 
    		var email = $("#modiemail").val();
    		var mPassword = $("#modipassword").val();
        	 
        	 
        	 modifyMember(memNumber,userNo,userName,email,mPassword);
        	 
        	 $("#modiMemberModal").modal('hide');
        	 
        	 
         });
         
         function modifyMember(memNumber,userNo,userName,email,mPassword){
        	 
			 console.log(memNumber,userNo,userName,email,mPassword);
			 
			   $.ajax({
				  type:'post',
				  url:"http://14.32.66.127:4000/member/modify",
				  headers : {
					"Content-Type" : "application/json"  
				  },
				  datatype:"json",
				  data:JSON.stringify({memberno:memNumber,userNo:userNo,userName:userName,email:email,mPassword:mPassword}),
				  success: function(data){
					  console.log("멤버 수정 완료");
					  console.log(data);
					  getMemberList();

				  }				   
			   });
				
	   };
 
	        
	</script>
 <!-- Core JavaScript Files -->

	<script src="/js/gnmenu.js"></script>
	<script src="/js/jquery.scrollTo.js"></script>
	<script src="/js/custom.js"></script>
	<script src="/js/classie.js"></script>
    
</body>
</html>