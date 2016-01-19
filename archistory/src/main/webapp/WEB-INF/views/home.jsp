<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
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
	    }
    
      .glyphicon{
            display: inline;
            margin : 10px;
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

	    #locationGly{
	        color:#FFF;
	        font-size:24px;
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
  	<link href="Cesium/Build/Cesium/Widgets/widgets.css" rel="stylesheet"/>
	<script src="Cesium/Build/Cesium/Cesium.js"></script>
<body>

<div id="menu">

<div class="dropdown">
  <a id="mDrop" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
    	<span class="glyphicon glyphicon-menu-hamburger" id=""></span>
  </a>

        <ul class="dropdown-menu" role="menu">
            <li role="presentation"><a role="menuitem" tabindex="-1" href="/">Home</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" id="routeList">Tour Route</a></li>

				<ul  id="myRouteList">
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







<!-- ★로그인 모달 -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="routeCreateModalLabel" aria-hidden="true" >
    <div class="modal-dialog" id="loginBody">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="loginModalLabel">로그인</h4>
            </div>
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

                    <input type="text" class="form-control" id="loginEmail" placeholder="Email"><br>
                    <input type="text" class="form-control" id="loginPassword" placeholder="Password"><br>
                </div>

            </div>
            <div class="modal-footer"><center>
                <button type="button" id="loginCancelBtn" class="btn btn-default" data-dismiss="modal">취소</button>
                <button type="button" id="loginSubmitBtn" class="btn btn-primary">로그인</button></center>
            </div>
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
	    <input type="text" class="form-control" id="email" placeholder="Email"><br>
	    <input type="text" class="form-control" id="password1" placeholder="Password"><br>
	    <input type="text" class="form-control" id="password2" placeholder="Password (Again)"><br>   
	    <input type="text" class="form-control" id="username" placeholder="UserName"><br>
    </div>
    <div id="adminJoinDiv">
	    <input type="text" class="form-control" id="adminEmail" placeholder="Email"><br>
	    <input type="text" class="form-control" id="adminpassword1" placeholder="Password"><br>
	    <input type="text" class="form-control" id="adminpassword2" placeholder="Password (Again)"><br>
    	<input type="text" class="form-control" id="adminname" placeholder="UserName"><br>
	    <input type="text" class="form-control" id="phone" placeholder="Phone Number"><br>
	    <input type="text" class="form-control" id="nation" placeholder="Nation"><br>   
    </div>
</div>

            </div>
            <div class="modal-footer">
                <center><button type="button" id="eventCreateCancelBtn" class="btn btn-default" data-dismiss="modal">취소</button>
                <button type="button" id="eventCreateBtn" class="btn btn-primary">회원가입</button></center>
            </div>
        </div>
    </div>
</div>

<!-- route modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
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
                        <th>연락처</th>
                        <th>이메일</th>
                        <th>루트완료여부</th>
                        <th>점수</th>
                    </tr>
                    <tr>
                       <td><input type="text" class="form-control" placeholder="Number"></td>
                        <td><input type="email" class="form-control"  placeholder="Name"></td>
                        <td><input type="tel"  class="form-control" name="usertel" placeholder="Phone" ></td>
                        <td><input type="email" class="form-control" name="useremail"  placeholder="Email"></td>
                        <td style="width:90px"><select class="form-control">
                            <option>미완료</option>
                            <option>완료</option>
                        </select></td>
                        <td><input type="text" class="form-control"name="point" placeholder="Score"></td>
                    </tr>
                </table>
                <table id="memTable">

                </table>
                <span class='glyphicon glyphicon-plus' id="plus"></span>

            </div>
            <div class="modal-footer">
                <button type="button" id="registerBtn" class="btn btn-create">등록</button>
                <button type="button" id="regiCancleBtn" class="btn btn-default" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>



<div id="cesiumContainer"></div>

<div id="myLocation"><span id="locationGly" class="glyphicon glyphicon-map-marker"></span></div>

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
    viewer = new Cesium.Viewer('cesiumContainer', {
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

    $("#cesiumContainer").on("click",function(){
        console.log("드래그");
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
    console.log("화면 전환 : ", lat, ' ', lng, ' ', height);
    self.location="close.html?lat="+lat+"&lng="+lng;
}


$("#myLocation").on("click",function(){

    stopAround();
    //초기 위치 읽어내서 지구를 이동시킨다.
    navigator.geolocation.getCurrentPosition(success, error);

    function success(position) {
    	 stopAround();
        console.log(position);
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
	
$("#loginSubmitBtn").on("click",function(){
    var email = $("#loginEmail").val();
    var password = $("#loginPassword").val();

    var loginType = $("#loginDiv .radio input:radio[name='loginType']:checked").val();

    console.log(email,password,loginType);

    $.ajax({
        type:'post',
        url: "http://192.168.0.36:8080/admin/login",
        headers: {
            "Content-Type": "application/json"},
        dataType: "json",
        data:JSON.stringify({email:email,password:password}),
        success: function(data){
            console.log(data);
            if(data=='LOGIN'){
                console.log("로그인 되었습니다.");
            };
        }
    });

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
	
	  
    getRouteList();
    var routeLi = "";
	  
	    function addList(route) {
	        routeLi += "<li data-lat='"+route.lat+"' data-lng='"+route.lng+"' data-routename='"+route.routename+"' data-routeno='"+route.routeno+"'>"+ route.routename + "<small data-routeno='"+route.routeno+"'>X</small></li>";
	        $("#myRouteList").html(routeLi);
	    }
	    
	    function getRouteList(){

	    $.getJSON("http://192.168.0.36:8080/route/listAll",function(data){
	        var list = $(data);
	        console.log(data);
	        routeLi="";

	        list.each(function(idx,value){
	            var route = this;
	            addList(route);
	        });
	    });
	    }

	    
	    function getMetaContentByName(name,content){
	    	var content = (content == null)?'content':content;
	    	return document.querySelector("meta[name='"+name+"']").getAttribute(content);
	    }
	    
	
	    
	    $("#myRouteList").on("click","li",function(event){
	       var select = $(this);
	       var routeno = parseInt(select.attr("data-routeno"));
	       
	       $("#editModal").modal('show');
	       editRoute(select);
	    });

	    
	    $("#routeList").on("click",function(){
	    	 $("#myRouteList").show();
	    	 
	    });
	    
	    

	    function editRoute(select){
	        var editRoute ="<li>" + select.attr("data-routename")+ "<div class='gly'><span class='glyphicon glyphicon-user' id='member' value='"+select.attr("data-routeno")+"'></span>" +
	                "<span class='glyphicon glyphicon-pencil' id='modi' value='"+select.attr("data-routeno")+"'></span>" +
	                "<span class='glyphicon glyphicon-remove' id='del' value='"+select.attr("data-routeno")+"'></span></div></li>";

	        $("#routelist").html(editRoute);
	    }
	    //멤버 입력

	    $("#routelist").on("click","#member",function(){
	         var icon= $(this);
	         console.log(icon.attr("value"));
	        $("#memberModal").modal('show');
	        $("#editModal").modal('hide');

	    });

	    //루트 수정 페이지로 이동

	    $("#routelist").on("click","#modi",function(){

	        var icon= $(this);
	        console.log(icon.attr("value"));
	        viewRoute(icon.attr("value"));

	    });


	    function viewRoute(routeno){
	            $.getJSON("http://192.168.0.36:8080/route/view?routeno="+routeno,function(data){
	                console.log("루트 넘버:"+routeno+"읽어오기");

	                var vo = $(data);
	                console.log(vo);

	                if(vo.attr("step")==true){
	                 self.location = "stepevent.html?lat="+vo.attr("lat")+"&lng="+vo.attr("lng")+"&step="+vo.attr("step")+"&routeno="+routeno;
	                 }else{
	                 self.location = "nonstepevent.html?lat="+vo.attr("lat")+"&lng="+vo.attr("lng")+"&step="+vo.attr("step")+"&routeno="+routeno+"&routename="+vo.attr("routename");
	                 }
	            });
	    }


	   //루트 삭제로 이동
	    $("#routelist").on("click","#del",function(){
	       var route= $(this);
	        $("#removeRouteModal").modal('show');
	        var msg = route.attr("value")+"를 삭제하시겠습니까?";
	        $("#removeroute").html(msg);


	        $("#removeRouteBtn").on("click",function(){
	            removeRoute(route.attr("value"),function(){

	            });

	            $("#removeRouteModal").modal('hide');
	            $("#editModal").modal('hide');
	        });

	    });


	    function removeRoute(routeno,callback){

	        console.log("루트 삭제" + routeno);
	        console.log(getMetaContentByName('_csrf'));

	        $.ajax({
	            type:"post",
	            url: "http://192.168.0.36:8080/route/remove",
	            headers : {"Access-Control-Allow-Origin":"*","Content-Type":"application/json","X-CSRF-TOKEN":getMetaContentByName('_csrf')},
	            dataType: "json",
	            data : JSON.stringify({routeno:routeno}),
	            success: function(data){
	                 console.log("성공");
	            }
	            
	            });
	        getRouteList();
	        callback();
	    }
	    
	  /*   $("#myRouteList").on("click","small",function(event){
	        var select = $(this);
	       var routeno = parseInt(select.attr("data-routeno"));
	       console.log(getMetaContentByName('_csrf'));
	       
	        $.ajax({
	            type:"post",
	            url: "http://192.168.0.36:8080/route/remove",
	            headers : {"Access-Control-Allow-Origin":"*","Content-Type":"application/json","X-CSRF-TOKEN":getMetaContentByName('_csrf')},
	            dataType: "json",
	            data : JSON.stringify({routeno:routeno}),
	            success: function(data){
	                if(data=="result"){
	                 console.log("성공");
	                }
	                console.log("삭제되었다.");
	                }
	            });
	    });
 */

	    $("#registerBtn").on("click",function(){
	       alert("멤버등록이 완료되었습니다.");
	    });

	    var contents ;

	    $("#plus").on("click",function(){


	                contents+=  "<tr>"
	            +"<td><input type='text' class='form-control' placeholder='Number'></td>"
	            +"<td><input type='email' class='form-control'  placeholder='Name'></td>"
	            +"<td><input type='tel'  class='form-control'  placeholder='Phone' ></td>"
	            +"<td><input type='email' class='form-control'  placeholder='Email'></td>"
	            +"<td style='width:90px'><select class='form-control'><option>미완료</option><option>완료</option></select></td>"
	            +"<td><input type='text' class='form-control'name='point' placeholder='Score'></td></tr>"
	        $("#memTable").html(contents);

	    });


	    $("#routeList").on("click",function(){
	    	 $("#myRouteList").toggle();
	    	 
	    });

	    
</script>
<script src="/Cesium/js/map.js"></script>
</body>
</html>