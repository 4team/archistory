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
}
#myRouteList{
font-size: 24px;
color: white;
font-weight: bold;
text-align: center;
}
ul{
list-style:none;
}
#closeList{
position:fixed;
}
</style>


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


	<!-- Section: intro -->
    <section id="intro" class="intro">
		<div class="slogan">
			<h1>Archistory</h1>
			<p>If you use it, You can see it. And it's not the same history as before.</p>
		<a href="#about" class="btn-skin" id="list">Start</a>
		
		
		</div>	
    </section>
	<!-- /Section: intro -->
			
			<div class="nivo-lightbox-overlay nivo-lightbox-theme-default nivo-lightbox-effect-fadeScale nivo-lightbox-open" id="routeList">
<div class="nivo-lightbox-wrap">
<div class="nivo-lightbox-content">

		<p id="myRouteList">
		</p>
		
		</div>
		</div>
		<a href="#" class="nivo-lightbox-close" id="closeList" title="Close"></a>
		</div>
			
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
	    $.getJSON("http://192.168.0.36:8080/route/listAll", function(data){
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
 
</script>
				
				

</body>

</html>
