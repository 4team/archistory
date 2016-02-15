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
			overflow:auto;
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
				position:absolute;
				top:30%;
				z-index:3000;
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
        	z-index:99;
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
	   		top:40px;
	   		right:6px;
	   		text-align:left;
	   		z-index:400;
	   		width:100px;
	   		height:70px;
	   		background-color: #303336;
	   	}
	   	
	   	#myPageModalLabel{
	   		text-align: center;
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
        
                
        a{
        text-decoration : none;
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
        #loginDiv{
        	text-align: center;
        }
       #loginBody{
	        top:150px;
	        z-index:2000;
	    	max-width:300px;
	    }
	
	    #loginH{
	        max-height:180px;
	    }
        input{
        	width:200px;
        }
        #finishedDiv{
        	text-align: center;
        }
        #finishedDiv pre{
        	width:50%;
        }
        #finishedDiv p{
        	text-align: center;
        }
        
        
        #imgDiv{
          	margin:auto;
          	padding:0px;
      	}
        
      #imgDiv img{
      		margin:auto;
      		margin-bottom : 10px;
	        width:200px;
	        height:200px;
	        display:block;
        }
        
        #routePage{
        max-height:400px;
        	overflow-y:scroll;
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
        
        #pageBtn{
        	position:absolute;
	        width:140px;
	        margin-left:-70px;
        	left:50%;
        }
        
        #pageBtn p{
        	float:right;
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


    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    
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
			class="btn btn-primary">
			<font face="verdana" size="2">${name}님</font>
		</button>
		<ul id="userInfo">
			<li><a id="showInfo"> My Info </a></li>
			<li><a id="myPage"> My Page </a></li>
			<li><a href="/user/logout"> Logout </a></li>
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
	<div class="modal fade" id="yesModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="false">
    <div class="modal-dialog">
        <div class="modal-content"  id="yesModalContent">
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




<!--  myProfile modal -->

<div class="modal fade" id="myProfileModal" tabindex="-1" role="dialog" aria-labelledby="myProfileModalLabel" aria-hidden="false">
    <div class="modal-dialog">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span></button>
                <h4 class="modal-title">My Profile</h4>
            </div>
            <div class="modal-body">
				      <div id="imgDiv">
			    </div>   
                
                   <table id="profile" align="center">
	                    <tr><td>NAME &nbsp :&nbsp </td><td><input type='text'  id="proName" class="form-control" placeholder='Name' ></td></tr>
			            <tr><td>E-MAIL &nbsp:&nbsp </td><td><input type='email'  id="proEmail" class="form-control" placeholder='Email' readonly></td></tr>
			            <tr><td>PASSWORD&nbsp:&nbsp </td><td><input type='password'  id="proPassword" class="form-control" placeholder='Password'></td></tr>
			            <tr><td>PASSWORD&nbsp:&nbsp<br>&nbsp(AGAIN)&nbsp</td><td><input type='password' class="form-control"  id="proPassword1" placeholder='Password(Again)'></td></tr>
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


<!-- my Page Modal -->

<div class="modal fade" id="myPageModal" tabindex="-1" role="dialog" aria-labelledby="routeCreateModalLabel" aria-hidden="false" >
    <div class="modal-dialog">

        <div class="modal-content" id="routePage">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myPageModalLabel">Finished Route</h4>
            </div>
            <div class="modal-body">
            
                <div id="finishedDiv">
                    <input type="text" class="form-control" name ="email" id="email" placeholder="Email"><br>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Password"><br>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" id="loginCancelBtn" class="btn btn-default" data-dismiss="modal">OK</button>
            </div>
        </div>

    </div>
</div>


<meta name="_csrf" content="${_csrf.token }"/>
<meta name="_csrf_header" content="${_csrf.headerName }"/>

<!-- ★로그인 모달 -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="routeCreateModalLabel" aria-hidden="false" >
    <div class="modal-dialog" id="loginBody">

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="loginModalLabel">로그인</h4>
            </div>
           <form name="loginForm"  id="loginForm" action="/user/login_process" method="post">
            <div class="modal-body" id="loginH">
                <div id="loginDiv">

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


<div class="modal fade" id="alertFirst" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="position:absolute; top:40%; width:100%; text-align: center; font-weight: bold;">
        <div class="panel panel-danger">
            <div class="panel-heading">
                <div>첫페이지 입니다.</div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="alertLast" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="position:absolute; top:40%; width:100%; text-align: center; font-weight: bold;">
        <div class="panel panel-danger">
            <div class="panel-heading">
                <div>마지막페이지 입니다.</div>
            </div>
        </div>
    </div>
</div>


<!-- 사용자 이미지 입력하는 곳 -->
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
           		<form id='form1' action='/memberImgUpload' method='post' enctype='multipart/form-data' target="zeroFrame">
           			<input type='file' name='file' id="file">
           		<iframe name="zeroFrame" style="height:30px; border:0px;"></iframe>
            </div>
            <div class="modal-footer">

                	<button type="button" id="cancleImgBtn" class="btn btn-default" data-dismiss="modal">CANCLE</button>
           			<button type='button' id="imgSubmit" class="btn btn-primary">SAVE</button>
           		</form>
            </div>
        </div>
    </div>
