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
    <title>= (admin)Archistory =</title>
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
    	<ul id="myRouteList">
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
                        <th>이메일</th>
                        <th>비밀번호</th>
                        <th>이미지</th>
                    </tr>
                    <tr>
	                    <td><input type='text' class='form-control' placeholder='Number'></td>
			            <td><input type='text' class='form-control'  placeholder='Name'></td>
			            <td><input type='email' class='form-control'  placeholder='Email'></td>
			            <td><input type='password' class='form-control'  placeholder='password'></td>
			            <td><input type='file' class='form-control'name='img'></td>
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

	//route list 보이기 
	
	var routeLi = "";
	    function addList(route) {
	        routeLi += "<li data-lat='"+route.lat+"' data-lng='"+route.lng+"' data-routename='"+route.routename+"' data-routeno='"+route.routeno+"'>" + route.routename + "<small data-routeno='"+route.routeno+"'>X</small></li>";
	        $("#myRouteList").html(routeLi);
	    }

	    function getAllRouteList(){
		    $.getJSON("http://192.168.0.36:8080/route/list?adminno="+adminno,function(data){
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
	    
	    $("#routeShow").on("click",function(){
	    	 $("#myRouteList").toggle();
	    	 
	    });
	    
	  //routelist 에서   route 이름 클릭하면 -> 루트 수정, 멤버 등록, 루트 삭제 모달 창 뜸.    
	    $("#myRouteList").on("click","li",function(event){
		       var select = $(this);
		       var routeno = parseInt(select.attr("data-routeno"));
		       
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
		            $.getJSON("http://192.168.0.36:8080/route/view?routeno="+routeno,function(data){
		                console.log("루트 넘버:"+routeno+"읽어오기");

		                var vo = $(data);
		                console.log(vo);

		                if(vo.attr("step")==true){
		                 self.location = "/stepevent.html?lat="+vo.attr("lat")+"&lng="+vo.attr("lng")+"&step="+vo.attr("step")+"&routeno="+routeno;
		                 }else{
		                 self.location = "/nonstepevent.html?lat="+vo.attr("lat")+"&lng="+vo.attr("lng")+"&step="+vo.attr("step")+"&routeno="+routeno+"&routename="+vo.attr("routename");
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
		        console.log(getMetaContentByName('_csrf'));

		        $.ajax({
		            type:"post",
		            url: "http://192.168.0.36:8080/route/remove",
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
		    
		    
		    //멤버 입력
				
		    var contents=" ";
		    
		    $("#routelist").on("click","#member",function(){
		         var icon= $(this);
		         contents=" ";
		         $("#memTable").html(contents);
		         
		         console.log(icon.attr("value"));
		        $("#memberModal").modal('show');		        
		        $("#editModal").modal('hide');

		    });
			 

		    $("#plus").on("click",function(){
		    	
		                contents+=  "<tr>"
		            +"<td><input type='text' class='form-control' placeholder='Number'></td>"
		            +"<td><input type='text' class='form-control'  placeholder='Name'></td>"
		            +"<td><input type='email' class='form-control'  placeholder='Email'></td>"
		            +"<td><input type='password' class='form-control'  placeholder='password'></td>"
		            +"<td><input type='file' class='form-control'name='img'></td></tr>"
		      
		            $("#memTable").html(contents);
		           

		    });

		    $("#registerBtn").on("click",function(){
			       regiMember();
			       alert("멤버등록이 완료되었습니다.");
			       $("#memberModal").modal('hide');	
			    });
		    
		    
		   function regiMember(){
			   $.ajax({
				  type:'post',
				  url:"http://192.168.0.36:8080/admin/login_success/member/register",
				  headers : {
					"Content-Type" : "application/json"  
				  },
				  datatype:"json",
				  data:JSON.stringfy({}),
				  success: function(data){
					  console.log(data);
				  }
				   
			   });
				   
			  
		   };
		   
		
	
	       
	     
	</script>

</body>
</html>