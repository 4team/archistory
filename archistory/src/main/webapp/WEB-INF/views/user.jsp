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

    <title> Archistory for USER </title>


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
#closeList{
position:fixed;
}
#yesModal{
display:none;
z-index:9999;
}
.rName{
list-style:none;
overflow: hidden; 
text-overflow: ellipsis;
white-space: nowrap; 
font-size:17px;
border-radius:1em;
}
.rr{
animation-duration: 3s;
animation-name: slidein;
text-overflow:ellipsis;
white-space:nowrap;
word-wrap:normal
}
.rNameModal{
list-style:none;
font-size:20px;
text-align:center;
}


         #upper-login{
        	padding:5px;
       		position:absolute;
        	z-index:3000;
        	right: 10px;
        	top:5px;
        }
        
	   	#userInfo{
	   		position:absolute;
	   		border-radius : 10px;
	   		padding:2px;
	   		text-align:center;
	   		border:1px solid;
	   		display:none;
	   		top:35px;
	   		right:6px;
	   		text-align:left;
	   		z-index:400;
	   		width:100px;
	   		height:70px;
	   		background-color: #303336;
	   	}
	   	
	   	#userInfo:hover{
	   		margin-top:1px;
	   		margin-right:1px;
        	border : 1px solid;
        	border-color:#aef;
        	box-shadow:0 0 8px #fff;
        }
        
        #userInfo li{
        	text-align:center;
        }
        
        #userInfo a{
        	color:#2169C1;
        }
        
       #userInfo a:hover{
       		text-decoration:none;
        	color:#aef;
        }
    
        .fa{
		position:absolute;
		}
		.fa-home{
		top:20px;
		left:22px;
		}
		.fa-map-marker{
		top:82px;
		left:24px;
		}
		.fa-question{
		top:143px;
		left:24px;
		}
		.fa-book{
		top:204px;
		left:22px;
		}
		.fa-download{
		top:264px;
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
#menuRouteList{
         display:none;
            position:absolute;
            overflow-y:scroll;
        }
</style>

  
	 <!-- Core JavaScript Files -->
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.easing.min.js"></script>	
	<script src="js/classie.js"></script>
	<script src="js/gnmenu.js"></script>
	<script src="js/jquery.scrollTo.js"></script>
	<script src="js/nivo-lightbox.min.js"></script>
	<script src="js/stellar.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="js/custom.js"></script>
    
<body>

<div class="menu">
			<ul id="gn-menu" class="gn-menu-main">
<li class="gn-trigger">
					<a class="gn-icon gn-icon-menu"><span>Menu</span></a>
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">
								<li><i class="fa fa-home"></i><a href="/" class="gn-icon gn-icon-cog">Home</a></li>
								<li><i class="fa fa-map-marker"></i><a href="#about" class="gn-icon gn-icon-download" id="routeShow">Tour Route</a></li>
								
									<ul  id="menuRouteList"></ul>
									
								<li><i class="fa fa-question"></i><a href="/sboard/usage" class="gn-icon gn-icon-help">Usage</a></li>
								<li><i class="fa fa-book"></i><a href="/sboard/list" class="gn-icon gn-icon-archive">Reviews</a></li>
								<li><i class="fa fa-download"></i><a href="#" class="gn-icon gn-icon-download">App Download</a></li>
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
</ul>
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
	<!--   fasdfsafdasda -->
	<div id="upper-login">
		<button type="button" id="myInfo" data-src="${memberno}"
			class="btn btn-primary btn-xs">
			<font face="verdana" size="2">${name}님</font>
		</button>
		<ul id="userInfo">
			<li><a id="myInfo">My Info</a></li>
			<li><a href="/user/logout">Logout</a></li>
		</ul>
	</div>

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
                <h4 class="modal-title">Travel this route?</h4>
            </div>
            <div class="modal-body">
           
				<h3 class="modal-title" id="yesNo">
                    <ul></ul>
                </h3>
                
            </div>
            <!-- <div class="modal-footer" id="yesNoFooter">
            </div> -->
        </div>
    </div>
</div>
		<!-- END 이 루트 들어갈건지 묻는 창 -->


<!-- ★로그인 모달 -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="routeCreateModalLabel" aria-hidden="false" >
    <div class="modal-dialog" id="loginBody">

	

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="loginModalLabel">로그인</h4>
            </div>
           <form name="loginForm"  id="loginForm" action="/user/login" method="post">
            <div class="modal-body" id="loginH">
                <div id="loginDiv">
                    <div class="radio">
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


<script>

var memberno = ${memberno};

//route list 보이기
$("#list").on("click",function(){
	 $("#routeList").show();	 	
});
$("#closeList").on("click",function(){
	 $("#routeList").hide();	 	
});
var routeLi = "";
    function addList(route) {
        routeLi += "<li class='rName'  style='border:2px outset white; margin:10px 10px 10px 10px;' data-lat='"+route.lat+"' data-lng='"+route.lng+"' data-routename='"+route.routename+"' data-routeno='"+route.routeno+"'><div class='rr'>" + route.routename + "</div></li>";
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
        var questionModal =   "<li class='rNameModal'>'" + select.attr("data-routename")+"'</li><br>"+
        "<a style='float:right;' class='btn btn-skin' id='yes' value='"+select.attr("data-routeno")+"'>YES</a><br>"+
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
                var a4 = $('<input type="hidden" value="'+ memberno +'" name="memberno">');
                
                $form.append(a1).append(a2).append(a3).append(a4);
                $form.submit();
            	
             }else{
            	 
            	 var $form = $('<form></form>');
                 $form.attr('action', '/userNstep');
                 $form.attr('method', 'post');
                 $form.appendTo('body');
                 
                 var a1 = $('<input type="hidden" value="'+ routeno +'" name="routeno">');
                 var a2 = $('<input type="hidden" value="'+ vo.attr("lat") +'" name="lat">');
                 var a3 = $('<input type="hidden" value="'+ vo.attr("lng") +'" name="lng">');
                 var a4 = $('<input type="hidden" value="'+ memberno +'" name="memberno">');
                 
                 $form.append(a1).append(a2).append(a3).append(a4);
                 $form.submit();
             }
        });
}
    
    

    $("#loginBtn").on("click",function(){
        $("#loginModal").modal('show');
    });

    	
   	$("#joinBtn").on("click",function(){
   		$("#joinModal").modal('show');
   	});
   	
   	
</script>
	 <!-- Core JavaScript Files -->
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.easing.min.js"></script>	
	<script src="js/classie.js"></script>
	<script src="js/gnmenu.js"></script>
	<script src="js/jquery.scrollTo.js"></script>
	<script src="js/nivo-lightbox.min.js"></script>
	<script src="js/stellar.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="js/custom.js"></script>
    

</body>
</html>