</div>

	<div class="modal fade" id="secretModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="false">
    <div class="modal-dialog">
        <div class="modal-content"  id="yesModalContent">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span></button>
                <h4 class="modal-title">Input Route Password</h4>
            </div>
            <div class="modal-body">
                <label>Password</label><input type='password' id="routeSecret" class="form-control">
                <button id="secretBtn">OK</button>
            </div>
            <!-- <div class="modal-footer" id="yesNoFooter">
            </div> -->
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
    
//admin myinfo page
$("#myInfo").on("click",function(){
	if(memberno !=0){
		$("#userInfo").toggle();
	}else{
		$("#loginModal").modal('show');
	}
});


$("#imgDiv").on("click",function(){
	$("#imgModal").modal('show');	
});


$("#imgSubmit").on("click",function(event){
	event.preventDefault();
	$("#imgModal").modal('hide');
	var formData = new FormData();
	console.log($("#file")[0].files[0]);
	formData.append("file",$("#file")[0].files[0]);
	formData.append("memberno",memberno);
	formData.append("img",$("#file")[0].files[0].name);
	
	$.ajax({
		url:"http://14.32.66.127:4000/memberImgUpload",
		data:formData,
		datatype:'text',
		processData:false,
		contentType:false,
		type:'post',
		success:function(data){
			console.log("멤버이미지 첨부 성공 DATA : "+data);
			$("#imgDiv").html("<img class='img-circle' src='http://14.32.66.127:4000/displayFile?fileName=/member/"+data+"'>");
		}
	});
	
});


	$("#showInfo").on("click",function(){
		if(memberno != 0){
			$.getJSON("http://14.32.66.127:4000/member/view?memberno="+memberno,function(data){
				var memberVO = $(data)[0];
				
				$("#proEmail").val(memberVO.email);
				$("#proName").val(memberVO.userName);
				
				var dbimg = memberVO.img;
				
				 if(dbimg==null){  
					   var imgTag=" <img class='img-circle' id='poto' src ='/img/profile.png'>";
						$("#imgDiv").html(imgTag); 
				   }else{
				   
					   var imgAddr="http://14.32.66.127:4000/displayFile?fileName=/member/"+dbimg;
					   var imgTag1="<img class='img-circle' id='poto' src ='"+imgAddr+"'>";
						$("#imgDiv").html(imgTag1); 
				   }
				   
				
			})
   			$("#myProfileModal").modal('show');
		}
	});

	
	$("#myPage").on("click",function(){
		$("#finishedDiv").html("");
		
		$.getJSON("http://14.32.66.127:4000/participate/finishList?memberno="+memberno,function(data){

			var list = $(data);
			
			list.each(function(){
				
				var str ="<center><pre onclick='viewFinishRoute("+this.routeno+",0)'>"+this.routename+"</pre></center>";
				$("#finishedDiv").append(str);
				
			});
			
		})

			$("#myPageModal").modal('show');
	});

	var lastPage = null;
	function viewFinishRoute(routeno,page){
		$.ajax({
			url:"http://14.32.66.127:4000/participate/finishRouteCount",
			data:JSON.stringify({memberno:memberno,routeno:routeno}),
			datatype:'json',
	        headers: {
	            "Content-Type":"application/json"},
			type:'post',
			success:function(data){
				console.log("멤버 피니쉬 루트 갯수 : "+data);
				lastPage = data;
			}
		});
		
		
		if(page == -1){
			$("#alertFirst").modal("show");
			page = 0;
		}else if(page == lastPage){
			$("#alertLast").modal('show');
			return;
		}
			console.log(page);
		
		var curpage = page;
		
		$.getJSON("http://14.32.66.127:4000/participate/finishRoute?memberno="+memberno+"&routeno="+routeno+"&page="+page,function(data){
				var FinishRouteVO = $(data)[0];
				var str ="<center><pre>Route Name</pre></center>";
				str+="<p>"+FinishRouteVO.routename+"</p>";
				str+="<center><pre>Route Creator</pre></center>";
				str+="<p>"+FinishRouteVO.username+"</p>";
				str+="<center><pre>Finished Date</pre></center>";
				var lastdate = new Date(FinishRouteVO.lastdate);
				str+="<p>"+lastdate.toLocaleDateString()+"  "+lastdate.toLocaleTimeString()+"</p>";
				str+="<center><pre>My Score</pre></center>";
				str+="<p>"+FinishRouteVO.score+"</p>";
				str+="<center><pre>My Ranking</pre></center>";
				str+="<div id='pageBtn'><p id='pageBtnP'>";
				
				if(curpage != 0){
					str+="<button class='btn btn-primary' onclick='viewFinishRoute("+routeno+","+(curpage-1)+")'>◀</button>";
				}
				
				str+= "  "+(page+1)+"/"+lastPage+"  ";
				
				if(curpage != (lastPage-1)){
					str+="<button class='btn btn-primary' onclick='viewFinishRoute("+routeno+","+(curpage+1)+")'>▶</button>";
				}
				
				str+="</p></div><br>";
				
				$("#finishedDiv").html(str);
				
				if(curpage == (lastPage-1)){
					$("#pageBtn").children("p").css("float","left");
				}
			
		}).error(function() {$("#alertLast").modal('show'); });
	}

