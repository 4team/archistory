<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

<link rel="stylesheet" href="nivo-lightbox.css" type="text/css" />
<link rel="stylesheet" href="themes/default/default.css" type="text/css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script src="nivo-lightbox.min.js"></script>


</head>

<style>
.img-responsive{
position: absolute;
}
 #list{
         display:none;
            position:absolute;
            padding: 10px;
            z-index:400;
            border : 1px solid black;
            border-radius : 10px;
            background-color : #FFF;
            top:46px;
            left:157px;
            width:200px;
            height:400px;
            overflow-y:scroll;
        }
</style>

<body data-spy="scroll">

<div class="container">
			<ul id="gn-menu" class="gn-menu-main">
				<li class="gn-trigger">
					<a class="gn-icon gn-icon-menu"><span>Menu</span></a>
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">
								<li class="gn-search-item">
									<input placeholder="Search" type="search" class="gn-search">
									<a class="gn-icon gn-icon-search"><span>Search</span></a>
								</li>
								<li>
									<a href="#about" class="gn-icon gn-icon-download">About</a>
								</li>
								<li><a href="#service" class="gn-icon gn-icon-cog">Service</a></li>
								<li><a href="#works" class="gn-icon gn-icon-help">Works</a></li>
								<li>
									<a href="#contact" class="gn-icon gn-icon-archive">Contact</a>
								</li>
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
	</div>

	<!-- Section: intro -->
    <section id="intro" class="intro">
		<div class="slogan">
			<h1>Archistory</h1>
			<p>If you use it, You can see it. And it's not the same history as before.</p>
		<a href="#about" class="btn btn-skin scroll" id="list">Start</a>
		<ul id="myRouteList">
    	</ul>  
		</div>	
    </section>
	<!-- /Section: intro -->
				
<script>
//route list 보이기

var adminno=${adminno};

$("#list").on("click",function(){
	 $("#myRouteList").show();	 
});

var routeLi = "";

    function addList(route) {
        routeLi += "<li data-lat='"+route.lat+"' data-lng='"+route.lng+"' data-routename='"+route.routename+"' data-routeno='"+route.routeno+"'>" + route.routename + "<small data-routeno='"+route.routeno+"'>X</small></li>";
        $("#list").html(routeLi);
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
 
</script>
				
				

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

</body>

</html>
