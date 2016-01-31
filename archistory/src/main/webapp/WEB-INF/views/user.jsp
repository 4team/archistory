<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Ninestars bootstrap 3 one page template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

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
.img-responsive{
position: absolute;
}
#routeList{
display:none;
overflow-y:scroll;
z-index: 100;
}
#myRouteList{
font-size: 24px;
color: white;
font-weight: bold;
text-align: center;
}
ul li{
list-style:none;
}
#closeList{
position:fixed;
}
#yesModal{
display:none;
z-index:9999;
top:10%;
}
</style>

<style>
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
</style>

 
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    
    
    <!-- Core JavaScript Files -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min2.js"></script>
    <script src="js/jquery.easing.min.js"></script>	
	<script src="js/classie.js"></script>
	<script src="js/gnmenu.js"></script>
	<script src="js/jquery.scrollTo.js"></script>
	<script src="js/nivo-lightbox.min.js"></script>
	<script src="js/stellar.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="js/custom.js"></script>


<body data-spy="scroll">


<div class="menu">
			<ul id="gn-menu" class="gn-menu-main">
<li class="gn-trigger">
					<a class="gn-icon gn-icon-menu"><span>Menu</span></a>
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">
								<li><a href="/" class="gn-icon gn-icon-cog">Home</a></li>
								<li><a href="#about" class="gn-icon gn-icon-download" id="routeList">Tour Route</a></li>
								
									<ul  id="myRouteList"></ul>
									
								<li><a href="/sboard/usage" class="gn-icon gn-icon-help">Usage</a></li>
								<li><a href="/sboard/list" class="gn-icon gn-icon-archive">Reviews</a></li>
								<li><a href="#" class="gn-icon gn-icon-download">App Download</a></li>
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

	<!-- Section: intro -->
    <section id="intro" class="intro">
		<div class="slogan">
			<h1>Archistory</h1>
			<p>If you use it, You can see it. And it's not the same history as before.</p>
		<a class="btn btn-skin" id="list">Start</a>
		</div>	
    </section>
	<!-- /Section: intro -->
			
			
			<!-- 루트리스트 뜨는 어두운전체창 -->
			<div class="nivo-lightbox-overlay nivo-lightbox-theme-default nivo-lightbox-effect-fadeScale nivo-lightbox-open" id="routeList">
			<div class="nivo-lightbox-wrap">
			<div class="nivo-lightbox-content">

						<p id="myRouteList">
						</p>
						
			</div>
			</div>
					<a href="#" class="nivo-lightbox-close" id="closeList" title="Close"></a>
			</div>
			<!-- END 루트리스트 뜨는 어두운전체창 -->


				<!-- 이 루트 들어갈건지 묻는 창 -->
	<div class="modal" id="yesModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span></button>
                <h4 class="modal-title">Do you wanna travel this route?</h4>
            </div>
            <div class="modal-body">
           
				<h3 class="modal-title" id="yesNo">
                    <ul></ul>
                </h3>
                
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
		<!-- END 이 루트 들어갈건지 묻는 창 -->


<script>
//route list 보이기

$("#list").on("click",function(){
	 $("#routeList").show();	 	
});

$("#closeList").on("click",function(){
	 $("#routeList").hide();	 	
});

var routeLi = "";

    function addList(route) {
        routeLi += "<li data-lat='"+route.lat+"' data-lng='"+route.lng+"' data-routename='"+route.routename+"' data-routeno='"+route.routeno+"'>" + route.routename + "</li>";
        $("#myRouteList").html(routeLi);
    }

    function getAllRouteList(){
	    $.getJSON("http://14.32.66.127:4000/route/listAll", function(data){
	        var list = $(data);

			routeLi = "";
	        list.each(function(idx,value){
	            var route = this;
	            addList(route);
	        });
	    });
    }
    
    getAllRouteList();
    
    function getMetaContentByName(name,content){
    	var content = (content == null)?'content':content;
    	return document.querySelector("meta[name='"+name+"']").getAttribute(content);
    }
 
 //myRoutelist 에서   route 이름 클릭하면  
    $("#myRouteList").on("click","li",function(event){
	       var select = $(this);
	       var routeno = parseInt(select.attr("data-routeno"));
	      
	       questionModal(select);
	       $("#yesModal").modal('show');
	    });
  
    function questionModal(select){
        var questionModal =   "<li>" + select.attr("data-routename")+
        "<a class='btn btn-skin' id='yes' value='"+select.attr("data-routeno")+"'>YES</a>"+
        "<a class='btn btn-skin' id='no' value='"+select.attr("data-routeno")+"'>NO</a>";

        $("#yesNo").html(questionModal);
    }

    $("#yesNo").on("click","#yes",function(){
        var icon= $(this);
        console.log(icon.attr("value"));
        viewRoute(icon.attr("value"));
    });
    
    $("#yesNo").on("click","#no",function(){
        $("#yesModal").modal('hide');
    });
    
  
    function viewRoute(routeno){
        $.getJSON("http://14.32.66.127:4000/route/view?routeno="+routeno,function(data){
            console.log("루트 넘버:"+routeno+"읽어오기");

            var vo = $(data);
            console.log("vovovovo:" + vo);

            if(vo.attr("step")==true){
                var $form = $('<form></form>');
                $form.attr('action', '/userStep');
                $form.attr('method', 'post');
                $form.appendTo('body');
                
                var a1 = $('<input type="hidden" value="'+ routeno +'" name="routeno">');
                var a2 = $('<input type="hidden" value="'+ vo.attr("lat") +'" name="lat">');
                var a3 = $('<input type="hidden" value="'+ vo.attr("lng") +'" name="lng">');
                
                $form.append(a1).append(a2).append(a3);
                $form.submit();
            	
             }else{
            	 
            	 var $form = $('<form></form>');
                 $form.attr('action', '/userNstep');
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



</body>
</html>