// 나의 위치를 읽어온다.
window.addEventListener('deviceorientation',getLocation);

var myLat;
var myLng;
var distance;
var num=0;
	// 내 위치 잡기
function getLocation(){
    console.log("[ 지오로케이션 실행 ]");
	   
    	navigator.geolocation.getCurrentPosition(function(position){
		        var lt = position.coords.latitude;
		        var ln = position.coords.longitude;

		        myLat = lt;
		        myLng = ln;
		        console.log(myLat);

        (function getRouteList(){
        	if(num==0){
            $.ajax({
    	        type:'post',
    	        url:"http://14.32.66.127:4000/route/closelist",
     	        headers: {
    	            "Content-Type":"application/json"},
    	        datatype: "json",
   	     		data:JSON.stringify({myLat:myLat,myLng:myLng}), 
    	        success: function(data){
    	        var list = $(data);
    			routeLi = "";
    	        list.each(function(idx,value){
    	            var route = this;
    	            calcDistance(route);
    	        });
    	        }
    	  });
            num++;
        	}
            
    		})();
   });
    }
 		
           
   		function calcDistance(route){
           var ret = Math.sqrt(Math.pow((Math.abs(route.lat-myLat)*111),2)+Math.pow((Math.abs(route.lng-myLng)*88.8),2))*1000;
    	   distance = ret.toFixed(2);
            console.log(distance);
             	 
            if(distance<2000){
        		addList(route);
        		}   
   		};   		

   		var routeLi = "";
   		    function addList(route) {
   		        routeLi += "<li class='rName'  style='border:2px outset white; margin:10px 10px 10px 10px;'" +
   		        "data-lat='"+route.lat+"' data-lng='"+route.lng+"' data-routename='"+route.routename+"' data-routeno='"+route.routeno+"'>"+
   		        "<div class='rr'>" + route.routename + "</div></li>";
   		        $("#myRouteList").html(routeLi);
   		    }   		    

/*     	  $.getJSON("http://14.32.66.127:4000/route/closelist?"+ myLocation, function(data){
	         var list = $(data);
			routeLi = "";
	        console.log(list);
	        
	        list.each(function(idx,value){
	            var route = this;
	            getLocation(route);
			}); 			
	    });
    }*/
    
    function getMetaContentByName(name,content){
    	var content = (content == null)?'content':content;
    	return document.querySelector("meta[name='"+name+"']").getAttribute(content);
    }
 
 //myRoutelist 에서   route 이름 클릭하면  
    $("#myRouteList").on("click","li",function(event){
	       var select = $(this);
	       var routeno = parseInt(select.attr("data-routeno"));
	      
	       questionModal(select);
	       $("#yesModal").modal("show");
	    });
  
    function questionModal(select){
        var questionModal =   "<li class='rNameModal'>'" + select.attr("data-routename")+"'</li><br>"+
        "<a style='float:right;' class='btn btn-primary' id='yes' value='"+select.attr("data-routeno")+"'>YES</a>"+
        "<a style='float:left;' class='btn btn-warning' id='no' value='"+select.attr("data-routeno")+"'>NO</a><br>";
        
        $("#yesNo").html(questionModal);
    }
    $("#yesNo").on("click","#yes",function(){
        var icon= $(this);
        var routeno = icon.attr("value");
        
        $.getJSON("http://14.32.66.127:4000/route/secret?routeno="+routeno,function(data){

        	if(data){
        		console.log("비밀번호 입력하는 모달창 뜨기.");
        		$("#secretModal").modal('show');
        		
			    $("#secretBtn").on("click",function(event){
			    	var input = $("#routeSecret").val();
			    	if(input == data){
				        viewRoute(icon.attr("value"));
			    	};
			    });
			    
        	}else if(!data){
		        viewRoute(icon.attr("value"));
        	}else{
        		$("#yesModal").modal('hide');
        	}
        	
        });
        
    });
    
    
    $("#yesNo").on("click","#no",function(){
        $("#yesModal").modal("hide");
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
                var a5 = $('<input type="hidden" value="'+ vo.attr("routename") +'" name="routeName">');
                
                $form.append(a1).append(a2).append(a3).append(a4).append(a5);
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
                 var a5 = $('<input type="hidden" value="'+ vo.attr("routename") +'" name="routeName">');
                 
                 $form.append(a1).append(a2).append(a3).append(a4).append(a5);
                 $form.submit();
             }
        });
}


        
</script>


</body>
</html>