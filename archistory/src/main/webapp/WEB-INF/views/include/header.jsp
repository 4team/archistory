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
    
<!--      Bootstrap Core CSS
    <link href="/css/bootstrap.min2.css" rel="stylesheet" type="text/css"> -->

    <!-- Fonts -->
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="/css/nivo-lightbox.css" rel="stylesheet" />
	<link href="/css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
	<link href="/css/animate.css" rel="stylesheet" />
    <!-- Squad theme CSS -->
    <link href="/css/style2.css" rel="stylesheet">
	<link href="/color/default.css" rel="stylesheet">
	
</head>
    
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <style>
        html, body {
            width: 100%; height: 100%; margin: 0; padding: 0; overflow-y: scroll;
            font-family: sans-serif; color: white;
            background-color: #000000;
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
            color:#000000;
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
            padding-top: 5px;
            padding-bottom:5px;
        }


        ::-webkit-scrollbar {
            width: 1px;
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
            color:#FFFFFF;
            z-index:400;
            font-size: 24px;
        }
        .gly{
            float:right;
        }
        
        table{
        	margin-top:10px;
            border-spacing: 50px;
        }
        
        table tr:hover{
        	background-color:rgba(95, 210, 255, 0.1);
        }
        table,th,td{
            border-collapse : collapse;
        }
        th{
        	background-color: #111521;
            text-align: center;
        }
    
        #myLocation:hover{
            border-color:#aef;
            box-shadow: 0 0 8px #fff;
        }
		button{
		margin:auto;
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
		
		#hamb:hover{
			color:#eb5d1e;
		}
		.box{
			position : fix;
			margin-left :200px;
			margin-right:200px;
		}
		
		.col-md-12{
		top:10px;
		}
		
		body {
		    background-image: url("/img/back1.jpg");
		    background-size:cover;
		    color:#ffffff;
		}
		
		a{
			text-decoration: none;
		}
		a:hover{
			color:#5DBFEC;
			text-decoration: none;
		}
		
		#searchType{
			color:#000000;
		}
		
		#keywordInput{
			color:#000000;
		}
		
		#searchDiv{
			float:right;
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
    </style>
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<!-- script references -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="/js/bootstrap.min.js"></script>
		
<body>

<div class="menu">
			<ul id="gn-menu" class="gn-menu-main">
<li class="gn-trigger">
					<a id="hamb" class="glyphicon glyphicon-menu-hamburger gn-icon-menu"></a>
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">
								<li><i class="fa fa-home"></i><a href="/" class="gn-icon gn-icon-cog">Home</a></li>
								<li><i class="fa fa-map-marker"></i><a class="gn-icon gn-icon-download" id="routeShow">Tour Route</a></li>
								
									<ul  id="myRouteList"></ul>
									
								<li><i class="fa fa-question"></i><a href="/sboard/usage" class="gn-icon gn-icon-help">Usage</a></li>
								<li><i class="fa fa-book"></i><a href="/sboard/list" class="gn-icon gn-icon-archive">Reviews</a></li>
								<li><i class="fa fa-download"></i><a href="/sboard/appDownload" class="gn-icon gn-icon-download">App Download</a></li>
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
</ul>
	</div>
	
	
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
	
<meta name="_csrf" content="${_csrf.token }"/>
<meta name="_csrf_header" content="${_csrf.headerName }"/>


<!-- ★로그인 모달 -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="routeCreateModalLabel" aria-hidden="true" >
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
                <button type="button" id="eventCreateCancelBtn" class="btn btn-default" data-dismiss="modal">취소</button>
                <button type="button" id="eventCreateBtn" class="btn btn-primary">회원가입</button>
            </div>
        </div>
    </div>
</div>


    
    
    
    