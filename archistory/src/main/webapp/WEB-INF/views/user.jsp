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
}
#mMyRouteList{
         display:none;
            position:absolute;

            overflow-y:scroll;
        }
.eachMenu:hover{
border : 1px solid;
border-color:#aef;
box-shadow:0 0 8px #aef;
}
.fa{
position:absolute;
z-index:999999;
}
</style>


<script src="js/jquery.min.js"></script>
<script src="js/jquery.easing.min.js"></script>	

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<body data-spy="scroll">


<div class="container">
			<ul id="gn-menu" class="gn-menu-main">
<li class="gn-trigger">
					<a class="gn-icon fa-bars fa-4"><span>MENU</span></a>
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">
								<li class="eachMenu"><a href="/user" class="gn-icon gn-icon-earth">Home</a></li>
								<li class="eachMenu"><a href="#about" class="gn-icon gn-icon-download" id="mRouteList">Tour Route</a></li>
								
									<ul  id="mMyRouteList"></ul>
									
								<li class="eachMenu"><a href="/sboard/usage" class="gn-icon gn-icon-help">Usage</a></li>
								<li class="eachMenu"><a href="/sboard/list" class="gn-icon gn-icon-article">Reviews</a></li>
								<li class="eachMenu"><a href="#" class="gn-icon gn-icon-download">App Download</a></li>
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

    
    <!-- Core JavaScript Files -->
    
    <script src="js/bootstrap.min2.js"></script>
    
	<script src="js/classie.js"></script>
	<script src="js/gnmenu.js"></script>
	<script src="js/jquery.scrollTo.js"></script>
	<script src="js/nivo-lightbox.min.js"></script>
	<script src="js/stellar.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="js/custom.js"></script>

</body>
</html>
